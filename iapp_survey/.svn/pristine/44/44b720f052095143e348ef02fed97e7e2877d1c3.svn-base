package com.longtime.app.ixin.mgr.survey.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.jongo.Jongo;
import org.jongo.MongoCollection;
import org.jongo.MongoCursor;
import org.springframework.stereotype.Service;

import com.longtime.app.ixin.mgr.survey.model.SurveyQuestion;
import com.longtime.app.ixin.mgr.survey.model.SurveyQuestionType;
import com.longtime.app.ixin.mgr.survey.service.SurveyQuestionService;
import com.longtime.app.util.Constant;
import com.mongodb.WriteResult;

@Service("surveyQuestionService")
public class SurveyQuestionServiceImpl implements SurveyQuestionService {

	@Resource(name = "jongo")
	 private Jongo jongo ;
	 
	 private static  MongoCollection coll;
	 
	 @PostConstruct
	 private void init(){
		 coll =  jongo.getCollection(Constant.COLLECTION_SURVEYQUESTION);
	 }
	
	@Override
	public boolean add(SurveyQuestion surveyQuestion) {
		coll.insert(surveyQuestion);
		SurveyQuestion sq = this.findById(surveyQuestion.getId(), surveyQuestion.getDomain());
		if (null!=sq) {
			return true;
		}
		return false;
	}

	@Override
	public long count(String query) {
		return  coll.count(query);
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
	public SurveyQuestion findById(String id,String domain) {
		SurveyQuestion surveyQuestion = coll.findOne("{id:#,domain:#}",id,domain).as(SurveyQuestion.class);
		return surveyQuestion;
	}

	@Override
	public boolean update(SurveyQuestion surveyQuestion) {
		WriteResult result = coll.update("{id:#}",surveyQuestion.getId()).with(surveyQuestion);
		if (result.getN()>0) {
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
	public boolean exchangeWeight(String id1, String id2,String domain) {
		SurveyQuestion currentQuestion = findById(id1,domain);
		SurveyQuestion targetQuestion =findById(id2,domain);
		if (null==currentQuestion||null==targetQuestion) {
			return false;
		}
		int tile_num = currentQuestion.getTitle_num();
		long flag = currentQuestion.getWeight();
		currentQuestion.setWeight(targetQuestion.getWeight());
		targetQuestion.setWeight(flag);
		//有分页的时候不交换题目序号
		if (targetQuestion.getTitle_num()!=0&&tile_num!=0) {
			currentQuestion.setTitle_num(targetQuestion.getTitle_num());
			targetQuestion.setTitle_num(tile_num);
		}
		//其中一项是分页的时候调整页码
		if (currentQuestion.getType()==SurveyQuestionType.FENYE.getVaule()&&targetQuestion.getType()!=SurveyQuestionType.FENYE.getVaule()) {
			if (targetQuestion.getPage_num()==currentQuestion.getPage_num()) {
				targetQuestion.setPage_num(currentQuestion.getPage_num()+1);
			}else{
				targetQuestion.setPage_num(currentQuestion.getPage_num());
			}
		}
		boolean result1 = update(currentQuestion);
		boolean result2 = update(targetQuestion);
		if (result2&&result1) {
			return true;
		}
		
		return false;
	}

	@Override
	public List<SurveyQuestion> findBySurveyId(String s_id, String domain) {
		MongoCursor<SurveyQuestion> cursor = coll.find("{survey_id:#,domain:#,isdel:0}", s_id,domain).as(SurveyQuestion.class);
		List<SurveyQuestion> list = new ArrayList<SurveyQuestion>();
		for (Iterator<SurveyQuestion> iterator = cursor.iterator();iterator.hasNext();) {
			list.add(iterator.next());
		}
		return list;
	}

	@Override
	public List<SurveyQuestion> findByGtPage(String surveyID,int page, String domain) {
		MongoCursor<SurveyQuestion> cursor = coll.find("{survey_id:#,page_num:{$gt:#},domain:#,isdel:0}", surveyID,page,domain).as(SurveyQuestion.class);
		List<SurveyQuestion> list = new ArrayList<SurveyQuestion>();
		for (Iterator<SurveyQuestion> iterator = cursor.iterator();iterator.hasNext();) {
			list.add(iterator.next());
		}
		return list;
	}

	@Override
	public  boolean  batchupdate(String[] ids, String domain,int page_num_inc,int weight_inc,int titile_num_inc) {
		if(ids.length==0){
			return true;
		}
		WriteResult result1 = coll.update("{id:{$in:#},domain:#}",Arrays.asList(ids),domain).multi().with("{$inc:{page_num:#,weight:#,title_num:#}}",page_num_inc,weight_inc,titile_num_inc);
		if (result1.getN()>0) {
				return true;
		}
		return false;
	}

	@Override
	public List<SurveyQuestion> findByWeight(String surveyID, String domain,
			long minWeight, long maxWeight) {
		MongoCursor<SurveyQuestion> cursor = null;
		
		if(minWeight==0&&maxWeight!=0){
			cursor = coll.find("{survey_id:#,weight:{$lt:#},domain:#,isdel:0}", surveyID,maxWeight,domain).as(SurveyQuestion.class);
		}else if(minWeight!=0&&maxWeight==0){
			cursor = coll.find("{survey_id:#,weight:{$gt:#},domain:#,isdel:0}", surveyID,minWeight,domain).as(SurveyQuestion.class);
		}else if(minWeight!=0&&maxWeight!=0){
			cursor = coll.find("{survey_id:#,weight:{$gt:#,$lt:#},domain:#,isdel:0}", surveyID,minWeight,maxWeight,domain).as(SurveyQuestion.class);
		}
		List<SurveyQuestion> list = new ArrayList<SurveyQuestion>();
		if (cursor!=null) {
			for (Iterator<SurveyQuestion> iterator = cursor.iterator();iterator.hasNext();) {
				list.add(iterator.next());
			}
		}
		
		return list;
	}

}
