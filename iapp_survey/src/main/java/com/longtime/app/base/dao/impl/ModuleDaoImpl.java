package com.longtime.app.base.dao.impl;

import org.springframework.stereotype.Repository;

import com.longtime.app.base.dao.ModuleDao;
import com.longtime.app.base.model.ModuleEntity;
import com.longtime.common.dao.BaseDAOImpl;
@Repository("moduleDao")
public class ModuleDaoImpl extends BaseDAOImpl<ModuleEntity, String> implements ModuleDao {
}
