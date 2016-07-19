package com.longtime.ajy.support.service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.util.HtmlUtils;

import com.google.common.base.Joiner;
import com.google.common.collect.Lists;
import com.google.gson.JsonObject;
import com.longtime.ajy.support.bean.WxCpInRedisConfigStorage;
import com.longtime.app.base.model.Organization;
import com.longtime.app.base.model.User;
import com.longtime.app.base.util.Constant;
import com.longtime.app.ixin.mgr.fodder.model.FodderEntity;
import com.longtime.app.ixin.mgr.fodder.service.FodderService;
import com.longtime.app.ixin.mgr.model.TokenInfo;
import com.longtime.app.ixin.mgr.service.ITokenService;
import com.longtime.app.util.HTMLUtils;
import com.longtime.app.util.MessageBody;
import com.longtime.common.spring.SpringContextUtil;

import me.chanjar.weixin.common.api.WxConsts;
import me.chanjar.weixin.common.exception.WxErrorException;
import me.chanjar.weixin.cp.api.WxCpService;
import me.chanjar.weixin.cp.api.WxCpServiceImpl;
import me.chanjar.weixin.cp.bean.WxCpDepart;
import me.chanjar.weixin.cp.bean.WxCpMessage;
import me.chanjar.weixin.cp.bean.WxCpUser;

public class WxCpAgentService {
	
	 private static final Logger logger = LoggerFactory.getLogger(WxCpAgentService.class);
	 private static AtomicBoolean init = new AtomicBoolean(false);
	 private static ITokenService tokenService;
	 private static FodderService fodderService;
	 
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
            if(null == fodderService){
            	fodderService = SpringContextUtil.getBean(FodderService.class);
            }
            init.set(true);
        }
    }
	 
	 /**
	  * 创建用户
	  * @param user
	  * @return
	  */
	 public static boolean userCreate(User user) {
		 WxCpService wxCpService = getWxCpService(user.getDomain());
		 if(wxCpService == null){
			 return false;
		 }
		 WxCpUser wxCpUser = assembleWXCpUser(user);
		 try {
			wxCpService.userCreate(wxCpUser);
			return true;
		} catch (WxErrorException e) {
			logger.error("wxCpService.userCreate due to error.",e);
			if(e.getError().getErrorCode()==60102){//60102 UserID已存在
                logger.error("wxCpService.userCreate. useid exist. retry to update user.");
                return  userUpdate(user);   
            }
			return false;
		}
	 }
	 
	 /**
	  * 更新用户
	  * @param user
	  * @return
	  */
	 public static boolean userUpdate(User user) {
		 WxCpService wxCpService = getWxCpService(user.getDomain());
		 if(wxCpService == null){
			 return false;
		 }
		 WxCpUser wxCpUser = assembleWXCpUser(user);
		 try {
			wxCpService.userUpdate(wxCpUser);
			return true;
		}catch(WxErrorException wxException) {
		    logger.error("wxCpService.userUpdate due to error.",wxException);
		    //  60111 userid not found
		    if(wxException.getError().getErrorCode()==60111){
		        logger.error("wxCpService.userUpdate. user not found. retry to add user.");
		        return  userCreate(user);	
		    }
		    return false;
	     }
	 }
	 
	 /**
	  * 删除用户
	  * @param user
	  * @return
	  */
	 public static boolean userDelete(String username,String domain) {
		 WxCpService wxCpService = getWxCpService(domain);
		 if(wxCpService == null){
			 return false;
		 }
		 try {
			wxCpService.userDelete(username);
			return true;
		} catch (Exception e) {
			logger.error("wxCpService.userDelete due to error.",e);
			return false;
		}
	 }
	 
	 /**
	  * 批量删除用户
	  * @param user
	  * @return
	  */
	 public static boolean userDelete(String[] userids,String domain) {
		 if(userids == null || userids.length == 0){
			 return true;
		 }
		 WxCpService wxCpService = getWxCpService(domain);
		 if(wxCpService == null){
			 return false;
		 }
		 try {
			wxCpService.userDelete(userids);
			return true;
		} catch (Exception e) {
			logger.error("wxCpService.userDelete batch due to error.",e);
			return false;
		}
	 }
	 
	 public static WxCpUser userGet(String userid,String domain) {
		 WxCpService wxCpService = getWxCpService(domain);
		 if(wxCpService == null){
			 return null;
		 }
		 try {
			 WxCpUser user = wxCpService.userGet(userid);
			return user;
		} catch (Exception e) {
			logger.error(String.format("wxCpService.userGet batch due to error,the userid=%s.", userid),e);
			return null;
		}
	 }
	 
	 /**
	  * 禁用用户
	  * @param user
	  * @return
	  */
	 public static boolean userDisabled(User user) {
		 user.setEnable(User.ENABLE_NO);
		 return userUpdate(user);
	 }
	 
	 /**
	  * 邀请用户关注
	  * @param user
	  * @return
	  */
	 public static boolean userInvite(String username,String domain) {
		 WxCpService wxCpService = getWxCpService(domain);
		 if(wxCpService == null){
			 return false;
		 }
		 try {
			String url = "https://qyapi.weixin.qq.com/cgi-bin/invite/send";
			JsonObject jsonObject = new JsonObject();
			jsonObject.addProperty("userid", username);;
			wxCpService.post(url, jsonObject.toString());
			return true;
		} catch (WxErrorException e) {
			logger.error("wxCpService.userInvite due to error.",e);
			if(e.getError().getErrorCode()==45025 || e.getError().getErrorCode()==60119){//"errcode":45025,"errmsg":"you can only invite a member once per week"} errcode=60119, errmsg=contact already joined
			    return true;
			}
			
			return false;
		}
	 }
	 
	 
	 public static boolean[] userInvite2(String username,String domain) {
	     boolean inviteSuccess = false;
	     boolean guanzhuSuccess = false;
         WxCpService wxCpService = getWxCpService(domain);
         if(wxCpService == null){
             return  new  boolean[]{inviteSuccess,guanzhuSuccess};
         }
         try {
            String url = "https://qyapi.weixin.qq.com/cgi-bin/invite/send";
            JsonObject jsonObject = new JsonObject();
            jsonObject.addProperty("userid", username);;
            wxCpService.post(url, jsonObject.toString());
            inviteSuccess = true;
            guanzhuSuccess = false;
            return new  boolean[]{inviteSuccess,guanzhuSuccess};
        } catch (WxErrorException e) {
            logger.error("wxCpService.userInvite due to error.",e);
            if(e.getError().getErrorCode()==45025 || e.getError().getErrorCode()==60119){//"errcode":45025,"errmsg":"you can only invite a member once per week"} errcode=60119, errmsg=contact already joined
                inviteSuccess = true;
            }
            if(e.getError().getErrorCode()==60119){
                guanzhuSuccess =true;
            }
            
            
            
            return new  boolean[]{inviteSuccess,guanzhuSuccess};
        }
     }
	 
	 public static List<WxCpUser> userList(String domain) {
		 WxCpService wxCpService = getWxCpService(domain);
		 if(wxCpService == null){
			 return Lists.newArrayList();
		 }
		 try {
			List<WxCpUser> list = wxCpService.userList(1, true,0);
			return list;
		} catch (Exception e) {
			logger.error(String.format("wxCpService.orgList due to error,domain=%s",domain),e);
			return Lists.newArrayList();
		}
	}
	 
	 
	 /**
	  * 创建组织
	  * @param org
	  * @return 微信公众平台内组织ID
	  */
	 public static Integer orgCreate(Organization org,int parentId) {
		 WxCpService wxCpService = getWxCpService(org.getDomain());
		 if(wxCpService == null){
			 return null;
		 }
		 try {
			WxCpDepart depart = new WxCpDepart();
			depart.setName(org.getName());
			depart.setParentId(parentId);
			Integer departid = wxCpService.departCreate(depart);
			return departid;
		} catch (Exception e) {
			logger.error(String.format("wxCpService.departCreate due to error,oid=%s",org.getId()),e);
			return null;
		}
	 }
	 
	/**
	  * 更新组织
	  * @param org
	  * @return
	  */
	 public static boolean orgUpdate(Organization org,int parentId) {
		 WxCpService wxCpService = getWxCpService(org.getDomain());
		 if(wxCpService == null){
			 return false;
		 }
		 try {
			WxCpDepart depart = new WxCpDepart();
			depart.setId(org.getCpid());
			depart.setName(org.getName());
			depart.setParentId(parentId);
			wxCpService.departUpdate(depart);
			return true;
		} catch (Exception e) {
			logger.error(String.format("wxCpService.departUpdate due to error,oid=%s",org.getId()),e);
			return false;
		}
	 }
	 
	/**
	  * 删除组织
	  * @param org
	  * @return
	  */
	 public static boolean orgDelete(int departId,String domain) {
		 WxCpService wxCpService = getWxCpService(domain);
		 if(wxCpService == null){
			 return false;
		 }
		 try {
			wxCpService.departDelete(departId);
			return true;
		} catch (Exception e) {
			logger.error(String.format("wxCpService.departDelete due to error,oid=%d",departId),e);
			return false;
		}
	 }
	 
	 public static void main(String[] args) {
		System.out.println(System.currentTimeMillis());
		Pattern p = Pattern.compile("^.*s$");
		Matcher matcher = p.matcher("sss");
		if(matcher.matches()){
			System.err.println("true");
		}
	}
	 
	 public static List<WxCpDepart> orgGet(String domain) {
		 WxCpService wxCpService = getWxCpService(domain);
		 if(wxCpService == null){
			 return Lists.newArrayList();
		 }
		 
		 try {
			List<WxCpDepart> list = wxCpService.departGet();
			return list;
		} catch (Exception e) {
			logger.error(String.format("wxCpService.orgList due to error,domain=%s",domain),e);
			return Lists.newArrayList();
		}
	}
	 
	 
	 
	 public static boolean sendTextMsg(String content, String toUser,String toParty, String domain) {
		 TokenInfo tokenInfo = getTokenInfo(domain);
		 if(tokenInfo == null){
			 return false;
		 }
		 WxCpService wxCpService = getWxCpService(tokenInfo);
		 if(wxCpService == null){
			 return false;
		 }
		 try {
			 
			 WxCpMessage message = new WxCpMessage();
			 message.setContent(content);
			 message.setAgentId(tokenInfo.getAgentid());
			 if(StringUtils.isNotBlank(toUser)){
				 message.setToUser(toUser);
			 }
			 if(StringUtils.isNotBlank(toParty)){
				 message.setToParty(toParty);
			 }
			 message.setMsgType(WxConsts.CUSTOM_MSG_TEXT);
			 wxCpService.messageSend(message);
			 return true;
		} catch (Exception e) {
			logger.error(String.format("wxCpService.sendNewsMsg due to error,content=%s,toUser=%s,toPart=%s",content,toUser,toParty),e);
			return false;
		}
	}
	 
	 /**
	  * 发送单图文信息
	  * @param fodderId 素材ID
	  * @param toUser UserID(用户名)列表（消息接收者，多个接收者用‘|’分隔）。特殊情况：指定为@all，则向关注该企业应用的全部成员发送"
	  * @param toParty PartyID（组织的cpid）列表，多个接受者用‘|’分隔。当touser为@all时忽略本参数
	  * @param domain 域
	  * @return
	  */
	 public static boolean sendNewsMsg(String fodderId,String toUser,String toParty,String domain) {
		 return sendNewsMsg(new String[]{fodderId}, toUser,toParty,domain);
	 }
	 
	 /**
	  * 发送多图文信息
	  * @param fodderIds 素材ID列表
	  * @param toUser UserID(用户名)列表（消息接收者，多个接收者用‘|’分隔）。特殊情况：指定为@all，则向关注该企业应用的全部成员发送"
	  * @param toParty PartyID（组织的cpid）列表，多个接受者用‘|’分隔。当touser为@all时忽略本参数
	  * @param domain 域
	  * @return
	  */
	 public static boolean sendNewsMsg(String[] fodderIds,String toUser,String toParty,String domain) {
		 TokenInfo tokenInfo = getTokenInfo(domain);
		 if(tokenInfo == null){
			 return false;
		 }
		 WxCpService wxCpService = getWxCpService(tokenInfo);
		 if(wxCpService == null){
			 return false;
		 }
		 try {
			 List<FodderEntity> list = fodderService.list(fodderIds);
			 if(CollectionUtils.isEmpty(list)){
				 return false;
			 }
			 
			 WxCpMessage message = assembleWxCpMessage(list,toUser,toParty,tokenInfo);
			 wxCpService.messageSend(message);
			 return true;
		} catch (Exception e) {
			logger.error(String.format("wxCpService.sendNewsMsg due to error,fodderIds=%s",Joiner.on(",").join(fodderIds)),e);
			return false;
		}
	 }
	 
	 /**
	  * 发送单图文信息
	  * @param fodder 素材
	  * @param toUser UserID(用户名)列表（消息接收者，多个接收者用‘|’分隔）。特殊情况：指定为@all，则向关注该企业应用的全部成员发送"
	  * @param toParty PartyID（组织的cpid）列表，多个接受者用‘|’分隔。当touser为@all时忽略本参数
	  * @param domain 域
	  * @return
	  */
	 public static boolean sendNewsMsg(MessageBody messageBody,String toUser,String toParty,String domain) {
		 return sendNewsMsg(Lists.newArrayList(messageBody), toUser,toParty,domain);
	 }
	 
	 /**
	  * 发送多图文信息
	  * @param list 消息内容列表
	  * @param toUser UserID(用户名)列表（消息接收者，多个接收者用‘|’分隔）。特殊情况：指定为@all，则向关注该企业应用的全部成员发送"
	  * @param toParty PartyID（组织的cpid）列表，多个接受者用‘|’分隔。当touser为@all时忽略本参数
	  * @param domain 域
	  * @return
	  */
	 public static boolean sendNewsMsg(List<MessageBody> list,String toUser,String toParty,String domain) {
		
		 if(CollectionUtils.isEmpty(list)){
			 return false;
		 }
		 try {
			 TokenInfo tokenInfo = getTokenInfo(domain);
			 if(tokenInfo == null){
				 return false;
			 }
			 WxCpService wxCpService = getWxCpService(tokenInfo);
			 if(wxCpService == null){
				 return false;
			 }
		 
			 WxCpMessage message = assembleWxCpMessage4Unfodder(list,toUser,toParty,tokenInfo);
			 wxCpService.messageSend(message);
			 return true;
		} catch (Exception e) {
			logger.error(String.format("wxCpService.sendNewsMsg due to error,messagebodys=%s",list),e);
			return false;
		}
	 }
	 
	 
	 /**
	  * 创建组织
	  * @param org
	  * @return 微信公众平台内组织ID
	  */
	 public static boolean menuCreate(String menuData,String domain) {
		 TokenInfo tokenInfo = getTokenInfo(domain);
		 if(tokenInfo == null){
			 return false;
		 }
		 WxCpService wxCpService = getWxCpService(tokenInfo);
		 if(wxCpService == null){
			 return false;
		 }
		 try {
			String url = String.format("https://qyapi.weixin.qq.com/cgi-bin/menu/create?agentid=%s", tokenInfo.getAgentid());
			wxCpService.post(url, menuData);
			return true;
		} catch (Exception e) {
			logger.error(String.format("wxCpService.menuCreate due to error,menuData=%s",menuData),e);
			return false;
		}
	 }
	 
	/**
	  * 删除组织
	  * @param org
	  * @return
	  */
	 public static boolean menuDelete(String domain) {
		 WxCpService wxCpService = getWxCpService(domain);
		 if(wxCpService == null){
			 return false;
		 }
		 try {
			wxCpService.menuDelete();
			return true;
		} catch (Exception e) {
			logger.error(String.format("wxCpService.menuDelete due to error,domain=%s",domain),e);
			return false;
		}
	 }
	 
	 
	 
	 public static File mediaDownload(String media_id,String domain) {
         WxCpService wxCpService = getWxCpService(domain);
         if(wxCpService == null){
             return null;
         }
         if(StringUtils.isBlank(media_id)){
             return null;
         }
         try {
             return wxCpService.mediaDownload(media_id);
         } catch (WxErrorException e) {
             logger.error(String.format("meida download due to error. media_id=[%s] domain=[%s]", media_id,domain), e);
         }
         
         return null;
     }
	 
	 private static WxCpMessage assembleWxCpMessage4Unfodder(List<MessageBody> list,String toUser,String toParty,TokenInfo tokenInfo) {
		 
		 WxCpMessage messge = WxCpMessage.NEWS().build();
		 messge.setAgentId(tokenInfo.getAgentid());
		 if(StringUtils.isNotBlank(toUser)){
			 messge.setToUser(toUser);
		 }
		 if(StringUtils.isNotBlank(toParty)){
			 messge.setToParty(toParty);
		 }
		 
		 List<WxCpMessage.WxArticle> articles = new ArrayList<WxCpMessage.WxArticle>();
		 
		 for (MessageBody entity : list) {
			 WxCpMessage.WxArticle article = new WxCpMessage.WxArticle();
			 article.setUrl(entity.getUrl());
			 article.setPicUrl(String.format("%s%s-360x200", Constant.IMG_SERVER_DOWNLOAD,entity.getPic()));
			 article.setDescription(entity.getContent());
			 article.setTitle(entity.getTitle());
			 articles.add(article);
		}
		messge.setArticles(articles);
		return messge;
	}
	 
	 private static WxCpMessage assembleWxCpMessage(List<FodderEntity> list,String toUser,String toParty,TokenInfo tokenInfo) {
		 
		 WxCpMessage messge = WxCpMessage.NEWS().build();
		 messge.setAgentId(tokenInfo.getAgentid());
		 if(StringUtils.isNotBlank(toUser)){
			 messge.setToUser(toUser);
		 }
		 if(StringUtils.isNotBlank(toParty)){
			 messge.setToParty(toParty);
		 }
		 
		 List<WxCpMessage.WxArticle> articles = new ArrayList<WxCpMessage.WxArticle>();
		 
		 for (FodderEntity fodder : list) {
			 WxCpMessage.WxArticle article = new WxCpMessage.WxArticle();
			 article.setUrl(String.format("%s%s%s%s%s", Constant.FODDER_BASE_PATH,"id=",fodder.getId(),"&fdomain=",fodder.getDomain()));
			 article.setPicUrl(String.format("%s%s-360x200", Constant.IMG_SERVER_DOWNLOAD,fodder.getCoverPath()));
			 article.setDescription(StringUtils.isBlank(fodder.getSummary())?HTMLUtils.html2Text(HtmlUtils.htmlUnescape(fodder.getContent())):fodder.getSummary());
			 article.setTitle(fodder.getTitle());
			 articles.add(article);
		}
		messge.setArticles(articles);
		return messge;
	}

	 
	private static WxCpUser assembleWXCpUser(User user) {
		FixWxCpUser wxCpUser = new FixWxCpUser();
		wxCpUser.setUserId(user.getUsername());
		wxCpUser.setName(user.getName());
		if(user.getOrganization() != null){
			int cpid = 1;
			if(!user.getOrganization().getId().startsWith("domain_")){
				cpid = user.getOrganization().getCpid();
			}
			wxCpUser.setDepartIds(new Integer[]{cpid});
		}
		wxCpUser.setGender(user.getGender() == User.GENDER_MALE ? "男" : user.getGender() == User.GENDER_FEMAIL ? "女" : "");
		wxCpUser.setEmail(user.getEmail());
		wxCpUser.setMobile(user.getMobile());
		wxCpUser.setStatus(user.getEnable());
		wxCpUser.setEnable(user.getEnable());
		return wxCpUser;
	}
	
	private static TokenInfo getTokenInfo(String domain){
		if(!init.get()){
			init();
		}
		TokenInfo tokenInfo = tokenService.getTokenInfoByDomain(domain);
		if(tokenInfo == null || StringUtils.isBlank(tokenInfo.getAppId()) || StringUtils.isBlank(tokenInfo.getAppSecret())){
			return null;
		}
		return tokenInfo;
		
	}
	
	private static WxCpService getWxCpService(TokenInfo tokenInfo) {
		WxCpInRedisConfigStorage config = WxCpInRedisConfigStorage.buildWxCpConfigStorage(tokenInfo.getAppId(),tokenInfo.getAppSecret(),tokenInfo.getAgentid(),tokenInfo.getToken(),tokenInfo.getAeskey());
		
		WxCpService wxCpService = new WxCpServiceImpl();
		wxCpService.setWxCpConfigStorage(config);
		
		return wxCpService;
	}

	private static WxCpService getWxCpService(String domain) {
		
		if(!init.get()){
			init();
		}
		TokenInfo tokenInfo = tokenService.getTokenInfoByDomain(domain);
		if(tokenInfo == null || StringUtils.isBlank(tokenInfo.getAppId()) || StringUtils.isBlank(tokenInfo.getAppSecret())){
			return null;
		}
		
		return getWxCpService(tokenInfo);
	}
	 
	
	public static String getOauthOpenId(String code,TokenInfo tokenInfo){
		WxCpService  wxCpService = getWxCpService(tokenInfo);
		try {
			wxCpService.getAccessToken();
			String[] res = wxCpService.oauth2getUserInfo(code);
			//String userId = res[0];
			//String deviceId = res[1];
			return res[0];
			
		} catch (WxErrorException e) {
			logger.error(String.format("oauth get userid due to error. code=[%s] token=[%s]", code,tokenInfo), e);
		}
		
		return StringUtils.EMPTY;
		
	}

	public static boolean userUpdate(WxCpUser user,String domain) {
		 WxCpService wxCpService = getWxCpService(domain);
		 if(wxCpService == null){
			 return false;
		 }
		 try {
			wxCpService.userUpdate(user);
			return true;
		} catch (Exception e) {
			logger.error("wxCpService.userUpdate due to error.",e);
			return false;
		}
	}


}
