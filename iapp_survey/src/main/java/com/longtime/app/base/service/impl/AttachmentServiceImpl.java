package com.longtime.app.base.service.impl;


import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.longtime.app.base.dao.AttachmentDao;
import com.longtime.app.base.model.AttachmentEntity;
import com.longtime.app.base.service.AttachmentService;
import com.longtime.common.dao.BaseDAO;
import com.longtime.common.service.BaseService4HImpl;

@Service(value="attachmentService")
public class AttachmentServiceImpl extends BaseService4HImpl<AttachmentEntity, String> implements AttachmentService {
	
	@Resource
    private AttachmentDao attachmentDao;
    
	@Override
	public BaseDAO<AttachmentEntity, String> getDAO() {
		return attachmentDao;
	}

}
