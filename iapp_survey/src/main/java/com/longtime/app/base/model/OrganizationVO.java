package com.longtime.app.base.model;


import java.io.Serializable;


public class OrganizationVO implements Serializable{
	
	private static final long serialVersionUID = 6625433758519027658L;

	public boolean isLeaf() {
		return rightWeight - leftWeight == 1;
	}
    
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

	private String id;
	
	private String parentId;      // 位置
	
	private int depth;      // 位置

	private boolean isLeaf;  //是否是叶节点
	
	private String name;    // 组织名称 
	
	private String orgFrom = "0";		//公司（域）或部门： 0部门 1公司
	
	private Integer leftWeight = 0 ;
	
	private Integer rightWeight = 0;
	
	private String remark;  // 备注
	
	private String linkman ;//联系人
	
	private String domainCode ;//组织代码
	
	private String domain;
	
	private String address1 ;//地址1
	
	private String address2 ;//地址2
	
	private String country ;//国家
	
	private String city ;//城市
	
	private String province ;//省份
	
	private String post  ;//邮政编码
	
	private String phone1 ;//联系电话1
	
	private String phone2 ;//联系电话2
	
	private String faxes ;//传真
	
	private int isSystemType ;//系统类型初始化数据为1 不能删除
	
	private int isdel=0;    //删除标记：0.未删除；1.已删除
	
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
	
	
}
