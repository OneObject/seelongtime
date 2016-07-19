package com.longtime.ajy.mweb.service.impl;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import com.google.common.collect.Lists;
import com.longtime.ajy.model.Authorize;
import com.longtime.ajy.model.User;
import com.longtime.ajy.mweb.model.SurveyAndVoteQuestionVo;
import com.longtime.ajy.mweb.model.VoteActivityEntity;
import com.longtime.ajy.mweb.model.VoteEntity;
import com.longtime.ajy.mweb.model.VoteOptionEntity;
import com.longtime.ajy.mweb.model.VoteQuestionEntity;
import com.longtime.ajy.mweb.model.VoteStatisticsOptionEntity;
import com.longtime.ajy.mweb.model.VoteStatisticsQuestionEntity;
import com.longtime.ajy.mweb.repository.NSpecialRepository;
import com.longtime.ajy.mweb.repository.SpecialRepository;
import com.longtime.ajy.mweb.service.LabelService;
import com.longtime.ajy.mweb.service.VoteActivityService;
import com.longtime.ajy.mweb.service.VoteStatisticsOptionService;
import com.longtime.ajy.mweb.service.VoteStatisticsQuestionService;
import com.longtime.ajy.student.utils.Constants;
import com.longtime.ajy.student.utils.Return;
import com.longtime.ajy.support.I18nHelper;
import com.longtime.common.PathServlet;
import com.longtime.common.dao.Repository;
import com.longtime.common.model.search.Pageable;
import com.longtime.common.model.search.ResultSet;
import com.longtime.common.service.BaseServiceImpl;
import com.telecom.ctu.platform.common.cache.CacheService;

@Service("voteActivityService")
public class VoteActivityServiceImpl extends BaseServiceImpl<VoteActivityEntity, String>  implements VoteActivityService{
    
	private static final Logger logger = LoggerFactory.getLogger(VoteActivityServiceImpl.class);
	
	@Resource(name = "voteActivityRepository")
	private Repository<VoteActivityEntity,String> voteActivityRepository;
	
	@Resource(name = "voteRepository")
	private Repository<VoteEntity,String> voteRepository;
	
	@Resource(name="voteQuestionRepository")
	private Repository<VoteQuestionEntity,String> voteQuestionRepository;
	
	@Resource(name = "voteOptionRepository")
    private Repository<VoteOptionEntity,String> voteOptionRepository;
	
	@Resource
	private SpecialRepository specialRepository;
	
	@Resource(name = "nSpecialRepository")
	private NSpecialRepository nSpecialRepository;
	
	@Resource(name = "voteStatisticsQuestionService")
	private VoteStatisticsQuestionService voteStatisticsQuestionService;
	
	@Resource(name = "voteStatisticsOptionService")
	private VoteStatisticsOptionService voteStatisticsOptionService;
	
	@Resource(name = "lt.cacheService")
	private CacheService cacheService;
	
	@Value("${com.longtime.vote.paper.save.url}")
	private String paperPath;
	
	@Resource(name = "labelService")
	private LabelService labelService;
	
	@Override
	public Repository<VoteActivityEntity, String> getRepository() {
		return this.voteActivityRepository;
	}

	@Override
	public ResultSet<VoteActivityEntity> getMyAttendVote(String domain, String uid, Pageable page) {
		return this.specialRepository.getMyAttendVote(domain, uid,page);
	}
	
	@Override
	public Return checkAuth(VoteActivityEntity voteActivityEntity, User user) {
		if (user == null) {
			String message = I18nHelper.get(Constants.MESSAGE_USER_UNEXISTS);
			return new Return(Return.CODE_FAIL, message);
		}

		if (voteActivityEntity == null) {
			String message = I18nHelper.get(Constants.MESSAGE_SURVEY_UNEXISTS);
			return new Return(Return.CODE_FAIL, message);
		}
		
		if(voteActivityEntity.getIsrelease() != 2){
			String message = I18nHelper.get(Constants.MESSAGE_SURVEY_UNRELEASE);
			return new Return(Return.CODE_FAIL, message);
		}

		long current = System.currentTimeMillis();
		if (voteActivityEntity.getStartTime() != 0 && current < voteActivityEntity.getStartTime()) {
			String message = I18nHelper.get(Constants.MESSAGE_SURVEY_UNSTART);
			return new Return(Return.CODE_FAIL, message);
		}
		if (voteActivityEntity.getEndTime() != 0 && current > voteActivityEntity.getEndTime()) {
			String message = I18nHelper.get(Constants.MESSAGE_SURVEY_ALREADY_END);
			return new Return(Return.CODE_FAIL, message);
		}
		
		if (user != null && (User.TYPE_FOUNDER == user.getType() 
				|| User.TYPE_SERVICE_OPERATORS == user.getType())) {
			return new Return(Return.CODE_SUCCESS, "");
		}

		if (voteActivityEntity.getIsOpen() == 1) {//开放的调研无需授权
			return new Return(Return.CODE_SUCCESS, "");
		}
		
		List<String> activityIds = this.nSpecialRepository.getUserAuthResourceIds(
				user, user.getDomain(), Authorize.R_CATEGORY_VOTE_ACTIVITY);
		if (activityIds.contains(voteActivityEntity.getId())) {
			return new Return(Return.CODE_SUCCESS, "");
		}
		boolean isFromLabel = labelService.isFromLabel(user.getLabels(),voteActivityEntity.getId(),user.getDomain());
		if(isFromLabel){
			return new Return(Return.CODE_SUCCESS, "");
		}
		
		String message = I18nHelper.get(Constants.MESSAGE_SURVEY_UNAUTH);
		return new Return(Return.CODE_FAIL, message);
	}
	
	private static final String VOTE_QUESTION_PAPER_CACHE_KEY = "vq_key_%s";
	private static final int EXPIRE = 60;//过期时间60s
	
	@SuppressWarnings("unchecked")
	@Override
	public List<SurveyAndVoteQuestionVo> getQuestions(VoteActivityEntity voteActivityEntity) {
		String key = String.format(VOTE_QUESTION_PAPER_CACHE_KEY, voteActivityEntity.getId());
		String paperData = cacheService.get(key);
		if(paperData == null){
			paperData = getPaperData(voteActivityEntity);
			cacheService.put(key, EXPIRE, paperData);
		}
		
		if(StringUtils.isBlank(paperData)){
			return null;
		}
		ObjectMapper mapper = new ObjectMapper();
        try {
			Map<?, ?> map = mapper.readValue(paperData, Map.class);
			List<Map<?,?>> items  = (List<Map<?, ?>>) map.get("questions");
			if(CollectionUtils.isEmpty(items)){
				return null;
			}
			List<SurveyAndVoteQuestionVo> questions = new ArrayList<SurveyAndVoteQuestionVo>(items.size());
			for(Map<?, ?> item : items){
				SurveyAndVoteQuestionVo questionVo = fromMap(item);
				questions.add(questionVo);
			}
			return questions;
        } catch(Exception e){
        		logger.error("mapper.readValue due to error",e);
        }
		
		return null;
	}
	
	@Override
	public List<SurveyAndVoteQuestionVo> getQuestionsWithStatistics(VoteActivityEntity voteActivityEntity) {
		List<SurveyAndVoteQuestionVo> questions = getQuestions(voteActivityEntity);
		if(CollectionUtils.isEmpty(questions)){
			return Lists.newArrayList();
		}
		List<VoteStatisticsQuestionEntity> qstatistics = voteStatisticsQuestionService.getList(voteActivityEntity.getId());
		List<VoteStatisticsOptionEntity> ostatistics = voteStatisticsOptionService.getList(voteActivityEntity.getId());
		for(SurveyAndVoteQuestionVo questionVo : questions){
			VoteStatisticsQuestionEntity vq = getVq(questionVo.getId(),qstatistics);
			if(vq != null){
				questionVo.setVoteNum(vq.getVoteNum());
			}
			
			if(CollectionUtils.isEmpty(questionVo.getVoteOptionEntities())){
				continue;
			}
			
			char no = 'A';
			for(VoteOptionEntity option : questionVo.getVoteOptionEntities()){
				
				option.setFileId(no+"");
				VoteStatisticsOptionEntity vo = getVo(option.getId(),ostatistics);
				if(vo != null){
					option.setVoteNum(vo.getVoteNum());
				}
				option.setFileId(no+"");
				no = (char) (no+1);
			}
		}
 		return questions;
	}
	

	/**
	 * @author yangwenkui
	 * @time 2016年6月26日 下午2:34:26
	 * @param option
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
	 * @time 2016年6月26日 下午2:30:47
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

	/**
	 * 从map转换为SurveyAndVoteQuestionVo
	 * @author yangwenkui
	 * @time 2016年6月23日 上午12:04:48
	 * @param item
	 * @return
	 */
	private SurveyAndVoteQuestionVo fromMap(Map<?, ?> item) {
		SurveyAndVoteQuestionVo questionVo = new SurveyAndVoteQuestionVo();
		questionVo.setId(getString(item,"id"));
		questionVo.setTitle(getString(item, "title"));
		questionVo.setType(getInt(item,"type"));
		questionVo.setVoteId(getString(item, "voteId"));
		questionVo.setMaxChooseNum(getInt(item, "maxChooseNum"));
		questionVo.setMinChooseNum(getInt(item, "minChooseNum"));
		questionVo.setMust(getInt(item, "must"));
		questionVo.setWeight(getLong(item,"weight"));
		questionVo.setHasjump(getInt(item, "hasjump"));
		questionVo.setTimestamp(getLong(item, "timestamp"));
		List<VoteOptionEntity> voteOptionEntities = Lists.newArrayList();
		
		@SuppressWarnings("unchecked")
		List<Map<?, ?>> options = (List<Map<?, ?>>)item.get("options");
		if(CollectionUtils.isEmpty(options)){
			questionVo.setVoteOptionEntities(voteOptionEntities);
			return questionVo;
		}
		
		for (Map<?, ?> map : options) {
			VoteOptionEntity option = new VoteOptionEntity();
			option.setId(getString(map, "id"));
			option.setCoverPath(getString(map, "coverPath"));
			option.setTitle(getString(map, "title"));
			option.setVoteQuestionId(getString(map, "voteQuestionId"));
			option.setContent(getString(map, "content"));
			option.setTimestamp(getLong(map, "timestamp"));
			option.setJumpto(getString(map, "jumpto"));
			option.setInputBoxSize(getInt(map, "inputBoxSize"));
			voteOptionEntities.add(option);
		}
		questionVo.setVoteOptionEntities(voteOptionEntities);
		return questionVo;
	}

	/**
	 * @author yangwenkui
	 * @time 2016年6月23日 上午12:12:05
	 * @param item
	 * @param string
	 * @return
	 */
	private long getLong(Map<?, ?> item, String key) {
		Long value = (Long) item.get(key);
		return value == null ? 0L : value.longValue();
	}

	/**
	 * @author yangwenkui
	 * @time 2016年6月23日 上午12:08:37
	 * @param item
	 * @param string
	 * @return
	 */
	private int getInt(Map<?, ?> item, String key) {
		Integer value = (Integer) item.get(key);
		return value == null ? 0 : value.intValue();
	}

	/**
	 * @author yangwenkui
	 * @time 2016年6月23日 上午12:05:43
	 * @param item
	 * @return
	 */
	private String getString(Map<?, ?> item,String key) {
		String value = (String) item.get(key);
		return value;
	}

	/**
	 * @author yangwenkui
	 * @time 2016年6月22日 下午11:14:58
	 * @param voteActivityEntity
	 * @return
	 * @throws IOException 
	 */
	private String getPaperData(VoteActivityEntity voteActivityEntity) {
		String directory = getDirectory(voteActivityEntity);
		String path = String.format("%s/%s.json",directory,voteActivityEntity.getId());
		File file = new File(path);
		if (!file.exists()) {
			return null;
		}
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
		return paperData.toString();
	}

	/**
	 * @author yangwenkui
	 * @time 2016年6月22日 下午11:15:42
	 * @param voteActivityEntity
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
	
}
