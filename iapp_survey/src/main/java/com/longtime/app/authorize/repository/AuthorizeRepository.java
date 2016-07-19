/**
 * project : iapp
 * user created : yangwk
 * date created : 2013-9-16 - 下午3:02:52
 */
package com.longtime.app.authorize.repository;

import com.longtime.app.authorize.model.AuthorizeModel;
import com.myctu.platform.repository.engine.storage.mongo.repository.MongoRepository;

/**
 * @since 2013-9-16
 * @author yangwk
 * 
 */
public interface AuthorizeRepository extends MongoRepository<AuthorizeModel, String>{

}
