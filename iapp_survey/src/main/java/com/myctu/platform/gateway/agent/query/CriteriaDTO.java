/* Copyright © 2010 www.myctu.cn. All rights reserved. */
package com.myctu.platform.gateway.agent.query;

import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.myctu.platform.protocol.MapSerializable;

public class CriteriaDTO implements MapSerializable {

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = -6633618136959791408L;

	public LinkedHashMap<String, Object> toMap() {
		LinkedHashMap<String, Object> out = this.getCriteriaObject();
		return out;
	}
	
	@Override
	public void fromMap(Map<String, Object> in) {
		// TODO Auto-generated method stub
		
	}

	/**
	 * Custom "not-null" object as we have to be able to work with {@literal null} values as well.
	 */
	private static final Object NOT_SET = new Object();

	private String key;

	private List<CriteriaDTO> criteriaChain;

	private LinkedHashMap<String, Object> criteria = new LinkedHashMap<String, Object>();

	private Object isValue = NOT_SET;

	public CriteriaDTO() {
		this.criteriaChain = new ArrayList<CriteriaDTO>();
	}

	public CriteriaDTO(String key) {
		this.criteriaChain = new ArrayList<CriteriaDTO>();
		this.criteriaChain.add(this);
		this.key = key;
	}

	protected CriteriaDTO(List<CriteriaDTO> criteriaChain, String key) {
		this.criteriaChain = criteriaChain;
		this.criteriaChain.add(this);
		this.key = key;
	}

	/**
	 * Static factory method to create a Criteria using the provided key
	 * 
	 * @param key
	 * @return
	 */
	public static CriteriaDTO where(String key) {
		return new CriteriaDTO(key);
	}

	/**
	 * Static factory method to create a Criteria using the provided key
	 * 
	 * @return
	 */
	public CriteriaDTO and(String key) {
		return new CriteriaDTO(this.criteriaChain, key);
	}

	/**
	 * Creates a criterion using equality
	 * 
	 * @param o
	 * @return
	 */
	public CriteriaDTO is(Object o) {
		if (isValue != NOT_SET) {
			throw new QueryException("Multiple 'is' values declared. You need to use 'and' with multiple criteria");
		}
		if (this.criteria.size() > 0 && "$not".equals(this.criteria.keySet().toArray()[this.criteria.size() - 1])) {
			throw new QueryException("Invalid query: 'not' can't be used with 'is' - use 'ne' instead.");
		}
		this.isValue = o;
		return this;
	}

	/**
	 * Creates a criterion using the $ne operator
	 * 
	 * @param o
	 * @return
	 */
	public CriteriaDTO ne(Object o) {
		criteria.put("$ne", o);
		return this;
	}

	/**
	 * Creates a criterion using the $lt operator
	 * 
	 * @param o
	 * @return
	 */
	public CriteriaDTO lt(Object o) {
		criteria.put("$lt", o);
		return this;
	}

	/**
	 * Creates a criterion using the $lte operator
	 * 
	 * @param o
	 * @return
	 */
	public CriteriaDTO lte(Object o) {
		criteria.put("$lte", o);
		return this;
	}

	/**
	 * Creates a criterion using the $gt operator
	 * 
	 * @param o
	 * @return
	 */
	public CriteriaDTO gt(Object o) {
		criteria.put("$gt", o);
		return this;
	}

	/**
	 * Creates a criterion using the $gte operator
	 * 
	 * @param o
	 * @return
	 */
	public CriteriaDTO gte(Object o) {
		criteria.put("$gte", o);
		return this;
	}

	/**
	 * Creates a criterion using the $in operator
	 * 
	 * @param o the values to match against
	 * @return
	 */
	public CriteriaDTO in(Object... o) {
		if (o.length > 1 && o[1] instanceof Collection) {
			throw new QueryException("You can only pass in one argument of type " + o[1].getClass().getName());
		}
		criteria.put("$in", o);
		return this;
	}

	/**
	 * Creates a criterion using the $in operator
	 * 
	 * @param c the collection containing the values to match against
	 * @return
	 */
	public CriteriaDTO in(Collection<?> c) {
		criteria.put("$in", c.toArray());
		return this;
	}

	/**
	 * Creates a criterion using the $nin operator
	 * 
	 * @param o
	 * @return
	 */
	public CriteriaDTO nin(Object... o) {
		criteria.put("$nin", o);
		return this;
	}

	/**
	 * Creates a criterion using the $mod operator
	 * 
	 * @param value
	 * @param remainder
	 * @return
	 */
	public CriteriaDTO mod(Number value, Number remainder) {
		List<Object> l = new ArrayList<Object>();
		l.add(value);
		l.add(remainder);
		criteria.put("$mod", l);
		return this;
	}

	/**
	 * Creates a criterion using the $all operator
	 * 
	 * @param o
	 * @return
	 */
	public CriteriaDTO all(Object... o) {
		criteria.put("$all", o);
		return this;
	}

	/**
	 * Creates a criterion using the $size operator
	 * 
	 * @param s
	 * @return
	 */
	public CriteriaDTO size(int s) {
		criteria.put("$size", s);
		return this;
	}

	/**
	 * Creates a criterion using the $exists operator
	 * 
	 * @param b
	 * @return
	 */
	public CriteriaDTO exists(boolean b) {
		criteria.put("$exists", b);
		return this;
	}

	/**
	 * Creates a criterion using the $type operator
	 * 
	 * @param t
	 * @return
	 */
	public CriteriaDTO type(int t) {
		criteria.put("$type", t);
		return this;
	}

	/**
	 * Creates a criterion using the $not meta operator which affects the clause directly following
	 * 
	 * @return
	 */
	public CriteriaDTO not() {
		criteria.put("$not", null);
		return this;
	}

	/**
	 * Creates a criterion using a $regex
	 * 
	 * @param re
	 * @return
	 */
	public CriteriaDTO regex(String re) {
		criteria.put("$regex", re);
		return this;
	}

	/**
	 * Creates a criterion using a $regex and $options
	 * 
	 * @param re
	 * @param options
	 * @return
	 */
	public CriteriaDTO regex(String re, String options) {
		criteria.put("$regex", re);

		if (options != null && options.length() > 0) {
			criteria.put("$options", options);
		}
		return this;
	}

	/**
	 * Creates a criterion using the $elemMatch operator
	 * 
	 * @param c
	 * @return
	 */
	public CriteriaDTO elemMatch(CriteriaDTO c) {
		criteria.put("$elemMatch", c.getCriteriaObject());
		return this;
	}

	/**
	 * Creates an 'or' criteria using the $or operator for all of the provided criteria
	 * 
	 * @param criteria
	 */
	public CriteriaDTO orOperator(CriteriaDTO... criteria) {
		List<Object> bsonList = createCriteriaList(criteria);
		criteriaChain.add(new CriteriaDTO("$or").is(bsonList));
		return this;
	}

	/**
	 * Creates a 'nor' criteria using the $nor operator for all of the provided criteria
	 * 
	 * @param criteria
	 */
	public CriteriaDTO norOperator(CriteriaDTO... criteria) {
		List<Object> bsonList = createCriteriaList(criteria);
		criteriaChain.add(new CriteriaDTO("$nor").is(bsonList));
		return this;
	}

	/**
	 * Creates an 'and' criteria using the $and operator for all of the provided criteria
	 * 
	 * @param criteria
	 */
	public CriteriaDTO andOperator(CriteriaDTO... criteria) {
		List<Object> bsonList = createCriteriaList(criteria);
		criteriaChain.add(new CriteriaDTO("$and").is(bsonList));
		return this;
	}

	public String getKey() {
		return this.key;
	}

	public LinkedHashMap<String, Object> getCriteriaObject() {
		if (this.criteriaChain.size() == 1) {
			return criteriaChain.get(0).getSingleCriteriaObject();
		} else {
			LinkedHashMap<String, Object> criteriaObject = new LinkedHashMap<String, Object>();
			for (CriteriaDTO c : this.criteriaChain) {
				Map<String, Object> dbo = c.getSingleCriteriaObject();
				for (String k : dbo.keySet()) {
					setValue(criteriaObject, k, dbo.get(k));
				}
			}
			return criteriaObject;
		}
	}

	protected LinkedHashMap<String, Object> getSingleCriteriaObject() {
		LinkedHashMap<String, Object> dbo = new LinkedHashMap<String, Object>();
		boolean not = false;
		for (String k : this.criteria.keySet()) {
			if (not) {
				Map<String, Object> notDbo = new LinkedHashMap<String, Object>();
				notDbo.put(k, this.criteria.get(k));
				dbo.put("$not", notDbo);
				not = false;
			} else {
				if ("$not".equals(k)) {
					not = true;
				} else {
					dbo.put(k, this.criteria.get(k));
				}
			}
		}
		LinkedHashMap<String, Object> queryCriteria = new LinkedHashMap<String, Object>();
		if (isValue != NOT_SET) {
			queryCriteria.put(this.key, this.isValue);
			queryCriteria.putAll(dbo);
		} else {
			queryCriteria.put(this.key, dbo);
		}
		return queryCriteria;
	}

	private List<Object> createCriteriaList(CriteriaDTO[] criteria) {
		List<Object> bsonList = new ArrayList<Object>();
		for (CriteriaDTO c : criteria) {
			bsonList.add(c.getCriteriaObject());
		}
		return bsonList;
	}

	private void setValue(Map<String, Object> dbo, String key, Object value) {
		Object existing = dbo.get(key);
		if (existing == null) {
			dbo.put(key, value);
		} else {
			throw new QueryException("Due to limitations of the com.mongodb.LinkedHashMap<String,Object>, "
					+ "you can't add a second '" + key + "' expression specified as '" + key + " : " + value + "'. "
					+ "Criteria already contains '" + key + " : " + existing + "'.");
		}
	}



	/*
	 * public List<CriteriaDTO> getCriteriaChain() { return criteriaChain; } public LinkedHashMap<String, Object>
	 * getCriteria() { return criteria; } public Object getIsValue() { return isValue; }
	 */

}
