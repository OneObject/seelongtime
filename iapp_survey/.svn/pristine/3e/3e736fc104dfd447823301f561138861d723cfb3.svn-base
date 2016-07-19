package com.longtime.ajy.support.service;

import com.longtime.ajy.support.bean.ExtWxMpServiceImpl;
import com.longtime.ajy.support.bean.WxMpInRedisConfigStorage;
import com.longtime.app.ixin.mgr.fodder.vo.FodderVO;
import com.longtime.app.ixin.mgr.model.TokenInfo;
import com.longtime.app.ixin.mgr.service.ITokenService;
import com.longtime.app.ixin.mgr.utils.Constants;
import com.longtime.common.spring.SpringContextUtil;
import me.chanjar.weixin.common.api.WxConsts;
import me.chanjar.weixin.common.bean.result.WxMediaUploadResult;
import me.chanjar.weixin.common.exception.WxErrorException;
import me.chanjar.weixin.mp.api.WxMpService;
import me.chanjar.weixin.mp.api.WxMpServiceImpl;
import me.chanjar.weixin.mp.bean.WxMpMassGroupMessage;
import me.chanjar.weixin.mp.bean.WxMpMassNews;
import me.chanjar.weixin.mp.bean.result.WxMpMassUploadResult;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicBoolean;

public class WxMpAgent {

	private static Logger logger = LoggerFactory.getLogger(WxMpAgent.class);
	private static AtomicBoolean init = new AtomicBoolean(false);
	private static ITokenService tokenService;

	private static void init() {
		if (init.get()) {
			return;
		}
		synchronized (init) {
			if (init.get()) {
				return;
			}
			if (null == tokenService) {
				tokenService = SpringContextUtil.getBean(ITokenService.class);
			}
			init.set(true);
		}
	}

	private static WxMpService getWxMpService(TokenInfo tokenInfo) {
		WxMpInRedisConfigStorage config = WxMpInRedisConfigStorage.buildWxMpConfigStorage(tokenInfo.getAppId(),
			tokenInfo.getAppSecret(),
			tokenInfo.getToken(),
			tokenInfo.getAeskey());

		WxMpService wxMpService = new WxMpServiceImpl();
		wxMpService.setWxMpConfigStorage(config);

		return wxMpService;
	}

	private static WxMpService getWxMpService(String domain) {

		init();
		TokenInfo tokenInfo = tokenService.getTokenInfoByDomain(domain);
		if (tokenInfo == null || StringUtils.isBlank(tokenInfo.getAppId())
				|| StringUtils.isBlank(tokenInfo.getAppSecret())) {
			return null;
		}
		return getWxMpService(tokenInfo);
	}
	
	
	public static boolean sendAll(TokenInfo tokenInfo,String mediaId){

		WxMpService wxService = getWxMpService(tokenInfo);
		if(null==wxService || StringUtils.isBlank(mediaId)){
			return false;
		}
		WxMpMassGroupMessage massMessage = new WxMpMassGroupMessage();
		massMessage.setMsgtype(WxConsts.MASS_MSG_NEWS);
		massMessage.setMediaId(mediaId);
		//massMessage.setGroupId(102L);
		massMessage.setGroupId(null);// toall
		try {
			wxService.massGroupMessageSend(massMessage);
			return true;
		} catch (Exception e) {
			logger.error(String.format("upload news due to error.massMessage=%s",ToStringBuilder.reflectionToString(massMessage)), e);
		}
		return false;
		
	}
	
	
	//创建临时素材  用于群发
 	public static String createMutilMsg(TokenInfo tokenInfo,List<FodderVO> fodders,List<File> pics){
			WxMpService wxService = getWxMpService(tokenInfo);
			if(null==wxService){
				return null;
			}
			
			List<String> picMediaIds = uploadCoverPics(pics, wxService);
			
			//创建素材
			WxMpMassNews news = assemblyMassNews(fodders, picMediaIds);
			try {
				WxMpMassUploadResult rs = wxService.massNewsUpload(news);
				return rs.getMediaId();
				
			} catch (Exception e) {
				logger.error(String.format("upload news due to error.news=%s",ToStringBuilder.reflectionToString(news)), e);
			}
			
			return null;
			
		}
		
		
	//创建永久素材
	public static String createMaterialMutilMsg(TokenInfo tokenInfo,List<FodderVO> fodders,List<File> pics){
		WxMpService target = getWxMpService(tokenInfo);
		if(null==target){
			return null;
		}
		ExtWxMpServiceImpl wxService = new ExtWxMpServiceImpl(target);
		
		List<String> picMediaIds = uploadMaterialCoverPics(pics, wxService);
		
		//创建素材
		WxMpMassNews news = assemblyMassNews(fodders, picMediaIds);
		try {
			WxMpMassUploadResult rs = wxService.massNewsMaterialUpload(news);
			return rs.getMediaId();
			
		} catch (Exception e) {
			logger.error(String.format("upload news due to error.news=%s",ToStringBuilder.reflectionToString(news)), e);
		}
		
		return null;
		
	}

	
	
	private static List<String> uploadCoverPics(List<File> pics, WxMpService wxService) {
		List<String> picMediaIds = new ArrayList<>(pics.size());
		
		//创建封面
		for (File file : pics) {
			try {
				WxMediaUploadResult  rs = wxService.mediaUpload("image", file);
				picMediaIds.add(rs.getMediaId());
			} catch (Exception e) {
				logger.error(String.format("upload image due to error.file=%s",file.getAbsolutePath()), e);
			}
		}
		return picMediaIds;
	}
	
	
	private static List<String> uploadMaterialCoverPics(List<File> pics, ExtWxMpServiceImpl wxService) {
		List<String> picMediaIds = new ArrayList<>(pics.size());
		
		//创建封面
		for (File file : pics) {
			try {
				WxMediaUploadResult  rs = wxService.mediaMaterialUpload("image", file);
				picMediaIds.add(rs.getMediaId());
			} catch (Exception e) {
				logger.error(String.format("upload image due to error.file=%s",file.getAbsolutePath()), e);
			}
		}
		return picMediaIds;
	}

	private static WxMpMassNews assemblyMassNews(List<FodderVO> fodders, List<String> picMediaIds) {
		WxMpMassNews news = new WxMpMassNews();
		WxMpMassNews.WxMpMassNewsArticle article = null;
		FodderVO fodder = null;
		for(int i=0;i<fodders.size();i++){
			fodder = fodders.get(i);
			article = new WxMpMassNews.WxMpMassNewsArticle();
			article.setTitle(fodder.getTitle());
			article.setContent(fodder.getContent());
			if(picMediaIds.size()>i){
				article.setThumbMediaId(picMediaIds.get(i));
			}
			article.setShowCoverPic(Constants.COVER_SHOW_TEXT==fodder.getCoverShowInText());
			article.setDigest(fodder.getSummary());
			article.setAuthor(fodder.getAuthor());
			article.setContentSourceUrl(fodder.getSourceUrl());
			news.addArticle(article);
			
		}
		return news;
	}
	
	
	public static File mediaDownload(String media_id,String domain) {
	    
	    WxMpService wxService = getWxMpService(domain);
        if(null==wxService){
            return null;
        }
        
        
        if(StringUtils.isBlank(media_id)){
            return null;
        }
        try {
            return wxService.mediaDownload(media_id);
        } catch (WxErrorException e) {
            logger.error(String.format("meida download due to error. media_id=[%s] domain=[%s]", media_id,domain), e);
        }
        
        return null;
        
	    
	}


	public static String  updateFodderContentImg(TokenInfo tokenInfo,File imgFile){
		if(null==imgFile){
			return null;
		}
		WxMpService target = getWxMpService(tokenInfo);
		if(null==target){
			return null;
		}
		ExtWxMpServiceImpl wxService = new ExtWxMpServiceImpl(target);


		try {
			String file = wxService.updateFodderContentImg(imgFile);
			return file;
		} catch (WxErrorException e) {
			logger.error(String.format("fodder img upload due to error. file=[%s]",imgFile.getAbsolutePath()), e);
		}

		return null;
	}

}
