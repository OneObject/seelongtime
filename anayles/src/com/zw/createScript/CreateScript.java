package com.zw.createScript;

import java.util.Map;
import java.util.TreeMap;

import com.zw.bean.Config;
import com.zw.util.*;

/**
 * 创建数据库脚本语言
 * @author liming
 */
public class CreateScript {

	/**
	 * 创建数据库脚本文件mongoDB.txt, mysql.txt
	 * @throws Exception
	 */
	public void createFile() throws Exception {
		Integer i = 1;
		String str = null;
		
		while(true) {
			str = url(i.toString());
			String json = APIServiceFunction.HttpRetrieve(Config.api_videos + "?" + str);		//获取到当前页的json数据
			if(json.contains("\"id\"")) {		//存在video时，取出数据
				AnalyticVideo.analyJSONObject(json);		//解析json文件
				AnalyticVideo.createFile("D:/test1", "mongoDB.json", "mysql.sql");		//创建文件,文件存储位置，mongoDB语句存放的文件，mysql语句存放的文件
			} else {
				break;
			}
			i++;
		}
	}
	
	/**
	 * 动态生成url
	 * @return
	 */
	public String url(String page) {
		Map<String, String> params = new TreeMap<>();
		params.put("userid", "014839512B269C8D");
		params.put("num_per_page", "100");
		params.put("page", page);
		params.put("format", "json");
		String str = APIServiceFunction.createHashedQueryString(params, System.currentTimeMillis(), "qKRAR9YWvvNkdkJUOOPriu4zWtRMyDXQ");
		return str;
	}
	
	public static void createMogoDBFile(String filePath, String path) throws Exception {
		AnalyticVideo.analyJSON(filePath);
		AnalyticVideo.createMongoDBTXT(path, "mongoDB.txt");
	}
	
	public static void main(String[] args) {
//		CreateScript cs = new CreateScript();
//		try {
//			cs.createFile();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
		try {
			CreateScript.createMogoDBFile("D:/test2", "D:/test");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
