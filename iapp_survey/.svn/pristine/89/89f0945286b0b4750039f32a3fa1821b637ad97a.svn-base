//package com.longtime.app.ixin.api;
//
//import com.alibaba.fastjson.JSON;
//import com.alibaba.fastjson.JSONObject;
//import com.google.common.collect.Maps;
//import ognl.Ognl;
//import ognl.OgnlException;
//import org.apache.commons.lang3.StringUtils;
//import org.apache.http.HttpEntity;
//import org.apache.http.NameValuePair;
//import org.apache.http.client.entity.UrlEncodedFormEntity;
//import org.apache.http.client.methods.CloseableHttpResponse;
//import org.apache.http.client.methods.HttpPost;
//import org.apache.http.conn.ssl.NoopHostnameVerifier;
//import org.apache.http.conn.ssl.SSLConnectionSocketFactory;
//import org.apache.http.impl.client.CloseableHttpClient;
//import org.apache.http.impl.client.HttpClients;
//import org.apache.http.message.BasicNameValuePair;
//import org.apache.http.ssl.SSLContexts;
//import org.apache.http.util.EntityUtils;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import sun.misc.BASE64Encoder;
//
//import javax.imageio.ImageIO;
//import javax.net.ssl.SSLContext;
//import java.awt.image.BufferedImage;
//import java.io.ByteArrayOutputStream;
//import java.io.IOException;
//import java.net.HttpURLConnection;
//import java.net.MalformedURLException;
//import java.net.ProtocolException;
//import java.net.URL;
//import java.security.MessageDigest;
//import java.util.*;
//
//
//public class FosunAPIHelper {
//    private static final Logger logger = LoggerFactory.getLogger(FosunAPIHelper.class);
//
//
//	public static final String DOMAIN_FOSUN        = "fosun";
//	public static final String DOMAIN_FODI = "fosunproperty"; //复星地产
//	public static final List<String> FILTER_DOMAINS = new ArrayList<String>();
//	static {
//		FILTER_DOMAINS.add(DOMAIN_FOSUN);//
//		FILTER_DOMAINS.add(DOMAIN_FODI);//
//	}
//
//	public static final Map<String,DingTalkConfig> CONFIG_MAP = Maps.newHashMap();
//	static {
//		CONFIG_MAP.put(DOMAIN_FOSUN,new DingTalkConfig("150312","4002716"));
//		CONFIG_MAP.put(DOMAIN_FODI,new DingTalkConfig("162020","8226972"));
//
//
//	}
//
//
//	public static boolean isDingTalkDomain(String domain) {
//		if(StringUtils.isBlank(domain)){
//			return false;
//		}
//		return FILTER_DOMAINS.contains(domain);
//	}
//
//
//
//
//	private static String getSendImageTextURL(DingTalkConfig config){
//		String ts = getLocaTimeStamp();
//		String secretKey = generateSecretKeyByClientid(config.clientId);
//		String rightSign = generateSign(ts, config.clientId, secretKey);
//		String url = "https://oapi.fosun.com/api/message/sendOa?clientid="+config.clientId+"&sign="+rightSign+"&timestamp="+ts;
//		return url;
//	}
//
//
//	private static void configConnection(HttpURLConnection conn, String method) throws ProtocolException {
//		conn.setRequestMethod(method);
//		conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
//		conn.setDoOutput(true);
//		conn.setDoInput(true);
//		conn.setConnectTimeout(10000);
//		conn.setReadTimeout(10000);
//	}
//
//
//	private static String getHttpPostReturn(String url,Map param) throws Exception {
//		logger.info("[DingDing]Call-sp:" + url + "  " + param);
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
//
//	private static String generateSecretKeyByClientid(String clientid){
//		return md5("FOSUN;"+clientid)+md5("webapi");
//	}
//
//	private static String generateSign(String ms,String clientid,String secretkey){
//
//		return md5(ms+clientid+secretkey);
//	}
//
//	private final static String md5(String s) {
//		char hexDigits[]={'0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'};
//		try {
//			byte[] btInput = s.getBytes();
//			// 获得MD5摘要算法的 MessageDigest 对象
//			MessageDigest mdInst = MessageDigest.getInstance("MD5");
//			// 使用指定的字节更新摘要
//			mdInst.update(btInput);
//			// 获得密文
//			byte[] md = mdInst.digest();
//			// 把密文转换成十六进制的字符串形式
//			int j = md.length;
//			char str[] = new char[j * 2];
//			int k = 0;
//			for (int i = 0; i < j; i++) {
//				byte byte0 = md[i];
//				str[k++] = hexDigits[byte0 >>> 4 & 0xf];
//				str[k++] = hexDigits[byte0 & 0xf];
//			}
//			return new String(str);
//		} catch (Exception e) {
//			e.printStackTrace();
//			return null;
//		}
//	}
//
//	private static String getLocaTimeStamp() {
//		String currentTimeStamp = ((Long)(System.currentTimeMillis()/1000)).toString();
//		return currentTimeStamp;
//	}
//
//
//
//	private static String getSendUrl(DingTalkConfig config){
//		String ts = getLocaTimeStamp();
//		String secretKey = generateSecretKeyByClientid(config.clientId);
//		String rightSign = generateSign(ts, config.clientId, secretKey);
//		String url = "https://oapi.fosun.com/api/message/send?clientid="+config.clientId+"&sign="+rightSign+"&timestamp="+ts;
//		return url;
//	}
//
//	private static DingTalkConfig getConfig(String domain) {
//		return CONFIG_MAP.get(domain);
//	}
//
//
//
//	public static boolean sendImageText(String toUsers,String toPartys,String title,String content,String url,String imageUrl,String domain){
//		if(StringUtils.isBlank(title)){
//			return false;
//		}
//
//		DingTalkConfig config = getConfig(domain);
//
//		if(null==config){
//			return false;
//		}
//
//		String json = formatToImageText(toUsers, toPartys, title, content, url,imageUrl, config);
//
//		Map<String, String> map = new HashMap<String, String>(1);
//		map.put("text", json);
//		try {
//
//			String	demoJson = FosunAPIHelper.getHttpPostReturn(FosunAPIHelper.getSendImageTextURL(config),map);
//			JSONObject jsStr = JSONObject.parseObject(demoJson); //把String类型转换成json类型
//			String	 jscode = jsStr.getString("errcode");//获取errcode的值
//			if("0".equals(jscode)){
//				return true;
//			}
//			else{
//				return false;
//			}
//		} catch (Exception e) {
//			logger.error("dingtalk send image text due to error.",e);
//		}
//
//
//
//		return false;
//	}
//
//	private static String formatToImageText(String toUsers, String toPartys, String title, String content, String url,String imageUrl, DingTalkConfig config) {
//
//		String mediaId = "";
//		if(StringUtils.isNotBlank(imageUrl)){
//			String code =encodeImgageToBase64((imageUrl));
//			mediaId = getMediaId(code);
//		}
//
//		Map<String,Object> root = Maps.newHashMap();
//
//
//		try {
//
//			Ognl.setValue("touser", root, org.apache.commons.lang.StringUtils.trimToEmpty(toUsers));
//			Ognl.setValue("toparty",root, org.apache.commons.lang.StringUtils.trimToEmpty(toPartys));
//			Ognl.setValue("msgtype",root,"oa");
//			Ognl.setValue("messageAgentId",root,config.agentId);
//
//			Ognl.setValue("oa",root,Maps.newHashMap());
//			Ognl.setValue("oa.message_url",root,url);
//
//			Ognl.setValue("oa.head",root,Maps.newHashMap());
//			Ognl.setValue("oa.head.bgcolor",root,"FF1E90FF");
//
//			Ognl.setValue("oa.body",root,Maps.newHashMap());
//			Ognl.setValue("oa.body.title",root,title);
//			Ognl.setValue("oa.body.content",root,content);
//
//			if(StringUtils.isNotBlank(mediaId)){
//				Ognl.setValue("oa.body.image",root,mediaId);
//			}
//
//		} catch (OgnlException e) {
//		}
//
//		return  JSON.toJSONString(root);
//	}
//
//
//	public static  boolean sendText(String msg,String toUsers,String toPartys,String domain){
//		if(StringUtils.isBlank(msg) ){
//			return  false;
//		}
//
//		DingTalkConfig config = getConfig(domain);
//
//		if(null==config){
//			return false;
//		}
//
//		String json = String.format("{\"touser\": \"%s\",\"toparty\": \"%s\",\"msgtype\": \"text\",\"clientId\": \"%s\",\"text\": { \"content\": \"%s\"}}", StringUtils.trimToEmpty(toUsers), StringUtils.trimToEmpty(toPartys),config.agentId, StringUtils.trim(msg));
//		Map<String, String> map = new HashMap<String, String>();
//		map.put("text", json);
//		try {
//
//			String	data = getHttpPostReturn(getSendUrl(config), map);
//
//			JSONObject jsonObject = JSONObject.parseObject(data);//把String类型转换成json类型
//			String	jscode = jsonObject.getString("errcode");//获取errcode的值
//			if("0".equals(jscode)){
//				return true;
//			}
//			else{
//				return false;
//			}
//		} catch (Exception e) {
//			logger.error("dingtalk send text due to error.", e);
//		}
//
//		return false;
//	}
//
//	public static  String getMediaId(String base64Code){
//
//		String webapiUrl = "https://oapi.fosun.com/api/message/getMediaId";
//		Map<String, String> map = new HashMap<String, String>();
//		map.put("base64Code", base64Code);
//		String jsonText = null;
//		try {
//			jsonText = FosunAPIHelper.getHttpPostReturn(webapiUrl, map);
//			JSONObject  textContentJsonObj  = JSONObject .parseObject(jsonText);
//			return textContentJsonObj.getString("media_id");
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//
//		return null;
//	}
//
//
//
//
//	static class DingTalkConfig {
//		String clientId;
//		String agentId;
//		public DingTalkConfig(String clientId,String agentId){
//			this.clientId = clientId;
//			this.agentId = agentId;
//		}
//	}
//
//
//
//
//	/**
//	 * 将网络图片进行Base64位编码
//	 *
//	 * @param imgUrl
//	 *			图片的url路径，如http://.....xx.jpg
//	 * @return
//	 */
//	public static String encodeImgageToBase64(String url) {// 将图片文件转化为字节数组字符串，并对其进行Base64编码处理
//		if(StringUtils.isBlank(url)){
//			return null;
//		}
//		ByteArrayOutputStream outputStream = null;
//		try {
//			URL imageUrl = new URL(url);
//			BufferedImage bufferedImage = ImageIO.read(imageUrl);
//			outputStream = new ByteArrayOutputStream();
//			ImageIO.write(bufferedImage, "png", outputStream);
//		} catch (MalformedURLException e1) {
//			e1.printStackTrace();
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		// 对字节数组Base64编码
//		BASE64Encoder encoder = new BASE64Encoder();
//		return encoder.encode(outputStream.toByteArray());// 返回Base64编码过的字节数组字符串
//	}
//
//
//
//
//	public static void main(String[] args) throws Exception{
//
//		//FosunAPIHelper.sendText("测试","gongjunxiong@longtimeit.com","","fosun");
//		//FosunAPIHelper.sendText("测试","13262770886","","fosun");
//
//		//FosunAPIHelper.sendImageText("gongjunxiong@longtimeit.com", "",  "测试", "这里是内容", "http://www.baidu.com", DOMAIN_FODI);
//
//
//		//String code =encodeImgageToBase64(("http://7d9ijt.com1.z0.glb.clouddn.com/FiEsmbf-9dNFsC_ROGH6R-VgO1uC-320x160"));
//		//download("https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=2172868569,77657086&fm=58", "/Users/longtime/Downloads/1.png");
//
//
//		String code =encodeImgageToBase64(("http://7d9ijt.com1.z0.glb.clouddn.com/FiEsmbf-9dNFsC_ROGH6R-VgO1uC-640x320"));
//
//		System.out.println(code);
//		String s = getMediaId(code);
//		System.out.println(s);
//
//		//FosunAPIHelper.sendImageText("gongjunxiong@longtimeit.com", "",  "测试", "这里是内容", "http://www.baidu.com", "http://7d9ijt.com1.z0.glb.clouddn.com/FryaxRtGy5so-KyrHGUKYVxeGz74-640x320",DOMAIN_FODI);
//
//
//
//	}
//}
