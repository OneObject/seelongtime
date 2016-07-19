package com.longtime.app.mobile.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Order;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Service;

import com.longtime.app.mobile.model.Mobile;
import com.longtime.app.mobile.repository.MobileRepository;
import com.longtime.app.mobile.service.MobileService;
import com.longtime.common.mongo.AbstractService;
import com.myctu.platform.repository.engine.storage.mongo.repository.MongoRepository;

@Service("mobileService")
public class MobileServiceImpl extends AbstractService<Mobile, String> implements MobileService{

	@Resource
	private MobileRepository mobileRepository;
	@Override
	public MongoRepository<Mobile, String> getMongoRepository() {
		
		return mobileRepository;
	}
	@Override
	public Mobile findCurrentVersion(String device, String version,
			String domain) {
		Query query = new Query();
		query.addCriteria(Criteria.where("version").is(version).and("domain").is(domain).and("device").is(device));
		List<Mobile> list = mobileRepository.find(query);
		if(CollectionUtils.isEmpty(list)){
			return null;
		}
		return list.get(0);
	}
	
	@Override
	public Mobile findCurrentVersion(String device, String version) {
		Query query = new Query();
		query.addCriteria(Criteria.where("version").is(version).and("device").is(device));
		List<Mobile> list = mobileRepository.find(query);
		if(CollectionUtils.isEmpty(list)){
			return null;
		}
		return list.get(0);
	}
	
	@Override
	public List<Mobile> list(String domain, String device) {
		Query query = new Query();
		query.addCriteria(Criteria.where("domain").is(domain).and("device").is(device));
		query.sort().on("version", Order.DESCENDING);
		List<Mobile> list = mobileRepository.find(query);
		return list;
	}
	
	@Override
	public List<Mobile> list(String device) {
		Query query = new Query();
		query.addCriteria(Criteria.where("device").is(device));
		query.sort().on("version", Order.DESCENDING);
		List<Mobile> list = mobileRepository.find(query);
		return list;
	}
}
