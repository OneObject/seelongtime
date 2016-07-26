package com.zw.createScript;

import java.sql.*;
import java.util.*;

/**
 * 更新数据
 * 1.更新课程包中的总时间 hand_coursepackage 表中的totalTime
 * 2.更新一个课程中包含的章节数 study_course 表中的chapterCount
 * 3.更新一个课程包中包含的课程数 hand_coursepackage 表中的courseCount
 * @author liming
 *
 */
public class DataUpdate {
	
	public void updateTable(String sql) throws Exception {
		String url = "jdbc:mysql://192.168.0.105:3306/iapp_hand";
		String user = "root";
		String password = "root";
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url, user, password);
		
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		Map<String, String> map = new HashMap<>();		// key: id   value: sum
		while(rs.next()) {
			map.put(rs.getString(1), rs.getString(2));
		}
		rs.close();
		pstmt.close();
		con.close();
	}
	
	
	

	/**
	 * 生成更新 hand_coursepackage表的语句
	 * @param totalTime		总时间
	 * @param courseCount	课程数
	 * @param id	课程包的id
	 * @return
	 */
	public String updateHand_coursepackage(String totalTime, String courseCount, String id) {
		StringBuffer sb = new StringBuffer();
		sb.append("update hand_coursepackage set totalTime = ");
		sb.append(totalTime);
		sb.append(", coursecount = ");
		sb.append(courseCount);
		sb.append(" where id = '");
		sb.append(id);
		sb.append("'; ");
		return sb.toString();
	}
	
	/**
	 * 生成更新 study_course 表的语句
	 * @param chapterCount 章节数
	 * @param id 课程的id
	 * @return
	 */
	public String updateStudy_course(String chapterCount, String id) {
		StringBuffer sb = new StringBuffer();
		sb.append("update study_course set chapterCount = ");
		sb.append(chapterCount);
		sb.append(" where id = '");
		sb.append(id);
		sb.append("'; ");
		return sb.toString();
	}
	
	public static void main(String[] args) {
		DataUpdate dateUpdate = new DataUpdate();
		try {
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
