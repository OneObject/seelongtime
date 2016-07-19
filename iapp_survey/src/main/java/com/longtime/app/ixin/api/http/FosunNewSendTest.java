//package com.longtime.app.ixin.api.http;
//
//import com.alibaba.fastjson.JSON;
//import com.google.common.collect.Maps;
//import com.longtime.app.base.util.Constant;
//import com.longtime.app.ixin.api.FosunAPIHelper;
//import ognl.Ognl;
//import ognl.OgnlException;
//import org.apache.commons.lang.StringUtils;
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
//
//import javax.net.ssl.SSLContext;
//import java.security.MessageDigest;
//import java.util.*;
//
///**
// * FosunNewSendTest
// *
// * @author songsp
// * @since 2015/09/15 13:02
// */
//public class FosunNewSendTest {private static String  clientId = "150312";//clientId
//
//
//    public static void main(String[] args) throws Exception {
////        String ts = getLocaTimeStamp();
////        String secretKey = generateSecretKeyByClientid(clientId);
////        String rightSign = generateSign(ts, clientId, secretKey);
////        System.out.println("输出timestamp的值==========" + ts);
////        System.out.println("输出sign的值==========" + rightSign);
////        String url = "https://oapi.fosun.com/api/message/sendOa?clientid=" + clientId + "&sign=" + rightSign + "&timestamp=" + ts;
////
////
////        Map<String,Object> root = Maps.newHashMap();
////
////        try {
////
////            Ognl.setValue("touser", root, StringUtils.trimToEmpty("gongjunxiong@longtimeit.com"));
////            Ognl.setValue("toparty",root, StringUtils.trimToEmpty(""));
////            Ognl.setValue("msgtype",root,"oa");
////            Ognl.setValue("messageAgentId",root, FosunAPIHelper.messageAgentId);
////
////            Ognl.setValue("oa",root,Maps.newHashMap());
////            Ognl.setValue("oa.message_url",root,String.format("%s%s%s%s%s", Constant.FODDER_BASE_PATH, "id=", "68e82e77d0854ce089c3d3a5e090bb15", "&fdomain=", "fosun"));
////
////            Ognl.setValue("oa.head",root,Maps.newHashMap());
////            Ognl.setValue("oa.head.bgcolor",root,"FF1E90FF");
////
////            Ognl.setValue("oa.body",root,Maps.newHashMap());
////            Ognl.setValue("oa.body.title",root,"测试");
////            Ognl.setValue("oa.body.content",root,"测试");
////
////        } catch (OgnlException e) {
////        }
////
////        String json = JSON.toJSONString(root);
////        System.out.println(json);
////        Map<String, String> map = new HashMap<String, String>();
////        map.put("text", json);
////        String ret1 = getHttpPostReturn(url, map);
////        System.out.println(ret1);
////
//
//
//    }
//
//    public static String getLocaTimeStamp() {
//        String currentTimeStamp = ((Long)(System.currentTimeMillis()/1000)).toString();
//        return currentTimeStamp;
//    }
//
//
//
//    public static String generateSecretKeyByClientid(String clientid){
//        return md5("FOSUN;"+clientid)+md5("webapi");
//    }
//
//    public static String generateSign(String ms,String clientid,String secretkey){
//
//        return md5(ms+clientid+secretkey);
//    }
//
//    private final static String md5(String s) {
//        char hexDigits[]={'0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'};
//        try {
//            byte[] btInput = s.getBytes();
//            // 获得MD5摘要算法的 MessageDigest 对象
//            MessageDigest mdInst = MessageDigest.getInstance("MD5");
//            // 使用指定的字节更新摘要
//            mdInst.update(btInput);
//            // 获得密文
//            byte[] md = mdInst.digest();
//            // 把密文转换成十六进制的字符串形式
//            int j = md.length;
//            char str[] = new char[j * 2];
//            int k = 0;
//            for (int i = 0; i < j; i++) {
//                byte byte0 = md[i];
//                str[k++] = hexDigits[byte0 >>> 4 & 0xf];
//                str[k++] = hexDigits[byte0 & 0xf];
//            }
//            return new String(str);
//        } catch (Exception e) {
//            e.printStackTrace();
//            return null;
//        }
//    }
//
//    private static String getHttpPostReturn(String url,Map param) throws Exception {
//        String ret = null;
//        SSLContext sslContext = SSLContexts.createSystemDefault();
//        SSLConnectionSocketFactory sslsf = new SSLConnectionSocketFactory(
//                sslContext, NoopHostnameVerifier.INSTANCE);
//        CloseableHttpClient httpclient = HttpClients.custom()
//                .setSSLSocketFactory(sslsf).build();
//
//        HttpPost httppost = new HttpPost(url);
//
//
//        List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>();
//        Iterator<String> it = param.keySet().iterator();
//        while (it.hasNext()) {
//            String key = it.next();
//            nameValuePairs.add(new BasicNameValuePair(key, (String) param
//                    .get(key)));
//        }
//        httppost.setEntity(new UrlEncodedFormEntity(nameValuePairs, "UTF-8"));
//
//        CloseableHttpResponse response = httpclient.execute(httppost);
//        try {
//            HttpEntity entity = response.getEntity();
//            if (entity != null) {
//                ret = EntityUtils.toString(entity, "UTF-8");
//            }
//        } finally {
//            response.close();
//        }
//        return ret;
//    }
//}
//
