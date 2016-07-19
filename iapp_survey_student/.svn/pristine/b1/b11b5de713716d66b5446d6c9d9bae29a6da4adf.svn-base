/**
 * Title:
 * Description:
 * @author yangwenkui
 * @version v1.0
 * @time 2016年6月11日 下午10:15:18
 */
package com.longtime.ajy.model;

import com.longtime.common.model.Entity;

/**
 *  标签实体
 * Description:
 * @author yangwenkui
 * @version v1.0 只汇聚系统内的标签
 * @time 2016年6月11日 下午10:15:18
 */
public class LabelEntity  implements Entity<String>{
	
	private static final long serialVersionUID = -2637135367182940122L;
	
	private String id;
	private String title;
	private String domain;
	private String creator;
	private long createTime = System.currentTimeMillis();//创建时间
	
	public static final int RTYPE_USER = 0;
	public static final int RTYPE_VOTE = 1;
	
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
	public String getDomain() {
		return domain;
	}
	public void setDomain(String domain) {
		this.domain = domain;
	}
	public String getCreator() {
		return creator;
	}
	public void setCreator(String creator) {
		this.creator = creator;
	}
	public long getCreateTime() {
		return createTime;
	}
	public void setCreateTime(long createTime) {
		this.createTime = createTime;
	}
	
	@Override
	public String toString() {
		return String.format("LabelEntity [id=%s, domain=%s, creator=%s, createTime=%s]", id, domain, creator,
				createTime);
	}
	
}
