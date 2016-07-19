package com.longtime.app.base.service;

import com.longtime.app.base.model.Comment;
import com.longtime.common.service.BaseService;

public interface CommentService extends BaseService<Comment, Long>{

	int countByResid(String id, int restype);
}
