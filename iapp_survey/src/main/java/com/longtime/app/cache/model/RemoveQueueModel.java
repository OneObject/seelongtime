/**
 * project : iapp
 * user created : yangwk
 * date created : 2013-9-27 - 下午12:41:40
 */
package com.longtime.app.cache.model;

import com.myctu.platform.repository.engine.domain.BaseEntity;

/**
 * @since 2013-9-27
 * @author yangwk
 * 
 */
public class RemoveQueueModel extends BaseEntity<String>{
	
	private static final long serialVersionUID = 4710219871687449864L;

	private String key;
	
	private int type;
	
	private long effective_time;
	
	
	public static int TYPE_REDIS = 1;

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public long getEffective_time() {
		return effective_time;
	}

	public void setEffective_time(long effective_time) {
		this.effective_time = effective_time;
	}
}
