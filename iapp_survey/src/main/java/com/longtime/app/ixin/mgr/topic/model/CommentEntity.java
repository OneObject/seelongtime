package com.longtime.app.ixin.mgr.topic.model;

import com.longtime.app.ixin.mgr.utils.Constants;

/**
 * 评论
 * 对应表：ixin_topic_comment//话题评论表
 */
public class CommentEntity {

	private String id;//主键
	private String topicId;//话题Id
	private String pid;//评论的评论ID，支持对评论进行评论
	private String uid;//用户Id
	private String d_openid;
	private String openid;
	private String uname;//用户姓名
	private String headimgurl; //用户头像
	private String content;//评论内容
	private long commentTime;//评论时间
	private int del = Constants.NO_DEL;//是否删除
	private int shield = 0;//是否审核通过，0代表审核通过，1代表取消审核
	private int type = TYPE_TEXT; //评论内容类型0文本  1图片
	
	public static final int TYPE_TEXT = 0;
	
	public static final int TYPE_IMAGE = 1;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTopicId() {
		return topicId;
	}
	public void setTopicId(String topicId) {
		this.topicId = topicId;
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
	public String getContent() {
		return content;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public long getCommentTime() {
		return commentTime;
	}
	public void setCommentTime(long commentTime) {
		this.commentTime = commentTime;
	}
	public int getDel() {
		return del;
	}
	public void setDel(int del) {
		this.del = del;
	}
	public int getShield() {
		return shield;
	}
	public void setShield(int shield) {
		this.shield = shield;
	}
	
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	
	
	public String getD_openid() {
		return d_openid;
	}
	public void setD_openid(String d_openid) {
		this.d_openid = d_openid;
	}
	public String getOpenid() {
		return openid;
	}
	public void setOpenid(String openid) {
		this.openid = openid;
	}
	public String getHeadimgurl() {
		return headimgurl;
	}
	public void setHeadimgurl(String headimgurl) {
		this.headimgurl = headimgurl;
	}
	public static CommentEntity newCommentEntity(String topicId,
			String openId, String content,String id,int shield,String uid,String d_openid) {
		CommentEntity entity = new CommentEntity();
		entity.setCommentTime(System.currentTimeMillis());
		entity.setContent(content);
		entity.setId(id);
		entity.setTopicId(topicId);
		//entity.setUid(openId);
		entity.setShield(shield);
		entity.setUid(uid);
		entity.setD_openid(d_openid);
		entity.setOpenid(openId);
		return entity;
	}
}
