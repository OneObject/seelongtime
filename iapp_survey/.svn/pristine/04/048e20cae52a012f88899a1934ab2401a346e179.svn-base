package com.longtime.app.admin.template.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import com.longtime.common.model.BaseModel;

@Entity
@Table(name = "base_module")
public class Module extends BaseModel<String>{

	private static final long serialVersionUID = -4497586325834662636L;

	@Id
    @Column(length = 36)
	private String id; //模块标记，如m.course.index
	
	private String name;//模块名称

	
	@Override
	public String getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setId(String id) {
		this.id = id;
	}
	
}
