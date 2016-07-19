package com.longtime.ajy.mweb.model;

import java.util.List;

public class TaskUserVo extends TaskUser{
	
	private static final long serialVersionUID = 9195166258865488748L;
	
	private List<AttachmentVo> attachments;
	
	private String avatar;//头像
	
	private String name;
	

	public List<AttachmentVo> getAttachments() {
		return attachments;
	}

	public void setAttachments(List<AttachmentVo> attachments) {
		this.attachments = attachments;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}


	
	
	

}
