package com.longtime.common.dao.mysql;

import com.longtime.common.model.Entity;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.apache.commons.lang3.Validate;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.jdbc.support.KeyHolder;

public class SpringJdbcAutoIncIdRepositoryImpl<T extends Entity<Long>> extends SpringJdbcRepositoryImpl<T, Long> {

    protected SimpleJdbcInsert jdbcInsertAutoId;

    public SpringJdbcAutoIncIdRepositoryImpl(Class<T> clazz){
        super(clazz);
    }

    public SpringJdbcAutoIncIdRepositoryImpl(Class<T> clazz, DataSource dataSource){
       this(clazz,dataSource,null);
    }
    public SpringJdbcAutoIncIdRepositoryImpl(Class<T> clazz, DataSource dataSource,String tableName){
        super(clazz, dataSource,tableName);
        this.jdbcInsertAutoId = new SimpleJdbcInsert(dataSource).withTableName(this.getTableName()).usingGeneratedKeyColumns("id");
        this.jdbcInsertAutoId.compile();
    }

    @Override
    public Long insert(T entity) {
        KeyHolder keyHolder = jdbcInsertAutoId.executeAndReturnKeyHolder(new BeanPropertySqlParameterSource(entity));
        Long id =  (Long) keyHolder.getKey();
        entity.setId(id);
        return id;
    }
    @Override
    public Long insert(Map<String,Object> rowMap){
        Long id =  (Long) jdbcInsertAutoId.executeAndReturnKey(rowMap);
        return id;
    }
    
    @Override
    public List<Long> insert(List<T> entitys){
    	Validate.notNull(entitys, "insert data  must not null.data=[{}]");
    	int size = entitys.size();
    	//Long[] ids = new Long[size];
    	List<Long> ids = new ArrayList<Long>(size);
    	for(int i=0;i<size;i++){
    		ids.add(this.insert(entitys.get(i)));
    	}
    	return ids;
    	
    }

}
