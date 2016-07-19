/**
 * project : platform-repository
 * user created : songsp
 * date created : 2012-2-3 - 下午12:58:08
 */
package com.longtime.common.mongo;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import com.myctu.platform.repository.engine.domain.Entity;
import com.myctu.platform.repository.engine.domain.query.Page;
import com.myctu.platform.repository.engine.domain.query.ResultSet;

/**
 * @since 2012-2-3
 * @author songsp
 */
public interface CommonService<T extends Entity<ID>, ID extends Serializable> {

	/**
	 * 新增记录
	 * 
	 * @param entity
	 * @return 返回新增记录id
	 */
	ID add(T entity);

	/**
	 * 根据id获取实体详情
	 * 
	 * @param id
	 * @return
	 */
	T loadById(ID id);

	/**
	 * 根据id删除实体(标记删除)
	 * 
	 * @param id
	 */
	void delById(ID id);

	/**
	 * 修改实体信息
	 * 
	 * @param entity 实体数据
	 */
	void update(T entity);

	//String echo(String msg,User user);

	/**
	 * 动态查询
	 * 
	 * @param query 查询条件、排序条件、分页条件
	 * @return
	 */
	//List<T> list(QueryDTO query);

	/**
	 * 动态查询结果数
	 * 
	 * @param query 查询条件 [将忽略分页条件]
	 * @return
	 */
	//long count(QueryDTO query);

	/**
	 * 动态查询
	 * 
	 * @param query QueryDTO.toMap()
	 * @return
	 */
	List<T> list(Map<String, Object> query);
	
	/**
	 * 动态查询，返回带分页信息的对象集合
	 * @param query 如果设置了分页条件将被page分页条件覆盖
	 * @param page
	 * @return
	 */
	ResultSet<T> listByPage(Map<String,Object> query,Page page);

	/**
	 * 动态查询结果数
	 * 
	 * @param query QueryDTO.toMap() 查询条件 [将忽略分页条件]
	 * @return
	 */
	long count(Map<String, Object> query);
	
	
	/**
	 * 获取信息，忽略标记删除状态
	 * @param id
	 * @return
	 */
	T loadByIdIgnoreDel(ID id);
}
