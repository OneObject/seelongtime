package com.longtime.app.base.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import com.longtime.common.model.BaseModel;

/**
 * 用户组对象
 * @author fangxinyuan
 *
 */
@Entity
@Table(name="iapp_base_group")
public class BaseGroup extends BaseModel<String>{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;


	@Id
    @GeneratedValue(generator = "system-uuid")
    @GenericGenerator(name = "system-uuid", strategy = "uuid")
    @Column(length = 36)
    private String id;
    
	
	private String name;//用户组名称
	
	private int type=COMMON_TYPE;//用户组类型
	
	private String domain;//域
	
	private long createtime;
	
	private String creator;
	
	private long  updatetime;
	
	private String updater;
	
	private int isdel=ISDEL_NO;
	
	
	public static int COMMON_TYPE=0;
	
	public static int ALL_TYPE=1;
	
	
	
	public static int ISDEL_NO=0;
	
	public static int ISDEL_YES=1;
	
	

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

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getDomain() {
		return domain;
	}

	public void setDomain(String domain) {
		this.domain = domain;
	}

	public long getCreatetime() {
		return createtime;
	}

	public void setCreatetime(long createtime) {
		this.createtime = createtime;
	}

	public String getCreator() {
		return creator;
	}

	public void setCreator(String creator) {
		this.creator = creator;
	}

	public long getUpdatetime() {
		return updatetime;
	}

	public void setUpdatetime(long updatetime) {
		this.updatetime = updatetime;
	}

	public String getUpdater() {
		return updater;
	}

	public void setUpdater(String updater) {
		this.updater = updater;
	}

	public int getIsdel() {
		return isdel;
	}

	public void setIsdel(int isdel) {
		this.isdel = isdel;
	}
}
