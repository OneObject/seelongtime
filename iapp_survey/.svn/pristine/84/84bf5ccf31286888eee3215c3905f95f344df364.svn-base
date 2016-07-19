/**
 * project : platform-repository
 * user created : songsp
 * date created : 2012-2-3 - 下午1:08:43
 */
package com.longtime.common.mongo;

import java.io.Serializable;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import org.springframework.data.mongodb.core.query.Query;

import com.longtime.app.util.PageQueryUtils;
import com.myctu.platform.gateway.agent.query.QueryDTO;
import com.myctu.platform.repository.engine.domain.Entity;
import com.myctu.platform.repository.engine.domain.query.ExtQuery;
import com.myctu.platform.repository.engine.domain.query.Page;
import com.myctu.platform.repository.engine.domain.query.ResultSet;
import com.myctu.platform.repository.engine.storage.mongo.repository.MongoRepository;

/**
 * @since 2012-2-3
 * @author songsp
 */
public abstract class AbstractService<T extends Entity<ID>, ID extends Serializable> implements CommonService<T, ID> {

	public abstract MongoRepository<T, ID> getMongoRepository();

	@Override
	public ID add(T entity) {
		this.getMongoRepository().save(entity);
		return entity.getId();
	}

	@Override
	public T loadById(ID id) {
		return this.getMongoRepository().findOne(id);
	}

	@Override
	public void delById(ID id) {
		this.getMongoRepository().delete(id);
	}

	@Override
	public void update(T entity) {
		this.getMongoRepository().update(entity);

	}

	/**
	 * 动态查询
	 * 
	 * @param query 查询条件、排序条件、分页条件
	 * @return
	 */
	protected List<T> list(QueryDTO query) {
		if (null == query) {
			return Collections.emptyList();
		}
		return this.list(query.toMap());
	}

	/**
	 * 动态查询结果数
	 * 
	 * @param query 查询条件 [将忽略分页条件]
	 * @return
	 */
	protected long count(QueryDTO query) {
		if (null == query) {
			return 0L;
		}
		return this.count(query.toMap());
	}

	@Override
	public List<T> list(Map<String, Object> query) {
		if (null == query) {
			return Collections.emptyList();
		}
		
		Query q = ExtQuery.valueOf(query);
		
		return this.getMongoRepository().find(q);
	}
	
	@Override
	public ResultSet<T> listByPage(Map<String,Object> query,Page page){
		return PageQueryUtils.listByPage(query, page, this.getMongoRepository());
	}

	@Override
	public long count(Map<String, Object> query) {
		if (null == query) {
			return 0L;
		}
		return this.getMongoRepository().count(ExtQuery.valueOf(query));
	}

	
	 /**
	 * 获取信息，忽略标记删除状态
	 * @param id
	 * @return
	 */
	@Override
	public T loadByIdIgnoreDel(ID id){
		if(null==id){
			return null;
		}
		return this.getMongoRepository().findOneIgnoreDel(id);
	}
}
