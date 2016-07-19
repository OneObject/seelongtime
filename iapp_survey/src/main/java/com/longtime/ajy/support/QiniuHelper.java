package com.longtime.ajy.support;

import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.net.URLEncoder;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;
import org.slf4j.Logger;

import com.longtime.app.base.util.Constant;
import com.longtime.common.dao.IdGenerator;
import com.qiniu.api.auth.digest.Mac;
import com.qiniu.api.io.PutRet;
import com.qiniu.api.net.Client;
import com.qiniu.api.net.EncodeUtils;
import com.qiniu.api.rs.PutPolicy;
import com.qiniu.common.QiniuException;
import com.qiniu.http.Response;
import com.qiniu.storage.UploadManager;
import com.qiniu.util.Auth;

public class QiniuHelper {

	private static Logger logger = org.slf4j.LoggerFactory.getLogger(QiniuHelper.class);

	public static String getUpToken() {
		Mac mac = getMac();
		// 请确保该bucket已经存在
		PutPolicy putPolicy = new PutPolicy(Config.BUCKET);
		putPolicy.returnBody = Config.UPLOAD_RETURNBODY;
		String token = null;
		try {
			token = putPolicy.token(mac);
		} catch (Exception e) {
			logger.error("create qiniu uploadtoken due to fail", e);
		}
		return token;
	}

	/**
	 * 截图
	 * 
	 * @param original
	 *            原图key
	 * @param target
	 *            生成图片key
	 * @param width
	 *            生成图片的宽
	 * @param height
	 *            生成图片的高
	 * @param dx
	 *            原图x轴位移
	 * @param dy
	 *            原图y轴位移
	 * @return
	 */
	public static String crop(String original, String target, int width, int height, int dx, int dy) {
		if (StringUtils.isBlank(target)) {
			target = IdGenerator.uuid32();
		}
		logger.debug("crop img.original=[{}] w=[{}] h=[{}] dx=[{}] dy=[{}] ", original, width, height, dx, dy);
		logger.debug("crop img.url= http://{}.qiniudn.com/{}?imageMogr2/crop/!{}x{}a{}a{} ", Config.BUCKET, original,
				width, height, dx, dy);

		String entryURI = String.format("%s:%s", Config.BUCKET, target);
		String encodedEntryURI = EncodeUtils.urlsafeEncode(entryURI);

		String rootURL = String.format("%s.qiniudn.com/%s", Config.BUCKET, original);// "imweb.qiniudn.com/FgIiC463m54CoaEXOp30gxPXJR60?

		String queryString = String.format("imageMogr2/crop/!%sx%sa%sa%s|saveas/%s", width, height, dx, dy,
				encodedEntryURI);// "imweb.qiniudn.com/FgIiC463m54CoaEXOp30gxPXJR60?imageMogr2/crop/!200x200a100a100|saveas/"+encodedEntryURI;

		try {
			String signingStr = String.format("%s?%s", rootURL, URLEncoder.encode(queryString, "UTF-8"));
			String sign = getMac().sign(signingStr.getBytes());
			String url = String.format("http://%s/sign/%s", signingStr, sign);
			logger.debug("request qiniu crop img url=[{}]", url);
			PutRet pr = new PutRet(client.call(url));
			logger.debug("response qiniu crop.resp=[{}]", pr);
			if (pr.ok()) {
				return pr.getKey();
			}
		} catch (Exception e) {
			logger.error(String.format("qiniu crop img due to fail. original=[%s]", original), e);
		}
		return StringUtils.EMPTY;
	}

	private static Client client = new Client();

	public static String getImgRootPath() {
		return Config.IMG_SERVER;
	}

	private static Mac mac;

	public static Mac getMac() {
		if (null == mac) {
			mac = new Mac(Config.ACCESS_KEY, Config.SECRET_KEY);
		}
		return mac;
	}

	static class Config {

		static String ACCESS_KEY = Constant.QINIU_ACCESSKEY;
		static String SECRET_KEY = Constant.QINIU_SECRETKEY;
		static String BUCKET = Constant.QINIU_BUCKET;
		static String UPLOAD_RETURNBODY = Constant.QINIU_UPLOAD_RETURNBODY;

		static String IMG_SERVER = Constant.IMG_SERVER_DOWNLOAD;
		
		static String DOWNLOAD_TMP_DIR = Constant.DOWNLOAD_TMP_DIR;
	}

	/**
	 * 
	 * @param avatar
	 *            头像id
	 * @param width
	 *            生成图片的宽
	 * @param height
	 *            生成图片的高
	 * @param x
	 *            原图x轴位移
	 * @param y
	 *            原图y轴位移
	 * @return
	 */
	public static boolean crop(String avatar, int width, int height, int x, int y) {
		String url = String.format("%s?action=%s&imageid=%s&w=%s&h=%s&x1=%s&y1=%s", Constant.IMG_SERVER_UPLOAD, "crop",
				avatar, width, height, x, y);
		if (logger.isDebugEnabled()) {
			logger.debug("request url : " + url);
		}
		HttpClient client = new DefaultHttpClient();
		HttpGet get = new HttpGet(url);
		try {
			HttpResponse res = client.execute(get);
			HttpEntity entity = res.getEntity();
			String responseContent = EntityUtils.toString(entity, "UTF-8");// 响应内容
			if (res.getStatusLine().getStatusCode() == HttpStatus.SC_OK) {
				// JsonParser jsonparer = new JsonParser();// 初始化解析json格式的对象
				// JsonObject json =  jsonparer.parse(responseContent).getAsJsonObject();
				// if (json.get("state") != null && json.get("state").equals("SUCCESS")) {
				// return true;
				// } else {
				// return false;
				// }
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 关闭连接 ,释放资源
			client.getConnectionManager().shutdown();
		}
		return false;
	}
	
	
	
	private static UploadManager uploadManager = new UploadManager();
	
	private static Auth auth = null;
	private static String getUpToken0(){
		if(null==auth){
			auth = Auth.create(Config.ACCESS_KEY, Config.SECRET_KEY);
		}
	    return auth.uploadToken(Config.BUCKET);
	}
	
	
	
	//上传文件数据 返回key
	public static String upload(String filepath){
			
		  String upToken = getUpToken0();
		  try {
		        Response res = uploadManager.put(filepath, null, upToken);
		        logger.debug("qiniu upload reponse=[{}]",res.toString());
		        if(res.isOK()){
		        	 Ret ret = res.jsonToObject(Ret.class);
		        	 return ret.key;
		        }else {
		            return StringUtils.EMPTY;
		        }
		    } catch (QiniuException e) {
		        Response r = e.response;
		        logger.error(r.toString(), e);
		        try {
		        	logger.error(r.bodyString(), e);
		        } catch (QiniuException e1) {
		        }
		    }
		  return StringUtils.EMPTY;
	}
	
	
	public static String uploadFormURL(String url){
		
		//下载
		String tmpdir = Config.DOWNLOAD_TMP_DIR;
		File tmpFile = null;
		try {
			
			tmpFile = downLoadFile(url,tmpdir);
			
			String filepath = tmpFile.getAbsolutePath();
			
			String key = upload(filepath);
			
			return key;
		} catch (IOException e) {
			logger.error(String.format("upload from ulr due to error. url=[%s]", url), e);
		}finally{
			if(null!=tmpFile){
				FileUtils.deleteQuietly(tmpFile);
			}
		}
		
		return null;
	}
	
	public class Ret {
	    public long fsize;
	    public String key;
	    public String hash;
	    public int width;
	    public int height;
	}
	

	// 下载网络文件到本地 
	private static File downLoadFile(String url,String dir) throws IOException {
		
		File dirFile = new File(dir);
		if(!dirFile.exists()){
			dirFile.mkdirs();
		}
		URL httpUrl = new URL(url);
		String filename = String.valueOf(System.currentTimeMillis()+".png");
		File f = new File(dir+filename);
		FileUtils.copyURLToFile(httpUrl, f);
		return f;
	}

}
