package com.longtime.ajy.model;

import com.longtime.common.model.BaseEntity;

public class Feed extends BaseEntity<Long>{

	private static final long serialVersionUID = 920205142993714318L;

	private Long   id;
	
    private String appid; //应用ID
    
    private String restype; //资源类型 如课程，评论等
    
    private String resid; //资源ID 如课程ID
    
    private String resname; //资源名称 如课程名称
    
    private String action; //动作类型 如评论，赞等动作
    
    private String uid; //产生动态的用户ID
    
    private String uname; //产生动态的用户姓名
    
    private String title; //用于展示时存放动态标题
    
    private String body; //动态内容 如评论内容（截取）
    
    private String domain; // 域
    
    private String ext; //扩展字段
    

	@Override
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}

	public String getAppid() {
		return appid;
	}

	public void setAppid(String appid) {
		this.appid = appid;
	}

	
    public String getRestype() {
        return restype;
    }

    
    public void setRestype(String restype) {
        this.restype = restype;
    }

    
    public String getAction() {
        return action;
    }

    
    public void setAction(String action) {
        this.action = action;
    }

    public String getResid() {
		return resid;
	}

	public void setResid(String resid) {
		this.resid = resid;
	}

	public String getResname() {
		return resname;
	}

	public void setResname(String resname) {
		this.resname = resname;
	}


	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}

	public String getDomain() {
		return domain;
	}

	public void setDomain(String domain) {
		this.domain = domain;
	}

	public String getExt() {
		return ext;
	}

	public void setExt(String ext) {
		this.ext = ext;
	}
	
	
	public static enum RESTYPE{
	    course("课程"),
	    test("考试");

	    public String title;
	    
	    RESTYPE(String title){
	    	this.title = title; 
	    }
	    
	    public String getTitle(){
	    	return title;
	    }
	    
	    public static RESTYPE from(String name) {
			for (RESTYPE mode : RESTYPE.values()) {
				if (mode.name().equals(name)) {
					return mode;
				}
			}
			return null;
		}
	}
	
	public static enum ACTION{
	    comment("评论"),
	    praise("赞"),
	    study("学习");
	    
	    public String title;
	    
	    ACTION(String title){
	    	this.title = title; 
	    }
	    
	    public String getTitle(){
	    	return title;
	    }
	    
	    public static ACTION from(String name) {
			for (ACTION mode : ACTION.values()) {
				if (mode.name().equals(name)) {
					return mode;
				}
			}
			throw new IllegalArgumentException(String.format("error feed action name %s", name));
		}
	}
	
	@Override
	public String toString()
	{
		return String
				.format("Feed [id=%s, appid=%s, restype=%s, resid=%s, resname=%s, action=%s, uid=%s, uname=%s, title=%s, body=%s, domain=%s, ext=%s]",
						id, appid, restype, resid, resname, action, uid, uname,
						title, body, domain, ext);
	}

	public static void main(String[] args) {
		
		String name = "comment";
		System.out.println(ACTION.from(name).getTitle());
		System.out.println(ACTION.from(name).name());
		
	}

}
