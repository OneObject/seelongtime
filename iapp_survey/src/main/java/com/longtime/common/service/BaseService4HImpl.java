/**
 * project : portal-support
 * user created : songsp
 * date created : 2012-9-29 - 下午3:11:57
 */
package com.longtime.common.service;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.longtime.common.dao.BaseDAO;
import com.longtime.common.model.BaseModel;
import com.longtime.common.utils.Page;
import com.longtime.common.utils.QueryCondition;
import com.longtime.common.utils.ResultSet;

/**
 * @since 2012-9-29
 * @author songsp
 */
public abstract class BaseService4HImpl<T extends BaseModel<ID>, ID extends Serializable> implements BaseService<T, ID> {

	protected Logger logger = LoggerFactory.getLogger(this.getClass());

	public abstract BaseDAO<T, ID> getDAO();

	public T get(ID id) {
		
		return this.getDAO().get(id);
	}

	public ID insert(T entity) {

		this.getDAO().insert(entity);
		return entity.getId();
	}

	public void update(T entity) {
		this.getDAO().update(entity);
	}

	public boolean deleteById(ID id) {
		return this.getDAO().deleteById(id);
	}

	public boolean delete(T entity) {
		return this.getDAO().delete(entity);
	}

	public List<T> list() {
		return this.getDAO().list();
	}

	public List<T> list(Map<String, Object> params) {

		return this.getDAO().list(params);
	}

	public <RT> ResultSet<RT> list(Map<String, Object> params, Page page) {

		return this.getDAO().list(params, page);

	}
	
	
	public <RT> ResultSet<RT> list(QueryCondition  conditions , Page page){
	    
		return this.getDAO().list(conditions, page);
		
	}
	
	public <RT> ResultSet<RT> list(QueryCondition  conditions ){
		
		return list(conditions,null);
	}
	

}
