/**
 * project : portal-support
 * user created : songsp
 * date created : 2012-10-18 - 下午5:29:51
 */
package com.longtime.demo.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import com.longtime.common.model.BaseModel;

/**
 * @since 2012-10-18
 * @author songsp
 */
@Entity
@Table(name = "demo_course_ext")
public class CourseExtEntity extends BaseModel<String>{
	
	private static final long serialVersionUID = -2775704965485022730L;

	//id 值需程序自己设置
	@Id
	@GeneratedValue(generator = "assignedGen")     
	@GenericGenerator(name = "assignedGen", strategy = "assigned")  
	@Column(length=50)
	private String id;

	private String ext1;
	private String ext2;
	private String ext3;
	private String ext4;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getExt1() {
		return ext1;
	}
	public void setExt1(String ext1) {
		this.ext1 = ext1;
	}
	public String getExt2() {
		return ext2;
	}
	public void setExt2(String ext2) {
		this.ext2 = ext2;
	}
	public String getExt3() {
		return ext3;
	}
	public void setExt3(String ext3) {
		this.ext3 = ext3;
	}
	public String getExt4() {
		return ext4;
	}
	public void setExt4(String ext4) {
		this.ext4 = ext4;
	}

}
