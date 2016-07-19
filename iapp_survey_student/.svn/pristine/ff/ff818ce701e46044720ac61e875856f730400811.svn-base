package com.longtime.ajy.student.config;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Component;
import org.springframework.beans.factory.annotation.Value;

@Component
@Lazy(false)
public class Constant {
    
	public static final String CACHE_KEY_GROUP_LIST = "glist_%s"; //用户组列表缓存key
    
    public static final String M_FAIL_PAGE    = "/m/error/error.xhtml";

	public static String EXAM_URL; //学员考试url
	
	public static String ADMIN_ROOT; // 管理员端root地址
	
	public static String PLAYER_ROOT; // 课件播放器root地址
	
	public static String VIDEO_PLAYER_URL;//视频播放器地址
	
	public static String DOCUMENT_ROOT;// 文档播放地址
	
	public static String FODDER_ROOT;// 素材播放地址
	
	public static String IMG_SERVER_DOWNLOAD;
    public static String IMG_SERVER_UPLOAD;
    public static String QINIU_SERVER;  //七牛up服务
    public static String IMG_SERVER_UPLOAD_ISQINIU;//是否使用到了七牛上传
    
    public static String QINIU_COURSE_IMG_STYLE_320_180;
    public static String QINIU_COURSE_IMG_STYLE_180_180;
    
    
    public static String  QINIU_ACCESSKEY;
    public static String  QINIU_SECRETKEY;
    public static String  QINIU_BUCKET;
    public static String  QINIU_UPLOAD_RETURNBODY;
    
    
    public static String DOWNLOAD_TMP_DIR;

    public static String DEFAULT_DOMAIN;

    
    
    public static String WX_AJY_APPID;
    public static String WX_AJY_APPSECRET;

    public static boolean WX_OAUTH_OPEN = true;
    
    public static String COURSEWARE_LOCAL_PATH;//本机课件路径
    
    public static String IVIDEO_SERVER;//
    
    public static String DEFAULT_COURSE_IMG;
    
    
    public static String COOKIE_DOMAIN;
    
    public static String COOKIE_KEY_PREFIX=StringUtils.EMPTY;
    
    
    public static boolean COOKIE_SESSION_NEVER_EXPIRES  = false;  //会话永不过期
    
    public static String WEBSOCKET_SERVER;//websocket服务地址

    public static String ICOME_ACCESS_TOKEN;

    public static String ICOME_ACCESS_TOKEN_TEST;

    public static String ICOME_USER_INFO;


    
    // 定义积分Action常量
 	public static final String CREDIT_ACTION_COMMENT = "comment";// 评论
 	
 	public static final String CREDIT_ACTION_PRAISE = "praise";// 赞
 	
 	public static final String CREDIT_ACTION_UNPRAISE = "unpraise";// 踩
 	
 	public static final String CREDIT_ACTION_STUDY= "study";// 学习
 	
 	public static final String CREDIT_ACTION_LOGIN= "login";// 每日登录
 	
 	public static final String CREDIT_ACTION_BIND="bind";// 微信绑定
 	
 	public static final String CREDIT_ACTION_ACTIVITY_APPLY="activityapply";//活动报名 
 	
 	public static final String CREDIT_ACTION_ACTIVITY_SIGNIN="activitysignin";//活动签到
 	
 	public static final String CREDIT_ACTION_VOTE="vote";//投票
 	
	public static final String CREDIT_ACTION_RELEASE_QUESTION="releasequestion";//发布提问
    
	public static final String CREDIT_ACTION_EXAMINATION="examination";//考试
	
	public static final String CREDIT_ACTION_LOOKCOURSES="lookcourses";//查看课程
	
	public static final String CREDIT_ACTION_LOOKACTIVITY="lookactivity";//查看活动
	
	public static final String CREDIT_ACTION_DIALY_SIGN = "dailysign";// 每日签到
	
	
	
	
    @Value("${com.longtime.imgserver.download}")
    public void setImgServerDownload(String imgServerDownload){
        IMG_SERVER_DOWNLOAD = imgServerDownload;
    }
    
    
    @Value("${com.longtime.imgserver.upload}")
    public void setImgServerUpLoad(String imgServerUpload){
        IMG_SERVER_UPLOAD = imgServerUpload;
    }
    
	@Value("${com.longtime.imgserver.isqiniu}")
    public void setImgServerUpLoadIsqiniu(String imgServerUpLoadIsqiniu) {
		IMG_SERVER_UPLOAD_ISQINIU = imgServerUpLoadIsqiniu;
	}
    
	@Value("${com.longtime.qiniu.upserver}")
    public void setQiniuUpserver(String qiniuUpserver){
        QINIU_SERVER = qiniuUpserver;
    }
    
    @Value("${com.longtime.iapp.exam.url}")
    public void setExamUrl(String examUrl){
        EXAM_URL = examUrl;
    }
    
    @Value("${com.longtime.ajy.admin.root}")
    public void setAdminRoot(String adminRoot){
        ADMIN_ROOT = adminRoot;
    }
    
    @Value("${com.longtime.ajy.player.root}")
    public void setPlayerRoot(String playerRoot){
        PLAYER_ROOT =  playerRoot;
    }
    
    @Value("${com.longtime.ajy.document.root}")
    public void setDocumentRoot(String documentRoot){
        DOCUMENT_ROOT =  documentRoot;
    }
    @Value("${com.longtime.ajy.fodder.root}")
    public void setFodderRoot(String fodderRot){
    	FODDER_ROOT =  fodderRot;
    }
    
    @Value("${com.longtime.ajy.video.player.url}")
    public void setVideoPlayerUrl(String videoPlayerUrl){
        VIDEO_PLAYER_URL =  videoPlayerUrl;
    }

	@Value("${com.longtime.ajy.weixin.appid}")
    public void setWXAjyAppid(String appid){
        WX_AJY_APPID =  appid;
    }
    
    @Value("${com.longtime.ajy.weixin.appsecret}")
    public void setWXAjyAppSecret(String appsecret){
        WX_AJY_APPSECRET =  appsecret;
    }

    @Value("${com.longtime.ajy.weixin.oauthopen}")
    public void setWXOauthOpen(boolean open){
        WX_OAUTH_OPEN= open;
    }

    @Value("${com.longtime.ajy.courseware.local.path}")
    public void setCoursewareLocalPath(String path){
        COURSEWARE_LOCAL_PATH =  path;
    }
    
    @Value("${com.longtime.ajy.ivideo.server}")
    public void setIVideoServer(String server){
        IVIDEO_SERVER =  server;
    }
    @Value("${com.longtime.qiniu.style.320x180}")
    public void setCourseStyle320180(String style){
        QINIU_COURSE_IMG_STYLE_320_180 =  style;
    }
    
    @Value("${com.longtime.qiniu.style.180x180}")
    public void setCourseStyle180180(String style){
        QINIU_COURSE_IMG_STYLE_180_180 =  style;
    }
    
    @Value("${com.longtime.qiniu.accesskey}")
    public void setQiNiuAccessKey(String accesskey){
        QINIU_ACCESSKEY = accesskey;
    }
    
    @Value("${com.longtime.qiniu.secretkey}")
    public void setQiNiuSecretKey(String secretkey){
        QINIU_SECRETKEY = secretkey;
    }
    @Value("${com.longtime.qiniu.bucket}")
    public void setQinNiuBucket(String bucket){
        QINIU_BUCKET = bucket;
    }
    
    @Value("${com.longtime.qiniu.upload.returnbody}")
    public void setQiNiuUploadReturnBody(String returnBody){
        QINIU_UPLOAD_RETURNBODY = returnBody;
    }
    
    @Value("${com.longtime.course.detail.img}")
    public void setDefaultCourseImg(String defaultCourseImg){
        DEFAULT_COURSE_IMG = defaultCourseImg;
    }
    
    @Value("${com.longtime.ajy.cookie.domain}")
    public void setCookieDomain(String domain){
        COOKIE_DOMAIN = domain;
    }
    
    @Value("${com.longtime.ajy.cookie.prefix}")
    public void setCookieKeyPrefix(String prefix){
        COOKIE_KEY_PREFIX = prefix;
    }
    
    @Value("${com.longtime.websocket.server}")
    public void setWebsocketServer(String websocketServer){
        WEBSOCKET_SERVER = websocketServer;
    }
    @Value("${com.longtime.ajy.download.tmp.dir}")
    public void setDownloadTmpdir(String downloadTmpdir){
    	DOWNLOAD_TMP_DIR = downloadTmpdir;
    }
    
    @Value("${com.longtime.ajy.default.domain}")
    public void setDefaultDomain(String domain){
        DEFAULT_DOMAIN = domain;
    }
    
    @Value("${com.longtime.ajy.cookiesession.neverexpires}")
    public void setCookieSessionNeverExpires(boolean neverExpires){
        COOKIE_SESSION_NEVER_EXPIRES = neverExpires;
    }

    @Value("${com.longtime.ajy.icome.access_token}")
    public void setIcomeAccessToken(String icomeAccessToken){
        ICOME_ACCESS_TOKEN = icomeAccessToken;
    }

    @Value("${com.longtime.ajy.icome.access_token.test}")
    public void setIcomeAccessTokenTest(String icomeAccessTokenTest){
        ICOME_ACCESS_TOKEN_TEST = icomeAccessTokenTest;
    }

    @Value("${com.longtime.ajy.icome.userinfo}")
    public void setIcomeUserVo(String userinfo){
        ICOME_USER_INFO = userinfo;
    }








}
