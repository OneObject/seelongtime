package com.longtime.app.ixin.mgr.model.matter;

import com.longtime.app.ixin.mgr.utils.Constants;

/**
 * 
 * 基础素材
 * 
 * 对应表    ixin_matter_draft 草稿表
 *        ixin_matter_official 正式素材表
 * 
 */
public class BaseMatter {

	private String id;//主键
	private String domain;
	private String createUid;
	private String modifyUid;
	private long saveTime;//保存时间
	private int del = Constants.NO_DEL;
	private long modifyTime;//修改时间 
	private int msgType = Constants.MESSAGE_TYPE_SINGLE;//消息类型：多图文，单图文等。
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getDomain() {
		return domain;
	}
	public void setDomain(String domain) {
		this.domain = domain;
	}
	public String getCreateUid() {
		return createUid;
	}
	public void setCreateUid(String createUid) {
		this.createUid = createUid;
	}
	public String getModifyUid() {
		return modifyUid;
	}
	public void setModifyUid(String modifyUid) {
		this.modifyUid = modifyUid;
	}
	public long getSaveTime() {
		return saveTime;
	}
	public void setSaveTime(long saveTime) {
		this.saveTime = saveTime;
	}
	public int getDel() {
		return del;
	}
	public void setDel(int del) {
		this.del = del;
	}
	public long getModifyTime() {
		return modifyTime;
	}
	public void setModifyTime(long modifyTime) {
		this.modifyTime = modifyTime;
	}
	public int getMsgType() {
		return msgType;
	}
	public void setMsgType(int msgType) {
		this.msgType = msgType;
	}
	
}
