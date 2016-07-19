package com.longtime.ajy.support.bean;

import com.alibaba.fastjson.JSONObject;
import com.google.gson.JsonObject;
import me.chanjar.weixin.common.bean.result.WxError;
import me.chanjar.weixin.common.bean.result.WxMediaUploadResult;
import me.chanjar.weixin.common.exception.WxErrorException;
import me.chanjar.weixin.common.util.http.MediaUploadRequestExecutor;
import me.chanjar.weixin.common.util.http.RequestExecutor;
import me.chanjar.weixin.common.util.http.SimplePostRequestExecutor;
import me.chanjar.weixin.common.util.http.Utf8ResponseHandler;
import me.chanjar.weixin.mp.api.WxMpService;
import me.chanjar.weixin.mp.bean.WxMpMassNews;
import me.chanjar.weixin.mp.bean.result.WxMpMassUploadResult;
import org.apache.http.HttpEntity;
import org.apache.http.HttpHost;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.mime.MultipartEntityBuilder;
import org.apache.http.impl.client.CloseableHttpClient;

import java.io.File;
import java.io.IOException;
import java.util.Hashtable;
import java.util.Map;

public class ExtWxMpServiceImpl  {

	private WxMpService _target;

	public ExtWxMpServiceImpl(WxMpService wxMpService) {
		_target = wxMpService;
	}

	//上传图文消息内的图片获取URL
	public String updateFodderContentImg(File file) throws WxErrorException {
		String url = "https://api.weixin.qq.com/cgi-bin/media/uploadimg";
		return _target.execute(new FordderContentImgUploadRequestExecutor(), url, file);
	}




	//永久素材 image voice  thumb
	public WxMediaUploadResult mediaMaterialUpload(String mediaType, File file) throws WxErrorException {
		String url = "http://api.weixin.qq.com/cgi-bin/material/add_material?type=" + mediaType;
		return _target.execute(new MediaUploadRequestExecutor(), url, file);
	}

	//永久视频 video
	public WxMediaUploadResult mediaVideoMaterialUpload(File file, String title, String introduction)
			throws WxErrorException {
		String url = "http://api.weixin.qq.com/cgi-bin/material/add_material?type=video";

		JsonObject json = new JsonObject();
		json.addProperty("title", title);
		json.addProperty("introduction", introduction);
		String description = json.toString();

		Map<String, Object> data = new Hashtable<>(2);
		data.put("media", file);
		data.put("description", description);

		return _target.execute(new MediaMaterialUploadRequestExecutor(), url, data);
	}
	
	
	
	 public WxMpMassUploadResult massNewsMaterialUpload(WxMpMassNews news) throws WxErrorException {
		    String url = "https://api.weixin.qq.com/cgi-bin/material/add_news";
		    String responseContent = _target.execute(new SimplePostRequestExecutor(), url, news.toJson());
		    return WxMpMassUploadResult.fromJson(responseContent);
	}

	public class MediaMaterialUploadRequestExecutor implements
			RequestExecutor<WxMediaUploadResult, Map<String, Object>> {

		@Override
		public WxMediaUploadResult execute(CloseableHttpClient httpclient,
				HttpHost httpProxy,
				String uri,
				Map<String, Object> data) throws WxErrorException, ClientProtocolException, IOException {
			HttpPost httpPost = new HttpPost(uri);
			if (httpProxy != null) {
				RequestConfig config = RequestConfig.custom().setProxy(httpProxy).build();
				httpPost.setConfig(config);
			}
			if (data != null) {
				MultipartEntityBuilder entityBuilder = MultipartEntityBuilder.create();
				Object value = null;
				for (String key : data.keySet()) {
					value = data.get(key);
					if (null == value) {
						continue;
					}
					if (value instanceof File) {
						entityBuilder.addBinaryBody(key, (File) value);
					} else {
						entityBuilder.addTextBody(key, (String) value);
					}
				}
				HttpEntity entity = entityBuilder.build();
				httpPost.setEntity(entity);
				httpPost.setHeader("Content-Type", ContentType.MULTIPART_FORM_DATA.toString());
			}
			CloseableHttpResponse response = httpclient.execute(httpPost);
			String responseContent = Utf8ResponseHandler.INSTANCE.handleResponse(response);
			WxError error = WxError.fromJson(responseContent);
			if (error.getErrorCode() != 0) {
				throw new WxErrorException(error);
			}
			return WxMediaUploadResult.fromJson(responseContent);
		}

	}




	public static class FordderContentImgUploadRequestExecutor implements RequestExecutor<String, File> {

		@Override
		public String execute(CloseableHttpClient httpclient, HttpHost httpProxy, String uri, File file) throws WxErrorException, ClientProtocolException, IOException {
			HttpPost httpPost = new HttpPost(uri);
			if (httpProxy != null) {
				RequestConfig config = RequestConfig.custom().setProxy(httpProxy).build();
				httpPost.setConfig(config);
			}
			if (file != null) {
				HttpEntity entity = MultipartEntityBuilder
						.create()
						.addBinaryBody("media", file)
						.build();
				httpPost.setEntity(entity);
			}
			CloseableHttpResponse response = httpclient.execute(httpPost);
			String responseContent = Utf8ResponseHandler.INSTANCE.handleResponse(response);
			WxError error = WxError.fromJson(responseContent);
			if (error.getErrorCode() != 0) {
				throw new WxErrorException(error);
			}
			return JSONObject.parseObject(responseContent).getString("url");
		}

	}

}
