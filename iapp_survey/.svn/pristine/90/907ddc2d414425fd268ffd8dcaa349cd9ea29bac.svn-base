/**
 * project : portal-support
 * user created : songsp
 * date created : 2012-9-29 - 下午2:58:20
 */
package com.longtime.common.service;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import com.longtime.common.model.BaseModel;
import com.longtime.common.utils.Page;
import com.longtime.common.utils.QueryCondition;
import com.longtime.common.utils.ResultSet;

/**
 * @since 2012-9-29
 * @author songsp
 */
public interface BaseService<T extends BaseModel<ID>, ID extends Serializable> {

	T get(ID id);

	ID insert(T entity);

	void update(T entity);

	boolean deleteById(ID id);

	boolean delete(T entity);

	List<T> list();

	List<T> list(Map<String, Object> params);

	<RT> ResultSet<RT> list(Map<String, Object> params, Page page);
	
	
	/**
	 * @param conditions 查询条件 & 排序条件
	 * @param page 分页条件   null 表示不分页
	 * @return
	 */
	<RT> ResultSet<RT> list(QueryCondition  conditions , Page page);
	
	<RT> ResultSet<RT> list(QueryCondition  conditions );

}
