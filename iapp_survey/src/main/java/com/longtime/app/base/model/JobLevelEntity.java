package com.longtime.app.base.model;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import com.longtime.common.model.BaseModel;

@Entity
@Table(name = "iapp_base_joblevel")
public class JobLevelEntity extends BaseModel<String> {

	private static final long serialVersionUID = -859640571298574886L;

	@Transient
	public boolean isLeaf() {
		return rightWeight - leftWeight == 1;
	}

	@Transient
	public boolean isSystemType() {
		return this.getIsSystemType() == IS_SYSTEM_YES;
	}

	/** 不是系统初始化数据 */
	public static int IS_SYSTEM_NO = 0;

	/** 是系统初始化数据 */
	public static int IS_SYSTEM_YES = 1;

	/**
	 * 主键
	 */
	@Id
	@Column(length = 40)
	private String id;

	@Column(name = "parent_id")
	private String parentId; // 位置

	@Column(name = "depth")
	private int depth; // 位置

	@Column(name = "isLeaf")
	private boolean isLeaf; //是否是叶节点

	@Column(name = "name")
	private String name; // 职级名称 

	@Column(name = "left_weight")
	private Integer leftWeight = 0;//左权重

	@Column(name = "right_weight")
	private Integer rightWeight = 0;//右权重

	@Column(name = "domain")
	private String domain;

	@Column(name = "isdel")
	private int isdel = 0; //删除标记：0.未删除；1.已删除

	@Column(name = "system_type")
	private int isSystemType;//系统类型初始化数据为1 不能删除

	@Column(name = "remark", length = 1000)
	private String remark; // 备注

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "parentId")
	@Cache(region = "entity.cache", usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
	private Set<JobLevelEntity> children;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	public int getDepth() {
		return depth;
	}

	public void setDepth(int depth) {
		this.depth = depth;
	}

	public boolean getIsLeaf() {
		return rightWeight - leftWeight == 1;
	}

	public void setLeaf(boolean isLeaf) {
		this.isLeaf = isLeaf;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getLeftWeight() {
		return leftWeight;
	}

	public void setLeftWeight(Integer leftWeight) {
		this.leftWeight = leftWeight;
	}

	public Integer getRightWeight() {
		return rightWeight;
	}

	public void setRightWeight(Integer rightWeight) {
		this.rightWeight = rightWeight;
	}

	public String getDomain() {
		return domain;
	}

	public void setDomain(String domain) {
		this.domain = domain;
	}

	public int getIsdel() {
		return isdel;
	}

	public void setIsdel(int isdel) {
		this.isdel = isdel;
	}

	public Set<JobLevelEntity> getChildren() {
		return children;
	}

	public void setChildren(Set<JobLevelEntity> children) {
		this.children = children;
	}

	public int getIsSystemType() {
		return isSystemType;
	}

	public void setIsSystemType(int isSystemType) {
		this.isSystemType = isSystemType;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

}
