package com.longtime.ajy.model;

import com.longtime.common.model.BaseEntity;

/**
 * 话题管理
 * 
 * @author fangxinyuan
 * 
 */
public class Topic extends BaseEntity<Long> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Long id;

	private String cover;//封面

	private String uid;

	private String uname;

	private String content;//话题内容
	
	private String domain;
	
	private int isdel=0;
	
	private int utype;
	
    private int recommend=0;  //0 表示不推荐 1表示推荐
	
	private long top=0;//置顶
	
	private int shield = 0; //屏蔽
	


	private String audiourl;// 音频id使用,分割

	private String videourl;// 视频id使用,分割
	
	private String channel="0"; //是否关联活动或者板块 不关联 为0  关联记录板块或者活动的id;默认为0
	private int channeltype=0; //0 社区  1：活动
    public int getShield()
	{
		return shield;
	}

	public String getChannel() {
		return channel;
	}

	public void setChannel(String channel) {
		this.channel = channel;
	}

	public void setShield(int shield)
	{
		this.shield = shield;
	}

	public static int UTYPE_COMMON=0; //普通用户
	
	public static int UTYPE_YK=1;//游客
	

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getUname() {
		return uname;
	}

	public String getCover()
	{
		return cover;
	}

	public void setCover(String cover)
	{
		this.cover = cover;
	}
	
	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getDomain() {
		return domain;
	}

	public void setDomain(String domain) {
		this.domain = domain;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public int getIsdel() {
		return isdel;
	}

	public void setIsdel(int isdel) {
		this.isdel = isdel;
	}

	public int getUtype() {
		return utype;
	}

	public void setUtype(int utype) {
		this.utype = utype;
	}

	public int getRecommend() {
		return recommend;
	}

	public void setRecommend(int recommend) {
		this.recommend = recommend;
	}

	public long getTop() {
		return top;
	}

	public void setTop(long top) {
		this.top = top;
	}
   

	public String getAudiourl() {
		return audiourl;
	}

	public void setAudiourl(String audiourl) {
		this.audiourl = audiourl;
	}

	public String getVideourl() {
		return videourl;
	}

	public void setVideourl(String videourl) {
		this.videourl = videourl;
	}

	public int getChanneltype() {
		return channeltype;
	}

	public void setChanneltype(int channeltype) {
		this.channeltype = channeltype;
	}
	
   	
}
