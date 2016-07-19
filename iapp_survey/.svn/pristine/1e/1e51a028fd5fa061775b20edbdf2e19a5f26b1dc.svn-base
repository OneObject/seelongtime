package com.longtime.app.base.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import com.longtime.common.model.BaseModel;

@Entity
@Table(name = "acl_resource")
public class AclResource extends BaseModel<Long>  {
	private static final long serialVersionUID = 2909270629762656504L;

	@Id
	@GenericGenerator(name = "idGenerator", strategy = "assigned")
	@GeneratedValue(generator = "idGenerator")
	private Long id;
	
	private String name;
	
	@Column(name="urls",length=2000)
	private String urls;
	
	@Column(name="type",columnDefinition ="int default 0")
	private Integer type; //0 菜单  1：按钮       10:不在管理端资源树中显示
	
	@Column(name="isopen",columnDefinition ="int default 1")
	private Integer isopen; // 1 公开   0 私有
	
	@Column(name="weight",columnDefinition ="int default 0")
	private Integer weight;
	
	private Long pid;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}


	public String getUrls() {
		return urls;
	}

	public void setUrls(String urls) {
		this.urls = urls;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public Integer getIsopen() {
		return isopen;
	}

	public void setIsopen(Integer isopen) {
		this.isopen = isopen;
	}

	public Integer getWeight() {
		return weight;
	}

	public void setWeight(Integer weight) {
		this.weight = weight;
	}

	public Long getPid() {
		return pid;
	}

	public void setPid(Long pid) {
		this.pid = pid;
	}
	
	
}
