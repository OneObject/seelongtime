/* Copyright © 2010 www.myctu.cn. All rights reserved. */
package com.myctu.platform.gateway.agent.query;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

import com.myctu.platform.protocol.MapSerializable;

public class FieldDTO implements MapSerializable {

	@Override
	public LinkedHashMap<String, Object> toMap() {
		LinkedHashMap<String, Object> out = getFieldsObject();
		return out;
	}
	
	@Override
	public void fromMap(Map<String, Object> in) {
		// TODO Auto-generated method stub
		
	}

	private static final long serialVersionUID = 1113369833653510968L;

	private Map<String, Integer> criteria = new HashMap<String, Integer>();

	private Map<String, Object> slices = new HashMap<String, Object>();

	public FieldDTO include(String key) {
		criteria.put(key, Integer.valueOf(1));
		return this;
	}

	public FieldDTO exclude(String key) {
		criteria.put(key, Integer.valueOf(0));
		return this;
	}

	public FieldDTO slice(String key, int size) {
		slices.put(key, Integer.valueOf(size));
		return this;
	}

	public FieldDTO slice(String key, int offset, int size) {
		slices.put(key, new Integer[] { Integer.valueOf(offset), Integer.valueOf(size) });
		return this;
	}

	public LinkedHashMap<String, Object> getFieldsObject() {
		LinkedHashMap<String, Object> dbo = new LinkedHashMap<String, Object>();
		for (String k : criteria.keySet()) {
			dbo.put(k, (criteria.get(k)));
		}
		LinkedHashMap<String, Object> tmp = null;
		for (String k : slices.keySet()) {
			tmp = new LinkedHashMap<String, Object>();
			tmp.put("$slice", (slices.get(k)));
			dbo.put(k, tmp);
		}
		return dbo;
	}

}
