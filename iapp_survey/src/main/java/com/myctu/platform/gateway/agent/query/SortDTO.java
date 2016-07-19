/* Copyright © 2010 www.myctu.cn. All rights reserved. */
package com.myctu.platform.gateway.agent.query;

import java.util.LinkedHashMap;
import java.util.Map;

import com.myctu.platform.protocol.MapSerializable;

public class SortDTO implements MapSerializable {

	@Override
	public LinkedHashMap<String, Object> toMap() {
		LinkedHashMap<String, Object> out = getSortObject();
		return out;
	}
	
	@Override
	public void fromMap(Map<String, Object> in) {
		// TODO Auto-generated method stub
		
	}

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = -7845526243897355121L;
	private Map<String, OrderDTO> fieldSpec = new LinkedHashMap<String, OrderDTO>();

	public SortDTO() {
	}

	public SortDTO(String key, OrderDTO order) {
		fieldSpec.put(key, order);
	}

	public SortDTO on(String key, OrderDTO order) {
		fieldSpec.put(key, order);
		return this;
	}

	public LinkedHashMap<String, Object> getSortObject() {
		LinkedHashMap<String, Object> dbo = new LinkedHashMap<String, Object>();
		for (String k : fieldSpec.keySet()) {
			dbo.put(k, (fieldSpec.get(k).equals(OrderDTO.ASCENDING) ? 1 : -1));
		}
		return dbo;
	}

}
