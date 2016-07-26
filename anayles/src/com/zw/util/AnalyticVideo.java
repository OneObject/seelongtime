package com.zw.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import com.zw.bean.Video;

import net.sf.json.JSONObject;

/**
 * 用于解析数据格式的程序
 * @author gzw
 */
public class AnalyticVideo {
	
	public static List<Video> videos = new ArrayList<>();		//用来存储解析出的数据的
	
	/**
	 * 根据文件名自动分类文件
	 * 创建mysql的文件夹，及其下的文件，文件名不同
	 * 创建mongoDB的文件夹，及其下的文件，文件名不同
	 */
	public static void createFile(String mysqlPath, String mongoDBPath) {
		
		for(int i = 0; i < videos.size(); i++) {
			Video video = videos.get(i);
			
			String name = video.getVideoName();
			String fName = null;
			
			if(name.indexOf("jj_") != -1) {		//"jj_bom_基本设置_3替代项（修改）"
				fName = name.substring(0, name.indexOf("_", 3));
			} else if(name.indexOf("jj-") != -1) {		// "jj-mpr-17MRP-MPS-下达和调整, jj-mpr-18MRP-MRP定义"
				fName = name.substring(0, name.indexOf("-", 3));
			} else if(name.indexOf("_") != -1) {		// "PO_13重要概念-采购接收和退货,  PO_14基本业务流程-供应商维护,  jjec_XXXX-XXXX"
				fName = name.substring(0, name.indexOf("_"));
			} else {
				fName = name;
			}
			
			fName = fName + ".txt";
			
			try {
				createMongoDBtxt(mysqlPath, fName, video);		//创建mongoDB文件
				createMySQLtxt(mongoDBPath, fName, video);		//创建mySQL文件
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
	}
	
	/**
	 * 解析json格式的字符串
	 * @return 视频列表
	 */
	@SuppressWarnings("unchecked")
	public static List<Video> analyJSONObject(String json) {
		
		JSONObject jsonObj = JSONObject.fromObject(json);
		jsonObj = (JSONObject)(jsonObj.get("videos"));
		List<JSONObject> list = jsonObj.getJSONArray("video");
		
		for(int i = 0; i < list.size(); i++) {
			Video video = new Video();
			video.setId((String)list.get(i).get("id"));
			video.setPlayTime((Integer)list.get(i).get("duration"));
			video.setVideoName((String)list.get(i).get("title"));
			videos.add(video);
		}
		
		return videos;
	}
	
	/**
	 * 解析文件并创建mySQL.txt和mongoDB.txt文件
	 */
	public static void createFile(String path, String mongoFileName, String sqlFileName) throws Exception {
		createMySQLTXT(path, sqlFileName);
		createMongoDBTXT(path, mongoFileName);
		videos = new ArrayList<>();
	}
	
	/**
	 * ����MySQL��ݿ�ű��ļ� mysql.txt
	 * @param path
	 * @param fileName
	 * @throws Exception
	 */
	public static void createMySQLtxt(String path, String fileName, Video video) throws Exception {
		File filePath = new File(path);
		File file = new File(path + "/" + fileName);
		
		if(!filePath.exists()) {
			filePath.mkdirs();
		} else {
			if(!file.exists()) {
				file.createNewFile();
			}
		}
		
		//设置为 true 不会覆盖原来的内容，设置为 false 会覆盖掉原来的内容
		FileWriter output = new FileWriter(file, true);
		PrintWriter out = new PrintWriter(output);
		
		/**
		for(int i = 0; i < videos.size(); i++) {
			Video video = videos.get(i);
			
			
			
			String str = mySQL(video.getId(), video.getPlayTime());
			
			out.println(str);
			out.flush();
			
		}
		*/
		
		String str = mySQL(video.getId(), video.getPlayTime());
		out.println(str);
		out.flush();
		out.close();
		output.close();
	}
	
	/**
	 * ����mySQL��ݿ�ű����ļ����ַ�
	 * @param id ��Ƶid
	 * @param time ��Ƶ����ʱ��
	 * @return
	 */
	public static String mySQL(String id, long time) {
		StringBuffer sb = new StringBuffer();
		sb.append(" update course_chapter  set time = ");
		sb.append(time);	//增加time
		sb.append(", type = 1 where rid = '");
		sb.append(id);		//增加id
		sb.append("'; ");
		
		return sb.toString();
	}
	
	/**
	 * mongodb.txt文件的创建
	 */
	public static void createMongoDBtxt(String path, String fileName, Video video) throws Exception {
		File filePath = new File(path);
		File file = new File(path + "/" + fileName);
		
		if(!filePath.exists()) {
			filePath.mkdirs();
		} else {
			if(!file.exists()) {
				file.createNewFile();
			}
		}
		
		/*
		 * 为true时写入数据不会覆盖原来的内容
		 * FileWriter(file, true)
		 * 为false会覆盖掉原来的内容
		 */
		FileWriter output = new FileWriter(file, true);
		PrintWriter out = new PrintWriter(output);
		
//		FileOutputStream output = new FileOutputStream(file);	//获取文件输出流
//		PrintStream out = new PrintStream(output);	//获取输出流
		
		/**
		for(int i = 0; i < videos.size(); i++) {
			Video video = videos.get(i);
			
			String name = video.getVideoName();
			String fName = name.substring(0, name.indexOf("_"));		//创建的文件的文件名
			
			String str = mongoDB(video.getVideoName(), video.getId(), video.getPlayTime());
			
			out.println(str);
			out.flush();
			
		}
		*/
		
		String str = mongoDB(video.getVideoName(), video.getId(), video.getPlayTime());	//写单个语句
		out.println(str);
		out.flush();
		
		out.close();
		output.close();
		
	}
	
	public static String mongoDB(String name, String id, long time) {
		StringBuffer sb = new StringBuffer();
		/**
		sb.append("{ ");
		sb.append(" '_class' : 'com.longtime.app.ivideo.model.Video', '_id' : '");
		sb.append(id);		//增加id
		sb.append("', 'coverPoint' : NumberLong(1), 'desp' : '");
		sb.append(name);	//增加视频名
		sb.append("', 'displayName' : '");
		sb.append(name);	//增加视频名
		sb.append("', 'domain' : 'ink', 'duration' : NumberLong(");
		sb.append(time);
		sb.append("), 'entityMetaInfo' : { 'dateCreated' : NumberLong('1468213189548') }, 'ftime' : NumberLong(0), 'is_delete' : false, 'isrelease' : 0, 'name' : '");
		sb.append(name);	//增加视频名
		sb.append("', 'recommendrank' : 0, 'source' : 'CC', 'status' : 10, 'videoid' : '");
		sb.append(id);		//增加id
		sb.append("' }");
		*/
		
		sb.append("db.video.insert({ ");
		sb.append(" \"_class\" : \"com.longtime.app.ivideo.model.Video\", \"_id\" : \"");
		sb.append(id);		//增加id
		sb.append("\", \"coverPoint\" : NumberLong(1), \"desp\" : \"");
		sb.append(name);	//增加视频名
		sb.append("\", \"displayName\" : \"");
		sb.append(name);	//增加视频名
		sb.append("\", \"domain\" : \"ink\", \"duration\" : NumberLong(");
		sb.append(time);
		sb.append("), \"entityMetaInfo\" : { \"dateCreated\" : NumberLong(\"" + System.currentTimeMillis() + "\") }, \"ftime\" : NumberLong(0), \"is_delete\" : false, \"isrelease\" : 1, \"name\" : \"");
		sb.append(name);	//增加视频名
		sb.append("\", \"recommendrank\" : 0, \"source\" : \"CC\", \"status\" : 10, \"videoid\" : \"");
		sb.append(id);		//增加id
		sb.append("\" });");
		
		
		return sb.toString();
	}

	/**
	 * �����ı�
	 * @param path �ļ�·��
	 * @param fileName �ļ���
	 * @throws Exception �쳣
	 */
	public static void analyFiles(String path) throws Exception {
		File file=new File(path);
		File[] tempList = file.listFiles();		//读取该文件夹下的所有文件
		for (int i = 0; i < tempList.length; i++) {
			if (tempList[i].isFile()) {
				FileInputStream fileIn = new FileInputStream(tempList[i]);
				InputStreamReader in = new InputStreamReader(fileIn);
				BufferedReader bufferedReader = new BufferedReader(in);
				
				String str = null;
				Video video = new Video();
				while((str = bufferedReader.readLine()) != null) {
					
					if("".equals(str.trim())) {
						videos.add(video);
						video = new Video();
					} else if(str.contains("时长")) {
						String time = str.substring(3, 11).trim();
						
						long playTime = 0l;
						String[] times = time.split(":");
						playTime = Long.parseLong(times[0]) * 3600 + Long.parseLong(times[1]) * 60 + Long.parseLong(times[2]);
						
						video.setPlayTime(playTime);
					} else if(str.contains("ID")) {
						String id = str.substring(3).trim();
						video.setId(id);
					} else {
						video.setVideoName(str.trim());
					}
					
				}
				
				bufferedReader.close();
				in.close();
				fileIn.close();
			}
		}
	}
	
	/**
	 * ����JSON���
	 * @param path �ļ���·��
	 * @throws Exception �׳��쳣
	 */
	public static void analyJSON(String path) throws Exception {
		File file = new File(path);
		File[] tempList = file.listFiles();		//��ȡ���ļ����µ������ļ�
		for(int i = 0; i < tempList.length; i++) {
			if(tempList[i].isFile()) {
				
				//创建输入流，设置编码方式 UTF-8
				FileInputStream fileIn = new FileInputStream(tempList[i]);
				InputStreamReader in = new InputStreamReader(fileIn, "UTF-8");
				BufferedReader bufferedReader = new BufferedReader(in);
				String str = null;
				Video video = new Video();
				int flag = 0;		//给定标记
				
				while((str = bufferedReader.readLine()) != null) {
					
					if(flag == 3) {	//判断一个对象是否封装完成
						flag = 0;
						videos.add(video);
						video = new Video();
					} else if(str.contains("\"id\"")) {	//����id
						video.setId(str.substring(str.indexOf("\"id\"") + 6, str.length() - 2));
						flag++;
					} else if(str.contains("\"title\"")) {	//������Ƶ��
						video.setVideoName(str.substring(str.indexOf("\"title\"") + 9, str.length() - 2).replace("格式工厂", ""));
						flag++;
					} else if(str.contains("\"duration\"")) {	//���ùۿ�ʱ��
						long time = Long.parseLong(str.substring(str.indexOf("\"duration\"") + "duration".length() + 3, str.length() - 1));
						video.setPlayTime(time);
						flag++;
					}
				}
				
				bufferedReader.close();
				in.close();
				fileIn.close();
			}
		}
	}
	
	
	/**
	 * 创建单个的数据库文件 mysql.txt
	 */
	public static void createMySQLTXT(String path, String fileName) throws Exception {
		File filePath = new File(path);
		File file = new File(path + "/" + fileName);
		
		if(!filePath.exists()) {
			filePath.mkdirs();
		} else {
			if(!file.exists()) {
				file.createNewFile();
			}
		}
		
		//设置为 true 不会覆盖原来的内容，设置为 false 会覆盖掉原来的内容
		FileWriter output = new FileWriter(file, true);
		PrintWriter out = new PrintWriter(output);
		
		for(int i = 0; i < videos.size(); i++) {
			Video video = videos.get(i);
			
			String str = mySQL(video.getId(), video.getPlayTime());
			
			out.println(str);
			out.flush();
			
		}
		
		out.close();
		output.close();
	}
	
	/**
	 * 创建单个的数据脚本文件 mongoDB.txt
	 */
	public static void createMongoDBTXT(String path, String fileName) throws Exception {
		File filePath = new File(path);
		File file = new File(path + "/" + fileName);
		
		if(!filePath.exists()) {
			filePath.mkdirs();
		} else {
			if(!file.exists()) {
				file.createNewFile();
			}
		}
		
		/*
		 * 为true时写入数据不会覆盖原来的内容
		 * FileWriter(file, true)
		 * 为false会覆盖掉原来的内容
		 */
		FileWriter output = new FileWriter(file, true);
		PrintWriter out = new PrintWriter(output);
		
//		FileOutputStream output = new FileOutputStream(file);	//获取文件输出流
//		PrintStream out = new PrintStream(output);	//获取输出流
		
		for(int i = 0; i < videos.size(); i++) {
			Video video = videos.get(i);
			
			String str = mongoDB(video.getVideoName(), video.getId(), video.getPlayTime());
			
			out.println(str);
			out.flush();
			
		}
		
		
		out.close();
		output.close();
	}
	
	
	
	public static void main(String[] args) {
		try {
//			AnalyticVideo.analyFiles("F:/Users/liming/Desktop/�½��ļ���");
			
//			createFile("D:/test2", "D:/test1", "mongoDB.txt", "sql.txt");
			
			
//			for(Video video : videos) {
//			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
