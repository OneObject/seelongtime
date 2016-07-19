package com.longtime.common.dao.mysql;

import com.google.common.collect.Lists;

import org.apache.commons.beanutils.PropertyUtils;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.apache.commons.collections.MapUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.Validate;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcOperations;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;

import com.google.common.base.Joiner;
import com.longtime.common.dao.Repository;
import com.longtime.common.model.Entity;
import com.longtime.common.model.search.Pageable;
import com.longtime.common.model.search.ResultSet;
import com.longtime.common.model.search.Search;
import com.longtime.common.utils.BeanUtils;
public class SpringJdbcRepositoryImpl<T extends Entity<ID>, ID extends Serializable> implements Repository<T, ID> {

    protected NamedParameterJdbcTemplate namedParameterJdbcTemplate;
    private SimpleJdbcInsert             jdbcInsert;

    protected DataSource                 dataSource;

    private String                       tableName;

    public SpringJdbcRepositoryImpl(Class<T> clazz){
        this.clazz = clazz;
        // this.clazz = GenericUtils.getSuperClassGenricType(this.getClass());
    }

    public SpringJdbcRepositoryImpl(Class<T> clazz, DataSource dataSource){
        this(clazz, dataSource, null);
    }

    public SpringJdbcRepositoryImpl(Class<T> clazz, DataSource dataSource, String tableName){
        this.clazz = clazz;
        this.tableName = StringUtils.isBlank(tableName) ? clazz.getSimpleName().toLowerCase() : tableName;
        this.setDataSource(dataSource);
    }

    public void setDataSource(DataSource dataSource) {
        this.dataSource = dataSource;
        namedParameterJdbcTemplate = new NamedParameterJdbcTemplate(this.dataSource);
        this.jdbcInsert = new SimpleJdbcInsert(dataSource).withTableName(this.getTableName());
        this.jdbcInsert.compile();
    }

    @Override
    public T findOne(ID id) {
        String table = this.getTableName();
        String sql = "select * from " + table + " where id=:id";
        Map<String, ID> paramMap = Collections.singletonMap("id", id);
        try {
            return namedParameterJdbcTemplate.queryForObject(sql, paramMap,
                                                             ParameterizedBeanPropertyRowMapper.newInstance(clazz));
        } catch (EmptyResultDataAccessException e) {
            return null;
        }

    }

    @Override
    public int delete(ID id) {
        String table = this.getTableName();
        String sql = "delete from " + table + " where id=:id";
        return namedParameterJdbcTemplate.update(sql, Collections.singletonMap("id", id));
    }

    @Override
    public ID insert(T entity) {
        Validate.notNull(entity.getId(), "insert data id must set value.data=[{}]", entity);
        jdbcInsert.execute(new BeanPropertySqlParameterSource(entity));
        return entity.getId();
    }
    
  
	@Override
    public List<ID> insert(List<T> entitys){
    	Validate.notNull(entitys, "insert data  must not null.data=[{}]");
    	int size = entitys.size();
    	for(int i=0;i<size;i++){
    		Validate.notNull(entitys.get(i).getId(), "insert data id must set value.data=[{}]", entitys.get(i).getId());
    	}
    	List<ID> ids = new ArrayList<ID>(size);
    	BeanPropertySqlParameterSource[] data = new BeanPropertySqlParameterSource[size];
    	
    	for(int i=0;i<size;i++){
    		data[i] = new BeanPropertySqlParameterSource(entitys.get(i));
    		ids.add(entitys.get(i).getId());
    	}
    	jdbcInsert.executeBatch(data);
    	
    	return ids;
    	
    }

    @Override
    @SuppressWarnings("unchecked")
    public ID insert(Map<String, Object> rowMap) {
        Validate.isTrue(null != rowMap && null != rowMap.get(KEY_ID), "insert data and id must not null. data=[{}]",
                        rowMap);
        jdbcInsert.execute(rowMap);
        return (ID) rowMap.get(KEY_ID);
    }

    @SuppressWarnings({ "unchecked", "rawtypes" })
    @Override
    public <R> List<R> query(String sql, Map<String, ?> paramMap, Class<R> returnType) {
        return namedParameterJdbcTemplate.query(sql, new MapSqlParameterSource(paramMap),
                                                new BeanPropertyRowMapper(returnType));
    }

    @Override
    public List<Map<String, Object>> query(String sql, Map<String, ?> paramMap) {
        return namedParameterJdbcTemplate.queryForList(sql, paramMap);
    }

    @Override
    public List<T> list(Search search) {
        return this.list(search, null);
    }

    @Override
    @SuppressWarnings({ "unchecked", "rawtypes" })
    public List<T> listAll() {
        String sql = "select * from " + this.getTableName();
        return namedParameterJdbcTemplate.query(sql, Collections.EMPTY_MAP, new BeanPropertyRowMapper(this.clazz));
    }

    @Override
    public ResultSet<T> listAndCount(Search search, Pageable pageable) {
        List<T> list = list(search, pageable);
        long total = count(search);
        ResultSet<T> rs = new ResultSet<T>(list, pageable, total);
        return rs;
    }

    @Override
    @SuppressWarnings({ "unchecked", "rawtypes" })
    public List<T> list(Search search, Pageable pageable) {
        if (null == search) {
            return listAll();
        }
        String sql = SearchUtil.generateSQL(null, this.getTableName(), search, pageable);
        Map<String, Object> paramMap = SearchUtil.generateParamMap(search);
        return namedParameterJdbcTemplate.query(sql, paramMap, new BeanPropertyRowMapper(this.clazz));
    }

    @Override
    public long count(Search search) {
        if (null == search) {
            return this.count();
        }
        String sql = SearchUtil.generateCountSQL(null, this.getTableName(), search, null);
        Map<String, Object> paramMap = SearchUtil.generateParamMap(search);
        return namedParameterJdbcTemplate.queryForObject(sql, paramMap, Long.class);
    }

    @Override
    public int update(String sql, Map<String, ?> paramMap) {
        return namedParameterJdbcTemplate.update(sql, paramMap);
    }

    @Override
    public int updateById(ID id, Map<String, ?> paramMap) {
        if (null == id || MapUtils.isEmpty(paramMap)) {
            return 0;
        }
        if (paramMap.containsKey(KEY_ID)) {
            paramMap.remove(KEY_ID);
        }
        List<String> sets = new ArrayList<String>(paramMap.size());
        for (String key : paramMap.keySet()) {
            sets.add(String.format(" %s=:%s ", key, key));
        }

        //String idStr = NumberUtils.isNumber(String.valueOf(id)) ? String.valueOf(id) : String.format("'%s'", id);
        String idStr = (id instanceof Number) ? String.valueOf(id):String.format("'%s'", id);
        
        String sql_set = Joiner.on(",").join(sets);
        String sql = String.format("update %s set %s where id=%s", this.getTableName(), sql_set, idStr);
        return this.update(sql, paramMap);
    }

    @Override
    public int update(T t) {

        if (null == t || null == t.getId()) {
            return 0;
        }
        Map<String, Object> map = BeanUtils.toMap(t);
        
        //过滤没有写的属性
        List<String> delkeys = Lists.newArrayList();
        for (String key :  map.keySet()) {
	       	if( !PropertyUtils.isWriteable(t, key)){
	       		 delkeys.add(key);
	       	}
		}
        for (String key : delkeys) {
			map.remove(key);
		}
        
        return this.updateById(t.getId(), map);
    }

    @Override
    @SuppressWarnings("unchecked")
    public long count() {
        String sql = "select count(*) from " + this.getTableName();
        return namedParameterJdbcTemplate.queryForObject(sql, Collections.EMPTY_MAP, Long.class);
    }

    public NamedParameterJdbcOperations getNamedParameterJdbcTemplate() {
        return namedParameterJdbcTemplate;
    }

    protected String getTableName() {
        return this.tableName;
    }

    protected Class<T> clazz;
    
}
