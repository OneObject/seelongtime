package com.longtime.app.ixin.mgr.vote.service.impl;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.StringWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.math.NumberUtils;
import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import com.google.common.collect.Maps;
import com.longtime.app.base.model.LabelRelationEntity;
import com.longtime.app.base.model.TenantConfig;
import com.longtime.app.base.model.User;
import com.longtime.app.base.service.AccountService;
import com.longtime.app.base.service.AuthorizeService;
import com.longtime.app.base.service.LabelEntityService;
import com.longtime.app.base.service.TenantConfigService;
import com.longtime.app.base.service.UserService;
import com.longtime.app.config.Constants;
import com.longtime.app.ixin.mgr.vote.dao.VoteActivityDao;
import com.longtime.app.ixin.mgr.vote.dao.VoteQueueDao;
import com.longtime.app.ixin.mgr.vote.model.VoteActivityEntity;
import com.longtime.app.ixin.mgr.vote.model.VoteEntity;
import com.longtime.app.ixin.mgr.vote.model.VoteQueueModel;
import com.longtime.app.ixin.mgr.vote.model.VoteStatisticsOptionEntity;
import com.longtime.app.ixin.mgr.vote.model.VoteStatisticsQuestionEntity;
import com.longtime.app.ixin.mgr.vote.service.VoteActivityService;
import com.longtime.app.ixin.mgr.vote.service.VoteService;
import com.longtime.app.ixin.mgr.vote.service.VoteStatisticsOptionService;
import com.longtime.app.ixin.mgr.vote.service.VoteStatisticsQuestionService;
import com.longtime.app.ixin.mgr.vote.vo.VoteOptionVO;
import com.longtime.app.ixin.mgr.vote.vo.VoteQuestionVO;
import com.longtime.app.util.EmailSender;
import com.longtime.common.PathServlet;
import com.longtime.common.dao.BaseDAO;
import com.longtime.common.dao.IdGenerator;
import com.longtime.common.service.BaseService4HImpl;
import com.longtime.common.utils.DateUtils;
import com.longtime.common.utils.Page;
import com.longtime.common.utils.QueryCondition;
import com.longtime.common.utils.QueryFilter;
import com.longtime.common.utils.ResultSet;
import com.longtime.common.utils.Sort;

import freemarker.cache.StringTemplateLoader;
import freemarker.template.Configuration;
import freemarker.template.Template;
import net.sf.json.JSONObject;


@Service("voteActivityService")
public class VoteActivityServiceImpl extends BaseService4HImpl<VoteActivityEntity, String> implements VoteActivityService{

	private static final Logger logger = LoggerFactory.getLogger(VoteActivityServiceImpl.class);
	
	@Resource(name="voteActivityDao")
	private VoteActivityDao voteActivityDao;
	
	@Resource(name = "authorizeService")
	private AuthorizeService authorizeService;
	
	@Resource(name = "userService")
	private UserService userService;
	
	@Resource(name = "accountService")
	private AccountService accountService;
	
	@Resource(name = "tenantConfigService")
	private TenantConfigService tenantConfigService;
	
	@Resource(name = "voteQueueDao")
	private VoteQueueDao voteQueueDao;
	
	@Resource(name = "voteService")
	private VoteService voteService;
	
	@Resource(name = "voteStatisticsQuestionService")
	private VoteStatisticsQuestionService voteStatisticsQuestionService;
	
	@Resource(name = "voteStatisticsOptionService")
	private VoteStatisticsOptionService voteStatisticsOptionService;
	
	@Value("${com.longtime.vote.paper.save.url}")
	private String paperPath;
	
	@Override
	public BaseDAO<VoteActivityEntity, String> getDAO() {
		return voteActivityDao;
	}
	
	@Override
	public VoteActivityEntity findByUpOrDown(String domain, long weight, String upOrDown, String vid) {
		QueryCondition query = new QueryCondition();
		query.addFilterEqual("domain", domain);
		query.addFilterEqual("del", 0);
		if (upOrDown.equals("up")){
			query.addFilter(QueryFilter.greaterOrEqual("weight", weight));
			query.addOrder("weight",Sort.Order.ASC );
		}else{
			query.addFilter(QueryFilter.lessOrEqual("weight", weight));
			query.addOrder("weight",Sort.Order.DES );
		}
		ResultSet<VoteActivityEntity> rs = list(query, new Page(1, 2));
		for(VoteActivityEntity entity : rs.getItems()){
			if (!entity.getId().equals(vid)){
				return entity;
			}
		}
		return null;
	}
	
	/**
	 * @author ganzw
	 * @time 2016年7月19日 上午11:41:32
	 * 将邮件模板的内容从tenantConfig中取出
	 */
	@Override
	public synchronized void doSendNotify(String id) {
		try {
			VoteActivityEntity entity = voteActivityDao.get(id);
			if(entity.getHasNotified() != 0){
				return;
			}
			entity.setHasNotified(1);
			voteActivityDao.update(entity);
			
			TenantConfig tenantConfig = tenantConfigService.get(entity.getDomain());
			EmailSender emailSender = EmailSender.getEmailSender(tenantConfig);
			String subject = String.format( Constants.EMAIL_NOTIFY_SURVEY_TITLE, entity.getTitle());
			Set<String> uids = authorizeService.listAuthUids(id, entity.getDomain());
			User user = null;
			for (String uid : uids) {
				try {
					user = userService.get(uid);
					if(user == null || StringUtils.isEmpty(user.getEmail())){
						continue;
					}
//					String msg = getNotifyMsg(entity,user);
					String msg = getNotifyMsg(entity, user, tenantConfig);
					if(StringUtils.isBlank(msg)){
						return;
					}
					emailSender.sendAsyn(user.getEmail(), subject, msg, true);
				} catch (Exception e) {
					logger.error(String.format("send email due to error,the uid = %s", uid), e);
				}
			}
			
			entity.setHasNotified(2);
			voteActivityDao.update(entity);
		} catch (Exception e) {
			logger.error(String.format("send email due to error,the activityId = %s", id), e);
		}
	}

	/**
	 * @author yangwenkui
	 * @time 2016年6月16日 下午9:19:32
	 * @param entity
	 * @param user 
	 * @return
	 */
	private String getNotifyMsg(VoteActivityEntity entity, User user) {
		String msg = "";
		@SuppressWarnings("deprecation")
		Configuration cfg = new Configuration();
		StringTemplateLoader stringLoader = new StringTemplateLoader();
		String templateContent = Constants.EMAIL_NOTIFY_SURVEY_CONTENT;
		
		stringLoader.putTemplate("myTemplate",templateContent);
		cfg.setTemplateLoader(stringLoader);
		
		Map<String, Object> map = Maps.newHashMap();
		map.put("name", user.getName());
		map.put("userName", user.getUsername());
		map.put("surveyName", entity.getTitle());
		map.put("author", StringUtils.isNotBlank(entity.getAuthor()) ? entity.getAuthor() : "汉德调研云");
		map.put("remark", StringUtils.isNotBlank(entity.getSummary()) ? entity.getSummary() : "");
		String url = String.format(Constants.SURVEY_NOTIFY_URL, entity.getId());
		url = String.format("%s%s", Constants.STUDENT_WEB_ROOT,url);
		map.put("surveyUrl", url);
		map.put("sendDate", DateUtils.longToString(System.currentTimeMillis()));
	    try {
	      Template template = cfg.getTemplate("myTemplate","utf-8");
	      StringWriter writer = new StringWriter();  
	      template.process(map, writer);
	      msg = writer.toString();
	    } catch (Exception e) {
	      logger.error("get survey notify content due to error", e);
	    }
		return msg;
	}
	
	/**
	 * @author ganzw
	 * @time 2016.7.19 11:44
	 * 将邮件模板的内容从tenantConfig中取出
	 * @return
	 */
	private String getNotifyMsg(VoteActivityEntity entity, User user, TenantConfig tenantConfig) {
		String msg = "";
		@SuppressWarnings("deprecation")
		Configuration cfg = new Configuration();
		StringTemplateLoader stringLoader = new StringTemplateLoader();
		
		String templateContent = "";		//邮件模板的内容
		if(tenantConfig != null && tenantConfig.getMailmodule() != null) {
			templateContent = tenantConfig.getMailmodule();
		} else {
			templateContent = Constants.EMAIL_NOTIFY_SURVEY_CONTENT;
		}
		logger.debug("VoteActivityServiceImpl  \t  [{}]", templateContent);
		
		stringLoader.putTemplate("myTemplate",templateContent);
		cfg.setTemplateLoader(stringLoader);
		
		Map<String, Object> map = Maps.newHashMap();
		map.put("name", user.getName());
		map.put("userName", user.getUsername());
		map.put("surveyName", entity.getTitle());
		map.put("author", StringUtils.isNotBlank(entity.getAuthor()) ? entity.getAuthor() : "汉德调研云");
		map.put("remark", StringUtils.isNotBlank(entity.getSummary()) ? entity.getSummary() : "");
		String url = String.format(Constants.SURVEY_NOTIFY_URL, entity.getId());
		url = String.format("%s%s", Constants.STUDENT_WEB_ROOT,url);
		map.put("surveyUrl", url);
		map.put("sendDate", DateUtils.longToString(System.currentTimeMillis()));
	    try {
	      Template template = cfg.getTemplate("myTemplate","utf-8");
	      StringWriter writer = new StringWriter();  
	      template.process(map, writer);
	      msg = writer.toString();
	    } catch (Exception e) {
	      logger.error("get survey notify content due to error", e);
	    }
		return msg;
	}
	
	@Override
	public boolean doRelease(String id, String status) {
		try {
			VoteActivityEntity entity = voteActivityDao.get(id);
			entity.setIsrelease(NumberUtils.toInt(status,0));
			voteActivityDao.update(entity);
			
			if(entity.getIsrelease() == 1){
				voteStatisticsQuestionService.doInit(entity);
				
				VoteQueueModel model = new VoteQueueModel();
				model.setId(IdGenerator.uuid32());
				model.setVote_activity_id(id);
				model.setStatus(VoteQueueModel.STATUS_TO_CREATE);
				voteQueueDao.insert(model);
			}
		} catch (Exception e) {
			logger.error("doRelease due to error",e);
			return false;
		}
		return true;
	}
	
	@Override
	public boolean createPaper(String vote_activity_id) {
		VoteActivityEntity voteActivityEntity = voteActivityDao.get(vote_activity_id);
		VoteEntity voteEntity = voteService.get(voteActivityEntity.getVoteId());
		List<VoteQuestionVO> questions = voteService.getVoteQuestions(voteActivityEntity.getVoteId());
		List<VoteQuestionVO> list = new ArrayList<VoteQuestionVO>(questions.size());
		for (VoteQuestionVO voteQuestionVO : questions) {
			VoteQuestionVO entity = voteService.getVoteQuestionVOWithOption(voteQuestionVO);
			list.add(entity);
		}
		return createJson(voteActivityEntity,voteEntity,list);
	}
	
	@SuppressWarnings("unchecked")
	public static void main(String[] args) {
		String path = String.format("/Users/yangwenkui/Documents/workspace/iapp_survey/src/main/resources/webapp/resource/vote/paper/16-06/1801d38296a945ab8ed1f85222712a62.json");
		File file = new File(path);
		StringBuffer paperData = new StringBuffer();
		try {
			BufferedReader reader = new BufferedReader(new FileReader(file));
			String tempStr = null;
			while ((tempStr = reader.readLine()) != null) {
				paperData.append(tempStr);
			}
			reader.close();
		}catch (IOException e) {
			logger.error("get survey paper due to error",e);
		}
		
		ObjectMapper mapper = new ObjectMapper();
        try {
			Map<?, ?> map = mapper.readValue(paperData.toString(), Map.class);
			List<Map<?, ?>> items  = (List<Map<?, ?>>) map.get("questions");
			
			for (Map<?, ?> voteQuestionVO : items) {
				System.out.println(voteQuestionVO.get("title"));
				List<Map<?, ?>> options = (List<Map<?, ?>>)voteQuestionVO.get("options");
				if(CollectionUtils.isEmpty(options)){
					System.out.println(0);
				} else {
					System.out.println(options.size());
				}
			}
        } catch(Exception e){
        		e.printStackTrace();
        }
	}
	
	private boolean createJson(VoteActivityEntity voteActivityEntity, VoteEntity voteEntity, List<VoteQuestionVO> list) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("voteActivity", voteActivityEntity);
		map.put("vote", voteEntity);
		map.put("questions", list);
		
		JSONObject jsonObject = JSONObject.fromObject(map);
		String json = jsonObject.toString();
		
		try {
			String directory = getDirectory(voteActivityEntity);
			File dir = new File(directory);
			if(!dir.exists()){
				dir.mkdirs();
			}
			
			String path = String.format("%s/%s.json",directory,voteActivityEntity.getId());
			File file = new File(path);
			FileOutputStream out = new FileOutputStream(file);
			out.write(json.getBytes());
			out.flush();
			out.close();
			return true;
		} catch (Exception e) {
			logger.error(String.format("create paper data due to error where voteActivityId=[%s],the message is %s", voteActivityEntity.getId(),e));
			return false;
		}
	}

	/**
	 * @author yangwenkui
	 * @param voteActivityEntity 
	 * @time 2016年6月19日 下午10:11:54
	 * @return
	 */
	private String getDirectory(VoteActivityEntity voteActivityEntity) {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = df.format(voteActivityEntity.getCreateTime());
		StringBuffer buffer = new StringBuffer();
		buffer.append(PathServlet.PATH);
		buffer.append(paperPath);
		if(StringUtils.isNotBlank(date)){
			buffer.append(date.substring(2,7));
		}
		return buffer.toString();
	}
	
	
	@Override
	public void doAdd(VoteActivityEntity entity, User user) {
		voteActivityDao.insert(entity);
		labelEntityService.doAdd(entity.getLabels(),entity.getId(),LabelRelationEntity.RTYPE_SURVEY,user);
	}
	
	@Override
	public void doUpdate(VoteActivityEntity entity, User user) {
		voteActivityDao.update(entity);
		labelEntityService.doAdd(entity.getLabels(),entity.getId(),LabelRelationEntity.RTYPE_SURVEY,user);
	}
	
	@Override
	public List<VoteQuestionVO> getQuestionsWithStatistics(VoteActivityEntity voteActivityEntity) {
		List<VoteQuestionVO> questions = voteService.getVoteQuestions(voteActivityEntity.getVoteId());
		List<VoteQuestionVO> list = new ArrayList<VoteQuestionVO>(questions.size());
		
		List<VoteStatisticsQuestionEntity> qstatistics = voteStatisticsQuestionService.getList(voteActivityEntity.getId());
		List<VoteStatisticsOptionEntity> ostatistics = voteStatisticsOptionService.getList(voteActivityEntity.getId());
		for (VoteQuestionVO voteQuestionVO : questions) {
			VoteQuestionVO entity = voteService.getVoteQuestionVOWithOption(voteQuestionVO);
			VoteStatisticsQuestionEntity vq = getVq(voteQuestionVO.getId(),qstatistics);
			if(vq != null){
				entity.setVoteNum(vq.getVoteNum());
			}
			
			if(CollectionUtils.isEmpty(entity.getOptions())){
				list.add(entity);
				continue;
			}
			
			for(VoteOptionVO option : entity.getOptions()){
				VoteStatisticsOptionEntity vo = getVo(option.getId(),ostatistics);
				if(vo != null){
					option.setVoteNum(vo.getVoteNum());
				}
			}
			list.add(entity);
		}
		
		return list;
	}

	/**
	 * @author yangwenkui
	 * @time 2016年7月2日 上午10:25:15
	 * @param id
	 * @param ostatistics
	 * @return
	 */
	private VoteStatisticsOptionEntity getVo(String id, List<VoteStatisticsOptionEntity> ostatistics) {
		for (VoteStatisticsOptionEntity voteStatisticsOptionEntity : ostatistics) {
			if(id.equals(voteStatisticsOptionEntity.getOptionid())){
				return voteStatisticsOptionEntity;
			}
		}
		return null;
	}
	
	/**
	 * @author yangwenkui
	 * @time 2016年7月2日 上午10:23:06
	 * @param id
	 * @param qstatistics
	 * @return
	 */
	private VoteStatisticsQuestionEntity getVq(String id, List<VoteStatisticsQuestionEntity> qstatistics) {
		for (VoteStatisticsQuestionEntity voteStatisticsQuestionEntity : qstatistics) {
			if(id.equals(voteStatisticsQuestionEntity.getQuestionid())){
				return voteStatisticsQuestionEntity;
			}
		}
		return null;
	}
	@Resource(name = "labelEntityService")
	private LabelEntityService labelEntityService;
}
