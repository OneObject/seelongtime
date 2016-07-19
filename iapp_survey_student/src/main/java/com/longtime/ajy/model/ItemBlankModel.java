package com.longtime.ajy.model;

import java.text.SimpleDateFormat;
import java.util.Date;

public class ItemBlankModel {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1565756226401265260L;

	private String _id;

	private String name;

	private String content;

	private String domain;

	private EntityMetaInfo entityMetaInfo;

	public String get_id() {
		return _id;
	}

	public void set_id(String _id) {
		this._id = _id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getFormatCreateDate() {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return df.format(this.entityMetaInfo.getDateCreated());
	}

	public String getFormatUpdateDate() {
		if (this.entityMetaInfo.getDateLastModified() == null
				|| this.entityMetaInfo.getDateLastModified() == 0L) {
			return "";
		}
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return df.format(new Date(this.entityMetaInfo.getDateLastModified()));
	}

	public String getDomain() {
		return domain;
	}

	public void setDomain(String domain) {
		this.domain = domain;
	}

}