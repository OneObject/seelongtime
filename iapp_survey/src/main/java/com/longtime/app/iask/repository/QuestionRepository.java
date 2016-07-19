/**
 * project : iapp
 * user created : yangwk
 * date created : 2013-9-29 - 上午10:45:07
 */
package com.longtime.app.iask.repository;

import com.longtime.app.iask.model.QuestionEntity;
import com.myctu.platform.repository.engine.storage.mongo.repository.MongoRepository;

/**
 * @since 2013-9-29
 * @author yangwk
 * 
 */
public interface QuestionRepository extends MongoRepository<QuestionEntity, String>{

}
