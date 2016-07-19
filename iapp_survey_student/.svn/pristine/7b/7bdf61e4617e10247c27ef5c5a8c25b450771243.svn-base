package com.longtime.ajy.mweb.model;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import org.apache.commons.lang3.StringUtils;

import com.alibaba.fastjson.JSONObject;
import com.longtime.common.model.BaseEntity;

/**
 * 话题实体 对应表：ixin_topic
 */
public class RankEntity extends BaseEntity<String> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String id;//主键
	private String title;//标题
	private String remark;//简介
	private String domain;//租户
	private String cover; //封面

	private String items; // json string { title:'', remark:'',img:'',index:0}
	
	private int model = 0;//类型 0自定义  1积分  2素材
	
	private int datetype = 0;//周期类型
	
	private Long starttime;
	
	private Long endtime;


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


	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}


	public String getDomain() {
		return domain;
	}

	public void setDomain(String domain) {
		this.domain = domain;
	}

	public String getCover() {
		return cover;
	}

	public void setCover(String cover) {
		this.cover = cover;
	}

    public String getItems() {
        return items;
    }

    
    public void setItems(String items) {
        this.items = items;
    }
    

	public int getModel() {
		return model;
	}

	public void setModel(int model) {
		this.model = model;
	}

	public int getDatetype() {
		return datetype;
	}

	public void setDatetype(int datetype) {
		this.datetype = datetype;
	}

	public Long getStarttime() {
		return starttime;
	}

	public void setStarttime(Long starttime) {
		this.starttime = starttime;
	}

	public Long getEndtime() {
		return endtime;
	}

	public void setEndtime(Long endtime) {
		this.endtime = endtime;
	}

	@Override
	public String toString() {
		return String.format("RankEntity [id=%s, title=%s, remark=%s, domain=%s, cover=%s, items=%s, creator=%s, updater=%s, createtime=%s, updatetime=%s]",
			id,
			title,
			remark,
			domain,
			cover,
			items,
			creator,
			updater,
			createtime,
			updatetime);
	}

}
