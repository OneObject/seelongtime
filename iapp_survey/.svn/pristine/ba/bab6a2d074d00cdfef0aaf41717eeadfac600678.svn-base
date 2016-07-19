package com.longtime.app.ixin.mgr.topic.service.impl;

import java.io.IOException;

import org.apache.commons.io.FileUtils;
import com.google.common.base.Joiner;
import com.longtime.ajy.support.service.WxCpAgentService;
import com.longtime.ajy.support.service.WxMpAgent;
import com.longtime.app.base.model.User;
import com.longtime.app.config.Constants;
import com.longtime.app.ixin.api.WeiXinAPIHelper;
import com.longtime.app.ixin.api.WeiXinAPIHelper.WXUserInfo;
import com.longtime.app.ixin.mgr.model.TokenInfo;
import com.longtime.app.ixin.mgr.model.WXUser;
import com.longtime.app.ixin.mgr.service.ITokenService;
import com.longtime.app.ixin.mgr.service.IXinUserService;
import com.longtime.app.ixin.mgr.service.WXUserService;
import com.longtime.app.ixin.mgr.topic.dao.CommentDao;
import com.longtime.app.ixin.mgr.topic.dao.TopicDao;
import com.longtime.app.ixin.mgr.topic.model.CommentEntity;
import com.longtime.app.ixin.mgr.topic.model.TopicEntity;
import com.longtime.app.ixin.mgr.topic.service.CommentService;
import com.longtime.app.ixin.protocol.ItemArticle;
import com.longtime.app.ixin.protocol.MessageEvent;
import com.longtime.app.ixin.protocol.MessageImage;
import com.longtime.app.ixin.protocol.MessageText;
import com.longtime.app.ixin.protocol.ReplyMessage;
import com.longtime.app.ixin.protocol.ReplyMessageNews;
import com.longtime.app.ixin.protocol.ReplyMessageText;
import com.longtime.app.ixin.service.handlers.AbstartMessageHandler;
import com.longtime.app.util.IdGenerator;
import com.longtime.common.comet.Message;
import com.longtime.common.comet.MsgNotifer;
import com.longtime.common.protocol.MapSerializable;
import com.longtime.common.pubsub.PubService;
import com.myctu.platform.protocol.ExtMapUtils;
import com.ssf.core.Matcher;
import com.ssf.utils.IOUtils;
import com.telecom.ctu.platform.common.cache.CacheService;
import java.io.BufferedReader;
import java.io.File;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;
import javax.annotation.Resource;
import me.chanjar.weixin.cp.bean.WxCpUser;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

@Service("topicCommentService")
public class CommentServiceImpl extends AbstartMessageHandler implements CommentService {

	private static Logger logger = LoggerFactory.getLogger(CommentServiceImpl.class);

	private static final DateFormat df = new SimpleDateFormat("HH:mm:ss");
	private static InputStream is = null;
	private static int EXPIRE_TIME = 43200;
	
	static {
		try {
			is = Thread.currentThread().getContextClassLoader().getResourceAsStream("sensitive_words");
			BufferedReader br = new BufferedReader(new InputStreamReader(is, "utf-8"));
			String tmp = null;
			while ((tmp = br.readLine()) != null) {
				Matcher.addKeyWord(tmp);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			IOUtils.closeQuietly(is);
		}
	}

	@Resource(name = "topicCommentDao")
	private CommentDao topicCommentDao;

	@Resource
	private PubService pubService;

	// @Resource
	private MsgNotifer msgNotifer;

	@Resource(name = "topicDao")
	private TopicDao topicDao;

	@Resource(name = "iXinUserService")
	private IXinUserService iXinUserService;
	
	@Resource(name = "lt.cacheService")
	private CacheService cacheService;
	
	@Resource(name = "wxUserService")
	private WXUserService wxUserService;
	
	@Resource(name = "tokenService")
	private ITokenService tokenService;
	
	@Value("${com.longtime.ixin.COVER_SUFFIX}")
	private String coverSuffix;
	@Value("${com.longtime.ixin.IMAGE_BASE_PATH}")
	private String qiniuImageBasePath;
	@Value("${com.longtime.ixin.matterdetail_basepath}")
	private String fodderBasePath;

	@Override
	public int getTopicCommentTotalSize(String topicId) {
		return topicCommentDao.getTopicCommentTotalSize(topicId);
	}

	@Override
	public List<CommentEntity> queryCommentListByTopicId(int pageSize, int currPage, String topicId) {

		return topicCommentDao.queryCommentListByTopicId(pageSize, currPage, topicId);
	}
	
	@Override
	public List<CommentEntity> queryInWallCommentListByTopicId(int pageSize,int currPage,String topicId){
		return topicCommentDao.queryInWallCommentListByTopicId(pageSize, currPage, topicId);
	}
	
	
	

	@Override
	public void updateCommentShieldStatus(String id, int shield) {

		CommentEntity comment = topicCommentDao.loadById(id);
		if (null == comment) {
			return;
		}
		if (comment.getShield() == shield) {
			return;
		}
		topicCommentDao.updateCommentShieldStatus(id, shield);

//		TopicEntity topic = this.topicDao.getTopicEntityById(comment.getTopicId());

		// if(topic.getIsaudit() == 1 && shield == 0){// isaudit
		// 是否开启审核，0代表关闭审核，1代表开启审核;shield, 0代表审核通过，1代表取消审核
		if (shield == 0) {// shield, 0代表审核通过，1代表取消审核
			String headImgUrl = "";
			WallMessgae wallMessage = new WallMessgae();
			wallMessage.setId(id);
			wallMessage.setTid(comment.getTopicId());
			wallMessage.setOpenId(comment.getD_openid());
			wallMessage.setUid(comment.getUid());
			wallMessage.setContent(comment.getContent());
			wallMessage.setUname(comment.getUname());
			if(StringUtils.isNotBlank(comment.getHeadimgurl())){
				headImgUrl = comment.getHeadimgurl();
			}
			if(StringUtils.isBlank(headImgUrl) && StringUtils.isNotBlank(comment.getUid())){
				headImgUrl  = String.format("%suser/avatar/%s.xhtml?style=128x128", Constants.STUDENT_WEB_ROOT,comment.getUid());
			}
			
			wallMessage.setHeadImgUrl(headImgUrl);
			wallMessage.setCommentTime(comment.getCommentTime());
			wallMessage.setType(comment.getType());
			pub(wallMessage);
		} else if (shield == 1 && StringUtils.isNotBlank(comment.getTopicId())) { // 通知删除微信墙中对应的评论
			WallMessgae wallMessage = new WallMessgae();
			wallMessage.setId(id);
			wallMessage.setTid(comment.getTopicId());
			wallMessage.setAction(WallMessgae.ACTION_DEL);
			pub(wallMessage);
			// send(wallMessage);
		}
	}

	public void deleteById(String id) {
		CommentEntity comment = topicCommentDao.loadById(id);
		if (null == comment) {
			return;
		}
		topicCommentDao.deleteById(id);
		if (comment.getShield() == 0) {
			WallMessgae wallMessage = new WallMessgae();
			wallMessage.setId(id);
			wallMessage.setTid(comment.getTopicId());
			wallMessage.setAction(WallMessgae.ACTION_DEL);
			pub(wallMessage);
			// send(wallMessage);
		}
	}
	
	@Override
	public ReplyMessage processEvent(MessageEvent messageEvent) {
		MessageText text = new MessageText();
		text.setFromUserName(messageEvent.getFromUserName());
		text.setDomain(messageEvent.getDomain());
		String key = messageEvent.getEventKey();
		if(StringUtils.isBlank(key)){
			key = messageEvent.getEvent();
		}
		text.setContent(key);
		return processText(text);
	}
	
	@Override
	public ReplyMessage processImage(MessageImage messageImage) {
		if(StringUtils.isBlank(messageImage.getPicUrl())){
			return emptyMessage();
		}
		String openId = messageImage.getFromUserName();
		String content = messageImage.getPicUrl();
		String domain = messageImage.getDomain();
		String keyword = cacheService.get(getKey(openId));
		if(StringUtils.isNotBlank(keyword)){
			toHandlerTopic(openId,content,domain,keyword,WallMessgae.TYPE_IMAGE,messageImage.isWxQY(),messageImage.getMediaId());
			cacheService.put(getKey(openId), EXPIRE_TIME, keyword);
		}
		return emptyMessage();
	}
	
	private String getKey(String openid){
		return String.format("wallx_%s", openid);
	}

	@Override
	public ReplyMessage processText(MessageText messageText) {
		String openId = messageText.getFromUserName();
		String content = messageText.getContent();
		String domain = messageText.getDomain();
		
		if(StringUtils.isBlank(content)){
			return emptyMessage();
		}
		
		//从缓存内取出上下文关键字，如果不为空，将内容直接上墙
		String keyword = cacheService.get(getKey(openId));
		if(StringUtils.isNotBlank(keyword)){
			toHandlerTopic(openId,content,domain,keyword,WallMessgae.TYPE_TEXT,messageText.isWxQY(),null);
			cacheService.put(getKey(openId), EXPIRE_TIME, keyword);
			return emptyMessage();
		}

		//不处于上下文环境中，判断是否是#key# content方式，是则抽取内容和关键字执行上墙操作
		String[] array = formatWallCommode(content);
		if (array != null) {
			String comment = array[1];
			String keywords = array[0];
			toHandlerTopic(openId, comment, domain, keywords,WallMessgae.TYPE_TEXT,messageText.isWxQY(),null);
			return emptyMessage();
		}
		
		//开启上下文
		cacheService.put(getKey(openId), EXPIRE_TIME, StringUtils.trim(content));
		if("ENN".equals(domain)){
			User user = iXinUserService.getUserByDopenId(openId, domain);
			if(user == null){
				ReplyMessageNews replyMessageNews = new ReplyMessageNews();
				List<ItemArticle> articleItems = new ArrayList<ItemArticle>();
				ItemArticle itemArticle = new ItemArticle();
				itemArticle.setId("f4145bed02184cff87e0470aed858727");//正式：f4145bed02184cff87e0470aed858727
				itemArticle.setDescription("如已绑定系统账号，请点击本消息以实名参与讨论");
				itemArticle.setTitle("请点\"我\"以实名参与讨论");
				itemArticle.setPicUrl(String.format("%s%s%s", qiniuImageBasePath,"Fk3DkWE6LL3kCXqiKgbyfFUxmB9l",coverSuffix));
				itemArticle.setUrl(String.format("%s%s%s&fdomain=ENN", fodderBasePath,"id=","f4145bed02184cff87e0470aed858727"));
				articleItems.add(itemArticle);
				replyMessageNews.setArticleItems(articleItems);
				replyMessageNews.setMsgType(ReplyMessage.REPLY_MESSAGE_NEWS);
				replyMessageNews.setCount(1);
				return replyMessageNews;
			} else {
				ReplyMessageText text = new ReplyMessageText();
				text.setMsgType(ReplyMessage.REPLY_MESSAGE_TEXT);
				text.setContent("您已经开启微信墙发言，输入\"tc\"退出。");
				return text;
			}
			
		}if("enntest".equals(domain)){
			User user = iXinUserService.getUserByDopenId(openId, domain);
			if(user == null){
				ReplyMessageNews replyMessageNews = new ReplyMessageNews();
				List<ItemArticle> articleItems = new ArrayList<ItemArticle>();
				ItemArticle itemArticle = new ItemArticle();
				itemArticle.setId("f4145bed02184cff87e0470aed858726");//正式：f4145bed02184cff87e0470aed858727
				itemArticle.setDescription("如已绑定系统账号，请点击本消息以实名参与讨论");
				itemArticle.setTitle("请点\"我\"以实名参与讨论");
				itemArticle.setPicUrl(String.format("%s%s%s", qiniuImageBasePath,"Fk3DkWE6LL3kCXqiKgbyfFUxmB9l",coverSuffix));
				itemArticle.setUrl(String.format("%s%s%s&fdomain=enntest", fodderBasePath,"id=","e2d7cbf662cc4676afc91c7db9cc69f5"));
				articleItems.add(itemArticle);
				replyMessageNews.setArticleItems(articleItems);
				replyMessageNews.setMsgType(ReplyMessage.REPLY_MESSAGE_NEWS);
				replyMessageNews.setCount(1);
				return replyMessageNews;
			} else {
				ReplyMessageText text = new ReplyMessageText();
				text.setMsgType(ReplyMessage.REPLY_MESSAGE_TEXT);
				text.setContent("您已经开启微信墙发言，输入\"tc\"退出。");
				return text;
			}
		} else {
			ReplyMessageText text = new ReplyMessageText();
			text.setMsgType(ReplyMessage.REPLY_MESSAGE_TEXT);
			text.setContent("您已经开启微信墙发言，输入\"tc\"退出。");
			return text;
		}
		
	}
	
	private static String DEFAULT_UNAME = "匿名";
	
	//执行上墙的业务操作
	private void toHandlerTopic(String d_openid, String content, String domain,String keywords,int type,boolean isWxQY,String mediaId) {
		if (StringUtils.isBlank(keywords)) {
			return;
		}

		// 根据关键字查询TopicEntity信息
		TopicEntity entity = topicDao.queryTopicEntityByKeywords(keywords, domain);

		if (null == entity) {
			return;
		}
		
		if(entity.getSupportimage()!=1 && type==CommentEntity.TYPE_IMAGE){ //不支持图片
			return;
		}
		
		String commentId = IdGenerator.nextId32().toString();

		String uname = "";

		String headImgUrl = "";
		
		/*
		// 根据opendid获取用户信息
		IXinUser iXinUser = iXinUserService.getIxinUserOrInsert(openId, domain);
		if (null != iXinUser) {
			uname = iXinUser.getNickname();
			headImgUrl = iXinUser.getHeadimgurl();
		}
		*/
		String uid = "";
		User user = iXinUserService.getUserByDopenId(d_openid, domain);
		if(null!=user ){
			uid = user.getId();
			if( user.getUsertype()==User.USER_TYPE_COMMON){ // 不是临时用户
				if(StringUtils.isNotBlank(user.getName())){
					uname = user.getName();
				}
				if(StringUtils.isNotBlank(user.getAvatar())){
					headImgUrl = String.format("%suser/avatar/%s.xhtml?style=128x128", Constants.STUDENT_WEB_ROOT,user.getId());
				}
			}
		}
		
		if(StringUtils.isBlank(uname) || StringUtils.isBlank(headImgUrl)){
			//获取微信昵称和头像
			WXUser wxUser = this.wxUserService.loadById(d_openid);
			if(wxUser != null){
				if(StringUtils.isBlank(uname)){
					uname = wxUser.getNickname();
				}
				if(StringUtils.isBlank(headImgUrl)){
					headImgUrl = wxUser.getHeadimgurl();
				}
			} else {
				
				if(isWxQY){
					WxCpUser wxCpUser = WxCpAgentService.userGet(d_openid,domain);
					if(wxCpUser != null){
						if(StringUtils.isBlank(uname)){
							uname = wxCpUser.getName();
						}
						if(StringUtils.isBlank(headImgUrl)){
							headImgUrl = wxCpUser.getAvatar();
						}
						
						WXUserInfo wxUserInfo = new WXUserInfo();
						wxUserInfo.setOpenid(d_openid);
						wxUserInfo.setHeadimgurl(wxCpUser.getAvatar());
						wxUserInfo.setNickname(wxCpUser.getName());
						this.wxUserService.add(wxUserInfo,domain);
					}
				} else {
				    
				    TokenInfo tokenInfo = tokenService.getTokenInfoByDomain(domain);
					if(null!=tokenInfo){
						WXUserInfo wxUserInfo = WeiXinAPIHelper.getUserInfo(tokenInfo.getAppId(),tokenInfo.getAppSecret(),d_openid);
						if(wxUserInfo != null && wxUserInfo.getSubscribe() != 0){
							if(StringUtils.isBlank(uname)){
								uname = wxUserInfo.getNickname();
							}
							if(StringUtils.isBlank(headImgUrl)){
								headImgUrl = wxUserInfo.getHeadimgurl();
							}
							this.wxUserService.add(wxUserInfo,domain);
						}
					}
				}
			}
		}
		
		if(StringUtils.isBlank(uname)){
			uname = DEFAULT_UNAME;
		}
//		if(StringUtils.isBlank(headImgUrl)){
//			headImgUrl = String.format("%suser/avatar/%s.xhtml?style=128x128", Constants.STUDENT_WEB_ROOT,user.getId());
//		}
		
		
		
		
		
		//处理图片
		if(type == CommentEntity.TYPE_IMAGE && StringUtils.isNotBlank(mediaId)){
		    // TODO
		    // 获取图片地址
		    
		    File tmp = null;
		    if(isWxQY){
		        tmp = WxCpAgentService.mediaDownload(mediaId, domain); 
		    }else{
		        
		         tmp =    WxMpAgent.mediaDownload(mediaId, domain);
		        
		        
		    }
		        if(null!=tmp){
		            // 保存到resource目录
		            File local=new File(String.format("%s/%s",Constants.getWeixinImgSaveLocalPath(),tmp.getName()));
		            try {
                        FileUtils.copyFile(tmp, local);
                        
                        // 图片路径
                        content = String.format("%s%s/%s",Constants.STUDENT_WEB_ROOT ,Constants.WEIXIN_DOWNLOAD_IMG_PATH,local.getName()  );
                        
                    } catch (IOException e) {
                        logger.error(String.format("copy file due to error.from=[%s] to=[%s]", tmp.getAbsolutePath(),local.getAbsolutePath()),e);
                    }finally{
                        if(null!=tmp){ //删除临时文件
                            FileUtils.deleteQuietly(tmp);
                        }
                        
                    }
		        }
		        
		    
		    
		}
		
		

		int shield = 1;// 0代表审核通过，1代表取消审核
		if (entity.getIsaudit() == 0   ) {// isaudit 是否开启审核，0代表关闭审核，1代表开启审核;
			// 过滤
			if (type == CommentEntity.TYPE_IMAGE || !Matcher.isIllegal(content)) {//图片的时候,验证合法的时候 直接发送
				// 保存成为，审核通过的状态
				shield = 0;
				WallMessgae wallMessage = new WallMessgae();
				wallMessage.setId(commentId);
				wallMessage.setTid(entity.getId());
				wallMessage.setOpenId(d_openid);
				wallMessage.setUid(uid);
				wallMessage.setContent(content);
				wallMessage.setUname(uname);
				wallMessage.setHeadImgUrl(headImgUrl);
				wallMessage.setCommentTime(System.currentTimeMillis());
				wallMessage.setType(type);
				// send(wallMessage);
				pub(wallMessage);
				logger.info("after pub(wallMessage)");
			}
		}
		// 保存DB
		CommentEntity commentEntity = CommentEntity.newCommentEntity(entity.getId(), null, content, commentId,
				shield,uid,d_openid);
		commentEntity.setUname(uname);
		commentEntity.setHeadimgurl(headImgUrl);;
		commentEntity.setType(type);
		topicCommentDao.saveUserTopicComment(commentEntity);
	}

	private ReplyMessage emptyMessage() {
		ReplyMessageText replyMessage = new ReplyMessageText();
		replyMessage.setMsgType(ReplyMessage.MESSAGE_TEXT);
		replyMessage.setContent("");
		return replyMessage;
	}

	// 使用新的方式发布消息
	private static final String channel = "lt.c.wall";

	private void pub(WallMessgae event) {
		pubService.pub4async(channel, event);
	}

	public void send(WallMessgae wallMessage) {
		String channel = wallMessage.getTid();
		Message message = new Message();
		message.setChannel(channel);
		message.setData(wallMessage);
		msgNotifer.send(message);
	}

	public static class WallMessgae implements MapSerializable {
		private static final long serialVersionUID = 8270995013654803951L;
		public static final int ACTION_NORMAL = 1;
		public static final int ACTION_DEL = 2;

		private String id;
		private String tid;
		private String uid;
		private String uname;
		private String openId;
		private String content;
		private String headImgUrl;
		private long commentTime = System.currentTimeMillis();

		private String commentTimeFormat = df.format(new Date(this.commentTime));

		private int action = ACTION_NORMAL;// 1 add 2 delete

		private String room_format = "wall_%s";
		
		private int type = TYPE_TEXT; //评论内容类型0文本  1图片
		
		
		public static final int TYPE_TEXT = 0;
		
		public static final int TYPE_IMAGE = 1;

		public String getRoom() {
			return String.format(room_format, this.tid);
		}

		public String getUname() {
			return uname;
		}

		public void setUname(String uname) {
			this.uname = uname;
		}

		public String getUid() {
			return uid;
		}

		public void setUid(String uid) {
			this.uid = uid;
		}

		public String getOpenId() {
			return openId;
		}

		public void setOpenId(String openId) {
			this.openId = openId;
		}

		public String getContent() {
			return content;
		}

		public void setContent(String content) {
			this.content = content;
		}

		public long getCommentTime() {
			return commentTime;
		}

		public void setCommentTime(long commentTime) {
			this.commentTime = commentTime;
			this.commentTimeFormat = df.format(new Date(this.commentTime));
		}

		public String getHeadImgUrl() {
			return headImgUrl;
		}

		public void setHeadImgUrl(String headImgUrl) {
			this.headImgUrl = headImgUrl;
		}

		public String getId() {
			return id;
		}

		public void setId(String id) {
			this.id = id;
		}

		public String getTid() {
			return tid;
		}

		public void setTid(String tid) {
			this.tid = tid;
		}

		public int getAction() {
			return action;
		}

		public void setAction(int action) {
			this.action = action;
		}

		public String getCommentTimeFormat() {
			return this.commentTimeFormat;
		}
		
		public int getType() {
			return type;
		}

		public void setType(int type) {
			this.type = type;
		}

		@Override
		public Map<String, Object> toMap() {
			Map<String, Object> map = new HashMap<String, Object>(8);
			ExtMapUtils.addIfNotNull(map, "id", id);
			ExtMapUtils.addIfNotNull(map, "tid", tid);
			ExtMapUtils.addIfNotNull(map, "uname", uname);
			ExtMapUtils.addIfNotNull(map, "action", action);
			ExtMapUtils.addIfNotNull(map, "headImgUrl", headImgUrl);
			ExtMapUtils.addIfNotNull(map, "openId", openId);
			ExtMapUtils.addIfNotNull(map, "uid", uid);
			ExtMapUtils.addIfNotNull(map, "content", content);
			ExtMapUtils.addIfNotNull(map, "commentTime", commentTime);
			ExtMapUtils.addIfNotNull(map, "commentTimeFormat", commentTimeFormat);
			ExtMapUtils.addIfNotNull(map, "type", type);
			return map;
		}

		@Override
		public void fromMap(Map<String, Object> in) {
			this.id = ExtMapUtils.getString(in, "id");
			this.tid = ExtMapUtils.getString(in, "tid");
			this.uname = ExtMapUtils.getString(in, "uname");
			this.headImgUrl = ExtMapUtils.getString(in, "headImgUrl");
			this.openId = ExtMapUtils.getString(in, "openId");
			this.uid = ExtMapUtils.getString(in, "uid");
			this.content = ExtMapUtils.getString(in, "content");
			if (in.containsKey("action")) {
				this.action = ExtMapUtils.getInteger(in, "action");
			}
			if (in.containsKey("commentTime")) {
				this.commentTime = ExtMapUtils.getLong(in, "commentTime");
				this.commentTimeFormat = ExtMapUtils.getString(in, "commentTimeFormat");
			}
			if(in.containsKey("type")){
				this.type = ExtMapUtils.getInteger(in, "type");
			}
		}

		@Override
		public String toString() {
			return String.format("WallMessgae [id=%s, tid=%s, uid=%s, uname=%s, openId=%s, content=%s, headImgUrl=%s, commentTime=%s, commentTimeFormat=%s, action=%s, room_format=%s, type=%s]",
				id,
				tid,
				uid,
				uname,
				openId,
				content,
				headImgUrl,
				commentTime,
				commentTimeFormat,
				action,
				room_format,
				type);
		}

	}

	/**
	 * 格式化由用从微信发表的微信墙评论信息 key,content
	 * 
	 * @param message
	 * @return
	 */
	private static final String pattern = "^[#＃](.+)[#＃](.*)";

	private static String[] formatWallCommode(String message) {
		if (StringUtils.isBlank(message)) {
			return null;
		}
		message = StringUtils.trim(message);
		Pattern r = Pattern.compile(pattern);
		java.util.regex.Matcher m = r.matcher(message);
		String[] array = new String[2];
		if (m.find()) {
			array[0] = StringUtils.trimToEmpty(m.group(1));
			array[1] = StringUtils.trimToEmpty(m.group(2));

			return array;
		} else {
			return null;
		}

	}



	@Override
	public void batchUpdateShield(int shield, String[] ids) {
		for (int i = ids.length-1; i >=0; i--) {
			CommentEntity comment = this.topicCommentDao.loadById(ids[i]);
			if (comment.getShield() != shield) {// 当前状态需要改变
				comment.setShield(shield);
				if (shield == 0) {// shield, 0代表审核通过，1代表取消审核
					String headImgUrl = "";
					WallMessgae wallMessage = new WallMessgae();
					wallMessage.setId(comment.getId());
					wallMessage.setTid(comment.getTopicId());
					wallMessage.setOpenId(comment.getD_openid());
					wallMessage.setUid(comment.getUid());
					wallMessage.setContent(comment.getContent());
					wallMessage.setUname(comment.getUname());
					if(StringUtils.isNotBlank(comment.getUid())){
						headImgUrl  = String.format("%suser/avatar/%s.xhtml?style=128x128", Constants.STUDENT_WEB_ROOT,comment.getUid());
					}
					wallMessage.setHeadImgUrl(headImgUrl);
					wallMessage.setCommentTime(comment.getCommentTime());
					wallMessage.setType(comment.getType());
					pub(wallMessage);
				} else if (shield == 1 && StringUtils.isNotBlank(comment.getTopicId())) { // 通知删除微信墙中对应的评论
					WallMessgae wallMessage = new WallMessgae();
					wallMessage.setId(comment.getId());
					wallMessage.setTid(comment.getTopicId());
					wallMessage.setAction(WallMessgae.ACTION_DEL);
					pub(wallMessage);
				}
				this.topicCommentDao.updateCommentShieldStatus(ids[i], shield);
			}
		}
	}
	
	
	static class WallUserInfo{
		String  uid;
		String  uname;
		String  headImgUrl;
	}
	

	
	
	   public static void main(String[] args) {
	        System.out.println(Joiner.on(",").join(CommentServiceImpl.formatWallCommode("＃test＃ 12323")));
	        System.out.println(Joiner.on(",").join(CommentServiceImpl.formatWallCommode("#test ＃ 12323")));
	        System.out.println(Joiner.on(",").join(CommentServiceImpl.formatWallCommode("#test# 12323")));

	        File f = new File("/Users/longtime/Downloads/资料.rar");
	        System.out.println(f.getName());
	    }


}
