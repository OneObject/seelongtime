/**
 * project : iapp
 * user created : yangwk
 * date created : 2013-9-29 - 上午10:45:07
 */
package com.longtime.app.iask.repository.impl;

import org.springframework.stereotype.Repository;

import com.longtime.app.iask.model.AnswerEntity;
import com.longtime.app.iask.repository.AnswerRepository;
import com.myctu.platform.repository.engine.storage.mongo.repository.BaseMongoCRUDRepository;

/**
 * @since 2013-9-29
 * @author yangwk
 * 
 */
@Repository("answerRepository")
public class AnswerRepositoryImpl extends BaseMongoCRUDRepository<AnswerEntity, String> implements AnswerRepository{

}
