package com.longtime.app.base.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import com.longtime.common.model.BaseModel;

@Entity
@Table(name = "iapp_base_ext_index")
public class IndexEntity extends BaseModel<String>{

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
    
    private String name;
    
    private String cover;
    
    private String fileid;
      
    private Long createtime;
    
    private Long modifytime;
    
    private String createuid;
    
    private String modifyuid;
    
    private int isdel=0;
    
    
	public String getFileid() {
		return fileid;
	}

	public void setFileid(String fileid) {
		this.fileid = fileid;
	}

	public int getIsdel() {
		return isdel;
	}

	public void setIsdel(int isdel) {
		this.isdel = isdel;
	}

	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
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

	public String getCover() {
		return cover;
	}

	public void setCover(String cover) {
		this.cover = cover;
	}


	public Long getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Long createtime) {
		this.createtime = createtime;
	}

	public Long getModifytime() {
		return modifytime;
	}

	public void setModifytime(Long modifytime) {
		this.modifytime = modifytime;
	}

	public String getCreateuid() {
		return createuid;
	}

	public void setCreateuid(String createuid) {
		this.createuid = createuid;
	}

	public String getModifyuid() {
		return modifyuid;
	}

	public void setModifyuid(String modifyuid) {
		this.modifyuid = modifyuid;
	}

	
	
	


}
