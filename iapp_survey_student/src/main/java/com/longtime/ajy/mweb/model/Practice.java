package com.longtime.ajy.mweb.model;

import java.util.HashMap;
import java.util.Map;

import com.longtime.common.model.BaseEntity;

public class Practice extends BaseEntity<String> {

	private static final long serialVersionUID = 1L;

	private String id;// id

	private String name;// 练习名称

	private int total;// 题目总数

	private String cover;// 练习图片

	private String content;// 练习简介

	private String status = "0"; // 状态：0，未发布；1，已发布；

	private int isDel = Practice.IS_DEL_NO; // 删除标记：0.未删除；1.已删除

	private String creater;

	private long createTime;

	private String updater;

	private long updateTime;

	private String domain;// 域

	/** 未删除 */
	public static int IS_DEL_NO = 0;

	/** 已删除 */
	public static int IS_DEL_YES = 1;

	/** 未发布 */
	public static String UNPUBLISHED_Practice = "0";
	/** 已发布 */
	public static String RELEASE_Practice = "1";

	public static Map<String, String> practiceStatusMap = new HashMap<String, String>();
	static {
		practiceStatusMap.put("未发布", Practice.UNPUBLISHED_Practice);
		practiceStatusMap.put("已发布", Practice.RELEASE_Practice);
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public String getCover() {
		return cover;
	}

	public void setCover(String cover) {
		this.cover = cover;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getIsDel() {
		return isDel;
	}

	public void setIsDel(int isDel) {
		this.isDel = isDel;
	}

	public String getDomain() {
		return domain;
	}

	public void setDomain(String domain) {
		this.domain = domain;
	}

	public String getCreater() {
		return creater;
	}

	public void setCreater(String creater) {
		this.creater = creater;
	}

	public long getCreateTime() {
		return createTime;
	}

	public void setCreateTime(long createTime) {
		this.createTime = createTime;
	}

	public String getUpdater() {
		return updater;
	}

	public void setUpdater(String updater) {
		this.updater = updater;
	}

	public long getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(long updateTime) {
		this.updateTime = updateTime;
	}

	@Override
	public String toString() {
		return String
				.format("Practice [id=%s, name=%s, total=%s, cover=%s, content=%s, status=%s, isDel=%s, domain=%s]",
						id, name, total, cover, content, status, isDel, domain);
	}
}
