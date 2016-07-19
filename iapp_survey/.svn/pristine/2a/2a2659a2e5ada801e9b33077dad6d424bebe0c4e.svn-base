/* Copyright © 2010 www.myctu.cn. All rights reserved. */
package com.myctu.platform.gateway.agent.query;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.google.common.collect.Lists;
import com.myctu.platform.protocol.ExtMapUtils;
import com.myctu.platform.protocol.MapSerializable;

public class QueryDTO implements MapSerializable {

	@Override
	public Map<String, Object> toMap() {
		Map<String, Object> out = new LinkedHashMap<String, Object>();
		ExtMapUtils.addIfNotNull(out, "fieldSpec", fieldSpec);
		ExtMapUtils.addIfNotNull(out, "sort", sort);
		ExtMapUtils.addIfNotNull(out, "skip", skip);
		ExtMapUtils.addIfNotNull(out, "limit", limit);
		ExtMapUtils.addIfNotNull(out, "hint", hint);
		List<CriteriaDTO> criteriaList = getCriteria();
		List<Map<String, Object>> criteriaMaps = Lists.newArrayList();
		for (CriteriaDTO dto : criteriaList) {
			criteriaMaps.add(dto.toMap());
		}

		ExtMapUtils.addIfNotNull(out, "criteria", criteriaMaps);

		return out;
	}
	
	@Override
	public void fromMap(Map<String, Object> in) {
		throw new UnsupportedOperationException();
	}

	private static final long serialVersionUID = -3259746086114621893L;

	private LinkedHashMap<String, CriteriaDTO> criteria = new LinkedHashMap<String, CriteriaDTO>();
	private FieldDTO fieldSpec;
	private SortDTO sort;
	private int skip;
	private int limit;
	private String hint;

	/**
	 * Static factory method to create a Query using the provided criteria
	 * 
	 * @param critera
	 * @return
	 */
	public static QueryDTO query(CriteriaDTO critera) {
		return new QueryDTO(critera);
	}

	public QueryDTO() {
	}

	public QueryDTO(CriteriaDTO criteria) {
		addCriteria(criteria);
	}

	public QueryDTO addCriteria(CriteriaDTO criteria) {
		CriteriaDTO existing = this.criteria.get(criteria.getKey());
		String key = criteria.getKey();
		if (existing == null) {
			this.criteria.put(key, criteria);
		} else {
			throw new QueryException("you can't add a second '" + key + "' criteria. " + "Query already contains '"
					+ existing.getCriteriaObject() + "'.");
		}
		return this;
	}

	public FieldDTO fields() {
		if (fieldSpec == null) {
			this.fieldSpec = new FieldDTO();
		}
		return this.fieldSpec;
	}

	public QueryDTO skip(int skip) {
		this.skip = skip;
		return this;
	}

	public QueryDTO limit(int limit) {
		this.limit = limit;
		return this;
	}

	/**
	 * Configures the query to use the given hint when being executed.
	 * 
	 * @param name must not be {@literal null} or empty.
	 * @return
	 */
	public QueryDTO withHint(String name) {
		if (null == name || "".equals(name.trim()))
			throw new IllegalArgumentException("Hint must not be empty or null!");
		this.hint = name;
		return this;
	}

	public SortDTO sort() {
		if (this.sort == null) {
			this.sort = new SortDTO();
		}

		return this.sort;
	}

	public Map<String, Object> getQueryObject() {
		Map<String, Object> dbo = new LinkedHashMap<String, Object>();
		for (String k : criteria.keySet()) {
			CriteriaDTO c = criteria.get(k);
			Map<String, Object> cl = c.getCriteriaObject();
			dbo.putAll(cl);
		}
		return dbo;
	}

	public Map<String, Object> getFieldsObject() {
		if (this.fieldSpec == null) {
			return null;
		}
		return fieldSpec.getFieldsObject();
	}

	public Map<String, Object> getSortObject() {
		if (this.sort == null) {
			return null;
		}
		return this.sort.getSortObject();
	}

	public int getSkip() {
		return this.skip;
	}

	public int getLimit() {
		return this.limit;
	}

	public String getHint() {
		return hint;
	}

	private List<CriteriaDTO> getCriteria() {
		return new ArrayList<CriteriaDTO>(this.criteria.values());
	}
	/*
	 * public Map<String, CriteriaDTO> getCriteriaMap(){ return this.criteria; }
	 */

	/*
	 * public Field getFieldSpec() { return this.fieldSpec; }
	 */
}
