
package com.longtime.ajy.model;

import org.apache.commons.lang.StringUtils;
import org.jongo.marshall.jackson.oid.Id;




/**
 * @since 2013-9-27
 * @author yangwk
 * 
 */
public class TestTemporary {

	private String _id;
	
	private String tid; //考试id
	
	private String uid; //用户id
	
	private int num; //试卷编号
	
	@Id
	private String no; //为用户每次参加考试分配的唯一标示
	
	private long time; //答题已用时间
	
	


	public String get_id() {
		if(StringUtils.isBlank(_id)){
			return no;
		}
		return _id;
	}

	public void set_id(String _id) {
		this._id = _id;
	}

	public String getTid() {
		return tid;
	}

	public void setTid(String tid) {
		this.tid = tid;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public long getTime() {
		return time;
	}

	public void setTime(long time) {
		this.time = time;
	}


}
