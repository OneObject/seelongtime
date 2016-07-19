/**
 * project : iapp
 * user created : yangwk
 * date created : 2013-9-29 - 上午10:45:07
 */
package com.longtime.app.iask.repository.impl;

import org.springframework.stereotype.Repository;

import com.longtime.app.iask.model.QuestionEntity;
import com.longtime.app.iask.repository.QuestionRepository;
import com.myctu.platform.repository.engine.storage.mongo.repository.BaseMongoCRUDRepository;

/**
 * @since 2013-9-29
 * @author yangwk
 * 
 */
@Deprecated
@Repository("iaskQuestionRepository")
public class QuestionRepositoryImpl extends BaseMongoCRUDRepository<QuestionEntity, String> implements QuestionRepository{

}
