package com.longtime.app.ixin.mgr.fodder.model;

import com.longtime.app.ixin.mgr.utils.Constants;

/**
 * 栏目信息表：ixin_columninfo
 */
public class ColumnEntity {

	private String id;//主键
	private String fodderId;//素材ID
	private String columnType;//栏目类型，"ixinstudy","ixinnotice"
	private String domain;//商户域
	private long saveTime = System.currentTimeMillis();//保存时间
	private int del = Constants.NO_DEL;//标记删除字段
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getFodderId() {
		return fodderId;
	}
	public void setFodderId(String fodderId) {
		this.fodderId = fodderId;
	}
	public String getColumnType() {
		return columnType;
	}
	public void setColumnType(String columnType) {
		this.columnType = columnType;
	}
	public String getDomain() {
		return domain;
	}
	public void setDomain(String domain) {
		this.domain = domain;
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
}
