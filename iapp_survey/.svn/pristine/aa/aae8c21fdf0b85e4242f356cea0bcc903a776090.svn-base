package com.longtime.app.ixin.mgr.survey.service.impl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.jongo.Jongo;
import org.jongo.MongoCollection;
import org.jongo.MongoCursor;
import org.springframework.stereotype.Service;

import com.longtime.app.ixin.mgr.survey.model.Survey;
import com.longtime.app.ixin.mgr.survey.service.SurveyService;
import com.longtime.app.util.Constant;
import com.longtime.app.util.IdGenerator;
import com.longtime.common.utils.Page;
import com.mongodb.WriteResult;

@Service("surveyService")
public class SurveyServiceImpl implements SurveyService{
	
	 @Resource(name = "jongo")
	 private Jongo jongo ;
	 
	 private static MongoCollection coll;
	 
	 @PostConstruct
	 private void init(){
		 coll =  jongo.getCollection(Constant.COLLECTION_SURVEY);
	 }

	@Override
	public boolean add(Survey survey) {
		if(StringUtils.isBlank(survey.getId())){
			survey.setId(IdGenerator.nextId32().toString());
		}
		coll.insert(survey);
		Survey survey2 = findById(survey.getId(), survey.getDomain());
		if (survey2!=null) {
			return true;
		}
		return false;
	}

	@Override
	public long count(String query) {
		return coll.count(query);
	}

	@Override
	public long distinctCount(String key, String query) {
		List<Object> distincts = coll.distinct(key).query(query).as(Object.class);
		if(CollectionUtils.isEmpty(distincts)){
			return 0L;
		}
		return distincts.size();
	}

	@Override
	public Survey findById(String id,String domain) {
		
		Survey survey = coll.findOne("{id:#,domain:#}",id,domain).as(Survey.class);
		
		return survey;
	}

	@Override
	public boolean update(Survey survey,String domain) {
		WriteResult result = coll.update("{id:#,domain:#}",survey.getId(),domain).with(survey);
		if (result.getN()>0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean delete(String id,String domain) {
		WriteResult result = coll.update("{id:#,domain:#}", id,domain).with("{$set:{isdel:1}}");
		if (result.getN()>0) {
			return true;
		}
		return false;
	}

	@Override
	public List<Survey> findByPage(String domain, Page page) {
		
		int skip = (page.getCurrent_page()-1)*page.getPage_size();
		List<Survey> list = new ArrayList<Survey>();
		MongoCursor<Survey> cursor = coll.find("{domain:#,isdel:#}",domain,0).limit(page.getPage_size()).skip(skip).as(Survey.class);
		long count = coll.count("{domain:#,isdel:#}",domain,0);
		for (Iterator<Survey> iter = cursor.iterator();iter.hasNext();) {
			list.add(iter.next());
		}
		page.setTotal_size((int)count);
		return list;
	}

	@Override
	public boolean verifyUniqueness(String id, String title) {
		long result = coll.count("{id:{$ne:#},title:#}",id,title);
		if (result>0) {
			return false;
		}
		return true;
	}

	
}
