/**
 * project : iapp
 * user created : yangwk
 * date created : 2013-9-29 - 上午10:45:07
 */
package com.longtime.app.iask.repository.impl;

import org.springframework.stereotype.Repository;

import com.longtime.app.iask.model.CommentEntity;
import com.longtime.app.iask.repository.IAskCommentRepository;
import com.myctu.platform.repository.engine.storage.mongo.repository.BaseMongoCRUDRepository;

/**
 * @since 2013-9-29
 * @author yangwk
 * 
 */
@Repository("iAskCommentRepository")
public class IAskCommentRepositoryImpl extends BaseMongoCRUDRepository<CommentEntity, String> implements IAskCommentRepository{

}
