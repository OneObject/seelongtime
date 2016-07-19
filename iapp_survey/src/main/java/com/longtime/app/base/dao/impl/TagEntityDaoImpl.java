package com.longtime.app.base.dao.impl;

import org.springframework.stereotype.Repository;

import com.longtime.app.base.dao.TagEntityDao;
import com.longtime.app.base.model.TagEntity;
import com.longtime.common.dao.BaseDAOImpl;

@Repository(value="tagEntityDaoImpl")
public class TagEntityDaoImpl extends BaseDAOImpl<TagEntity,String> implements TagEntityDao{

}
