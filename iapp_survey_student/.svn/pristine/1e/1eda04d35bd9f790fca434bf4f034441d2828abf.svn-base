/**
 * 微信公众平台开发模式(JAVA) SDK
 * (c) 2012-2013 ____′↘夏悸 <wmails@126.cn>, MIT Licensed
 * http://www.jeasyuicn.com/wechat
 */
package com.longtime.ajy.support.weixin;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLEncoder;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import java.util.Map;
import java.util.Map.Entry;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSocketFactory;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * https 请求 微信为https的请求
 * 
 * @author L.cm
 * @date 2013-10-9 下午2:40:19
 */
public class HttpsKit {

	private static final String DEFAULT_CHARSET = "UTF-8";
	private static final Logger logger = LoggerFactory.getLogger(HttpsKit.class);

	private static final int TIME_OUT_CONNECT = 3000; // 3s
	private static final int TIME_OUT_READ = 3000;//3s

	/**
	 * 发送Get请求
	 * 
	 * @param url
	 * @return
	 * @throws NoSuchProviderException
	 * @throws NoSuchAlgorithmException
	 * @throws IOException
	 * @throws KeyManagementException
	 */
	public static String get(String url) {//throws NoSuchAlgorithmException, NoSuchProviderException, IOException, KeyManagementException {
		InputStream in = null;
		HttpsURLConnection http = null;

		try {
			StringBuffer bufferRes = null;
			TrustManager[] tm = { new MyX509TrustManager() };
			SSLContext sslContext = SSLContext.getInstance("SSL", "SunJSSE");
			sslContext.init(null, tm, new java.security.SecureRandom());
			// 从上述SSLContext对象中得到SSLSocketFactory对象  
			SSLSocketFactory ssf = sslContext.getSocketFactory();

			URL urlGet = new URL(url);
			http = (HttpsURLConnection) urlGet.openConnection();
			// 连接超时
			http.setConnectTimeout(TIME_OUT_CONNECT);
			// 读取超时 --服务器响应比较慢，增大时间
			http.setReadTimeout(TIME_OUT_READ);
			http.setRequestMethod("GET");
			http.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
			http.setSSLSocketFactory(ssf);
			http.setDoOutput(true);
			http.setDoInput(true);
			http.connect();

			in = http.getInputStream();
			BufferedReader read = new BufferedReader(new InputStreamReader(in, DEFAULT_CHARSET));
			String valueString = null;
			bufferRes = new StringBuffer();
			while ((valueString = read.readLine()) != null) {
				bufferRes.append(valueString);
			}
			return bufferRes.toString();
		} catch (Exception e) {
			logger.error(String.format("HTTP GET url=[%s] due to fail.", url), e);
		} finally {
			if (null != in) {
				try {
					in.close();
				} catch (IOException e) {
					logger.error(String.format("HTTP GET url=[%s] close inputstream due to fail.", url), e);
				}
			}
			if (http != null) {
				// 关闭连接
				http.disconnect();
			}
		}

		return StringUtils.EMPTY;

	}

	/**
	 * 发送Get请求
	 * 
	 * @param url
	 * @param params
	 * @return
	 * @throws IOException
	 * @throws NoSuchProviderException
	 * @throws NoSuchAlgorithmException
	 * @throws KeyManagementException
	 */
	public static String get(String url, Map<String, String> params) throws KeyManagementException,
			NoSuchAlgorithmException, NoSuchProviderException, IOException {
		return get(initParams(url, params));
	}

	/**
	 * 发送Post请求
	 * 
	 * @param url
	 * @param params
	 * @return
	 * @throws IOException
	 * @throws NoSuchProviderException
	 * @throws NoSuchAlgorithmException
	 * @throws KeyManagementException
	 */
	public static String post(String url, String params) {//throws IOException, NoSuchAlgorithmException, NoSuchProviderException, KeyManagementException {

		OutputStream out = null;
		InputStream in = null;
		HttpsURLConnection http = null;
		try {
			StringBuffer bufferRes = null;
			TrustManager[] tm = { new MyX509TrustManager() };
			SSLContext sslContext = SSLContext.getInstance("SSL", "SunJSSE");
			sslContext.init(null, tm, new java.security.SecureRandom());
			// 从上述SSLContext对象中得到SSLSocketFactory对象  
			SSLSocketFactory ssf = sslContext.getSocketFactory();

			URL urlGet = new URL(url);
			http = (HttpsURLConnection) urlGet.openConnection();
			// 连接超时
			http.setConnectTimeout(TIME_OUT_CONNECT);
			// 读取超时 --服务器响应比较慢，增大时间
			http.setReadTimeout(TIME_OUT_READ);
			http.setRequestMethod("POST");
			http.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
			http.setSSLSocketFactory(ssf);
			http.setDoOutput(true);
			http.setDoInput(true);
			http.connect();

			out = http.getOutputStream();
			out.write(params.getBytes("UTF-8"));
			out.flush();

			in = http.getInputStream();
			BufferedReader read = new BufferedReader(new InputStreamReader(in, DEFAULT_CHARSET));
			String valueString = null;
			bufferRes = new StringBuffer();
			while ((valueString = read.readLine()) != null) {
				bufferRes.append(valueString);
			}

			return bufferRes.toString();

		} catch (Exception e) {
			logger.error(String.format("HTTP POST url=[%s] param=[%s] due to fail.", url, params), e);
		} finally {

			if (null != out) {
				try {
					out.close();
				} catch (IOException e) {
					logger.error(String.format("HTTP POST url=[%s] param=[%s]  close outputstream due to fail.",
						url,
						params), e);
				}
			}
			if (null != in) {
				try {
					in.close();
				} catch (IOException e) {
					logger.error(String.format("HTTP POST url=[%s] param=[%s] close inputstream due to fail.",
						url,
						params), e);
				}
			}

			if (http != null) {
				// 关闭连接
				http.disconnect();

			}
		}
		return StringUtils.EMPTY;
	}

	/**
	 * @param url
	 * @param params
	 * @return
	 */
	private static String initParams(String url, Map<String, String> params) {
		if (null == params || params.isEmpty()) {
			return url;
		}
		StringBuilder sb = new StringBuilder(url);
		if (url.indexOf("?") == -1) {
			sb.append("?");
		} else {
			sb.append("&");
		}
		boolean first = true;
		for (Entry<String, String> entry : params.entrySet()) {
			if (first) {
				first = false;
			} else {
				sb.append("&");
			}
			String key = entry.getKey();
			String value = entry.getValue();
			sb.append(key).append("=");
			if (StringUtils.isNotEmpty(value)) {
				try {
					sb.append(URLEncoder.encode(value, DEFAULT_CHARSET));
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
					logger.error(url, e);
				}
			}
		}
		return sb.toString();
	}

	public static void main(String[] args) {
		
		String appid="wxd301c80aa34b6b24";
		String secret = "f83007f9e17b0258dd7a2979079c14e5";
		
		
		String code = "025a85f3e21a94d7e4de9e1cd6ab4a22";
		
		String str = HttpsKit.get(String.format("https://api.weixin.qq.com/sns/oauth2/access_token?appid=%s&secret=%s&code=%s&grant_type=authorization_code",appid,secret,code));
		
		System.out.println(str);
		
		//{"access_token":"OezXcEiiBSKSxW0eoylIeCn-3lBhvaWGIFYDWln7YpMvpzr58oEi_CN35IrMY0jtf8t5kQdMT0fmMlg5tl7yFiRfhvfGkWlwZw_qb1bb07xozg2baXKnXLuQHJ0xY_rdftGsn8RX8qcaZ83J1XzQhg","expires_in":7200,"refresh_token":"OezXcEiiBSKSxW0eoylIeCn-3lBhvaWGIFYDWln7YpMvpzr58oEi_CN35IrMY0jtf8t5kQdMT0fmMlg5tl7yFub__Qee3Mm0r6Cq-zP8cLMoisZfwQKRacYRbVCOXbJG8lQbF867jXA-HRJ2Lb5gKg","openid":"o7ShcuEjSTtHd9rIGO43rylOOcn4","scope":"snsapi_base"}

		String access_token ="OezXcEiiBSKSxW0eoylIeCn-3lBhvaWGIFYDWln7YpMvpzr58oEi_CN35IrMY0jtf8t5kQdMT0fmMlg5tl7yFiRfhvfGkWlwZw_qb1bb07xozg2baXKnXLuQHJ0xY_rdftGsn8RX8qcaZ83J1XzQhg";
		String openid = "o7ShcuEjSTtHd9rIGO43rylOOcn4";
		str =  HttpsKit.get("https://api.weixin.qq.com/sns/userinfo?access_token="+access_token+"&openid="+openid+"&lang=zh_CN");
		
		
		System.out.println(str);
		//{"openid":"o7ShcuEjSTtHd9rIGO43rylOOcn4","nickname":"宋少璞","sex":1,"language":"zh_CN","city":"静安","province":"上海","country":"中国","headimgurl":"http:\/\/wx.qlogo.cn\/mmopen\/lzpjEaNVhXv1URUmL337sK39KPuhtlmEibsKvlfyn4IXdJUzFL88Kp1gAS8Bv6zmAdHeNUt1oT1235yulg4z6BONxGc7NDnNj\/0","privilege":[]}
	}
}

/**
 * 证书管理
 */
class MyX509TrustManager implements X509TrustManager {

	public X509Certificate[] getAcceptedIssuers() {
		return null;
	}

	@Override
	public void checkClientTrusted(X509Certificate[] chain, String authType) throws CertificateException {
	}

	@Override
	public void checkServerTrusted(X509Certificate[] chain, String authType) throws CertificateException {
	}
}