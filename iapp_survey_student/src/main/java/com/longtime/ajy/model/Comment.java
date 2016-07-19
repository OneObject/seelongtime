package com.longtime.ajy.model;

import com.longtime.common.model.BaseEntity;

public class Comment extends BaseEntity<Long>{

	private static final long serialVersionUID = 2909270629762656504L;

	private Long id;
	
	private String resid; //被评论资源ID
	
	private Integer restype; //被评论资源类型
	
	private String uid; //评论人ID
	
	private String uname;//评论人姓名
	
	private int utype;//评论人类型
	 
	private String touid; //被评论人的ID
	
	private String touname; //被评论人的姓名
	
	private String header; //对评论进行评论时原评论截取内容
	
	private String body; //评论内容
	
	private Integer action = ACTION_COMMENT; //操作类型，评论，评论评论
	
	private String pid;// 父id
	
	private String domain;
	
	private String cover;//头像
	
	private int shield; //屏蔽  0未屏蔽 1 已屏蔽
	
	private int bodytype;

	public static int RES_TYPE_COURSE = 1; //课程评论
	
	public static int RES_TYPE_TOPIC=2;//话题评论
	
	public static int RES_TYPE_ANSWER=3;//回答评论
	
	public static int ACTION_COMMENT = 1; //评论
	
	public static int ACTION_REPLY = 2; //对评论进行回复
	
	public static int UNKNOW_PARAM = -1; //为定义的数据 
	
	public static int UTYPE_COMMON=0; //普通用户
	
	public static int UTYPE_YK=1;//游客
	

	@Override
	public Long getId() {
		return id;
	}

	@Override
	public void setId(Long id) {
		this.id = id;
	}

	public String getResid() {
		return resid;
	}

	public void setResid(String resid) {
		this.resid = resid;
	}

	public Integer getRestype() {
		return restype;
	}

	public void setRestype(Integer restype) {
		this.restype = restype;
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

	public String getTouid() {
		return touid;
	}

	public void setTouid(String touid) {
		this.touid = touid;
	}

	public String getTouname() {
		return touname;
	}

	public void setTouname(String touname) {
		this.touname = touname;
	}

	public String getHeader() {
		return header;
	}

	public void setHeader(String header) {
		this.header = header;
	}

	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}

	public Integer getAction() {
		return action;
	}

	public void setAction(Integer action) {
		this.action = action;
	}

    
    public String getPid() {
        return pid;
    }
    
    public String getDomain() {
        return domain;
    }
    
    public String getCover() {
		return cover;
	}

	public void setCover(String cover) {
		this.cover = cover;
	}

	public void setDomain(String domain) {
        this.domain = domain;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }
    

    public int getUtype() {
		return utype;
	}

	public void setUtype(int utype) {
		this.utype = utype;
	}

	public int getShield()
	{
		return shield;
	}

	public void setShield(int shield)
	{
		this.shield = shield;
	}
	
	
	public int getBodytype() {
		return bodytype;
	}

	public void setBodytype(int bodytype) {
		this.bodytype = bodytype;
	}

	@Override
	public String toString() {
		return "Comment [id=" + id + ", resid=" + resid + ", restype="
				+ restype + ", uid=" + uid + ", uname=" + uname + ", utype="
				+ utype + ", touid=" + touid + ", touname=" + touname
				+ ", header=" + header + ", body=" + body + ", action="
				+ action + ", pid=" + pid + ", domain=" + domain + ", cover="
				+ cover + "]";
	}



}
