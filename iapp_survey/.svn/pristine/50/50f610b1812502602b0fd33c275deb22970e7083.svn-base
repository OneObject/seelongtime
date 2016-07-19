package com.longtime.app.ixin.mgr.fodder.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.util.HtmlUtils;

import com.longtime.app.ixin.mgr.fodder.dao.FodderDao;
import com.longtime.app.ixin.mgr.fodder.model.FodderEntity;
import com.longtime.app.ixin.mgr.fodder.model.SourceFileEntity;
import com.longtime.app.ixin.mgr.fodder.service.FodderService;
import com.longtime.app.ixin.mgr.fodder.vo.FodderVO;
import com.longtime.app.ixin.protocol.ItemArticle;
import com.longtime.app.ixin.protocol.ReplyMessage;
import com.longtime.app.ixin.protocol.ReplyMessageNews;
import com.longtime.app.ixin.utils.DefaultMessageUtil;
import com.longtime.app.util.HTMLUtils;
import com.longtime.app.util.IdGenerator;
import com.longtime.app.util.PutPolicy;
import com.qiniu.api.auth.digest.Mac;

@Service("fodderService")
public class FodderServiceImpl implements FodderService{
	private static final Logger logger = LoggerFactory.getLogger(FodderServiceImpl.class);
	@Value("${com.longtime.ixin.SECRETKEY}")
	private String secretKey;
	@Value("${com.longtime.ixin.BUCKETNAME}")
	private String bucketName;
	@Value("${com.longtime.ixin.ACCESSKEY}")
	private String accessKey;
	@Value("${com.longtime.ixin.RETURNBODY}")
	private String returnBody;
	@Value("${com.longtime.ixin.COVER_SUFFIX}")
	private String coverSuffix;
	@Value("${com.longtime.ixin.IMAGE_BASE_PATH}")
	private String qiniuImageBasePath;
	@Value("${com.longtime.ixin.matterdetail_basepath}")
	private String fodderBasePath;
	
	@Resource(name="fodderDao")
	private FodderDao fodderDao;

	@Override
	public Map<String, String> getRequiredParams() {
		Mac mac = new Mac(accessKey, secretKey);
		PutPolicy policy = new PutPolicy(bucketName);
		policy.returnBody=returnBody;
		Map<String,String> requiredParams = new HashMap<String, String>();
		try {
			String uploadToken = policy.token(mac);
			requiredParams.put("uploadToken", uploadToken);
			
		} catch (Exception e) {
			logger.warn(String.format("failure to obtain authorization code.   accessKey=[%s],secretKey=[%s]",accessKey,secretKey ));
		}
		requiredParams.put("coverSuffix", coverSuffix);
        requiredParams.put("qiniuImageBasePath", qiniuImageBasePath);
		return requiredParams;
	}

	@Override
	public String saveSourceFile(SourceFileEntity file,String domain) {
		file.setDomain(domain);
		String id = UUID.randomUUID().toString().replaceAll("-", "");
		file.setId(id);
		file.setUploadDate(System.currentTimeMillis());
		try {
			fodderDao.saveSourceFile(file);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return id;
	}

	@Override
	public void delSourceFile(String id) {
		fodderDao.delSourceFile(id);
	}

	@Override
	public void saveOrUpdateFodderDraft(FodderVO vo,boolean isSave) {
		try {
			fodderDao.saveOrUpdateFodderDraft(vo,isSave);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public boolean checkExist(String baseId) {
		return fodderDao.checkExist(baseId);
	}

	@Override
	public void delFodderDraft(String id) {
		fodderDao.delFodderDraft(id);
	}

	@Override
	public void updateFodder(FodderVO vo) {
		try {
			fodderDao.updateFodder(vo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public void saveFodder(FodderVO vo) {
		try {
			fodderDao.saveFodder(vo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public int getFodderTotalSize(String domain) {
		
		return fodderDao.getFodderTotalSize(domain);
	}

	@Override
	public List<FodderVO> getFodderByPage(int pageSize, int currPage,
			String domain) {
		List<FodderVO> list = fodderDao.getFodderByPage(pageSize,currPage,domain,qiniuImageBasePath,coverSuffix);
		for (FodderVO vo : list) {
			//vo.setContent(HTMLUtils.html2Text(HtmlUtils.htmlUnescape(vo.getContent())));
			vo.setContent(vo.getContent());
			vo.setCoverPath(String.format("%s%s%s", qiniuImageBasePath,vo.getCoverPath(),coverSuffix));
		}
		return list;
	}

	@Override
	public FodderVO getFodderVOById(String id) {
		FodderVO vo = fodderDao.getFodderVOById(id);
		if(vo!=null){
			vo.setExt(vo.getCoverPath());
			vo.setCoverPath(String.format("%s%s%s", qiniuImageBasePath,vo.getCoverPath(),coverSuffix));
			vo.setContent(HtmlUtils.htmlUnescape(vo.getContent()));
		}
		return vo;
	}

	@Override
	public void del(String id) {
		fodderDao.del(id);
	}

	@Override
	public int getFodderDraffTotalSize(String domain) {
		
		return fodderDao.getFodderDraffTotalSize(domain);
	}

	@Override
	public List<FodderVO> getFodderDraffByPage(int pageSize, int currPage,
			String domain) {
		List<FodderVO> list = fodderDao.getFodderDraffByPage(pageSize,currPage,domain);
		if(list == null){
			return null;
		}
		for (FodderVO vo : list) {
			vo.setCoverPath(String.format("%s%s%s", qiniuImageBasePath,vo.getCoverPath(),coverSuffix));
			vo.setContent(HTMLUtils.html2Text(HtmlUtils.htmlUnescape(vo.getContent())));
		}
		return list;
	}

	@Override
	public FodderVO getFodderVOByDraffId(String id) {
		FodderVO vo = fodderDao.getFodderVOByDraffId(id);
		if(vo!=null){
			vo.setExt(vo.getCoverPath());
			vo.setCoverPath(String.format("%s%s%s", qiniuImageBasePath,vo.getCoverPath(),coverSuffix));
			vo.setContent(HtmlUtils.htmlUnescape(vo.getContent()));
		}
		return vo;
	}

	@Override
	public void saveColumnInfo(String columnType, String baseId, String domain) {
		fodderDao.saveColumnInfo(columnType,baseId,domain);
	}

	@Override
	public ReplyMessage getReplyByIds(List<String> ids, String domain) {
		if(ids == null || ids.isEmpty()){
			return DefaultMessageUtil.getDefaultMessage(domain);
		}
		
		
		List<ItemArticle> articleItems = new ArrayList<ItemArticle>();
		for (String id : ids) {
			ItemArticle item = fodderDao.getItemArticleById(id,qiniuImageBasePath,coverSuffix,fodderBasePath);
			if(item!=null){
				articleItems.add(item);
			}
		}
		
		if(articleItems.size()<=0){
			return DefaultMessageUtil.getDefaultMessage(domain);
		}
		
		ReplyMessageNews replyMessage = new ReplyMessageNews();
		replyMessage.setCount(articleItems.size());
		replyMessage.setMsgType(ReplyMessage.REPLY_MESSAGE_NEWS);
		replyMessage.setArticleItems(articleItems);
		return replyMessage;
	}

	@Override
	public void saveAttResp(String content, String type, String currentDomain) {
		String attId = fodderDao.queryAttRespByDomain(currentDomain);
		if(StringUtils.isBlank(attId)){
			//添加
			attId = (String)IdGenerator.nextId32()+"-"+currentDomain;
			fodderDao.saveAttResp(content,type,currentDomain,attId);
		}else{
			//保存
			fodderDao.updateAttResp(content,type,currentDomain,attId);
		}
	}

	@Override
	public FodderVO getFodderVOResp(String currentDomain) {
		FodderVO vo = fodderDao.getFodderVOResp(currentDomain);
		if(vo!=null && vo.getExtType().equals("fodder")){
			//查询素材信息
			FodderVO vo1 = fodderDao.getFodderVOById(vo.getContent());
			vo1.setExt1(vo.getExt1());
			vo1.setContent(HTMLUtils.html2Text(HtmlUtils.htmlUnescape(vo1.getContent())));
			
			vo1.setExtType(vo.getExtType());
			vo1.setDomain(vo.getDomain());
			return vo1;
		}
		return vo;
	}

	@Override
	public void delAttResp(String attId) {
		fodderDao.delAttResp(attId);
	}

	@Override
	public int getFodderTotalSize(String domain, String param) {
		return this.fodderDao.getFodderTotalSize(domain, param);
	}

	@Override
	public List<FodderEntity> fodderList(int pagesize, int currentpage,
			String domain, String param) {
		return this.fodderDao.fodderList(pagesize, currentpage, domain, param);
	}

	@Override
	public List<FodderEntity> list(String[] ids) {
		return this.fodderDao.list(ids);
	}

	@Override
	public int getTitalSizeWithSearch(String domain, String searchcontent) {

		return fodderDao.getTitalSizeWithSearch(domain, searchcontent);
	}

	@Override
	public List<FodderVO> getFodderByPageWithSerch(int pageSize, int currPage,
			String domain, String searchecontent) {
		List<FodderVO> list = fodderDao.getFodderByPageWithSerch(pageSize, currPage, domain, searchecontent);
		for (FodderVO vo : list) {
			vo.setContent(vo.getContent());
			vo.setCoverPath(String.format("%s%s%s", qiniuImageBasePath,vo.getCoverPath(),coverSuffix));
		}
		return list;
	}
}
