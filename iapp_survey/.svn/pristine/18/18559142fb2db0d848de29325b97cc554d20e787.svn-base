package com.longtime.app.base.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import com.longtime.common.model.BaseModel;

@Entity
@Table(name="iapp_group_rule_config")
public class BaseGroupRuleConfig extends BaseModel<String> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
    
	@Id
    @GeneratedValue(generator = "system-uuid")
    @GenericGenerator(name = "system-uuid", strategy = "uuid")
    @Column(length = 36)
    private String id;
	
	
	private String entityname;
	
	private String propertyname;
	
	private int type;
	
	private String domain;
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getEntityname() {
		return entityname;
	}

	public void setEntityname(String entityname) {
		this.entityname = entityname;
	}

	public String getPropertyname() {
		return propertyname;
	}

	public void setPropertyname(String propertyname) {
		this.propertyname = propertyname;
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
	
	public static String getEntityNameByRuleType(int ruletype){
		
		String msg="";
		
		if(ruletype==0){
			msg="user";
		}else if(ruletype==1){
			msg="organization";
		}
		return msg;
	}
	
	
	
    
}
