package com.longtime.app.base.dao.impl;

import org.springframework.stereotype.Repository;

import com.longtime.app.base.dao.AttachmentDao;
import com.longtime.app.base.model.AttachmentEntity;
import com.longtime.common.dao.BaseDAOImpl;

@Repository("attachmentDao")
public class AttachmentDaoImpl extends  BaseDAOImpl<AttachmentEntity, String> implements AttachmentDao{

}
