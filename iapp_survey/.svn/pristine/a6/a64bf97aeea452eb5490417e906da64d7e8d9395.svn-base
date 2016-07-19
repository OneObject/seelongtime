package com.longtime.app.base.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import com.longtime.common.model.BaseModel;


@Entity
@Table(name = "base_tag")
public class TagEntity  extends BaseModel<String> {
	
	private static final long serialVersionUID = 3607489454414847173L;

	@Id
	@GeneratedValue(generator = "system-uuid")
	@GenericGenerator(name = "system-uuid", strategy = "uuid")
	@Column(length = 40)
	private String id;
	
	private String name;
	
	@Column(name="dateCreated",columnDefinition="bigint default 0")
	private Long dateCreated;
	
	private String userCreated;
	
	@Column(name="dateLastModified",columnDefinition="bigint default 0")
	private Long dateLastModified;
	
	private String userLastModified;
	
	private String domain;
	
	@Column(name="isopen",columnDefinition="int default 0")
	private Integer isopen;
	
	private Integer idx;
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public String getDomain() {
		return domain;
	}

	public void setDomain(String domain) {
		this.domain = domain;
	}

	public Integer getIsopen() {
		return isopen;
	}

	public void setIsopen(Integer isopen) {
		this.isopen = isopen;
	}

	public Integer getIdx() {
		return idx;
	}

	public void setIdx(Integer idx) {
		this.idx = idx;
	}

	
	
	

}
