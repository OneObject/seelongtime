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

import com.longtime.app.oplog.model.OpLog;
import com.longtime.common.model.BaseModel;


@Entity
@Table(name = "iapp_base_organization")
public class Organization  extends BaseModel<String> {
	
	private static final long serialVersionUID = 1366686264865935922L;
	
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
	
    public boolean getIsLeaf() {
        return rightWeight - leftWeight == 1;
    }

	//public static String root_id = "4028809242116c290142116d318d0000";
	/**
	 * 主键
	 */
	@Id
	@Column(length = 40)
	private String id;
	
	/*@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "parent_id")
	@OnDelete(action = OnDeleteAction.CASCADE)
	private Organization parentId; //组织父id
*/	
	
	private int cpid;//企业号内组织ID
	
	@Column(name="parent_id")
	private String parentId;      // 位置
	
	@Column(name="depth")
	private int depth;      // 位置

	@Column(name="isLeaf")
	private boolean isLeaf;  //是否是叶节点
	
	@Column(name="name")
	private String name;    // 组织名称 
	
	@Column(name="org_from")
	private String orgFrom = "0";		//公司（域）或部门： 0部门 1公司
	
	@Column(name="left_weight")
	private Integer leftWeight = 0 ;
	
	@Column(name="right_weight")
	private Integer rightWeight = 0;
	
	@Column(name="remark",length = 1000)
	private String remark;  // 备注
	
	@Column(name="linkman")
	private String linkman ;//联系人
	
	@Column(name="domainCode")
	private String domainCode ;//组织代码
	
	@Column(name="domain")
	private String domain;
	
	
	@Column(name="acronym")
	private String acronym;//简称
	
	@Column(name="address1")
	private String address1 ;//地址1
	
	@Column(name="address2")
	private String address2 ;//地址2
	
	@Column(name="country")
	private String country ;//国家
	
	@Column(name="city")
	private String city ;//城市
	
	@Column(name="province")
	private String province ;//省份
	
	@Column(name="post")
	private String post  ;//邮政编码
	
	@Column(name="phone1")
	private String phone1 ;//联系电话1
	
	@Column(name="phone2")
	private String phone2 ;//联系电话2
	
	@Column(name="faxes")
	private String faxes ;//传真
	
	@Column(name="system_type")
	private int isSystemType ;//系统类型初始化数据为1 不能删除
	
	@Column(name="isdel")
	private int isdel=0;    //删除标记：0.未删除；1.已删除
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "parentId")
	@Cache(region = "entity.cache", usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
	private Set<Organization> children;
	
	//0:未同步  1:已同步 -1:wx内不存在数据
    @Column(name="synchronousstatus",columnDefinition ="int default 0")
    private int synchronousstatus;
    
    //同步操作类型
    @Column(name="synctype",columnDefinition ="int default 0")
    private int synctype = OpLog.ACTION_ADD;
    
    @Column(name="orders",columnDefinition="int default 0")
	private int orders;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	/*public Organization getParentId() {
		return parentId;
	}

	public void setParentId(Organization parentId) {
		this.parentId = parentId;
	}*/
	
	

	public int getCpid() {
		return cpid;
	}

	public void setCpid(int cpid) {
		this.cpid = cpid;
	}

	public int getDepth() {
		return depth;
	}

	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	public void setDepth(int depth) {
		this.depth = depth;
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

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getLinkman() {
		return linkman;
	}

	public void setLinkman(String linkman) {
		this.linkman = linkman;
	}

	public String getDomainCode() {
		return domainCode;
	}

	public void setDomainCode(String domainCode) {
		this.domainCode = domainCode;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getPost() {
		return post;
	}

	public void setPost(String post) {
		this.post = post;
	}

	public String getPhone1() {
		return phone1;
	}

	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}

	public String getPhone2() {
		return phone2;
	}

	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}

	public String getFaxes() {
		return faxes;
	}

	public void setFaxes(String faxes) {
		this.faxes = faxes;
	}

	public int getIsSystemType() {
		return isSystemType;
	}

	public void setIsSystemType(int isSystemType) {
		this.isSystemType = isSystemType;
	}

	public int getIsdel() {
		return isdel;
	}

	public void setIsdel(int isdel) {
		this.isdel = isdel;
	}

	public String getDomain() {
		return domain;
	}

	public void setDomain(String domain) {
		this.domain = domain;
	}

	public Set<Organization> getChildren() {
		return children;
	}

	public void setChildren(Set<Organization> children) {
		this.children = children;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getOrgFrom() {
		return orgFrom;
	}

	public void setOrgFrom(String orgFrom) {
		this.orgFrom = orgFrom;
	}

	public void setLeaf(boolean isLeaf) {
		this.isLeaf = isLeaf;
	}

	public int getSynchronousstatus() {
		return synchronousstatus;
	}

	public void setSynchronousstatus(int synchronousstatus) {
		this.synchronousstatus = synchronousstatus;
	}

	public int getSynctype() {
		return synctype;
	}

	public void setSynctype(int synctype) {
		this.synctype = synctype;
	}

	public int getOrders() {
		return orders;
	}

	public void setOrders(int orders) {
		this.orders = orders;
	}


}
