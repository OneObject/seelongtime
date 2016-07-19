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
 *  标签关联资源实体
 * @author yangwenkui
 * @version v1.0 只汇聚系统内的标签
 * @time 2016年6月11日 下午10:15:18
 */
@Entity
@Table(name = "base_label_relation")
public class LabelRelationEntity  extends BaseModel<String>{

	private static final long serialVersionUID = -4083409887118034947L;
	
	@Id
	@Column(length = 36)
	private String id;
	private String label;//标签
	private String rid;//关联资源id
	private int rtype = RTYPE_SURVEY;
	private String domain;
	private String creator;
	private long createTime = System.currentTimeMillis();//创建时间
	
	public static final int RTYPE_SURVEY = 1; //关联资源类型-调研
	public static final int RTYPE_USER = 2; //关联资源类型-用户

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
	}

	public String getRid() {
		return rid;
	}

	public void setRid(String rid) {
		this.rid = rid;
	}

	public int getRtype() {
		return rtype;
	}

	public void setRtype(int rtype) {
		this.rtype = rtype;
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
		return String.format(
				"LabelRelationEntity [id=%s, label=%s, rid=%s, rtype=%s, domain=%s, creator=%s, createTime=%s]", id,
				label, rid, rtype, domain, creator, createTime);
	}
	
}
