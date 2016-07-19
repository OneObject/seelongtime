package com.longtime.app.config;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Component;
import org.springframework.beans.factory.annotation.Value;

/**
 * @author longtime
 *
 */
@Component
@Lazy(false)
public class Constants {
	public static String EMAIL_NOTIFY_SURVEY_TITLE;
	public static String EMAIL_NOTIFY_SURVEY_CONTENT;
	public static String SURVEY_NOTIFY_URL;
	public static String QINIU_COURSE_IMG_STYLE_320_180;
	public static String QINIU_COURSE_IMG_STYLE_180_180;
	public static String IMG_SERVER_DOWNLOAD;
	public static String IMG_SERVER_UPLOAD;
	public static String QINIU_SERVER; //七牛up服务

	public static String WX_AJY_APPID;
	public static String WX_AJY_APPSECRET;
	
	public static String STUDENT_WEB_ROOT;
	
	public static String WX_TMEP_IMG_PATH;
	
    public static String COOKIE_DOMAIN;
    
    public static String COOKIE_KEY_PREFIX=StringUtils.EMPTY;
    
    public static String QRCODE_PATH_EXTRACT;
    
    public static String VOTE_DETAIL_URL;
    
    public static String DOC_SERVER;
    
    public static String TOPIC_COVER_BASE;
    
    
    public static String EMAIL_HOST;
    public static int EMAIL_PORT;
    public static String EMAIL_DEFAULT_ENCODEING;
    public static String EMAIL_USERNAME;
    public static String EMAIL_PASSWORD;
    public static String EMAIL_ALAIS;
    
    
    /**
     * webapp 本地完整路径  如 /opt/applications/webapp/iapp/
     */
    public static String WEBAPP_LOCAL_DIR;
    
    
    public static String WEIXIN_DOWNLOAD_IMG_PATH;
    
    
    public static String getWeixinImgSaveLocalPath(){
        return String.format("%s%s", WEBAPP_LOCAL_DIR,WEIXIN_DOWNLOAD_IMG_PATH);
    }
    
    @Value("${com.longtimeit.email.survey.notify}")
    public void setEMAIL_NOTIFY_SURVEY_CONTENT(String eMAIL_NOTIFY_SURVEY_CONTENT) {
		EMAIL_NOTIFY_SURVEY_CONTENT = eMAIL_NOTIFY_SURVEY_CONTENT;
	}
    
    
    @Value("${com.longtimeit.email.survey.notify.title}")
    public void setEMAIL_NOTIFY_SURVEY_TITLE(String eMAIL_NOTIFY_SURVEY_TITLE) {
		EMAIL_NOTIFY_SURVEY_TITLE = eMAIL_NOTIFY_SURVEY_TITLE;
	}

	@Value("${com.longtimeit.survey.attend.url}")
	public void setSURVEY_NOTIFY_URL(String sURVEY_NOTIFY_URL) {
		SURVEY_NOTIFY_URL = sURVEY_NOTIFY_URL;
	}

	@Value("${com.longtimeit.email.host}")
	public void setEMAIL_HOST(String eMAIL_HOST) {
		EMAIL_HOST = eMAIL_HOST;
	}

    @Value("${com.longtimeit.email.port}")
	public void setEMAIL_PORT(int eMAIL_PORT) {
		EMAIL_PORT = eMAIL_PORT;
	}

    @Value("${com.longtimeit.email.encoding}")
	public void setEMAIL_DEFAULT_ENCODEING(String eMAIL_DEFAULT_ENCODEING) {
		EMAIL_DEFAULT_ENCODEING = eMAIL_DEFAULT_ENCODEING;
	}

    @Value("${com.longtimeit.email.username}")
	public void setEMAIL_USERNAME(String eMAIL_USERNAME) {
		EMAIL_USERNAME = eMAIL_USERNAME;
	}

    @Value("${com.longtimeit.email.password}")
	public void setEMAIL_PASSWORD(String eMAIL_PASSWORD) {
		EMAIL_PASSWORD = eMAIL_PASSWORD;
	}

    @Value("${com.longtimeit.email.alias}")
	public void setEMAIL_ALAIS(String eMAIL_ALAIS) {
		EMAIL_ALAIS = eMAIL_ALAIS;
	}


	@Value("${com.longtime.ixin.IMAGE_BASE_PATH}")
	public void setTopicCoverBase(String topicCoverBase) {
		TOPIC_COVER_BASE = topicCoverBase;
	}
	
	
	@Value("${com.longtime.ajy.doc.webroot}")
	public void setDocRoot(String docRoot) {
		DOC_SERVER = docRoot;
	}
	
	@Value("${com.longtime.wx.temp.img.path}")
	public void setWXTempImgPath(String wxTmpImgPath) {
		WX_TMEP_IMG_PATH = wxTmpImgPath;
	}

	@Value("${com.longtime.imgserver.download}")
	public void setImgServerDownload(String imgServerDownload) {
		IMG_SERVER_DOWNLOAD = imgServerDownload;
	}

	@Value("${com.longtime.imgserver.upload}")
	public void setImgServerUpLoad(String imgServerUpload) {
		IMG_SERVER_UPLOAD = imgServerUpload;
	}

	@Value("${com.longtime.qiniu.upserver}")
	public void setQiniuUpserver(String qiniuUpserver) {
		QINIU_SERVER = qiniuUpserver;
	}

	@Value("${com.longtime.ajy.weixin.appid}")
	public void setWXAjyAppid(String appid) {
		WX_AJY_APPID = appid;
	}

	@Value("${com.longtime.ajy.weixin.appsecret}")
	public void setWXAjyAppSecret(String appsecret) {
		WX_AJY_APPSECRET = appsecret;
	}
	
	@Value("${com.longtime.qiniu.style.320x180}")
    public void setCourseStyle320180(String style){
        QINIU_COURSE_IMG_STYLE_320_180 =  style;
    }
    
    @Value("${com.longtime.qiniu.style.180x180}")
    public void setCourseStyle180180(String style){
        QINIU_COURSE_IMG_STYLE_180_180 =  style;
    }
    @Value("${com.longtime.ajy.student.webroot}")
    public void setStudentWebRoot(String webroot){
    	STUDENT_WEB_ROOT = webroot;
    }
    
    @Value("${com.longtime.ajy.cookie.domain}")
    public void setCookieDomain(String domain){
        COOKIE_DOMAIN = domain;
    }
    
    @Value("${com.longtime.ajy.cookie.prefix}")
    public void setCookieKeyPrefix(String prefix){
        COOKIE_KEY_PREFIX = prefix;
    }
    
    @Value("${com.longtime.ixin.qrcode.path.extract}")
    public void setQrcodePathExtract(String qrcodePathExtract){
        QRCODE_PATH_EXTRACT = qrcodePathExtract;
    }
    
    @Value("${com.longtime.ixin.voteBasePath}")
    public void setVotedetailUrl(String votedetailUrl){
    	VOTE_DETAIL_URL = votedetailUrl;
    }
    @Value("${com.longtime.ajy.download.weixin.img.dir}")
    public void setWeiXinDownloadImgPath(String path){
        WEIXIN_DOWNLOAD_IMG_PATH = path;
    }
   // com.longtime.ixin.qrcode.path.extract
}
