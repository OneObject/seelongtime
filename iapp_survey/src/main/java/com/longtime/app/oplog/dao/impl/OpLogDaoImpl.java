package com.longtime.app.oplog.dao.impl;

import org.springframework.stereotype.Component;

import com.longtime.app.oplog.dao.OpLogDao;
import com.longtime.app.oplog.model.OpLog;
import com.longtime.common.dao.BaseDAOImpl;

@Component("opLogDao")
public class OpLogDaoImpl extends BaseDAOImpl<OpLog, String> implements OpLogDao{

}
