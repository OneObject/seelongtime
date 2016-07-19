package com.longtime.app.base.util;

import java.util.Random;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Component;
import org.springframework.beans.factory.annotation.Value;

@Component
@Lazy(false)
public class Constant {

	public static String EXAM_URL; //学员考试url
	
	public static String ADMIN_ROOT; // 管理员端root地址
	
	public static String PLAYER_ROOT; // 课件播放器root地址
	
	public static String VIDEO_PLAYER_URL;//视频播放器地址
	
	public static String IMG_SERVER_DOWNLOAD;
    public static String IMG_SERVER_UPLOAD;
    public static String QINIU_SERVER;  //七牛up服务
    
    public static String QINIU_COURSE_IMG_STYLE_320_180;
    public static String QINIU_COURSE_IMG_STYLE_180_180;
    
    
    public static String  QINIU_ACCESSKEY;
    public static String  QINIU_SECRETKEY;
    public static String  QINIU_BUCKET;
    public static String  QINIU_UPLOAD_RETURNBODY;
    
    public static String DOWNLOAD_TMP_DIR;

    
    public static String WX_AJY_APPID;
    public static String WX_AJY_APPSECRET;
    
    public static String COURSEWARE_LOCAL_PATH;//本机课件路径
    
    public static String IVIDEO_SERVER;//
    
    public static String DEFAULT_COURSE_IMG;
    
    
    public static String COOKIE_DOMAIN;
    
    public static String COOKIE_KEY_PREFIX=StringUtils.EMPTY;
    
    public static String WEBSOCKET_SERVER;//websocket服务地址
    
    public static String FODDER_BASE_PATH;
    
    public static String NOTIFY_COURSE_TITLE = "%s发布了";//%s代表课程名称 

    //每日签到title，content，pic
    private static String NOTIFY_SIGN_REMAIND_TITLE;

	private static String NOTIFY_SIGN_REMAIND_CONTENT;

	private static String NOTIFY_SIGN_REMAIND_PIC;
	
	//每日签到title，content，pic
    private static String NOTIFY_CREDIT_RANK_TITLE;

	private static String NOTIFY_CREDIT_RANK_CONTENT;

	private static String NOTIFY_CREDIT_RANK_PIC;
	
	
	//未完成课程title，pic
    private static String COURSE_UNCOMPILE_TITLE;

	private static String COURSE_UNCOMPILE_PIC;
	
	public static String getUnCompleteCourseTitle() {
		String[] items = COURSE_UNCOMPILE_TITLE.split("｜");
		return items[getRandomIndex(items.length)];
	}

	public static String getUnCompleteCoursePic() {
		String[] items = COURSE_UNCOMPILE_PIC.split("｜");
		return items[getRandomIndex(items.length)];
	}
	
	public static String getCreditRankContent() {
		String content = NOTIFY_CREDIT_RANK_CONTENT;
		String[] items = content.split("｜");
		return items[getRandomIndex(items.length)];
	}
	
	public static String getCreditRankTitle() {
		String[] items = NOTIFY_CREDIT_RANK_TITLE.split("｜");
		return items[getRandomIndex(items.length)];
	}

	public static String getCreditRankPic() {
		String[] items = NOTIFY_CREDIT_RANK_PIC.split("｜");
		return items[getRandomIndex(items.length)];
	}

	public static String getSignRemaindContent() {
		String content = NOTIFY_SIGN_REMAIND_CONTENT;
		String[] items = content.split("｜");
		return items[getRandomIndex(items.length)];
	}
	
	public static String getSignRemaindTitle() {
		String[] items = NOTIFY_SIGN_REMAIND_TITLE.split("｜");
		return items[getRandomIndex(items.length)];
	}

	public static String getSignRemaindPic() {
		String[] items = NOTIFY_SIGN_REMAIND_PIC.split("｜");
		return items[getRandomIndex(items.length)];
	}
	
	private static int getRandomIndex(int length){
		Random random = new Random();
		return random.nextInt(length);
	}
    
    // 定义积分Action常量
 	public static final java.lang.String CREDIT_ACTION_COMMENT = "comment";// 评论
 	
 	public static final java.lang.String CREDIT_ACTION_PRAISE = "praise";// 赞
 	
 	public static final java.lang.String CREDIT_ACTION_STUDY= "study";// 学习
 	
 	public static final java.lang.String CREDIT_ACTION_LOGIN= "login";// 每日登录
 	
 	public static final java.lang.String CREDIT_ACTION_BIND="bind";// 微信绑定
 	
 	public static final java.lang.String CREDIT_ACTION_ACTIVITY_APPLY="activityapply";//活动报名    
 	
 	public static final java.lang.String CREDIT_ACTION_ACTIVITY_SIGNIN="activitysignin";//活动签到
 	
 	public static final java.lang.String CREDIT_ACTION_VOTE="vote";//投票
    
	public static final java.lang.String CREDIT_ACTION_RELEASE_QUESTION="releasequestion";//发布提问
    
	public static final java.lang.String CREDIT_ACTION_EXAMINATION="examination";//发布提问
	
	public static final java.lang.String CREDIT_ACTION_LOOKCOURSES="lookcourses";//查看课程
	
	public static final java.lang.String CREDIT_ACTION_LOOKACTIVITY="lookactivity";//查看活动

	public static final String DOMAIN_ROBAM = "robam";//老板电器域名
	
    @Value("${com.longtime.imgserver.download}")
    public void setImgServerDownload(String imgServerDownload){
        IMG_SERVER_DOWNLOAD = imgServerDownload;
    }
    
    
    @Value("${com.longtime.imgserver.upload}")
    public void setImgServerUpLoad(String imgServerUpload){
        IMG_SERVER_UPLOAD = imgServerUpload;
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
    
    @Value("${com.longtime.ixin.ACCESSKEY}")
    public void setQiNiuAccessKey(String accesskey){
        QINIU_ACCESSKEY = accesskey;
    }
    
    @Value("${com.longtime.ixin.SECRETKEY}")
    public void setQiNiuSecretKey(String secretkey){
        QINIU_SECRETKEY = secretkey;
    }
    @Value("${com.longtime.ixin.BUCKETNAME}")
    public void setQinNiuBucket(String bucket){
        QINIU_BUCKET = bucket;
    }
    
    @Value("${com.longtime.ixin.RETURNBODY}")
    public void setQiNiuUploadReturnBody(String returnBody){
        QINIU_UPLOAD_RETURNBODY = returnBody;
    }
    
    @Value("${com.longtime.ajy.download.tmp.dir}")
    public void setDOWNLOAD_TMP_DIR(String dOWNLOAD_TMP_DIR) {
		DOWNLOAD_TMP_DIR = dOWNLOAD_TMP_DIR;
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
    
    @Value("${com.longtime.ixin.matterdetail_basepath}")
	public void setFODDER_BASE_PATH(String fODDER_BASE_PATH) {
		FODDER_BASE_PATH = fODDER_BASE_PATH;
	}
    
    @Value("${com.longtime.notify.sign.remaind.title}")
	public void setNOTIFY_SIGN_REMAIND_TITLE(String nOTIFY_SIGN_REMAIND_TITLE) {
		NOTIFY_SIGN_REMAIND_TITLE = nOTIFY_SIGN_REMAIND_TITLE;
	}

    @Value("${com.longtime.notify.sign.remaind.content}")
	public void setNOTIFY_SIGN_REMAIND_CONTENT(String nOTIFY_SIGN_REMAIND_CONTENT) {
		NOTIFY_SIGN_REMAIND_CONTENT = nOTIFY_SIGN_REMAIND_CONTENT;
	}

    @Value("${com.longtime.notify.sign.remaind.pic}")
	public void setNOTIFY_SIGN_REMAIND_PIC(String nOTIFY_SIGN_REMAIND_PIC) {
		NOTIFY_SIGN_REMAIND_PIC = nOTIFY_SIGN_REMAIND_PIC;
	}

    @Value("${com.longtime.notify.credit.rank.title}")
	public void setNOTIFY_CREDIT_RANK_TITLE(String nOTIFY_CREDIT_RANK_TITLE) {
		NOTIFY_CREDIT_RANK_TITLE = nOTIFY_CREDIT_RANK_TITLE;
	}
	
	@Value("${com.longtime.notify.credit.rank.content}")
	public void setNOTIFY_CREDIT_RANK_CONTENT(
			String nOTIFY_CREDIT_RANK_CONTENT) {
		NOTIFY_CREDIT_RANK_CONTENT = nOTIFY_CREDIT_RANK_CONTENT;
	}
	
	@Value("${com.longtime.notify.credit.rank.pic}")
	public void setNOTIFY_CREDIT_RANK_PIC(String nOTIFY_CREDIT_RANK_PIC) {
		NOTIFY_CREDIT_RANK_PIC = nOTIFY_CREDIT_RANK_PIC;
	}
	
	@Value("${com.longtime.uncomple.course.title}")
	public void setCOURSE_UNCOMPILE_TITLE(String cOURSE_UNCOMPILE_TITLE) {
		COURSE_UNCOMPILE_TITLE = cOURSE_UNCOMPILE_TITLE;
	}
	
	@Value("${com.longtime.uncomple.course.pic}")
	public void setCOURSE_UNCOMPILE_PIC(String cOURSE_UNCOMPILE_PIC) {
		COURSE_UNCOMPILE_PIC = cOURSE_UNCOMPILE_PIC;
	}
    
}
