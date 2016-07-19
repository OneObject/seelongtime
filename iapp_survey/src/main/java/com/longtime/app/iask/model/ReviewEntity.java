/**
 * project : iapp
 * user created : yangwk
 * date created : 2013-10-10 - 下午5:33:52
 */
package com.longtime.app.iask.model;

import com.myctu.platform.repository.engine.domain.BaseEntity;

/**
 * @since 2013-10-10
 * @author yangwk
 * 
 */
public class ReviewEntity extends BaseEntity<String>{
	
	private static final long serialVersionUID = 4422952142058602286L;

	private String sid; //资源id
	
	private String uid; //用户id
	
	private String type; //用户态度
	
	
	public static String AGREE = "1"; //赞同
	
	public static String CANCEL_AGREE = "2"; //取消赞同
	
	public static String DISAGREE = "3"; //反对
	
	public static String CANCEL_DISAGREE = "4";//取消反对

	

	public String getSid() {
		return sid;
	}

	public void setSid(String sid) {
		this.sid = sid;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
}
