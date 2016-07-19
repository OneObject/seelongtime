/**
 * Title:
 * Description:
 * @author yangwenkui
 * @version v1.0
 * @time 2016年6月11日 下午10:15:18
 */
package com.longtime.app.base.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import com.longtime.common.model.BaseModel;

/**
 *  标签实体
 * Description:
 * @author yangwenkui
 * @version v1.0 只汇聚系统内的标签
 * @time 2016年6月11日 下午10:15:18
 */
@Entity
@Table(name = "base_label")
public class LabelEntity  extends BaseModel<String>{

	private static final long serialVersionUID = 3396347869788358230L;
	
	@Id
	@Column(length = 36)
	private String id;
	private String title;
	private String domain;
	private String creator;
	private long createTime = System.currentTimeMillis();//创建时间
	
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
		return String.format("LabelEntity [id=%s, title=%s, domain=%s, creator=%s, createTime=%s]", id, title, domain,
				creator, createTime);
	}
	
}
