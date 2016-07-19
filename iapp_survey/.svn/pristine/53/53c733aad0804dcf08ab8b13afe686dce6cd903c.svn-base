package com.kin.weixin;

import java.io.File;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.methods.multipart.FilePart;
import org.apache.commons.httpclient.methods.multipart.MultipartRequestEntity;
import org.apache.commons.httpclient.methods.multipart.Part;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.longtime.app.ixin.mgr.fodder.vo.FodderVO;

/**
 * 微信api相关
 * 
 */
public class WeixinApi {
	private final static Logger log = LoggerFactory.getLogger(WeixinApi.class);

	public static final String GET_TOKEN_URL = "https://api.weixin.qq.com/cgi-bin/token"; // 获取token
																							// url

	public static final String UPLOAD_IMAGE_URL = "http://file.api.weixin.qq.com/cgi-bin/media/upload"; // 上传多媒体文件url

	public static final String UPLOAD_FODDER_URL = "https://api.weixin.qq.com/cgi-bin/media/uploadnews"; // 上传图文消息url

	public static final String GET_USER_GROUP = "https://api.weixin.qq.com/cgi-bin/groups/get"; // 获取用户分组url

	public static final String SEND_MESSAGE_URL = "https://api.weixin.qq.com/cgi-bin/message/mass/sendall"; // 分组发送消息url

	public final static String USER_AGENT_H = "User-Agent";
	public final static String USER_AGENT = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:30.0) Gecko/20100101 Firefox/30.0";
	public final static String USER_HOST_H = "Host";
	public final static String USER_HOST = "file.api.weixin.qq.com";
	public final static String USER_CACHE_H = "Cache-Control";
	public final static String USER_CACHE = "no-cache";
	public final static String USER_CONNECTION_H = "Connection";
	public final static String USER_CONNECTION = "Keep-Alive";
	public final static String USER_CONTENT_TYPE_H = "Content-Type";

	/**
	 * 获取token
	 * 
	 * @param apiurl
	 *            访问url
	 * @param appid
	 *            appid
	 * @param secret
	 *            appsecret
	 * @return
	 */
	@SuppressWarnings({ "deprecation" })
	public static String getToken(String apiurl, String appid, String secret) {
		String result = null;
		String turl = String.format(
				"%s?grant_type=client_credential&appid=%s&secret=%s", apiurl,
				appid, secret);
		HttpClient client = new DefaultHttpClient();
		HttpGet get = new HttpGet(turl);
		try {
			HttpResponse res = client.execute(get);
			HttpEntity entity = res.getEntity();
			String responseContent = EntityUtils.toString(entity, "UTF-8"); // 响应内容
			log.debug("getToken" + responseContent);
			JSONObject json = JSONObject.fromObject(responseContent);// 将json字符串转换为json对象
			if (res.getStatusLine().getStatusCode() == HttpStatus.SC_OK) {
				if (json.get("access_token") != null) { // 正常情况下{"access_token":"ACCESS_TOKEN","expires_in":7200}
					result = json.getString("access_token");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 关闭连接 ,释放资源
			client.getConnectionManager().shutdown();
		}
		// }
		return result;
	}

	/**
	 * 上传多媒体文件(上传封面)
	 * 
	 * @param url
	 *            访问url
	 * @param access_token
	 *            access_token
	 * @param type
	 *            文件类型
	 * @param file
	 *            文件对象
	 * @return
	 */
	public static String uploadImage(String url, String access_token,
			String type, File file) {
		org.apache.commons.httpclient.HttpClient client = new org.apache.commons.httpclient.HttpClient();
		String uploadurl = String.format("%s?access_token=%s&type=%s", url,
				access_token, type);
		PostMethod post = gettPostMethod(uploadurl);
		String result = null;
		try {
			if (file != null && file.exists()) {
				FilePart filepart = new FilePart("media", file, "image/jpeg",
						"UTF-8");
				Part[] parts = new Part[] { filepart };
				MultipartRequestEntity entity = new MultipartRequestEntity(
						parts, post.getParams());

				post.setRequestEntity(entity);
				int status = client.executeMethod(post);
				if (status == HttpStatus.SC_OK) {
					String responseContent = post.getResponseBodyAsString();
					log.debug("uploadImage" + responseContent);
					JSONObject json = JSONObject.fromObject(responseContent);// 将json字符串转换为json对象
					if (json.get("media_id") != null)// 上传成功
														// ,{"type":"TYPE","media_id":"MEDIA_ID","created_at":123456789}
					{
						result = json.getString("media_id");
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 上传素材
	 * 
	 * @param uploadurl
	 *            apiurl
	 * @param access_token
	 *            访问token
	 * @param data
	 *            提交数据
	 * @return
	 */
	@SuppressWarnings({ "deprecation" })
	public static String uploadFodder(String uploadurl, String access_token,
			String data) {
		org.apache.commons.httpclient.HttpClient client = new org.apache.commons.httpclient.HttpClient();
		String posturl = String.format("%s?access_token=%s", uploadurl,
				access_token);
		PostMethod post = gettPostMethod(posturl);
		String result = null;
		try {
			post.setRequestBody(data);
			int status = client.executeMethod(post);
			if (status == HttpStatus.SC_OK) {
				String responseContent = post.getResponseBodyAsString();
				log.debug("uploadFodder" + responseContent);
				JSONObject json = JSONObject.fromObject(responseContent);// 将json字符串转换为json对象
				if (json.get("media_id") != null) {// 正确 { "type":"news",
													// "media_id":"CsEf3ldqkAYJAU6EJeIkStVDSvffUJ54vqbThMgplD-VJXXof6ctX5fI6-aYyUiQ","created_at":1391857799}
					result = json.getString("media_id");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 获取用户组信息
	 * 
	 * @param url
	 *            访问url
	 * @param token
	 *            access_token
	 * @return 用户id数组
	 */
	@SuppressWarnings({ "deprecation" })
	public static String[] getGroups(String url, String token) {
		String groupurl = String.format("%s?access_token=%s", url, token);
		HttpClient client = new DefaultHttpClient();
		HttpGet get = new HttpGet(groupurl);
		String[] array = null;
		try {
			HttpResponse res = client.execute(get);
			HttpEntity entity = res.getEntity();
			String responseContent = EntityUtils.toString(entity, "UTF-8");// 响应内容
			log.debug("getGroups" + responseContent);
			JSONObject json = JSONObject.fromObject(responseContent);// 将json字符串转换为json对象
			if (res.getStatusLine().getStatusCode() == HttpStatus.SC_OK)// 成功返回消息
			{
				if (json.get("groups") != null)// 不存在错误消息，成功返回
				{
					JSONArray groups = json.getJSONArray("groups");
//					 array = new String[1];
					array = new String[groups.size()];
					for (int i = 0; i < groups.size(); i++) {
//						if (groups.getJSONObject(i).getString("name")
//								.equals("测试群发"))
//							array[0] = groups.getJSONObject(i).getString("id");
						 array[i] = groups.getJSONObject(i).getString("id");
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally { // 关闭连接 ,释放资源
			client.getConnectionManager().shutdown();
		}
		return array;
	}

	/**
	 * 发送消息
	 * 
	 * @param uploadurl
	 *            apiurl
	 * @param access_token
	 * @param data
	 *            发送数据
	 * @return
	 */
	public static String sendMsg(String url, String token, String data) {
		org.apache.commons.httpclient.HttpClient client = new org.apache.commons.httpclient.HttpClient();
		String sendurl = String.format("%s?access_token=%s", url, token);
		PostMethod post = gettPostMethod(sendurl);
		String result = null;
		try {
			post.setRequestBody(data);
			int status = client.executeMethod(post);
			if (status == HttpStatus.SC_OK) {
				String responseContent = post.getResponseBodyAsString();
				log.debug("sendMsg" + responseContent);
				JSONObject json = JSONObject.fromObject(responseContent);// 将json字符串转换为json对象
				if (json.get("errcode") != null
						&& json.getString("errcode").equals("0")) {// 发送消息正确返回信息
					result = json.getString("errmsg");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 获取请求头
	 * 
	 * @param url
	 *            请求地址
	 */
	private static PostMethod gettPostMethod(String url) {
		PostMethod post = new UTF8PostMethod(url);
		post.setRequestHeader(USER_AGENT_H, USER_AGENT);
		post.setRequestHeader(USER_HOST_H, USER_HOST);
		post.setRequestHeader(USER_CONNECTION_H, USER_CONNECTION);
		post.setRequestHeader(USER_CACHE_H, USER_CACHE);
		return post;
	}

	/**
	 * 构造上传微信平台的图文消息
	 * 
	 * @param fileids
	 *            封面id列表
	 * @param fodder
	 *            素材列表
	 * @param showCover
	 *            是否显示封面， 1为显示，0为不显示
	 * @return
	 */
	public static JSONObject createFodderMessage(List<String> fileids,
			List<FodderVO> fodders, String showCover) {
		JSONObject[] array = new JSONObject[fileids.size()];
		for (int i = 0; i < fileids.size(); i++) {
			FodderVO fodder = fodders.get(i);
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("thumb_media_id", fileids.get(i)); // 图文消息缩略图的media_id
			// jsonObject.put("author", fodder.getAuthor());
			jsonObject.put("title", fodder.getTitle());
			jsonObject.put("content_source_url", fodder.getGotoUrl());// 跳转url
			jsonObject.put("content", fodder.getContent()); //
			jsonObject.put("digest", fodder.getSummary()); // 图文消息的描述
			jsonObject.put("show_cover_pic", showCover); // 是否显示封面，
			array[i] = jsonObject;
		}
		JSONObject jsonObjectMsg = new JSONObject();
		jsonObjectMsg.put("articles", array);
		return jsonObjectMsg;
	}

	/**
	 * 构造分组发送的消息
	 * 
	 * @param gid
	 *            分组id
	 * @param mediaId
	 *            媒体id
	 * @param type类型
	 * @return
	 */
	public static JSONObject createGroupMessage(String gid, String mediaId,
			String type) {
		JSONObject filter = new JSONObject();
		filter.put("group_id", gid);

		JSONObject mpnews = new JSONObject();
		mpnews.put("media_id", mediaId);

		JSONObject jsonObj = new JSONObject();
		jsonObj.put("filter", filter);
		jsonObj.put("mpnews", mpnews);
		jsonObj.put("msgtype", type);
		return jsonObj;
	}

	public static class UTF8PostMethod extends PostMethod {
		public UTF8PostMethod(String url) {
			super(url);
		}

		@Override
		public String getRequestCharSet() {
			return "UTF-8";
		}
	}
}
