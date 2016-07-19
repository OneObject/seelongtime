package com.longtime.app.ixin.mgr.utils;

import java.beans.PropertyDescriptor;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

/**
 * 
 * @author 陈克锋
 *
 */
public class DBUtils {
	private static final Logger logger = LoggerFactory.getLogger(DBUtils.class);

	/**
	 * 例如：一个JavaBean Person [person为传递进来的Person对象] 字段有 private String id,private String name <br>
	 * 		对应表为 person 字段为 id，name
	 *      忽略字段为 name
	 *      生成的sql 语句为 insert into 'tableName' (id) value (?)
	 *      生成的insertVals 为List 类型 [person.getId()]
	 *      
	 * @param entity service传递进来需要保存的对象
	 * @param tableName  表名
	 * @param ignoreColumns 那些字段不需要插入
	 * @return sql 生成的sql语句
	 * 		   insertVals 生成的体替代？的字段值
	 * 		   timeConsuming 耗时长
	 */
	public static <T> Map<String,Object> getInsertSql(T entity,String tableName,List<String> ignoreColumns){
		Map<String,Object> map = new HashMap<String, Object>();
		List<Object> insertVals = new ArrayList<Object>();
		long statTime = System.currentTimeMillis();
		try{
			StringBuffer sqlBuffer = new StringBuffer("insert into ");
			sqlBuffer.append(tableName).append(" (");
			StringBuffer valueBuffer = new StringBuffer(" value (");
			
			Field[] fields = entity.getClass().getDeclaredFields();
			PropertyDescriptor descriptor = null;
			for (Field field : fields) {
				if(ignoreColumns!=null && ignoreColumns.contains(field.getName())){
					continue;
				}
				if(Modifier.isStatic(field.getModifiers())){ //属性是static类型
					continue;
				}
				descriptor = new PropertyDescriptor(field.getName(), entity.getClass());
				sqlBuffer.append(field.getName()).append(',');
				valueBuffer.append('?').append(',');
				insertVals.add(descriptor.getReadMethod().invoke(entity));
			}
			sqlBuffer.replace(sqlBuffer.length()-1, sqlBuffer.length(), ")").append((valueBuffer.replace(valueBuffer.length()-1, valueBuffer.length(), ")")));
			map.put("sql", sqlBuffer.toString());
			map.put("insertVals", insertVals);
			map.put("timeConsuming", System.currentTimeMillis()-statTime);
		}catch(Exception e){
			logger.debug("get insert sql failure.");
		}
		return map;
	}
	
	/**
	 * 
	 * @param entity
	 * @param tableName
	 * @param ignoreColumns
	 * @param whereColumn 条件字段
	 * @return sql ,updateVals ,timeConsuming
	 */
	public static <T> Map<String, Object> getUpdateSql(T entity,
			String tableName, List<String> ignoreColumns,String whereColumn) {
		Map<String,Object> map = new HashMap<String, Object>();
		List<Object> updateVals = new ArrayList<Object>();
		long statTime = System.currentTimeMillis();
		try{
			StringBuffer sqlBuffer = new StringBuffer("update ");
			sqlBuffer.append(tableName).append(" set");
			
			Field[] fields = entity.getClass().getDeclaredFields();
			PropertyDescriptor descriptor = null;
			for (Field field : fields) {
				if(ignoreColumns!=null && ignoreColumns.contains(field.getName())){
					continue;
				}
				//排除静态属性
				if(Modifier.isStatic(field.getModifiers())){
					continue;
				}
				
				descriptor = new PropertyDescriptor(field.getName(), entity.getClass());
				sqlBuffer.append(" ").append(field.getName()).append("=").append("?,");
				updateVals.add(descriptor.getReadMethod().invoke(entity));
			}
			map.put("sql", sqlBuffer.replace(sqlBuffer.length()-1, sqlBuffer.length(), " where ").append(whereColumn).append("=?").toString());
			descriptor = new PropertyDescriptor(whereColumn, entity.getClass());
			updateVals.add(descriptor.getReadMethod().invoke(entity));
			map.put("updateVals", updateVals);
			map.put("timeConsuming", System.currentTimeMillis()-statTime);
		}catch(Exception e){
			e.printStackTrace();
			logger.debug("get insert sql failure.");
		}
		return map;
	}
	
	/**
	 * 得到记录总数
	 * @param sql
	 * @return
	 */
	public static int getCount(String sql,JdbcTemplate jdbcTemplate,Object...reqVal){
		List<Integer> list = jdbcTemplate.query(sql, reqVal ,new RowMapper<Integer>(){
			@Override
			public Integer mapRow(ResultSet rs, int rowNum) throws SQLException {
				
				return rs.getInt(1);
			}
		});
		if(list!=null && list.size()>0){
			return list.get(0);
		}
		return 0;
	}
	/**
	 * 
	 * @param obj
	 * @param sql
	 * @param jdbcTemplate
	 * @param params
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static <T> List<T> queryList(final T obj,String sql,JdbcTemplate jdbcTemplate,Object...params){
		try {
			return jdbcTemplate.query(sql, params,new RowMapper<T>(){
				@Override
				public T mapRow(ResultSet rs, int rowNum) throws SQLException {
					try{
						Constructor<T> c = (Constructor<T>)obj.getClass().getConstructor();
						T returnObj = c.newInstance();
						Field[] fields = obj.getClass().getDeclaredFields();
						PropertyDescriptor descriptor = null;
						for (Field field : fields) {
							if(Modifier.isStatic(field.getModifiers())){ //属性是static类型
								continue;
							}
							descriptor = new PropertyDescriptor(field.getName(), returnObj.getClass());
							descriptor.getWriteMethod().invoke(returnObj, rs.getObject(field.getName()));
						}
						return returnObj;
					}catch(Exception e){
						throw new RuntimeException("error.");
					}
				}
			});
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static void main(String[] args)throws Exception {
		
		queryList(new String(), null, null);
		
	}

}
