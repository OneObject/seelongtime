package com.longtime.app.ixin.mgr.model;

public class ActivityVo {
	
	private Long itemid;
	
	private String id;
	
    private String title;
    
    private long createtime;
    
    private String cover;
    
    private String summary;
    
    private int type;	//记录资源类型   1.投票	2.调研	3.抽奖	4.积分排行	5.话题 	10.课程	11.考 试	12.素材

	public Long getItemid() {
		return itemid;
	}

	public void setItemid(Long itemid) {
		this.itemid = itemid;
	}


	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public long getCreatetime() {
		return createtime;
	}

	public void setCreatetime(long createtime) {
		this.createtime = createtime;
	}

	public String getCover() {
		return cover;
	}

	public void setCover(String cover) {
		this.cover = cover;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}
}
