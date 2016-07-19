/**
 * project : portal-support
 * user created : songsp
 * date created : 2012-9-28 - 下午4:34:54
 */
package com.longtime.common.dao;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import com.googlecode.genericdao.dao.hibernate.GenericDAO;
import com.googlecode.genericdao.search.ISearch;
import com.longtime.common.model.BaseModel;
import com.longtime.common.operation.HibernateOperation;
import com.longtime.common.utils.Page;
import com.longtime.common.utils.QueryCondition;
import com.longtime.common.utils.ResultSet;

/**
 * @since 2012-9-28
 * @author songsp
 */
public interface BaseDAO<T extends BaseModel<ID>, ID extends Serializable> extends GenericDAO<T, ID>{

	T get(ID id);

	ID insert(T entity);

	void update(T entity);

	boolean deleteById(ID id);

	boolean delete(T entity);

	List<T> list();

	int execute(String hql, Map<String, Object> params);

	int execute(String hql, List<Object> params);

	<R> R execute(HibernateOperation<R> operation);

	/**
	 * 通过hql 和条件查询 例: select entity from User entity where id=? and name=?
	 * 
	 * @param hql
	 * @param params
	 * @return
	 */
	List<T> list(String hql, Object... params);

	/**
	 * 分页条件在search中设置 例: search.setMaxResults(1); //每页条数 search.setPage(-1); // 第几页，从0开始
	 * 
	 * @param search
	 * @return
	 */
	<RT> ResultSet<RT> query(ISearch search);

	/**
	 * 根据page参数值进行分页查询[如果page为空或者page.page_size<1 将采用search中分页设置查询]
	 * 
	 * @param search
	 * @param page
	 * @return
	 */
	<RT> ResultSet<RT> query(ISearch search, Page page);

	List<T> list(Map<String, Object> params);

	<RT> ResultSet<RT> list(Map<String, Object> params, Page page);

	<RT> ResultSet<RT> list(QueryCondition conditions, Page page);

	
	/***********************************************************/
	<T extends Object> T query(String dslStr, Object... values);

	<T extends Object> T query(String dslStr, String[] names, Object[] values);

	int execute(String hql, Object... values);

	int execute(String hql, String[] names, Object[] values);
	
}
