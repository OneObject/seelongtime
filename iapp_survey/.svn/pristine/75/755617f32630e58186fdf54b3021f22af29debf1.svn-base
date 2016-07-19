/* Copyright © 2010 www.myctu.cn. All rights reserved. */
// $dateCreated:2006-1-24-13:46:33-13:46:33 userCreated:pippo
package com.longtime.app.base.util;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.Validate;
import org.hibernate.Query;
import org.hibernate.ScrollableResults;
import org.hibernate.Session;

import com.longtime.common.utils.Page;
import com.longtime.common.utils.Pagination;


/**
 * @author pippo
 */
public final class QueryUtils {

	public static Query setCacheable(Query query, boolean cacheable) {
		Validate.notNull(query, "query can not be null");
		return query.setCacheable(cacheable);
	}

	public static Query setParameter(Query query, Object... arguments) {
		Validate.notNull(query, "query can not be null");
		if (arguments == null) {
			return query;
		}
		for (int i = 0; i < arguments.length; i++) {
			query.setParameter(i, arguments[i]);
		}
		return query;
	}

	public static Query setParameter(Query query, String[] argumentsNames, Object[] arguments) {
		Validate.notNull(query, "query can not be null");
		if (argumentsNames == null || arguments == null) {
			return query;
		}

		for (int i = 0; i < argumentsNames.length; i++) {
			String parameterName = argumentsNames[i];
			Object parameterValue = arguments[i];
			if (parameterValue.getClass().isArray()) {
				query.setParameterList(parameterName, (Object[]) parameterValue);
			} else if (parameterValue instanceof Collection<?>) {
				query.setParameterList(parameterName, (Collection<?>) parameterValue);
			} else {
				query.setParameter(parameterName, parameterValue);
			}
		}
		return query;
	}

	public static Query setParameter(Query query, Map<String, Object> parameterMap) {
		Validate.notNull(query, "query can not be null");
		if (parameterMap == null) {
			return query;
		}
		for (String parameterName : parameterMap.keySet()) {
			if (parameterName == null) {
				continue;
			}
			Object parameterValue = parameterMap.get(parameterName);
			if (parameterValue == null) {
				continue;
			} else if (parameterValue.getClass().isArray()) {
				query.setParameterList(parameterName, (Object[]) parameterValue);
			} else if (parameterValue instanceof Collection<?>) {
				query.setParameterList(parameterName, (Collection<?>) parameterValue);
			} else {
				query.setParameter(parameterName, parameterValue);
			}
		}
		return query;
	}

	public static Query create(String hql, Session session, Object... arguments) {
		Query query = session.createQuery(hql);
		setParameter(query, arguments);
		return query;
	}

	public static Query create(String hql, Session session, String[] argumentsNames, Object[] arguments) {
		Query query = session.createQuery(hql);
		setParameter(query, argumentsNames, arguments);
		return query;
	}

	public static <T extends Serializable> Pagination<T> constructPagination(Query query, Page page) {
		Validate.notNull(query, "query can not be null");

		ScrollableResults scrollableResults = query.scroll();
		scrollableResults.last();
		int count = scrollableResults.getRowNumber();

		if (count < 1) {
			return Pagination.empty();
		}

		@SuppressWarnings("unchecked") 
		List<T> items = query.setFirstResult(page.getStart())
			.setMaxResults(page.getLimit())
			.list();

		return new Pagination<T>(items, page);
	}

}
