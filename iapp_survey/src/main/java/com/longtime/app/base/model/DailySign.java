package com.longtime.app.base.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import com.longtime.common.model.BaseModel;



@Entity
@Table(name="sns_daily_sign")
public class DailySign extends BaseModel<Long>{

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = -1120678866591522156L;

	@Id
	@GenericGenerator(name = "idGenerator", strategy = "identity")
	@GeneratedValue(generator = "idGenerator")
	private Long id;

	private String uid; //用户ID
	
	private String uname; // 用户姓名
	
	private String domain; //域
	
	private long timestamp; //签到时间
	 
	private String context; //签到内容
	
	private int credit;  //奖励积分
	
	private int device;; //签到来源 1 pc  2 mobile
	
	public static int DEVICE_MOBILE = 2;
	
	public static int DEVICE_PC = 1;
	


	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getDomain() {
		return domain;
	}

	public void setDomain(String domain) {
		this.domain = domain;
	}

	public long getTimestamp() {
		return timestamp;
	}

	public void setTimestamp(long timestamp) {
		this.timestamp = timestamp;
	}

	public String getContext() {
		return context;
	}

	public void setContext(String context) {
		this.context = context;
	}

	public int getCredit() {
		return credit;
	}

	public void setCredit(int credit) {
		this.credit = credit;
	}

	public int getDevice() {
		return device;
	}

	public void setDevice(int device) {
		this.device = device;
	}
}
