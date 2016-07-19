package com.longtime.app.ixin.mgr.fodder.model;

/**
 * 素材草稿表
 * 表：ixin_fodderdraft
 */
public class FodderDraftEntity extends FodderEntity{

	private String baseId;//对应FodderEntity的id属性

	public String getBaseId() {
		return baseId;
	}

	public void setBaseId(String baseId) {
		this.baseId = baseId;
	}
	
}
