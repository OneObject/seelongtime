/**
 * project : portal-demo
 * user created : songsp
 * date created : 2012-9-28 - 下午4:49:00
 */
package com.longtime.demo.model;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

import com.longtime.common.model.BaseModel;

/**
 * @since 2012-9-28
 * @author songsp
 * 
 */
@Entity
@Table(name="demo_user")
public class DemoUser extends BaseModel<Long>{
	private static final long serialVersionUID = 5451622713143609615L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	private String name;
	private String job;
	

	@ManyToOne
	private DemoOrg org;
	
	
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
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	} 
	
	
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.SHORT_PREFIX_STYLE, false)
			.concat(String.format("@hashCode=%s", this.hashCode()));
	}
	public DemoOrg getOrg() {
		return org;
	}
	public void setOrg(DemoOrg org) {
		this.org = org;
	}
}
