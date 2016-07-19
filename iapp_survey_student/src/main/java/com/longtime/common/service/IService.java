package com.longtime.common.service;

import com.longtime.common.model.Entity;

import com.longtime.common.model.search.ResultSet;
import com.longtime.common.model.search.Pageable;
import com.longtime.common.model.search.Search;
import com.longtime.common.dao.Repository;
import java.io.Serializable;
import java.util.List;
import java.util.Map;

public interface IService<T extends Entity<ID>, ID extends Serializable> {

    Repository<T, ID> getRepository();

    T findOne(ID id);

    int delete(ID id);

    ID insert(T entity);

    ID insert(Map<String, Object> rowMap);

    List<T> list(Search search);

    List<T> listAll();

    ResultSet<T> listAndCount(Search search, Pageable pageable);

    List<T> list(Search search, Pageable pageable);

    long count(Search search);

    long count();
    int update(T t);

}
