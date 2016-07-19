package com.longtime.common.dao;

import com.longtime.common.model.search.ResultSet;
import com.longtime.common.model.search.Pageable;
import com.longtime.common.model.search.Search;
import java.util.List;
import java.util.Map;
import javax.sql.DataSource;
import java.io.Serializable;

public interface Repository<T, ID extends Serializable> {

    public static final String KEY_ID = "id";

    void setDataSource(DataSource dataSource);

    T findOne(ID id);

    int delete(ID id);

    ID insert(T entity);
    
    List<ID> insert(List<T> entitys);

    ID insert(Map<String, Object> rowMap);

    List<T> list(Search search);

    List<T> listAll();

    ResultSet<T> listAndCount(Search search, Pageable pageable);

    List<T> list(Search search, Pageable pageable);

    long count(Search search);

    long count();
    
    <R> List<R> query(String sql, Map<String, ?> paramMap, Class<R> returnType);

    List<Map<String, Object>> query(String sql, Map<String, ?> paramMap);
    
    
    int  update(String sql ,Map<String,?> paramMap);
    
    int  updateById(ID id , Map<String,?> paramMap);
    
    
    int update(T t);

}
