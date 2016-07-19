package com.longtime.app.ixin.mgr.dao;

import java.util.List;

import com.longtime.app.ixin.mgr.model.MessageRecordVO;
import com.longtime.common.utils.Page;

public interface MessageRecordDao {

	void save(String id, String fids, String currentUserId,
			long currentTimeMillis, String domain,int status);

	List<MessageRecordVO> list(String domain, Page page);

	int count(String domain);

	void save(String id, String content, String contentType,
			String currentUserId, long currentTimeMillis, String domain,
			int status,String remark);

}
