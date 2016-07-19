//package com.longtime.app.ixin.api;
//import org.apache.commons.logging.Log;
//import org.apache.commons.logging.LogFactory;
//import org.apache.http.HttpEntity;
//import org.apache.http.NameValuePair;
//import org.apache.http.client.entity.UrlEncodedFormEntity;
//import org.apache.http.client.methods.CloseableHttpResponse;
//import org.apache.http.client.methods.HttpPost;
//import org.apache.http.conn.ssl.NoopHostnameVerifier;
//import org.apache.http.conn.ssl.SSLConnectionSocketFactory;
//import org.apache.http.entity.StringEntity;
//import org.apache.http.impl.client.CloseableHttpClient;
//import org.apache.http.impl.client.HttpClients;
//import org.apache.http.message.BasicNameValuePair;
//import org.apache.http.ssl.SSLContexts;
//import org.apache.http.util.EntityUtils;
//
//import javax.net.ssl.SSLContext;
//import java.util.ArrayList;
//import java.util.Iterator;
//import java.util.List;
//import java.util.Map;
//
//@Deprecated
//public class TestDingHelper {
//	private static Log logger = LogFactory.getLog(TestDingHelper.class);
//	
//	public static String getHttpPostReturn(String url,String json) throws Exception {
//		logger.info("[DingDing]Call-sp:" + url + "  "+json);
//		String ret = null;
//		SSLContext sslContext = SSLContexts.createSystemDefault();
//		SSLConnectionSocketFactory sslsf = new SSLConnectionSocketFactory(
//				sslContext, NoopHostnameVerifier.INSTANCE);
//		CloseableHttpClient httpclient = HttpClients.custom()
//				.setSSLSocketFactory(sslsf).build();
//
//		HttpPost httppost = new HttpPost(url);
//		httppost.addHeader("Content-Type", "application/json");
//		httppost.setEntity(new StringEntity(json, "UTF-8"));
// 
//		CloseableHttpResponse response = httpclient.execute(httppost);
//		try {
//			HttpEntity entity = response.getEntity();
//			if (entity != null) {
//				ret = EntityUtils.toString(entity, "UTF-8");			
//			}
//		} finally {
//			response.close();
//		}
//		logger.info("[DingDing]Call-sr:" + ret);
//		return ret;
//	}
//	
//	public static String getHttpPostReturn(String url,Map param) throws Exception {
//		logger.info("[DingDing]Call-sp:" + url + "  "+param);
//		String ret = null;
//		SSLContext sslContext = SSLContexts.createSystemDefault();
//		SSLConnectionSocketFactory sslsf = new SSLConnectionSocketFactory(
//				sslContext, NoopHostnameVerifier.INSTANCE);
//		CloseableHttpClient httpclient = HttpClients.custom()
//				.setSSLSocketFactory(sslsf).build();
//
//		HttpPost httppost = new HttpPost(url);
//	 
//		
//		List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>();
//		Iterator<String> it = param.keySet().iterator();
//		while (it.hasNext()) {
//			String key = it.next();
//			nameValuePairs.add(new BasicNameValuePair(key, (String) param
//					.get(key)));
//		}
//		httppost.setEntity(new UrlEncodedFormEntity(nameValuePairs, "UTF-8"));
// 
//		CloseableHttpResponse response = httpclient.execute(httppost);
//		try {
//			HttpEntity entity = response.getEntity();
//			if (entity != null) {
//				ret = EntityUtils.toString(entity, "UTF-8");			
//			}
//		} finally {
//			response.close();
//		}
//		logger.info("[DingDing]Call-sr:" + ret);
//		return ret;
//	} 	
//
//	public static void main(String[] args) throws Exception {
//        
////        String json = String.format("{\"touser\": \"%s\",\"toparty\": \"%s\",\"msgtype\": \"text\",\"clientId\": \""+FosunAPIHelper.FOSUN_API_CLIENTID+"\",\"text\": { \"content\": \"%s\"}}","gongjunxiong@longtimeit.com",null, "hello");
////        Map<String, String> map = new HashMap<String, String>();
////        map.put("text", json);
////
////            String  demoJson = TestDingHelper.getHttpPostReturn(FosunAPIHelper.geturl(),map);
////            JSONObject jsStr = JSONObject.fromObject(demoJson); //把String类型转换成json类型
////       System.out.println(jsStr.toString());
//	    
//    }
//}
