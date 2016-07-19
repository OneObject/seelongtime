/**
 * project : iapp
 * user created : yangwk
 * date created : 2013-9-16 - 下午3:01:08
 */
package com.longtime.app.authorize.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Service;

import com.longtime.app.authorize.model.AuthorizeModel;
import com.longtime.app.authorize.repository.AuthorizeRepository;
import com.longtime.app.authorize.service.AuthorizeService;
import com.longtime.common.mongo.AbstractService;
import com.myctu.platform.repository.engine.storage.mongo.repository.MongoRepository;

/**
 * @since 2013-9-16
 * @author yangwk
 * 
 */
@Service("authorizeServiceMongo")
public class AuthorizeServiceMongoImpl extends AbstractService<AuthorizeModel, String> implements AuthorizeService{

	@Resource(name = "authorizeRepository")
	private AuthorizeRepository authorizeRepository;
	
	@Override
	public MongoRepository<AuthorizeModel, String> getMongoRepository() {
		return authorizeRepository;
	}

	@Override
	public void addAuth(String sid, String params, String type,String category) {
		String[] array = params.split(";");
		for(String param : array){
			if(StringUtils.isBlank(param)){
				continue;
			}
			String[] items = param.split(",");
			AuthorizeModel auth = new AuthorizeModel();
			auth.setSid(sid);
			auth.setRid(items[0]);
			if(items.length>1){
				auth.setRname(items[1]);
			}
			auth.setType(Integer.valueOf(type));
			auth.setCategory(Integer.valueOf(category));
			this.authorizeRepository.save(auth);
		}
		
	}

	@Override
	public List<AuthorizeModel> listAuth(String sid, int type,int category,String rname) {
		Query query = new Query();
		query.addCriteria(Criteria.where("sid").is(sid));
		query.addCriteria(Criteria.where("type").is(type));
		
		if(StringUtils.isNotBlank(rname)){
			query.addCriteria(Criteria.where("rname").is(rname));
		}
		
		return this.authorizeRepository.find(query);
	}

	@Override
	public void delByIds(String ids) {
		String[] idArray = ids.split(",");
		for(String id : idArray){
			this.authorizeRepository.delete(id);
		}
	}
	
	
	
	
}
