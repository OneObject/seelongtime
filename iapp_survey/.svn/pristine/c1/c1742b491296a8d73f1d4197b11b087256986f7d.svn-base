package com.longtime.app.ixin.mgr.survey.service.impl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.jongo.Jongo;
import org.jongo.MongoCollection;
import org.jongo.MongoCursor;
import org.springframework.stereotype.Service;

import com.longtime.app.ixin.mgr.survey.model.SurveyJumpStrategy;
import com.longtime.app.ixin.mgr.survey.service.SurveyJumpStrategyService;
import com.longtime.app.util.Constant;
import com.mongodb.WriteResult;

@Service("jumpStrategyService")
public class SurveyJumpStategyServiceImpl implements SurveyJumpStrategyService {

	 @Resource(name = "jongo")
	 private Jongo jongo ;
	 
	 private static MongoCollection coll;
	 
	 @PostConstruct
	 private void init(){
		 coll =  jongo.getCollection(Constant.COLLECTION_SURVEYJUMPSTRATEGY);
	 }
	
	@Override
	public boolean add(SurveyJumpStrategy surveyJumpStrategy) {
		coll.insert(surveyJumpStrategy);
		SurveyJumpStrategy strategy = findById(surveyJumpStrategy.getId());
		if(null!=strategy){
			return true;
		}
		return false;
	}

	@Override
	public long count(String query,Object... parameters) {
		return coll.count(query, parameters);
	}

	@Override
	public long distinctCount(String key, String query) {
		List<SurveyJumpStrategy> list = coll.distinct(key).query(query).as(SurveyJumpStrategy.class);
		if (CollectionUtils.isEmpty(list)) {
			return 0;
		}
		return list.size();
	}

	@Override
	public SurveyJumpStrategy findById(String id) {
		return coll.findOne("{id:#}",id).as(SurveyJumpStrategy.class);
	}

	@Override
	public boolean update(SurveyJumpStrategy surveyJumpStrategy) {
		WriteResult result = coll.update("{id:#}",surveyJumpStrategy.getId()).with(surveyJumpStrategy);
		if(result.getN()>0){
			return true;
		}
		return false;
	}

	@Override
	public boolean delete(String id,String domain) {
		WriteResult result = coll.update("{id:#,domain:#}",id,domain).with("{$set:{isdel:1}}");
		if (result.getN()>0) {
			return true;
		}
		return false;
	}

	@Override
	public List<SurveyJumpStrategy> findList(String surveyid,
			String questionid, String domain) {
		List<SurveyJumpStrategy> list = new ArrayList<SurveyJumpStrategy>();
		MongoCursor<SurveyJumpStrategy> cursor = coll.find("{survey_id:#,source_qid:#,domain:#,isdel:0}",surveyid,questionid,domain).as(SurveyJumpStrategy.class);
		for (Iterator<SurveyJumpStrategy> iterator =cursor.iterator();iterator.hasNext();) {
			list.add(iterator.next());
		}
		return list;
	}

	@Override
	public List<SurveyJumpStrategy> findBySurveyId(String surveyid,
			String domain) {
		List<SurveyJumpStrategy> list = new ArrayList<SurveyJumpStrategy>();
		MongoCursor<SurveyJumpStrategy> cursor = coll.find("{survey_id:#,domain:#,isdel:0}",surveyid,domain).as(SurveyJumpStrategy.class);
		for (Iterator<SurveyJumpStrategy> iterator =cursor.iterator();iterator.hasNext();) {
			list.add(iterator.next());
		}
		return list;
	}

	@Override
	public boolean delete(String surveyid, String questionid, String domain) {
		WriteResult result = coll.update("{survey_id:#,source_qid:#,domain:#}",surveyid,questionid,domain).multi().with("{$set:{isdel:1}}");
		if (result.getN()>0) {
			return true;
		}
		return false;
	}

	
	
}
