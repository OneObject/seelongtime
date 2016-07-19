package com.longtime.common.service;

import com.longtime.common.dao.Repository;
import com.longtime.common.model.Entity;
import com.longtime.common.model.search.Pageable;
import com.longtime.common.model.search.ResultSet;
import com.longtime.common.model.search.Search;
import java.io.Serializable;
import java.util.List;
import java.util.Map;



public abstract class BaseServiceImpl<T extends Entity<ID>, ID extends Serializable> implements IService<T, ID> {

   // protected Repository<T, ID> repository;


    public abstract Repository<T, ID> getRepository();

    public T findOne(ID id) {
        return getRepository().findOne(id);
    }

    @Override
    public int delete(ID id) {
        return getRepository().delete(id);
    }

    @Override
    public ID insert(T entity) {
        return getRepository().insert(entity);
    }

    @Override
    public ID insert(Map<String, Object> rowMap) {
        return getRepository().insert(rowMap);
    }

    @Override
    public List<T> list(Search search) {
        return getRepository().list(search);
    }

    @Override
    public List<T> listAll() {
        return getRepository().listAll();
    }

    @Override
    public ResultSet<T> listAndCount(Search search, Pageable pageable) {
        return getRepository().listAndCount(search, pageable);
    }

    @Override
    public List<T> list(Search search, Pageable pageable) {
        return getRepository().list(search, pageable);
    }

    @Override
    public long count(Search search) {
        return getRepository().count(search);
    }

    @Override
    public long count() {
        return getRepository().count();
    }
    
    @Override
    public  int update(T t){
    	return getRepository().update(t);
    }

}
