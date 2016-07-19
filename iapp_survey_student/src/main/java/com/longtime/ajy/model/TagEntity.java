/**
 * project : iask
 * user created : yangwk
 * date created : 2013-7-12 - 下午1:40:02
 */
package com.longtime.ajy.model;

import com.longtime.common.model.Entity;

/**
 * @since 2013-7-12
 * @author yangwk
 * 
 */
public class TagEntity implements Entity<String> {
	
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String id;
    
	private String name; //标签
	
	private Long dateCreated;

	private String userCreated;

	private Long dateLastModified;

	private String userLastModified;
	
	private String domain;
	
	private String isopen;
	
	private Integer idx =0; //排序 从小到大

	private Integer questionchoose=1;// 是否可以用于提问是选择 1：可选 0:不可选择

	public String getDomain() {
		return domain;
	}

	public void setDomain(String domain) {
		this.domain = domain;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Long getDateCreated() {
		return dateCreated;
	}

	public void setDateCreated(Long dateCreated) {
		this.dateCreated = dateCreated;
	}

	public String getUserCreated() {
		return userCreated;
	}

	public void setUserCreated(String userCreated) {
		this.userCreated = userCreated;
	}

	public Long getDateLastModified() {
		return dateLastModified;
	}

	public void setDateLastModified(Long dateLastModified) {
		this.dateLastModified = dateLastModified;
	}

	public String getUserLastModified() {
		return userLastModified;
	}

	public void setUserLastModified(String userLastModified) {
		this.userLastModified = userLastModified;
	}

	public String getIsopen() {
		return isopen;
	}

	public void setIsopen(String isopen) {
		this.isopen = isopen;
	}


    public Integer getIdx() {
        return idx;
    }


    public void setIdx(Integer idx) {
        this.idx = idx;
    }

	public Integer getQuestionchoose() {
		return questionchoose;
	}

	public void setQuestionchoose(Integer questionchoose) {
		this.questionchoose = questionchoose;
	}
}
