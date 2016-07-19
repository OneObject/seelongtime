/**
 * project : iapp
 * user created : yangwk
 * date created : 2013-9-16 - 下午3:03:24
 */
package com.longtime.app.authorize.repository.impl;

import org.springframework.stereotype.Repository;

import com.longtime.app.authorize.model.AuthorizeModel;
import com.longtime.app.authorize.repository.AuthorizeRepository;
import com.myctu.platform.repository.engine.storage.mongo.repository.BaseMongoCRUDRepository;

/**
 * @since 2013-9-16
 * @author yangwk
 * 
 */
@Repository("authorizeRepository")
public class AuthorizeRepositoryImpl extends BaseMongoCRUDRepository<AuthorizeModel, String> implements AuthorizeRepository{

}
