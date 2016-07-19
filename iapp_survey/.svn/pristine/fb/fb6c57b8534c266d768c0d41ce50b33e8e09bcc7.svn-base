package com.longtime.app.oplog.service;

import java.util.List;

import com.longtime.app.oplog.model.OpLog;
import com.longtime.common.service.BaseService;
import com.longtime.common.utils.Page;

public interface OpLogService extends BaseService<OpLog, String>{

	boolean isExist(String id, int type, String domain);

	List<OpLog> getNeedSyncList(String domain, Page page);

}
