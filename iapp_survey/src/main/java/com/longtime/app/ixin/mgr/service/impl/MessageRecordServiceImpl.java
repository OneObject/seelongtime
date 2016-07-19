package com.longtime.app.ixin.mgr.service.impl;

import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.longtime.app.ixin.mgr.dao.MessageRecordDao;
import com.longtime.app.ixin.mgr.model.MessageRecordVO;
import com.longtime.app.ixin.mgr.service.MessageRecordService;
import com.longtime.app.util.IdGenerator;
import com.longtime.common.utils.Page;

@Service("messageRecordService")
public class MessageRecordServiceImpl implements MessageRecordService {

	@Resource(name = "messageRecordDao")
	private MessageRecordDao messageRecordDao;

	/**
	 * 
	 */
	@Override
	public void save(String fids, String currentUserId, String domain,int status) {
		String id = UUID.randomUUID().toString().replaceAll("-", "");
		messageRecordDao.save(id, fids, currentUserId,
				System.currentTimeMillis(), domain,status);
	}

	@Override
	public List<MessageRecordVO> list(String domain,Page page) {
		List<MessageRecordVO> list = messageRecordDao.list(domain,page);
		return list;
	}
	@Override
	public int count(String domain) {
		return messageRecordDao.count(domain);
	}
	
	@Override
	public void save(String content, String contentType, String currentUserId,
			String domain, int status,String remark) {
		String id = IdGenerator.nextId32().toString();
		messageRecordDao.save(id,content, contentType, currentUserId,
				System.currentTimeMillis(), domain,status,remark);
	}
}