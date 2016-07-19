package com.longtime.app.ixin.mgr.service;

import java.util.List;

import com.longtime.app.ixin.mgr.model.MessageRecordVO;
import com.longtime.common.utils.Page;

public interface MessageRecordService {

	void save(String fids, String currentUserId, String domain,int status);
	
	List<MessageRecordVO> list(String domain, Page page);

	int count(String domain);

	void save(String content, String contentType, String currentUserId,
			String domain, int status, String remark);
}
