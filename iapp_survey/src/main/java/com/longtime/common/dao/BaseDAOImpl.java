/**
 * project : portal-support
 * user created : songsp
 * date created : 2012-9-28 - 下午4:41:41
 */
package com.longtime.common.dao;

import java.io.Serializable;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.commons.collections.ListUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang3.ArrayUtils;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.googlecode.genericdao.dao.hibernate.GenericDAOImpl;
import com.googlecode.genericdao.search.Filter;
import com.googlecode.genericdao.search.ISearch;
import com.googlecode.genericdao.search.Search;
import com.googlecode.genericdao.search.SearchResult;
import com.longtime.app.base.util.QueryUtils;
import com.longtime.common.RepositoryUnexpectedException;
import com.longtime.common.model.BaseModel;
import com.longtime.common.operation.HibernateOperation;
import com.longtime.common.utils.Page;
import com.longtime.common.utils.QueryCondition;
import com.longtime.common.utils.QueryFilter;
import com.longtime.common.utils.ResultSet;
import com.longtime.common.utils.Sort;

/**
 * @since 2012-9-28
 * @author songsp
 */
public class BaseDAOImpl<T extends BaseModel<ID>, ID extends Serializable> extends GenericDAOImpl<T, ID> implements
		BaseDAO<T, ID> {

	protected Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	@Override
	public void setSessionFactory(SessionFactory sessionFactory) {
		super.setSessionFactory(sessionFactory);
	}

	@Override
	public int execute(String hql, Map<String, Object> params) {
		if (StringUtils.isBlank(hql)) {
			throw new IllegalArgumentException("arg hql is empty due to fail.");
		}
		Query query = getSession().createQuery(hql);

		if (null != params) {
			Iterator<Entry<String, Object>> iter = params.entrySet().iterator();
			while (iter.hasNext()) {
				Entry<String, Object> param = iter.next();
				if(param.getValue() instanceof Collection){
					query.setParameterList(param.getKey(), (Collection<?>) param.getValue());
				} else {
					query.setParameter(param.getKey(), param.getValue());
				}
			}
		}
		return query.executeUpdate();
	}

	@Override
	public int execute(String hql, List<Object> params) {
		if (StringUtils.isBlank(hql)) {
			throw new IllegalArgumentException("arg hql is empty due to fail.");
		}
		Query query = getSession().createQuery(hql);

		if (null != params) {
			int position = 0;
			for (Object param : params) {
				query.setParameter(position, param);
				position++;
			}
		}
		return query.executeUpdate();
	}

	@Override
	public <R> R execute(HibernateOperation<R> operation) {
		try {
			return operation.execute(this.getSession());
		} catch (RepositoryUnexpectedException e) {
			logger.error(String.format("execute operation:[%s] due to error", operation), e);
			throw new RepositoryUnexpectedException(e);
		}
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<T> list(String hql, Object... params) {
		Session s = getSession();
		hql = StringUtils.trimToEmpty(hql);
		if (StringUtils.isBlank(hql))
			//返回一个空的集合对象
			return ListUtils.EMPTY_LIST;
		Query query = s.createQuery(hql);
		if (null != params) {
			int position = 0;
			for (Object val : params) {
				query.setParameter(position, val);
				position++;
			}
		}
		return query.list();
	}

	@Override
	public <RT> ResultSet<RT> query(ISearch search) {
		return this.query(search, null);
	}

	/**
	 * 根据page参数值进行分页查询[如果page为空或者page.page_size<1 将采用search中分页设置查询]
	 * 
	 * @param search
	 * @param page
	 * @return
	 */
	@Override
	public <RT> ResultSet<RT> query(ISearch search, Page page) {
		if (null == search) {
			search = new Search();
		}
		if (null != page && page.getPage_size() > 0) {
			((Search) search).setPage(page.getCurrent_page() - 1).setMaxResults(page.getPage_size()).setFirstResult(-1);
		}
		SearchResult<RT> sr = searchAndCount(search);

		if (null == sr) {
			return ResultSet.emptyResultSet();
		}
		ResultSet<RT> rs = new ResultSet<RT>(sr, search);
		return rs;
	}

	@Override
	public List<T> list(Map<String, Object> params) {
		Search search = new Search();

		for (String key : params.keySet()) {
			search.addFilterEqual(key, params.get(key));
		}

		return this.search(search);
	}

	@Override
	public <RT> ResultSet<RT> list(Map<String, Object> params, Page page) {
		Search search = new Search();

		for (String key : params.keySet()) {
			search.addFilterEqual(key, params.get(key));
		}
		return this.query(search, page);
	}

	@Override
	public T get(ID id) {
		return find(id);
	}

	@Override
	public ID insert(T entity) {
		save(entity);
		return entity.getId();
	}

	@Override
	public void update(T entity) {
		save(entity);
	}

	@Override
	public boolean deleteById(ID id) {
		return removeById(id);
	}

	@Override
	public boolean delete(T entity) {
		return remove(entity);
	}

	@Override
	public List<T> list() {
		return findAll();
	}

	public <RT> ResultSet<RT> list(QueryCondition conditions, Page page) {

		Search search = assemblyQueryConditionToSearch(conditions);

		return this.query(search, page);

	}

	private Search assemblyQueryConditionToSearch(QueryCondition conditions) {
		Search search = new Search();
		
		if(null==conditions){
			return search;
		}
		
		
		if(null!=conditions.getFilters()){
			for (QueryFilter filter : conditions.getFilters()) {
				search.addFilter(new Filter(filter.getProperty(), filter.getValue(), filter.getOperator()));
			}
		}
		
		if(null!=conditions.getSort()){
		    Map<String, Integer> sortMap = conditions.getSort().getOrders();
			for (String key : sortMap.keySet()) {
				if(sortMap.get(key) == Sort.ORDER_ASC){
				    search.addSortAsc(key);
				} else{
				    search.addSortDesc(key);
				}
			}
		}
		

		return search;
	}
	
	
	

	/*********************************************************************************************************/

	@SuppressWarnings({ "hiding", "unchecked" })
	@Override
	public <T extends Object> T query(String hql, Object... values) {
		if (logger.isDebugEnabled()) {
			logger.debug("execute hql:[{}] the params is:[{}]", hql, ArrayUtils.toString(values));
		}
		return (T) QueryUtils.create(hql, this.getSession(), values).uniqueResult();
	}

	@SuppressWarnings({ "unchecked", "hiding" })
	@Override
	public <T extends Object> T query(String hql, String[] names, Object[] values) {
		if (logger.isDebugEnabled()) {
			logger.debug("execute hql:[{}] the params is:[{}] and values is:[{}]",
				hql,
				ArrayUtils.toString(names),
				ArrayUtils.toString(values));
		}
		return (T) QueryUtils.create(hql, this.getSession(), names, values).uniqueResult();
	}

	@Override
	public int execute(String hql, Object... values) {
		if (logger.isDebugEnabled()) {
			logger.debug("execute hql:[{}] the params is:[{}]", hql, ArrayUtils.toString(values));
		}

		return QueryUtils.create(hql, this.getSession(), values).executeUpdate();
	}

	@Override
	public int execute(String hql, String[] names, Object[] values) {
		if (logger.isDebugEnabled()) {
			logger.debug("execute hql:[{}] the params is:[{}] and values is:[{}]",
				hql,
				ArrayUtils.toString(names),
				ArrayUtils.toString(values));
		}
		return QueryUtils.create(hql, this.getSession(), names, values).executeUpdate();
	}

	/*********************************************************************************************************/

	/* 谨慎使用，这个函数有问题，没有办法及时回收数据库连接-王聪 2011-03-03，已经有地方调用了   没有办法删掉了
	 * 返回sql的一个结果集
	 * param：@return
	 * param：@throws DAOException
	 */
	 
}
