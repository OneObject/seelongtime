package com.longtime.app.base.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import com.longtime.common.model.BaseModel;

@Entity
@Table(name = "iapp_base_ext_resource")
public class ResourceEntity extends BaseModel<String>{

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 1L;

	@Id
    @GeneratedValue(generator = "system-uuid")
    @GenericGenerator(name = "system-uuid", strategy = "uuid")
    @Column(length = 36)
    private String id;

    private String domain;
    
    private String title;
    
    private String cover;
    
    private String remark;
    
    private int openstatus = 1;
    
    private int releasestatus;
    
    private int isdel;
    
    private Long createtime;
    
    private Long modifytime;
    
    private Long releasetime;
    
    private String resid;
    
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	

	public int getIsdel() {
		return isdel;
	}
	
	
	public String getResid() {
		return resid;
	}

	public void setResid(String resid) {
		this.resid = resid;
	}

	public void setIsdel(int isdel) {
		this.isdel = isdel;
	}
	
	public Long getModifytime() {
		return modifytime;
	}

	public void setModifytime(Long modifytime) {
		this.modifytime = modifytime;
	}

	public Long getReleasetime() {
		return releasetime;
	}

	public void setReleasetime(Long releasetime) {
		this.releasetime = releasetime;
	}

	public Long getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Long createtime) {
		this.createtime = createtime;
	}

	public String getDomain() {
		return domain;
	}

	public void setDomain(String domain) {
		this.domain = domain;
	}


	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getCover() {
		return cover;
	}

	public void setCover(String cover) {
		this.cover = cover;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public int getOpenstatus() {
		return openstatus;
	}

	public void setOpenstatus(int openstatus) {
		this.openstatus = openstatus;
	}

	public int getReleasestatus() {
		return releasestatus;
	}

	public void setReleasestatus(int releasestatus) {
		this.releasestatus = releasestatus;
	}

    

}
