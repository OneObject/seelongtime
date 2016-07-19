package com.longtime.ajy.mweb.model;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;
 

public class EntityMetaInfo {

	private Long dateCreated;

	private String userCreated;

	private Long dateLastModified;

	private String userLastModified;

	public Long getDateCreated() {
		return this.dateCreated;
	}

	public EntityMetaInfo setDateCreated(Long dateCreated) {
		this.dateCreated = dateCreated;
		return this;
	}

	public String getUserCreated() {
		return this.userCreated;
	}

	public EntityMetaInfo setUserCreated(String userCreated) {
		this.userCreated = userCreated;
		return this;
	}

	public Long getDateLastModified() {
		return this.dateLastModified;
	}

	public EntityMetaInfo setDateLastModified(Long dateLastModified) {
		this.dateLastModified = dateLastModified;
		return this;
	}

	public String getUserLastModified() {
		return this.userLastModified;
	}

	public EntityMetaInfo setUserLastModified(String userLastModified) {
		this.userLastModified = userLastModified;
		return this;
	}

	public String toString() {
		return ToStringBuilder.reflectionToString(this,
				ToStringStyle.SHORT_PREFIX_STYLE, false).concat(
				String.format("@hashCode=%s", this.hashCode()));
	}

	/*
	 * public static enum MODIFYINFO_PROPERTY_NAME { dateCreated, userCreated,
	 * dateLastModified, userLastModified; public boolean equals(String name) {
	 * return this.toString().equals(name); } }
	 */

}
