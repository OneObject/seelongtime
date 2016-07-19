package com.kin.weixin;


import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.net.ssl.SSLContext;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.methods.multipart.FilePart;
import org.apache.commons.httpclient.methods.multipart.MultipartRequestEntity;
import org.apache.commons.httpclient.methods.multipart.Part;
import org.apache.commons.httpclient.methods.multipart.StringPart;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.math.RandomUtils;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.CookieStore;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.protocol.ClientContext;
import org.apache.http.conn.scheme.Scheme;
import org.apache.http.conn.ssl.SSLSocketFactory;
import org.apache.http.cookie.Cookie;
import org.apache.http.entity.mime.MultipartEntity;
import org.apache.http.entity.mime.content.FileBody;
import org.apache.http.entity.mime.content.StringBody;
import org.apache.http.impl.client.BasicCookieStore;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.protocol.BasicHttpContext;
import org.apache.http.protocol.HttpContext;
import org.apache.http.util.EntityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.longtime.app.ixin.mgr.fodder.vo.FodderVO;


public class Weixin {
	private final static Logger log = LoggerFactory.getLogger(Weixin.class);
	
	public final static String HOST = "https://mp.weixin.qq.com";
	public final static String LOGIN_URL = "https://mp.weixin.qq.com/cgi-bin/login?lang=zh_CN";
	public final static String INDEX_URL = "http://mp.weixin.qq.com/cgi-bin/indexpage?t=wxm-index&lang=zh_CN";
	public final static String SENDMSG_URL ="https://mp.weixin.qq.com/cgi-bin/singlesend";
	public final static String FANS_URL = "http://mp.weixin.qq.com/cgi-bin/contactmanagepage?t=wxm-friend&lang=zh_CN&pagesize=10&pageidx=0&type=0&groupid=0";
	public final static String LOGOUT_URL = "http://mp.weixin.qq.com/cgi-bin/logout?t=wxm-logout&lang=zh_CN";
	public final static String DOWNLOAD_URL = "http://mp.weixin.qq.com/cgi-bin/downloadfile?";
	public final static String VERIFY_CODE = "http://mp.weixin.qq.com/cgi-bin/verifycode?";
	public final static String POST_MSG = "https://mp.weixin.qq.com/cgi-bin/masssend?t=ajax-response";
	public final static String VIEW_HEAD_IMG = "http://mp.weixin.qq.com/cgi-bin/viewheadimg";
	public final static String GET_IMG_DATA = "http://mp.weixin.qq.com/cgi-bin/getimgdata";
	public final static String GET_REGIONS = "http://mp.weixin.qq.com/cgi-bin/getregions";
	public final static String GET_MESSAGE = "http://mp.weixin.qq.com/cgi-bin/getmessage";
	public final static String OPER_ADVANCED_FUNC = "http://mp.weixin.qq.com/cgi-bin/operadvancedfunc";
	public final static String MASSSEND_PAGE = "http://mp.weixin.qq.com/cgi-bin/masssendpage";
	public final static String FILE_MANAGE_PAGE = "http://mp.weixin.qq.com/cgi-bin/filemanagepage";
	public final static String OPERATE_APPMSG = "https://mp.weixin.qq.com/cgi-bin/operate_appmsg?token=416919388&lang=zh_CN&sub=edit&t=wxm-appmsgs-edit-new&type=10&subtype=3&ismul=1";
	public final static String FMS_TRANSPORT = "http://mp.weixin.qq.com/cgi-bin/fmstransport";
	//public final static String CONTACT_MANAGE_PAGE = "http://mp.weixin.qq.com/cgi-bin/contactmanagepage";
	public final static String CONTACT_MANAGE_PAGE = "http://mp.weixin.qq.com/cgi-bin/contactmanage";
	public final static String OPER_SELF_MENU = "http://mp.weixin.qq.com/cgi-bin/operselfmenu";
	public final static String REPLY_RULE_PAGE = "http://mp.weixin.qq.com/cgi-bin/replyrulepage";
	public final static String SINGLE_MSG_PAGE = "http://mp.weixin.qq.com/cgi-bin/singlemsgpage";
	public final static String USER_INFO_PAGE = "http://mp.weixin.qq.com/cgi-bin/userinfopage";
	public final static String UPLOAD_MATERIAL = "https://mp.weixin.qq.com/cgi-bin/uploadmaterial?cgi=uploadmaterial&type=2&token=416919388&t=iframe-uploadfile&lang=zh_CN&formId=1";

	public final static String USER_AGENT_H = "User-Agent";
	public final static String REFERER_H = "Referer";
	public final static String USER_AGENT = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:30.0) Gecko/20100101 Firefox/30.0";
	public final static String UTF_8 = "UTF-8";

	private HttpClient client = new HttpClient();

	private Cookie[] cookies;
	private String cookiestr;

	private String token;
	private int loginErrCode;
	private String loginErrMsg;
	private int msgSendCode;
	private String msgSendMsg;
	private List<Fan> fans;

	private String loginUser;
	private String loginPwd;
	public boolean isLogin = false;

	public Weixin(String user, String pwd) {
		this.loginUser = user;
		this.loginPwd = pwd;
	}

	public Cookie[] getCookies() {
		return cookies;
	}

	public void setCookies(Cookie[] cookies) {
		this.cookies = cookies;
	}

	public String getCookiestr() {
		return cookiestr;
	}

	public void setCookiestr(String cookiestr) {
		this.cookiestr = cookiestr;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public int getLoginErrCode() {
		return loginErrCode;
	}

	public void setLoginErrCode(int loginErrCode) {
		this.loginErrCode = loginErrCode;
	}

	public String getLoginErrMsg() {
		return loginErrMsg;
	}

	public void setLoginErrMsg(String loginErrMsg) {
		this.loginErrMsg = loginErrMsg;
	}

	public int getMsgSendCode() {
		return msgSendCode;
	}

	public void setMsgSendCode(int msgSendCode) {
		this.msgSendCode = msgSendCode;
	}

	public String getMsgSendMsg() {
		return msgSendMsg;
	}

	public void setMsgSendMsg(String msgSendMsg) {
		this.msgSendMsg = msgSendMsg;
	}

	public String getLoginUser() {
		return loginUser;
	}

	public void setLoginUser(String loginUser) {
		this.loginUser = loginUser;
	}

	public String getLoginPwd() {
		return loginPwd;
	}

	public void setLoginPwd(String loginPwd) {
		this.loginPwd = loginPwd;
	}

	public boolean isLogin() {
		return isLogin;
	}

	public void setLogin(boolean isLogin) {
		this.isLogin = isLogin;
	}


	/**
	 * 登录,登录失败会重复请求登录
	 */
	public boolean login() {
		boolean bool = _login();
		int count = 0;
		while (!bool && count<2) {
			String info = "【登录失败】【错误代码：" +this.loginErrCode + " 信息：" + this.loginErrMsg + "】【账号："
					+ this.loginUser + "】正在尝试重新登录....";
			log.debug(info);
			bool = _login();
			count ++;
			try {
				Thread.sleep(500);
			} catch (InterruptedException e) {
				bool = _login();
			}
		}
		log.debug("login result. [{}]", bool);
		return bool;
	}

	
	
	private boolean _login(){
		
		HttpPost post = new HttpPost(LOGIN_URL);
		post.setHeader(USER_AGENT_H, USER_AGENT);
		post.setHeader("Referer", "https://mp.weixin.qq.com/");
		NameValuePair[] params = new NameValuePair[]{
				new NameValuePair("username", this.loginUser),
				new NameValuePair("pwd", DigestUtils.md5Hex(this.loginPwd
						.getBytes())), new NameValuePair("f", "json"),
						new NameValuePair("imagecode", "")};
		
		post.setHeader("Accept", "application/json, text/javascript, */*; q=0.01");
		post.setHeader("Accept-Encoding", "gzip, deflate");
		post.setHeader("Accept-Language", "zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3");
		post.setHeader("Cache-Control", "no-cache");
		post.setHeader("Connection", "keep-alive");
		post.setHeader("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
		post.setHeader("Host", "mp.weixin.qq.com");
		post.setHeader("Pragma", "no-cache");
		post.setHeader("X-Requested-With", "XMLHttpRequest");


		//NameValuePair[] params = null;
		List<BasicNameValuePair> formParams = new ArrayList<BasicNameValuePair>(); //构建POST请求的表单参数 

		formParams.add(new BasicNameValuePair("username", this.loginUser)); 
		formParams.add(new BasicNameValuePair("pwd",DigestUtils.md5Hex(this.loginPwd
			.getBytes()))); 
		formParams.add(new BasicNameValuePair("f", "json")); 
		formParams.add(new BasicNameValuePair("imagecode", "")); 
		
		
		try{
			post.setEntity(new UrlEncodedFormEntity(formParams, "UTF-8")); 
	
			DefaultHttpClient  client = getHttpsClient();
			
			CookieStore cookieStore = new BasicCookieStore();  
	        //创建一个本地上下文信息  
	        HttpContext localContext = new BasicHttpContext();  
	        //在本地上下问中绑定一个本地存储  
	        localContext.setAttribute(ClientContext.COOKIE_STORE, cookieStore);  
	        
	        
			HttpResponse response = client.execute(post,localContext);    //执行POST请求 
			//HttpEntity entity = response.getEntity();          //获取响应实体 
			HttpEntity entity = response.getEntity();            //获取响应实体 
			long responseLength = 0;                             //响应长度 
			String responseContent = null;                       //响应内容 
			if (null != entity) { 
				responseLength = entity.getContentLength(); 
				responseContent = EntityUtils.toString(entity, "UTF-8"); 
				EntityUtils.consume(entity); //Consume response content 
				System.out.println(responseContent);
				
				log.debug("request login weixin response.data=[{}] ", responseContent);
				LoginJson retcode = null;
				try{
					retcode = JSON.parseObject(responseContent, LoginJson.class);
				}catch(Exception e){
					log.error(String.format("parse string to LoginJson class due to fail. str=[%s]", responseContent), e);
				}
				if(null==retcode || retcode.getBase_resp()==null){
					return false;
				}

				if (retcode.getBase_resp().getRet() == 0) {
					
					List<Cookie> cookies_list = cookieStore.getCookies();
					for (Object object : cookies_list) {
						
					}
					this.cookies = cookieStore.getCookies().toArray(new Cookie[0]);
					StringBuffer cookie = new StringBuffer();
					for (Cookie c : cookies) {
						cookie.append(c.getName()).append("=")
						.append(c.getValue()).append(";");
					}
					this.cookiestr = cookie.toString();
					this.isLogin = true;
					this.token = getToken(retcode.getRedirect_url());
					
					return true;
				}
				int errCode = retcode.getBase_resp().getRet();
				this.loginErrCode = errCode;
				this.loginErrMsg = retcode.getBase_resp().getErr_msg();
				return false;
				
			} 
		
		}catch(Exception e){
			System.out.println("error" + e.getMessage());
		}
		return isLogin;
		
		
		
		
	}
	/**
	 * 发送登录信息,记录cookie，登录状态，token等信息
	 *
	 * @return
	 */
	private boolean _login2() {
		try {
			PostMethod post = new PostMethod(LOGIN_URL);
			post.setRequestHeader("Referer", "https://mp.weixin.qq.com/");
			post.setRequestHeader(USER_AGENT_H, USER_AGENT);
			NameValuePair[] params = new NameValuePair[]{
					new NameValuePair("username", this.loginUser),
					new NameValuePair("pwd", DigestUtils.md5Hex(this.loginPwd
							.getBytes())), new NameValuePair("f", "json"),
							new NameValuePair("imagecode", "")};
			//post.setQueryString(params);
			post.setRequestBody(params);
			int status = client.executeMethod(post);
			
			System.out.println(post.getResponseBodyAsString());
			if (status == HttpStatus.SC_OK) {
				//{"base_resp":{"ret":0,"err_msg":"ok"},"redirect_url":"\/cgi-bin\/home?t=home\/index&lang=zh_CN&token=1916815285"}
				//{"base_resp":{"ret":-23,"err_msg":"acct\/password error"}}
				String ret = post.getResponseBodyAsString();
				
				log.debug("request login weixin response.data=[{}] ", ret);
				LoginJson retcode = null;
				try{
					retcode = JSON.parseObject(ret, LoginJson.class);
				}catch(Exception e){
					log.error(String.format("parse string to LoginJson class due to fail. str=[%s]", ret), e);
				}
				if(null==retcode || retcode.getBase_resp()==null){
					return false;
				}

				if (retcode.getBase_resp().getRet() == 0) {
					this.cookies = (Cookie[]) client.getState().getCookies();
					StringBuffer cookie = new StringBuffer();
					for (org.apache.commons.httpclient.Cookie c : client.getState().getCookies()) {
						cookie.append(c.getName()).append("=")
						.append(c.getValue()).append(";");
					}
					this.cookiestr = cookie.toString();
					this.isLogin = true;
					this.token = getToken(retcode.getRedirect_url());
					
					return true;
				}
				int errCode = retcode.getBase_resp().getRet();
				this.loginErrCode = errCode;
				this.loginErrMsg = retcode.getBase_resp().getErr_msg();
				return false;
			}
		} catch (Exception e) {
			String info = "【登录失败】【发生异常：" + e.getMessage() + "】";
			log.error(info,e);
			return false;
		}
		return false;
	}

	/**
	 * 从登录成功的信息中分离出token信息
	 *
	 * @param s
	 * @return
	 */
	private String getToken(String s) {
		try {
			if (StringUtils.isBlank(s))
				return null;
			String[] ss = StringUtils.split(s, "?");
			String[] params = null;
			if (ss.length == 2) {
				if (!StringUtils.isBlank(ss[1]))
					params = StringUtils.split(ss[1], "&");
			} else if (ss.length == 1) {
				if (!StringUtils.isBlank(ss[0]) && ss[0].indexOf("&") != -1)
					params = StringUtils.split(ss[0], "&");
			} else {
				return null;
			}
			for (String param : params) {
				if (StringUtils.isBlank(param))
					continue;
				String[] p = StringUtils.split(param, "=");
				if (null != p && p.length == 2
						&& StringUtils.equalsIgnoreCase(p[0], "token"))
					return p[1];

			}
		} catch (Exception e) {
			String info = "【解析Token失败】【发生异常：" + e.getMessage() + "】";
			System.err.println(info);
			log.debug(info);
			log.info(info);
			return null;
		}
		return null;
	}

	/**
	 * 获取首页
	 *
	 * @throws HttpException
	 * @throws IOException
	 */
	public void index() throws HttpException, IOException {
		GetMethod get = new GetMethod(INDEX_URL);
		get.setRequestHeader(USER_AGENT_H, USER_AGENT);
		get.setRequestHeader("Cookie", this.cookiestr);
		int status = client.executeMethod(get);
		if (status == HttpStatus.SC_OK) {
			System.out.println(get.getResponseBodyAsString());
		}
	}

	/**
	 * 登出操作
	 *
	 * @throws HttpException
	 * @throws IOException
	 */
	public void logout() throws HttpException, IOException {
		GetMethod get = new GetMethod(LOGOUT_URL);
		get.setRequestHeader(USER_AGENT_H, USER_AGENT);
		get.setRequestHeader("Cookie", this.cookiestr);
		int status = client.executeMethod(get);
		if (status == HttpStatus.SC_OK) {
			System.err.println("-----------注销登录成功-----------");
		}
	}

	/**
	 * 获取验证码
	 *
	 * @throws HttpException
	 * @throws IOException
	 */
	public InputStream code() throws HttpException, IOException {
		GetMethod get = new GetMethod(VERIFY_CODE);
		get.setRequestHeader(USER_AGENT_H, USER_AGENT);
		get.setRequestHeader("Cookie", this.cookiestr);
		NameValuePair[] params = new NameValuePair[]{
				new NameValuePair("username", this.loginUser),
				new NameValuePair("r", "1365318662649")};
		get.setQueryString(params);
		int status = client.executeMethod(get);
		if (status == HttpStatus.SC_OK) {
			return get.getResponseBodyAsStream();
		}
		return null;
	}

	/**
	 * 获取粉丝列表，返回粉丝数量，出错则返回-1
	 * @author trprebel
	 * @return
	 */
	public int getFans() {
		try {
			String paramStr = "?t=user/index&token=" + this.token
					+ "&lang=zh_CN&pagesize=1000&pageidx=0&type=0&groupid=0";
			//String paramStr = "?t=user/index&pagesize=10&pageidx=0&type=4";
			if (!this.isLogin) {
				this._login();
			}
			if (this.isLogin) {
				GetMethod get = new GetMethod(CONTACT_MANAGE_PAGE + paramStr);
				get.setRequestHeader(REFERER_H, INDEX_URL);
				get.setRequestHeader("Cookie", this.cookiestr);
				int status = client.executeMethod(get);
				if (status == HttpStatus.SC_OK) {
					//return parseFansCount(get.getResponseBodyAsString());
					return parseFans(get.getResponseBodyAsString());
				}
				return -1;
			}
		} catch (Exception e) {
			String info = "【获取粉丝数失败】【可能登录过期】";
			System.err.println(info);
			log.debug(info);
			log.info(info);
			return -1;
		}
		return -1;
	}

	/**
	 * 从返回文本中提取粉丝数量
	 *
	 * @param text
	 * @return
	 */
	private int parseFansCount(String text) {
		try {


			StringBuffer json = new StringBuffer();
			final String start = "DATA.groupList =";
			for (int i = text.indexOf(start) + start.length(), len = text
					.length(); i < len; i++) {
				char ci = text.charAt(i);
				if (ci == ';') {
					break;
				}
				json.append(text.charAt(i));
			}
			String txt = json.toString().replaceAll("[*]1", "")
					.replaceAll("defaultGroupName\\[0\\] \\|\\|", "")
					.replaceAll("defaultGroupName\\[1\\] \\|\\|", "")
					.replaceAll("defaultGroupName\\[2\\] \\|\\|", "")
					.replaceAll("defaultGroupName\\[100\\] \\|\\|", "");
			List<FansCount> fans = JSON.parseArray(txt, FansCount.class);
			if (null != fans && !fans.isEmpty())
				for (FansCount fan : fans)
					if (fan.getId() == 0)
						return fan.getNum();
		} catch (Exception e) {
			String info = "【解析粉丝数失败】 " + "\t\n【文本：】\t\n" + text + "\t\n"
					+ "【发生异常：" + e.getMessage() + "】";
			System.err.println(info);
			log.debug(info);
			log.info(info);
			return -1;
		}
		return -1;
	}
	
	
	
	
	/**解析粉丝列表，将粉丝列表存入List<fan>
	 * @param text
	 * @return
	 */
	private int parseFans(String text) {                
		try {

			int liststart=text.indexOf("cgiData")+8;
			int listend=text.indexOf("};", liststart)+1;
			text=text.substring(liststart, listend);
			//System.out.println(text);
			int friendliststart=text.indexOf("contacts")+10;
			int friendlistend=text.indexOf("contacts", friendliststart)-3;
			String friendlistjson=text.substring(friendliststart, friendlistend);
			//System.out.println(friendlistjson);
			fans=JSON.parseArray(friendlistjson,Fan.class);
			System.out.println("粉丝列表：");
			
			
			/**
			 * id:就是后面要用到的fakeid
			 * nick_name:昵称
			 * remark_name:备注
			 * group_id:0为未分组,其他的忘了，自己摸索吧
			 */
			for (Fan fan : fans) {
				System.out.println("ID:"+fan.getId()+" nick_name:"+fan.getNick_name()+" remark_name:"+fan.getRemark_name()+" group_id:"+fan.getGroup_id());
			}
			return fans.size();

		} catch (Exception e) {
			String info = "【解析粉丝数失败】 " + "\t\n【文本：】\t\n" + text + "\t\n"
					+ "【发生异常：" + e.getMessage() + "】";
			System.err.println(info);
			log.debug(info);
			log.info(info);
			return -1;
		}
	}


	/**
	 *
	 * <strong>群发消息</strong>
	 * <p>
	 * 返回码说明<br>
	 * 0：发送成功<br>
	 * 64004:今天的群发数量已到，无法群发<br>
	 * -20000:请求被禁止，请仔细检查token是否合法<br>
	 * </p>
	 * <p>
	 * 可通过msgSendCode取得发送状态码
	 * </p>
	 *
	 * @by liaokai
	 *
	 */
	/**
	 * @param form
	 * @param type
	 * @return
	 */
	public boolean msgSend(MsgForm form, MsgType type) {
		try {
			if (!this.isLogin) {
				this._login();
			}
			if (this.isLogin) {
				form.setToken(this.token);
				HttpPost post = new HttpPost("https://mp.weixin.qq.com/cgi-bin/masssend");
				post.setHeader(USER_AGENT_H, USER_AGENT);
				post.setHeader(REFERER_H, String.format("https://mp.weixin.qq.com/cgi-bin/masssendpage?t=mass/send&token=%s&lang=zh_CN", this.token));
				post.setHeader("Cookie", this.cookiestr);
				BasicNameValuePair[] parts = null;
				//NameValuePair[] params = null;
				List<BasicNameValuePair> formParams = new ArrayList<BasicNameValuePair>(); //构建POST请求的表单参数 
				switch (type) {
				case TEXT:
					parts = new BasicNameValuePair[]{
							new BasicNameValuePair("content", form.getContent()),
									new BasicNameValuePair("type", form.getType()),
									new BasicNameValuePair("error", form.getError()),
									new BasicNameValuePair("needcomment", form.getNeedcomment()),
									new BasicNameValuePair("groupid", form.getGroupid()),
									new BasicNameValuePair("sex", form.getSex()),
									new BasicNameValuePair("country", form.getCountry()),
									new BasicNameValuePair("province", form.getProvince()),
									new BasicNameValuePair("city", form.getCity()),
									new BasicNameValuePair("token", form.getToken()),
									new BasicNameValuePair("ajax", form.getAjax()),
									new BasicNameValuePair("t", "ajax-response")};
					break;
				case IMAGE_TEXT:
					parts = new BasicNameValuePair[]{
									new BasicNameValuePair("type", form.getType()),
									new BasicNameValuePair("appmsgid", form.getAppmsgid()),
									new BasicNameValuePair("sex", form.getSex()),
									new BasicNameValuePair("groupid", form.getGroupid()),
									new BasicNameValuePair("synctxweibo", form.getSynctxweibo()),
									new BasicNameValuePair("synctxnews", form.getSynctxnews()),
									new BasicNameValuePair("country", form.getCountry()),
									new BasicNameValuePair("province", form.getProvince()),
									new BasicNameValuePair("city", form.getCity()),
									new BasicNameValuePair("imgcode", form.getImgcode()),
									new BasicNameValuePair("token", form.getToken()),
									new BasicNameValuePair("lang", "zh_CN"),
									new BasicNameValuePair("random", Math.random()+"8"),
									new BasicNameValuePair("f", "json"),
									new BasicNameValuePair("ajax", form.getAjax()),
									new BasicNameValuePair("t", "ajax-response")};
					break;
				default:
					parts = new BasicNameValuePair[]{
							new BasicNameValuePair("content", form.getContent()),
									new BasicNameValuePair("type", form.getType()),
									new BasicNameValuePair("error", form.getError()),
									new BasicNameValuePair("needcomment", form.getNeedcomment()),
									new BasicNameValuePair("groupid", form.getGroupid()),
									new BasicNameValuePair("sex", form.getSex()),
									new BasicNameValuePair("country", form.getCountry()),
									new BasicNameValuePair("province", form.getProvince()),
									new BasicNameValuePair("city", form.getCity()),
									new BasicNameValuePair("token", form.getToken()),
									new BasicNameValuePair("ajax", form.getAjax()),
									new BasicNameValuePair("t", "ajax-response")};

					break;
				}
				
				formParams.addAll(Arrays.asList(parts));
				post.setEntity(new UrlEncodedFormEntity(formParams, "UTF-8")); 
				DefaultHttpClient sslClient = getHttpsClient();
				HttpResponse response = sslClient.execute(post);
				
				HttpEntity entity = response.getEntity();            //获取响应实体 
				String responseContent = null;                       //响应内容 
				if (null != entity) { 
					responseContent = EntityUtils.toString(entity, "UTF-8"); 
					EntityUtils.consume(entity); //Consume response content 
					
					log.debug("send msg weixin response.data=[{}] ", responseContent);
					try {
						MsgJson ret = JSON.parseObject(responseContent, MsgJson.class);
						this.msgSendCode = ret.getRet();
						switch (this.msgSendCode) {
						case 0:
							this.msgSendMsg = "发送成功";
							return true;
						case -2:
							this.msgSendMsg = "参数错误，请仔细检查";
							return false;
						case 64004:
							this.msgSendMsg = "今天的群发数量已到，无法群发";
							return false;
						case -20000:
							this.msgSendMsg = "请求被禁止，请仔细检查token是否合法";
							return false;
						default:
							this.msgSendMsg = "未知错误!";
							return false;
						}
					} catch (Exception e) {
						String info = "【群发信息失败】【解析json错误】" + e.getMessage()
								+ "\n\t【文本:】\n\t" + responseContent;
						log.error(info);
						log.error(msgSendMsg);
						return false;
					}
				} 
				
			}
		} catch (Exception e) {
			String info = "【群发信息失败】" + e.getMessage();
			log.error(info);
			return false;
		}
		return false;
	}
	
	
	
	
	/**向粉丝发送消息，默认发送第二个粉丝，想不受限制的群发可以循环向粉丝列表中的粉丝发送消息
	 * @author trprebel
	 * @date 2013-11-20
	 */
	public boolean sendMsg(int i)
	{
		try {
			if (!this.isLogin) {
				this._login();
			}
			if (this.isLogin) {
				if (fans==null) {
					System.out.println("请先获取粉丝列表：");
					return false;
				}
				DefaultHttpClient httpClient = new DefaultHttpClient();          //创建默认的httpClient实例 
				X509TrustManager xtm = new X509TrustManager(){                   //创建TrustManager 
					public void checkClientTrusted(X509Certificate[] chain, String authType) throws CertificateException {} 
					public void checkServerTrusted(X509Certificate[] chain, String authType) throws CertificateException {} 
					public X509Certificate[] getAcceptedIssuers() { return null; } 
				};
				SSLContext ctx = SSLContext.getInstance("TLS"); 

				//使用TrustManager来初始化该上下文，TrustManager只是被SSL的Socket所使用 
				ctx.init(null, new TrustManager[]{xtm}, null); 

				//创建SSLSocketFactory 
				SSLSocketFactory socketFactory = new SSLSocketFactory(ctx); 

				//通过SchemeRegistry将SSLSocketFactory注册到我们的HttpClient上 
				httpClient.getConnectionManager().getSchemeRegistry().register(new Scheme("https", 443, socketFactory)); 

				HttpPost post = new HttpPost(SENDMSG_URL);
				post.setHeader(USER_AGENT_H, USER_AGENT);
				post.setHeader(REFERER_H,"https://mp.weixin.qq.com/cgi-bin/singlesendpage?t=message/send&action=index&tofakeid="+fans.get(i).getId()+"&token="+this.token+"&lang=zh_CN");
				post.setHeader("Cookie", this.cookiestr);
				post.setHeader("Accept", "application/json, text/javascript, */*; q=0.01");
				post.setHeader("Accept-Encoding", "gzip, deflate");
				post.setHeader("Accept-Language", "zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3");
				post.setHeader("Cache-Control", "no-cache");
				post.setHeader("Connection", "keep-alive");
				//post.setHeader("Content-Length", "130");
				post.setHeader("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
				post.setHeader("Host", "mp.weixin.qq.com");
				post.setHeader("Pragma", "no-cache");
				post.setHeader("X-Requested-With", "XMLHttpRequest");


				//NameValuePair[] params = null;
				List<BasicNameValuePair> formParams = new ArrayList<BasicNameValuePair>(); //构建POST请求的表单参数 

				formParams.add(new BasicNameValuePair("content", "Hello,I didn't login!")); //说话内容
				formParams.add(new BasicNameValuePair("imgcode", "")); 
				formParams.add(new BasicNameValuePair("lang", "zh_CN")); 
				formParams.add(new BasicNameValuePair("random", Math.random()+"8")); 
				formParams.add(new BasicNameValuePair("tofakeid",fans.get(i).getId())); 
				formParams.add(new BasicNameValuePair("token", this.token)); 
				formParams.add(new BasicNameValuePair("type", "1")); 
				formParams.add(new BasicNameValuePair("t", "ajax-response")); 
				
				
				post.setEntity(new UrlEncodedFormEntity(formParams, "UTF-8")); 


				HttpResponse response = httpClient.execute(post);    //执行POST请求 
				//HttpEntity entity = response.getEntity();          //获取响应实体 
				HttpEntity entity = response.getEntity();            //获取响应实体 
				long responseLength = 0;                             //响应长度 
				String responseContent = null;                       //响应内容 
				if (null != entity) { 
					responseLength = entity.getContentLength(); 
					responseContent = EntityUtils.toString(entity, "UTF-8"); 
					EntityUtils.consume(entity); //Consume response content 
				} 
				System.out.println("请求地址: " + post.getURI()); 
				System.out.println("响应状态: " + response.getStatusLine()); 
				System.out.println("响应长度: " + responseLength); 
				System.out.println("响应内容: " + responseContent); 

			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
		return false;
	}
	
	
	/**向粉丝发送消息，默认发送第二个粉丝，想不受限制的群发可以循环向粉丝列表中的粉丝发送消息
	 * @author trprebel
	 * @date 2013-11-20
	 */
	public boolean sendMsg(String fanId)
	{
		try {
			if (!this.isLogin) {
				this._login();
			}
			if (this.isLogin) {
				DefaultHttpClient httpClient = getHttpsClient(); 
				
				String url = SENDMSG_URL;

				String referer = "https://mp.weixin.qq.com/cgi-bin/singlesendpage?t=message/send&action=index&tofakeid="+fanId+"&token="+this.token+"&lang=zh_CN";
				HttpPost post = getHttpPost(url, referer);
				
				//NameValuePair[] params = null;
				List<BasicNameValuePair> formParams = new ArrayList<BasicNameValuePair>(); //构建POST请求的表单参数 

//				formParams.add(new BasicNameValuePair("content", "Hello,I didn't login!")); //说话内容
//				formParams.add(new BasicNameValuePair("imgcode", "")); 
//				formParams.add(new BasicNameValuePair("lang", "zh_CN")); 
//				formParams.add(new BasicNameValuePair("random", Math.random()+"8")); 
//				formParams.add(new BasicNameValuePair("tofakeid",fanId)); 
//				formParams.add(new BasicNameValuePair("token", this.token)); 
//				formParams.add(new BasicNameValuePair("type", "1")); 
//				formParams.add(new BasicNameValuePair("t", "ajax-response")); 
				
				formParams.add(new BasicNameValuePair("ajax", "1")); 
				formParams.add(new BasicNameValuePair("imgcode", "")); 
				formParams.add(new BasicNameValuePair("lang", "zh_CN")); 
				formParams.add(new BasicNameValuePair("random", Math.random()+"8")); 
				formParams.add(new BasicNameValuePair("tofakeid",fanId)); 
				formParams.add(new BasicNameValuePair("token", this.token)); 
				formParams.add(new BasicNameValuePair("type", "10")); 
				formParams.add(new BasicNameValuePair("t", "ajax-response")); 
				formParams.add(new BasicNameValuePair("appmsgid", "200150584")); 
				//app_id
				
				
				post.setEntity(new UrlEncodedFormEntity(formParams, "UTF-8")); 


				HttpResponse response = httpClient.execute(post);    //执行POST请求 
				//HttpEntity entity = response.getEntity();          //获取响应实体 
				HttpEntity entity = response.getEntity();            //获取响应实体 
				long responseLength = 0;                             //响应长度 
				String responseContent = null;                       //响应内容 
				if (null != entity) { 
					responseLength = entity.getContentLength(); 
					responseContent = EntityUtils.toString(entity, "UTF-8"); 
					EntityUtils.consume(entity); //Consume response content 
				} 
				System.out.println("请求地址: " + post.getURI()); 
				System.out.println("响应状态: " + response.getStatusLine()); 
				System.out.println("响应长度: " + responseLength); 
				System.out.println("响应内容: " + responseContent); 

			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
		return false;
	}

	private HttpPost getHttpPost(String url, String referer) {
		HttpPost post = new HttpPost(url);
		post.setHeader(USER_AGENT_H, USER_AGENT);
		post.setHeader(REFERER_H,referer);
		post.setHeader("Cookie", this.cookiestr);
		post.setHeader("Accept", "application/json, text/javascript, */*; q=0.01");
		post.setHeader("Accept-Encoding", "gzip, deflate");
		post.setHeader("Accept-Language", "zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3");
		post.setHeader("Cache-Control", "no-cache");
		post.setHeader("Connection", "keep-alive");
		//post.setHeader("Content-Length", "130");
		post.setHeader("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
		post.setHeader("Host", "mp.weixin.qq.com");
		post.setHeader("Pragma", "no-cache");
		post.setHeader("X-Requested-With", "XMLHttpRequest");
		return post;
	}
	
	private HttpGet getHttpGet(String url, String referer) {
		HttpGet get = new HttpGet(url);
		get.setHeader(USER_AGENT_H, USER_AGENT);
		get.setHeader(REFERER_H,referer);
		get.setHeader("Cookie", this.cookiestr);
		get.setHeader("Accept", "application/json, text/javascript, */*; q=0.01");
		get.setHeader("Accept-Encoding", "gzip, deflate");
		get.setHeader("Accept-Language", "zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3");
		get.setHeader("Cache-Control", "no-cache");
		get.setHeader("Connection", "keep-alive");
		//post.setHeader("Content-Length", "130");
		get.setHeader("Host", "mp.weixin.qq.com");
		get.setHeader("Pragma", "no-cache");
		get.setHeader("X-Requested-With", "XMLHttpRequest");
		return get;
	}


	private DefaultHttpClient getHttpsClient() throws NoSuchAlgorithmException, KeyManagementException {
		DefaultHttpClient httpClient = new DefaultHttpClient();          //创建默认的httpClient实例 
		X509TrustManager xtm = new X509TrustManager(){                   //创建TrustManager 
			public void checkClientTrusted(X509Certificate[] chain, String authType) throws CertificateException {} 
			public void checkServerTrusted(X509Certificate[] chain, String authType) throws CertificateException {} 
			public X509Certificate[] getAcceptedIssuers() { return null; } 
		};
		SSLContext ctx = SSLContext.getInstance("TLS"); 

		//使用TrustManager来初始化该上下文，TrustManager只是被SSL的Socket所使用 
		ctx.init(null, new TrustManager[]{xtm}, null); 

		//创建SSLSocketFactory 
		SSLSocketFactory socketFactory = new SSLSocketFactory(ctx); 

		//通过SchemeRegistry将SSLSocketFactory注册到我们的HttpClient上 
		httpClient.getConnectionManager().getSchemeRegistry().register(new Scheme("https", 443, socketFactory));
		return httpClient;
	}

	//    public final static Pattern IMG_SUCCESS_REG = Pattern.compile("\.top\.W\.upload\.suc(\"")
	public void updateImg(ImgFileForm form) {
		try {
			if (!this.isLogin)
				this.isLogin();
			if (this.isLogin) {
				
				
				form.setToken(this.getToken());
				PostMethod post = new PostMethod(UPLOAD_MATERIAL);
				post.setRequestHeader(USER_AGENT_H, USER_AGENT);
				post.setRequestHeader(REFERER_H, INDEX_URL);
				post.setRequestHeader("Connection", "Keep-Alive");
				post.setRequestHeader("Cookie", this.cookiestr);
				post.setRequestHeader("Cache-Control", "no-cache");

				/**
				 *   private String cgi = "uploadmaterial";
                 private String type = "2";
                 private String token = "";
                 private String t = "iframe-uploadfile";
                 private String lang = "zh_CN";
                 private String formId = "1";
				 */
				FilePart file = new FilePart("uploadfile", form.getUploadfile(), "image/jpeg", "UTF-8");
				System.out.println(form.getToken());
				Part[] parts = new Part[]{
						new StringPart("cgi", form.getCgi()),
						new StringPart("type", form.getType()),
						new StringPart("token", form.getToken()),
						new StringPart("t", form.getT()),
						new StringPart("lang", form.getLang()),
						new StringPart("formId", form.getFormId()),
						file};
				MultipartRequestEntity entity = new MultipartRequestEntity(parts, post.getParams());
				
				
				post.setRequestEntity(entity);
				int status = client.executeMethod(post);
				if (status == HttpStatus.SC_OK) {
					String text = post.getResponseBodyAsString();
					System.out.println(text);

				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	
	@SuppressWarnings("deprecation")
	public String updateImg2(ImgFileForm form) {
		try {
			if (!this.isLogin)
				this._login();
			if (this.isLogin) {
				DefaultHttpClient httpClient = new DefaultHttpClient();          //创建默认的httpClient实例 
				X509TrustManager xtm = new X509TrustManager(){                   //创建TrustManager 
					public void checkClientTrusted(X509Certificate[] chain, String authType) throws CertificateException {} 
					public void checkServerTrusted(X509Certificate[] chain, String authType) throws CertificateException {} 
					public X509Certificate[] getAcceptedIssuers() { return null; } 
				};
				SSLContext ctx = SSLContext.getInstance("TLS"); 

				//使用TrustManager来初始化该上下文，TrustManager只是被SSL的Socket所使用 
				ctx.init(null, new TrustManager[]{xtm}, null); 

				//创建SSLSocketFactory 
				SSLSocketFactory socketFactory = new SSLSocketFactory(ctx); 

				//通过SchemeRegistry将SSLSocketFactory注册到我们的HttpClient上 
				httpClient.getConnectionManager().getSchemeRegistry().register(new Scheme("https", 443, socketFactory)); 

				
				String tmp[] = getTikets();
				if(null==tmp){
					log.error("获取信息失败");
					return null;
				}
				String ticket_id = tmp[1];
				String ticket = tmp[0];
				String url = "https://mp.weixin.qq.com/cgi-bin/filetransfer?action=upload_material&f=json&ticket_id="+ticket_id+"&ticket="+ticket+"&token="+this.getToken()+"&lang=zh_CN";
				HttpPost post = new HttpPost(url);
				post.setHeader(USER_AGENT_H, USER_AGENT);
				post.setHeader(REFERER_H,"https://mp.weixin.qq.com/cgi-bin/filepage?type=2&begin=0&count=10&t=media/list&token="+this.getToken()+"&lang=zh_CN");
				post.setHeader("Cookie", this.cookiestr);
				post.setHeader("Accept", "application/json, text/javascript, */*; q=0.01");
				post.setHeader("Accept-Encoding", "gzip, deflate");
				post.setHeader("Accept-Language", "zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3");
				post.setHeader("Cache-Control", "no-cache");
				post.setHeader("Connection", "keep-alive");
				post.setHeader("Content-Type", "multipart/form-data; charset=UTF-8");
				post.setHeader("Host", "mp.weixin.qq.com");
				post.setHeader("Pragma", "no-cache");
				post.setHeader("X-Requested-With", "XMLHttpRequest");
				
				form.setToken(this.getToken());

				MultipartEntity entity = new MultipartEntity();
				
				FileBody fileBody = new FileBody(form.getUploadfile());  
				entity.addPart("folder",new StringBody("/cgi-bin/uploads"));
			    entity.addPart("Upload",new StringBody("Submit Query"));
		        entity.addPart("file", fileBody);

		        post.setEntity(entity);
				HttpResponse response = httpClient.execute(post);    //执行POST请求 
				HttpEntity entity1 = response.getEntity();            //获取响应实体 
				String responseContent = null;                       //响应内容 
				if (null != entity) { 
					responseContent = EntityUtils.toString(entity1, "UTF-8"); 
					EntityUtils.consume(entity1); //Consume response content 
					Map<String, Object> map = JSONObject.parseObject(responseContent);
					String id = (String) map.get("content");
					return id;
				}
			}
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return null;
	}
	
	
	public  String[]  getTikets(){
		
			try {
				
				String url = "https://mp.weixin.qq.com/cgi-bin/filepage?type=2&begin=0&count=10&t=media/list&token="+this.token+"&lang=zh_CN";
				if (!this.isLogin) {
					this._login();
				}
				if (this.isLogin) {
					HttpGet get = new HttpGet(url);
					get.setHeader(REFERER_H, INDEX_URL);
					get.setHeader("Cookie", this.cookiestr);
					DefaultHttpClient sslClient = getHttpsClient();
					HttpResponse response = sslClient.execute(get);
					
					HttpEntity entity = response.getEntity();            //获取响应实体 
					String responseContent = null;                       //响应内容 
					if (null != entity) { 
						responseContent = EntityUtils.toString(entity, "UTF-8"); 
						EntityUtils.consume(entity); //Consume response content 
						return parseTickets(responseContent);
					}
					return null;
				}
			} catch (Exception e) {
				String info = "【获取粉丝数失败】【可能登录过期】";
				System.err.println(info);
				log.debug(info);
				log.info(info);
				return null;
			}
			return null;
		
	}
	
	
	public  String  getAppMsgId(){
		
		try {
			String url = "https://mp.weixin.qq.com/cgi-bin/appmsg?begin=0&count=10&t=media/appmsg_list&type=10&action=list&token="+this.token+"&lang=zh_CN";
			if (!this.isLogin) {
				this._login();
			}
			if (this.isLogin) {
				HttpGet get = new HttpGet(url);
				get.setHeader(REFERER_H, "https://mp.weixin.qq.com/cgi-bin/masssendpage?t=mass/send&token="+this.token+"&lang=zh_CN");
				get.setHeader("Cookie", this.cookiestr);
				
				DefaultHttpClient sslClient = getHttpsClient();
				HttpResponse response = sslClient.execute(get);
				
				HttpEntity entity = response.getEntity();            //获取响应实体 
				String responseContent = null;                       //响应内容 
				if (null != entity) { 
					responseContent = EntityUtils.toString(entity, "UTF-8"); 
					EntityUtils.consume(entity); //Consume response content 
					return parseAppMsgId(responseContent);
				}
				return null;
			}
		} catch (Exception e) {
			String info = "【解析图文素材ID失败】";
			System.err.println(info);
			log.error(info);
			return null;
		}
		return null;
	
}
	
	private String parseAppMsgId(String text) {
		try {
			int start=text.indexOf("mid=")+4;
			
			String tmp  = text.substring(start);
			
			int end = tmp.indexOf("&");
			
			String msgid = tmp.substring(0, end);
			System.out.println(msgid);
			
			return msgid;

		} catch (Exception e) {
			String info = "【解析粉丝数失败】 " + "\t\n【文本：】\t\n" + text + "\t\n"
					+ "【发生异常：" + e.getMessage() + "】";
			System.err.println(info);
			log.debug(info);
			log.info(info);
			return null;
		}
	}

	private String[] parseTickets(String text) {                
		try {

			int start=text.indexOf("ticket:\"")+8;
			
			String tmp  = text.substring(start);
			
			int end = tmp.indexOf("\",");
			
			String ticket = tmp.substring(0, end);
			
			
			
			System.out.println(ticket);
			
			
			start=text.indexOf("user_name:\"")+11;
			
			tmp  = text.substring(start);
			
			end = tmp.indexOf("\",");
			
			String user_name = tmp.substring(0, end);
			System.out.println(user_name);
			
			return new String[]{ticket, user_name};

		} catch (Exception e) {
			String info = "【解析粉丝数失败】 " + "\t\n【文本：】\t\n" + text + "\t\n"
					+ "【发生异常：" + e.getMessage() + "】";
			System.err.println(info);
			log.debug(info);
			log.info(info);
			return null;
		}
	}
	

	/**
	 * 页面跳转
	 *
	 * @param url
	 */
	public void redirect(String url) {
		if (url.indexOf("https://") == -1)
			url = HOST + url;
		try {
			if (this.isLogin) {
				GetMethod get = new GetMethod(url);
				get.setRequestHeader(USER_AGENT_H, USER_AGENT);
				get.setRequestHeader(REFERER_H, INDEX_URL);
				get.setRequestHeader("Cookie", this.cookiestr);
				int status = client.executeMethod(get);
				if (status == HttpStatus.SC_OK) {
					System.err.println("正在跳转.....");
					System.out.println(get.getResponseBodyAsString());
				}
			}
		} catch (Exception e) {
		}
	}
	
	
	//设置开发模式中的url和token
	public boolean setDevUrl(String tokenurl ,String urltoken){
		
		
		try {
			DefaultHttpClient httpClient = getHttpsClient();
			String url = "https://mp.weixin.qq.com/advanced/callbackprofile?t=ajax-response&token="+this.token+"&lang=zh_CN";

			String referer = "	https://mp.weixin.qq.com/advanced/advanced?action=interface&t=advanced/interface&token="+this.token+"&lang=zh_CN";
			HttpPost post = getHttpPost(url, referer);
			
			
			List<BasicNameValuePair> formParams = new ArrayList<BasicNameValuePair>(); //构建POST请求的表单参数 

			//flag=0&type=1&token=239106049
			formParams.add(new BasicNameValuePair("url", tokenurl)); 
			formParams.add(new BasicNameValuePair("callback_token", urltoken)); 
			formParams.add(new BasicNameValuePair("encoding_aeskey", getAesKey()));
			formParams.add(new BasicNameValuePair("callback_encrypt_mode", "0"));
			
			post.setEntity(new UrlEncodedFormEntity(formParams, "UTF-8")); 
			httpClient.execute(post);    //执行POST请求 

//			HttpResponse response = httpClient.execute(post);    //执行POST请求 
//			HttpEntity entity = response.getEntity();            //获取响应实体 
//			String responseContent = null;                       //响应内容 
//			if (null != entity) { 
//				responseContent = EntityUtils.toString(entity, "UTF-8"); 
//				EntityUtils.consume(entity); //Consume response content 
//				log.debug(responseContent);
//				Map<String, Object> map = JSONObject.parseObject(responseContent);
//				Object obj =  map.get("ret");
//				if(null==obj){
//					return false;
//				}
//				if(!"0".equals(obj)){
//					return false;
//				}
//				
//				return true;
//				
//			} 
			return true;
			
		} catch (Exception e) {
			e.printStackTrace();
			
			return false;
		} 
	}
	
	private String getAesKey() {
		String[] characters = {"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","0","1","2","3","4","5","6","7","8","9"};
		StringBuffer buffer = new StringBuffer();
		for(int i=0;i<43;i++){
			int index = RandomUtils.nextInt(62);
			buffer.append(characters[index]);
		}
		return buffer.toString();
	}
	
	//开启开发模式
	public  boolean  openDevModle(){
		
		// 开启高级模式
		try {
			DefaultHttpClient httpClient = getHttpsClient();
			
			String url = "https://mp.weixin.qq.com/misc/skeyform?form=advancedswitchform&lang=zh_CN";

			String referer = "https://mp.weixin.qq.com/advanced/advanced?action=dev&t=advanced/dev&token="+this.token+"&lang=zh_CN";
			HttpPost post = getHttpPost(url, referer);
			
			
			List<BasicNameValuePair> formParams = new ArrayList<BasicNameValuePair>(); //构建POST请求的表单参数 
			//flag=0&type=1&token=239106049
			formParams.add(new BasicNameValuePair("flag", "1")); 
			formParams.add(new BasicNameValuePair("type", "2")); 
			formParams.add(new BasicNameValuePair("token", this.token)); 
			formParams.add(new BasicNameValuePair("lang", "zh_CN")); 
			formParams.add(new BasicNameValuePair("f", "json")); 
			formParams.add(new BasicNameValuePair("ajax", "1")); 
			
			post.setEntity(new UrlEncodedFormEntity(formParams, "UTF-8")); 

			HttpResponse response = httpClient.execute(post);    //执行POST请求 
			HttpEntity entity = response.getEntity();            //获取响应实体 
			String responseContent = null;                       //响应内容 
			if (null != entity) { 
				responseContent = EntityUtils.toString(entity, "UTF-8"); 
				EntityUtils.consume(entity); //Consume response content 
				log.debug(responseContent);
				Map<String, Object> map = JSONObject.parseObject(responseContent);
				Object obj =  map.get("base_resp");
				if(null==obj){
					return false;
				}
				Map<String,Object> tmp = (Map)obj;
				if(0 != (Integer)tmp.get("ret")){
					return false;
				}
				
				return true;
				
			} 
			return false;
			
		} catch (Exception e) {
			log.error(String.format("openDevModle due tor error,%s", e));
			return false;
		} 
	}
	
	//获取 appid 和 appsecret
	public String[]  getAppIdAndSecret(){
		
		try{
			String url = "http://mp.weixin.qq.com/advanced/advanced?action=dev&t=advanced/dev&token="+this.token+"&lang=zh_CN";
			HttpGet get = new HttpGet(url);
			get.setHeader(REFERER_H, "https://mp.weixin.qq.com");
			get.setHeader("Cookie", this.cookiestr);
			
			DefaultHttpClient sslClient = getHttpsClient();
			HttpResponse response = sslClient.execute(get);
			
			HttpEntity entity = response.getEntity();            //获取响应实体 
			String responseContent = null;                       //响应内容 
			if (null != entity) { 
				responseContent = EntityUtils.toString(entity, "UTF-8"); 
				EntityUtils.consume(entity); //Consume response content 
				return parseAppidAndAppSecret(responseContent);
			}
			return null;
			
		}catch(Exception e){
			log.error(e.getMessage(), e);
		}
		return null;

	
	}
	private String[] parseAppidAndAppSecret(String html){
		
		if(StringUtils.isBlank(html)){
			return null;
		}
		
		String optionStr = "{name:\"AppId\",value:\"";
		int start = html.indexOf(optionStr);
		if(-1==start){
			return null;
		}
		start = start + optionStr.length();
		int end = html.indexOf("\"", start);
		
		String appid = html.substring(start, end);
		
		if(StringUtils.isBlank(appid)){
			return null;
		}
		
		optionStr = "name:\"AppSecret\",value:\"";
		
		start = html.indexOf(optionStr);
		if(-1==start){
			return null;
		}
		start = start + optionStr.length();
		end = html.indexOf("\"", start);
		
		String appSecret = html.substring(start, end);
		
		if(StringUtils.isBlank(appSecret)){
			return null;
		}
		
		log.debug("appid=[{}] appsecret=[{}]", appid,appSecret);
		
		return new String[]{appid,appSecret};
	}
	
	
	
	public static void main(String[] args) throws Exception {

		
		
		String LOGIN_USER = "test_wx_f@longtimeit.com"; //此为上一任作者的用户名和密码，截止到我最后用发现还能用
		String LOGIN_PWD = "longtime123";
		
		//LOGIN_USER = "test_wx_f@longtimeit.com";
		//LOGIN_PWD = "longtime123";
		
		System.out.println(DigestUtils.md5Hex(LOGIN_USER.getBytes()));
		Weixin wx = new Weixin(LOGIN_USER, LOGIN_PWD);
		wx.login();
		System.out.println(wx.loginErrMsg);
		wx.getCookiestr();
		System.out.println(wx.getCookiestr());
		
		
		String path = "/Users/longtime/Downloads/";
		String filename = String.valueOf(System.currentTimeMillis()+".jpg");
		wx.downLoadQrcode(path,filename);
		//ImgFileForm form = new ImgFileForm();
		//form.setUploadfile(new File("D:\\Data\\image\\4.jpg"));
		//wx.updateImg(form);
		
		
		/*
		wx.openDevModle();
		//String url = "http://beta.aijiayou.com/iapp/iwx/webchat/aa6bfadbde3b4406aab039f489618ad5.xhtml";
		String url = "http://beta.aijiayou.com/iapp/iwx/webchat/b1c1e526efba408bb7774484c977c6ee.xhtml";
		String token = "8y14XF";
		wx.setDevUrl(url, token);

		wx.getAppIdAndSecret();
		*/
	}
	
	public boolean downLoadQrcode(String path,String filename) throws Exception{
		DefaultHttpClient httpClient = getHttpsClient();
		String referer = "https://mp.weixin.qq.com/misc/getqrcode?action=dev&t=advanced/dev&token="+this.token+"&lang=zh_CN";
		String url = "https://mp.weixin.qq.com/misc/getqrcode?token="+this.token+"&style=1";
		
		HttpGet get = getHttpGet(url, referer);

		HttpResponse response = httpClient.execute(get);    //执行get请求 
		HttpEntity entity = response.getEntity();
		OutputStream fos = null;
		
		InputStream in = null;
		
		//获取响应实体 
		
		if (null != entity) { 
			try{
			in = entity.getContent();
			fos = new FileOutputStream(path+filename);
			IOUtils.copy(in, fos);
			}finally{
				IOUtils.closeQuietly(in);
				IOUtils.closeQuietly(fos);
			}
			
		}
		
		return true;
	}

	
	
	public static File downLoadFile(String url,String dir) throws IOException {
		URL httpUrl = new URL(url);
		String filename = String.valueOf(System.currentTimeMillis()+".png");
		File f = new File(dir+filename);
		FileUtils.copyURLToFile(httpUrl, f);
		return f;
	}
	
	@SuppressWarnings("deprecation")
	public String createImgTextMsg(List<FodderVO> fodders,List<String> imgids) {
		try {
			if (!this.isLogin) {
				this._login();
			}
			if (this.isLogin) {
				DefaultHttpClient httpClient = new DefaultHttpClient();          //创建默认的httpClient实例 
				X509TrustManager xtm = new X509TrustManager(){                   //创建TrustManager 
					public void checkClientTrusted(X509Certificate[] chain, String authType) throws CertificateException {} 
					public void checkServerTrusted(X509Certificate[] chain, String authType) throws CertificateException {} 
					public X509Certificate[] getAcceptedIssuers() { return null; } 
				};
				SSLContext ctx = SSLContext.getInstance("TLS"); 

				//使用TrustManager来初始化该上下文，TrustManager只是被SSL的Socket所使用 
				ctx.init(null, new TrustManager[]{xtm}, null); 

				//创建SSLSocketFactory 
				SSLSocketFactory socketFactory = new SSLSocketFactory(ctx); 
				
				//通过SchemeRegistry将SSLSocketFactory注册到我们的HttpClient上 
				httpClient.getConnectionManager().getSchemeRegistry().register(new Scheme("https", 443, socketFactory)); 
				HttpPost post = new HttpPost("https://mp.weixin.qq.com/cgi-bin/operate_appmsg");
				post.setHeader(USER_AGENT_H, USER_AGENT);
				post.setHeader("Cookie", this.cookiestr);
				post.setHeader("Accept", "text/html, */*; q=0.01");
				post.setHeader("Accept-Encoding", "gzip, deflate");
				post.setHeader("Accept-Language", "zh-CN,zh;q=0.8,en;q=0.6");
				post.setHeader("Cache-Control", "no-cache");
				post.setHeader("Connection", "keep-alive");
				//post.setHeader("Content-Length", "130");
				post.setHeader(REFERER_H,String.format("https://mp.weixin.qq.com/cgi-bin/appmsg?t=media/appmsg_edit&action=edit&type=10&isMul=0&isNew=1&lang=zh_CN&token=%s", this.token));
				post.setHeader("Origin", "https://mp.weixin.qq.com");
				post.setHeader("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
				post.setHeader("Host", "mp.weixin.qq.com");
				post.setHeader("Pragma", "no-cache");
				post.setHeader("X-Requested-With", "XMLHttpRequest");
				
				//NameValuePair[] params = null;
				List<BasicNameValuePair> formParams = new ArrayList<BasicNameValuePair>(); //构建POST请求的表单参数
				int count = fodders.size();
				formParams.add(new BasicNameValuePair("count", String.valueOf(count)));//素材个数 
				for(int i = 0; i < count; i++){
					FodderVO fodder = fodders.get(i);
					formParams.add(new BasicNameValuePair("author" + i, fodder.getAuthor()));
					formParams.add(new BasicNameValuePair("content" + i,fodder.getContent())); 
					formParams.add(new BasicNameValuePair("digest" + i, fodder.getSummary())); 
					formParams.add(new BasicNameValuePair("fileid" + i, imgids.get(i)));
					formParams.add(new BasicNameValuePair("title" + i, fodder.getTitle())); 
					formParams.add(new BasicNameValuePair("show_cover_pic" + i, String.valueOf(fodder.getCoverShowInText())));
					formParams.add(new BasicNameValuePair("sourceurl" + i,fodder.getSourceUrl())); 
				}
				formParams.add(new BasicNameValuePair("ajax", "1"));
				formParams.add(new BasicNameValuePair("random", Math.random()+"8")); 
				formParams.add(new BasicNameValuePair("f", "json"));
				formParams.add(new BasicNameValuePair("lang", "zh_CN")); 
				formParams.add(new BasicNameValuePair("sub", "create")); 
				formParams.add(new BasicNameValuePair("t", "ajax-response"));
				formParams.add(new BasicNameValuePair("token", this.token)); 
				formParams.add(new BasicNameValuePair("type", "10")); 
				
				post.setEntity(new UrlEncodedFormEntity(formParams, "UTF-8")); 


				HttpResponse response = httpClient.execute(post);    //执行POST请求 
				HttpEntity entity = response.getEntity();            //获取响应实体 
				String responseContent = null;                       //响应内容 
				if (null != entity) { 
					responseContent = EntityUtils.toString(entity, "UTF-8"); 
					EntityUtils.consume(entity); //Consume response content 
					Map<String, Object> map = JSONObject.parseObject(responseContent);
					String ret = (String) map.get("ret");
					if("0".equals(ret)){
						String msgid = getAppMsgId();
						return msgid;
					}
				} 
			}
		}catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return null;
	}
}
