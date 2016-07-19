package com.longtime.ajy.mweb.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.math.NumberUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import com.google.common.collect.Lists;
import com.longtime.ajy.api.vo.QuestionVO;
import com.longtime.ajy.mweb.model.SurveyAndVoteQuestionVo;
import com.longtime.ajy.mweb.model.UserVoteEntity;
import com.longtime.ajy.mweb.model.VoteActionDetailEntity;
import com.longtime.ajy.mweb.model.VoteEntity;
import com.longtime.ajy.mweb.model.VoteOptionEntity;
import com.longtime.ajy.mweb.model.VoteQuestionEntity;
import com.longtime.ajy.mweb.repository.SpecialRepository;
import com.longtime.ajy.mweb.service.VoteService;
import com.longtime.ajy.mweb.service.VoteStatisticsOptionService;
import com.longtime.ajy.mweb.service.VoteStatisticsQuestionService;
import com.longtime.common.dao.IdGenerator;
import com.longtime.common.dao.Repository;
import com.longtime.common.model.search.Search;
import com.longtime.common.model.search.Sort;
import com.longtime.common.service.BaseServiceImpl;

@Service("voteService")
public class VoteServiceImpl extends BaseServiceImpl<VoteEntity, String>  implements VoteService{
    
	@Resource
	private Repository<VoteEntity,String> voteRepository;
	
	@Resource(name="voteQuestionRepository")
	private Repository<VoteQuestionEntity,String> voteQuestionRepository;
	
	@Resource(name = "voteOptionRepository")
    private Repository<VoteOptionEntity,String> voteOptionRepository;
	
	@Resource
	private SpecialRepository specialRepository;
	
	@Resource
	private VoteStatisticsQuestionService voteStatisticsQuestionService;
	
	@Resource
	private VoteStatisticsOptionService voteStatisticsOptionService;
	
	@Resource(name = "voteActionDetailRepository")
    private Repository<VoteActionDetailEntity,String> voteActionDetailRepository;
	
	@Resource(name = "userVoteRepository")
    private Repository<UserVoteEntity,String> userVoteRepository;
	
	
	@Override
	public Repository<VoteEntity, String> getRepository() {
		return this.voteRepository;
	}
	
	@Override
	public boolean saveAnswer(String activityId, String voteId, String uid, 
			String domain,String allowAnonymous,Map<String, String> answerMap) {
		String[] keyArray = null;
		String qid;
		int type;
		
		List<String> options = new ArrayList<String>(100);
		List<String> questionIds = new ArrayList<String>(answerMap.size());
		
		for (String key : answerMap.keySet()) {
			keyArray = key.split("_");
			if (null == keyArray || keyArray.length != 2) {
				continue;
			}
			qid = keyArray[0];
			type = NumberUtils.toInt(keyArray[1]);
			if (StringUtils.isBlank(qid)) {
				continue;
			}

			String answer = answerMap.get(key);
			if (StringUtils.isBlank(answer)) {
				continue;
			}

			questionIds.add(qid);

			VoteActionDetailEntity voteActionDetailEntity = new VoteActionDetailEntity();
			voteActionDetailEntity.setId(IdGenerator.uuid32());
			voteActionDetailEntity.setDomain(domain);
			voteActionDetailEntity.setOptionid(answer);
			voteActionDetailEntity.setQuestionid(qid);
			voteActionDetailEntity.setVoteid(voteId);
			voteActionDetailEntity.setVoteactivityid(activityId);
			voteActionDetailEntity.setUid(uid);
			// 记录答案
			voteActionDetailRepository.insert(voteActionDetailEntity);
			

			switch (type) {// 1单选，2多选，3 问答 4打分题 5段落 6填空
			case 1:
			case 2:
				String[] answerList = answer.split(",");
				if (null == answerList) {
					break;
				}
				for (String item : answerList) {
					if (StringUtils.isBlank(item)) {
						continue;
					}
					options.add(item);
				}
				break;
			case 3:
				break;
			case 4:
				options.add(answer);
				break;
			case 5:
				break;
			case 6:
				break;
			}
		}
		
		// 向用户投票表中插入记录
		UserVoteEntity userVoteEntity = new UserVoteEntity();
		userVoteEntity.setId(IdGenerator.uuid32());
		userVoteEntity.setActivityId(activityId);
		userVoteEntity.setVoteId(voteId);
		userVoteEntity.setBase_uid(uid);
		userVoteEntity.setTimestamp(System.currentTimeMillis());
		userVoteEntity.setIsAnonymous("1".equals(allowAnonymous) ? 1 : 0);
		userVoteRepository.insert(userVoteEntity);

		// 更新投票数统计
		specialRepository.updateVoteQuestionNum(activityId,questionIds);
		specialRepository.updateVoteOptionNum(activityId,options);
		specialRepository.updateActivityVoteNum(activityId);
		
		return true;
	}
	
	

	@Override
	public List<VoteEntity> querylist(String domain,int surveyOrvote) {
		Search search=new Search();
		search.addEqualFilter("domain",domain);
		search.addEqualFilter("del",VoteEntity.ISDEL_NO);
		search.addEqualFilter("surveyOrvote",surveyOrvote);
		search.addSort(new Sort("weight",true));
		List<VoteEntity> list=voteRepository.list(search);
		
		if(list!=null && list.size()>0){
			return list;
		}
		return null;
	}

	@Override
	public List<QuestionVO> queryListOption(String id) {
		Search search = new Search();
		search.addEqualFilter("voteId", id);
		search.addSort(Sort.asc("weight"));
		List<VoteQuestionEntity> qList=this.voteQuestionRepository.list(search);
		//循环问题列表
		
		List<QuestionVO> list = new ArrayList<QuestionVO>();
		if (qList!=null&&qList.size()>0) {
			for (VoteQuestionEntity ql : qList) {
				QuestionVO vo = new QuestionVO();
				vo.setId(ql.getId());
				vo.setTitle(ql.getTitle());
				Search search2 = new Search();
				search2.addEqualFilter("voteQuestionId", ql.getId());
				search2.addSort(Sort.asc("timestamp"));
				List<VoteOptionEntity> oList = this.voteOptionRepository.list(search2);
				if (oList!=null&&oList.size()>0) {
					vo.setOptions(oList);
				}
				list.add(vo);
			}
			
		}
		return list;
	}

	@Override
	public List<SurveyAndVoteQuestionVo> querylist(String id) {
		
		List<SurveyAndVoteQuestionVo> surveyAndVoteQuestionVos=Lists.newArrayList();
		
		List<VoteQuestionEntity> voteQuestionEntities=getVoteQuestionList(id);
		
		if(voteQuestionEntities!=null && voteQuestionEntities.size()>0){
			for(VoteQuestionEntity voteQuestionEntity:voteQuestionEntities){
				SurveyAndVoteQuestionVo surveyAndVoteQuestionVo=copy(new SurveyAndVoteQuestionVo(),voteQuestionEntity);
				
				//得到option列表
				String voteQuestionid=voteQuestionEntity.getId();
				List<VoteOptionEntity> optionEntities=getVoteOptionList(voteQuestionid);
				if(optionEntities!=null){
					surveyAndVoteQuestionVo.setVoteOptionEntities(optionEntities);
				}
				surveyAndVoteQuestionVos.add(surveyAndVoteQuestionVo);
			}
		}
		return surveyAndVoteQuestionVos;
	}
    
	private List<VoteQuestionEntity> getVoteQuestionList(String voteid){
		Search search=Search.newInstance();
		search.addEqualFilter("voteId",voteid);
		search.addSort(Sort.asc("weight"));
		return this.voteQuestionRepository.list(search);
	}
	
	private List<VoteOptionEntity> getVoteOptionList(String voteQuestionId){
		Search search=Search.newInstance();
		search.addEqualFilter("voteQuestionId",voteQuestionId);
		search.addSort(Sort.asc("timestamp"));
		return this.voteOptionRepository.list(search);
	}
	
	private SurveyAndVoteQuestionVo copy(SurveyAndVoteQuestionVo surveyAndVoteQuestionVo,VoteQuestionEntity voteQuestionEntity){
	
		surveyAndVoteQuestionVo=new SurveyAndVoteQuestionVo();
		surveyAndVoteQuestionVo.setId(voteQuestionEntity.getId());
		surveyAndVoteQuestionVo.setMust(voteQuestionEntity.getMust());
		surveyAndVoteQuestionVo.setTimestamp(voteQuestionEntity.getTimestamp());
		surveyAndVoteQuestionVo.setTitle(voteQuestionEntity.getTitle());
		surveyAndVoteQuestionVo.setType(voteQuestionEntity.getType());
		surveyAndVoteQuestionVo.setVoteId(voteQuestionEntity.getVoteId());
		surveyAndVoteQuestionVo.setVoteNum(voteQuestionEntity.getVoteNum());
		surveyAndVoteQuestionVo.setWeight(voteQuestionEntity.getWeight());
		surveyAndVoteQuestionVo.setMaxChooseNum(voteQuestionEntity.getMaxChooseNum());
		surveyAndVoteQuestionVo.setMinChooseNum(voteQuestionEntity.getMinChooseNum());
		
		surveyAndVoteQuestionVo.setWeight(voteQuestionEntity.getWeight());
		return surveyAndVoteQuestionVo;
	}

	@Override
	public void updateUserVoteNum(String voteId) {
		
	}

	@Override
	public boolean saveUserVote(String voteId, String uid,String openId) {
		try{
			specialRepository.addUserVote(voteId,uid,openId);
			specialRepository.updateUserVoteNum(voteId);
			return true;
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public void updateQuestionCount(String qid) {
		if(StringUtils.isBlank(qid)){
			return;
		}
		specialRepository.updateQuestionCount(qid);
	}

	@Override
	public void saveVoteActionDetail(
			VoteActionDetailEntity voteActionDetailEntity) {
		  specialRepository.saveAction(voteActionDetailEntity);
	}

	@Override
	public void updateOptionCount(String optionId) {
		if(StringUtils.isBlank(optionId)){
			return;
		}
		specialRepository.updateOptionCount(optionId);		
	}

	@Override
	public List<VoteActionDetailEntity> getVoteActionDetailEntities(
			String uid, String activityId, String domain) {
		return this.specialRepository.getVoteActionDetailEntity(domain, uid, activityId);
	}

}
