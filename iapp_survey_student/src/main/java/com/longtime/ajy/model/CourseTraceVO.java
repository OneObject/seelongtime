/* Copyright © 2010 www.myctu.cn. All rights reserved. */
package com.longtime.ajy.model;


/**
 * 学习进度实体
 */
public class CourseTraceVO extends CourseTrace {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -6816074581943958697L;
	
	private String name; //课程名称
	
	private String tid;//考试ID
	
	
	private Integer               restype             = 0; //课程课件类型
    

	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

    
    public Integer getRestype() {
        return restype;
    }

    
    public void setRestype(Integer restype) {
        this.restype = restype;
    }

	public String getTid() {
		return tid;
	}

	public void setTid(String tid) {
		this.tid = tid;
	}
	
}
