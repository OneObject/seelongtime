package com.longtime.app.ixin.mgr.vote.service.impl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.longtime.app.base.model.UserVo;
import com.longtime.app.ixin.mgr.vote.dao.VoteDao;
import com.longtime.app.ixin.mgr.vote.model.VoteActionDetailEntity;
import com.longtime.app.ixin.mgr.vote.model.VoteEntity;
import com.longtime.app.ixin.mgr.vote.model.VoteOptionEntity;
import com.longtime.app.ixin.mgr.vote.model.VoteQuestionEntity;
import com.longtime.app.ixin.mgr.vote.service.VoteOptionService;
import com.longtime.app.ixin.mgr.vote.service.VoteQuestionService;
import com.longtime.app.ixin.mgr.vote.service.VoteService;
import com.longtime.app.ixin.mgr.vote.vo.VoteOptionVO;
import com.longtime.app.ixin.mgr.vote.vo.VoteQuestionVO;
import com.longtime.app.ixin.mgr.vote.vo.VoteVO;
import com.longtime.app.util.IdGenerator;
import com.longtime.common.dao.BaseDAO;
import com.longtime.common.service.BaseService4HImpl;
import com.longtime.common.utils.Page;
import com.longtime.common.utils.ResultSet;
import com.myctu.platform.utils.NumberUtils;

@Service("voteService")
public class VoteServiceImpl extends BaseService4HImpl<VoteEntity, String> implements VoteService{

	@Resource(name="voteDao")
	private VoteDao voteDao;
	
	@Value("${com.longtime.ixin.IMAGE_BASE_PATH}")
	private String coverBasePath;
	@Value("${com.longtime.ixin.COVER_SUFFIX}")
	private String suffix;
	@Value("${com.longtime.ixin.voteBasePath}")
	private String voteBasePath;
	
	@Value("${com.longtime.ixin.role.vote}")
	private String voteRole;
	
	@Resource(name = "voteOptionService")
	private VoteOptionService voteOptionService;
	
	@Resource(name = "voteQuestionService")
	private VoteQuestionService voteQuestionService;
	
	@Override
	public BaseDAO<VoteEntity, String> getDAO() {
		return voteDao;
	}
	
	@Override
	public VoteQuestionVO getVoteQuestionVOWithOption(VoteQuestionVO vo) {
		List<VoteOptionVO> options = voteDao.getVoteOptionVOByQuestionId(vo.getId());
		vo.setOptions(options);
		if(vo != null && 4==vo.getType()){
			if(CollectionUtils.isNotEmpty(options)){
				
				Collections.sort(options, new Comparator<VoteOptionVO>(){
					@Override
					public int compare(VoteOptionVO o1, VoteOptionVO o2) {
						
						
						long i1 = NumberUtils.toLong(o1.getTitle(),o1.getTimestamp());
						long i2 = NumberUtils.toLong(o2.getTitle(), o2.getTimestamp());
						//return new CompareToBuilder().append(i1, i2).toComparison();
						return (i1==i2)? 0: (i1>i2) ? 1:-1;
					}
					
				});
				
				int minScore = NumberUtils.toInt(options.get(0).getTitle(), 1);
				int maxScore = NumberUtils.toInt(options.get(options.size()-1).getTitle(), 5);
				String content = options.get(0).getContent();
				if(StringUtils.isBlank(content)){
					content = "";
				}
				vo.setMinScore(minScore);
				vo.setMaxScore(maxScore);
				vo.setContent(content);
			}
			
		}
		return vo;
	}
	
	@Override
	public boolean doSaveQuestions(VoteQuestionVO questionVO) {
		VoteQuestionEntity entity = null;
		if(StringUtils.isBlank(questionVO.getId())){
			entity = new VoteQuestionEntity();
		} else {
			entity = voteQuestionService.get(questionVO.getId());
		}
		entity = VoteQuestionVO.castToVoteQuestionEntity(entity,questionVO);
		if(StringUtils.isBlank(entity.getId())){
			entity.setId(IdGenerator.nextId32().toString());
		}
		
		saveOrUpdateVoteQuestionEntity(entity);
		
		if(3 == entity.getType() || 5 == entity.getType()){ //问答和段落没有选项
			return true;
		}
		if(4 == entity.getType()){
			List<VoteOptionVO> list = creteOption(questionVO);
			questionVO.setOptions(list);
		}
		List<VoteOptionVO> options = questionVO.getOptions();
		for (VoteOptionVO voteOptionVO : options) {
			VoteOptionEntity optionEntity = null;
			if(StringUtils.isBlank(voteOptionVO.getId())){
				optionEntity = new VoteOptionEntity();
				optionEntity.setId(IdGenerator.nextId32().toString());
			} else {
				optionEntity = voteOptionService.get(voteOptionVO.getId());
			}
			optionEntity = VoteOptionVO.castToOptionEntity(optionEntity,voteOptionVO,entity.getId());
			
			if(StringUtils.isBlank(optionEntity.getId())){
				voteOptionService.insert(optionEntity);
			} else {
				voteOptionService.update(optionEntity);
			}
		}
		
		return true;
	}
	
	private List<VoteOptionVO> creteOption(VoteQuestionVO question) {
		List<VoteOptionVO> options = getVoteOptionByQid(question.getId());
		int min = question.getMinScore();
		int max = question.getMaxScore();
		
		List<Integer> exists = new ArrayList<Integer>();
		
		List<VoteOptionVO> list = new ArrayList<VoteOptionVO>();
		for(VoteOptionVO option : options){
			int score = NumberUtils.toInt(option.getTitle(), 0);
			for (int i = question.getMinScore();i<=question.getMaxScore();i++){
				if (score==i) {
					option.setContent(StringUtils.isBlank(question.getContent())?"":question.getContent());
					list.add(option);
				}
			}
			if(score<min || score>max){
				deleteVoteOption(option.getId());
			}else {
				exists.add(score);
			}
		}
		
		
		for(int i = question.getMinScore();i<=question.getMaxScore();i++){
			if(exists.contains(i)){
				continue;
			}
			VoteOptionVO entity = new VoteOptionVO();
			entity.setTitle(String.valueOf(i));
			entity.setTimestamp(System.currentTimeMillis()+i);
		
			entity.setContent(StringUtils.isBlank(question.getContent())?"":question.getContent());
			list.add(entity);
		}
		
		return list;
	}
	
	@Override
	public String saveVoteInfo(VoteVO vo,String domain) {
		//保存投票基础信息
		/*VoteEntity entity = VoteEntity.getVoteEntityByVoteVO(vo,domain);
		String voteId = voteDao.saveOrUpdateVoteEntity(entity);
		int questionIndex = 1;
		if(StringUtils.isNotBlank(voteId)){
			List<QuestionVO> qVOs = vo.getQuestions();
			for (QuestionVO qVO : qVOs) {
				QuestionEntity questionEntity = QuestionEntity.getQuestionEntityByQVO(qVO,voteId);
				questionEntity.setShortNum(questionIndex++);
				String qId = voteDao.saveOrUpdateQuestionEntity(questionEntity);
				if(StringUtils.isNotBlank(qId)){
					List<OptionVO> oVOs = qVO.getOptions();
					int optionIndex = 1;
					for (OptionVO oVO : oVOs) {
						OptionEntity optionEntity = OptionEntity.getOptionEntityByOptionVO(oVO,qId);
						optionEntity.setShortNum(optionIndex++);
						voteDao.saveOrUpdateOptionEntity(optionEntity);
					}
					voteDao.setVoteNoDel(voteId);
				}
			}
		}*/
		return "";
	}
	@Override
	public int getVoteTotalSize(String domain) {
		
		return voteDao.getVoteTotalSize(domain);
	}
	@Override
	public List<VoteVO> queryByPage(int pageSize, int currPage, String domain) {
		
		return voteDao.queryByPage(pageSize,currPage,domain);
	}
	public List<VoteVO> queryByPage(int pageSize, int currPage, String domain,int surveyOrvote) {
		
		return voteDao.queryByPage(pageSize,currPage,domain,surveyOrvote);
	}
	@Override
	public ResultSet<VoteVO> queryByPage(Page page, String domain,String name,int surveyOrvote) {
		
		return voteDao.queryByPage(page,domain,name,surveyOrvote);
	}
	
	@Override
	public VoteVO getVoteVOById(String id) {
		VoteVO vo = voteDao.getVoteVOFormVoteEntityById(id);
		if (vo == null){
			return null;
		}
		List<VoteQuestionVO> questions = getVoteQuestionVOByVoteId(id);
		for (VoteQuestionVO question : questions) {
			List<VoteOptionVO> options = voteDao.getVoteOptionVOByQuestionId(question.getId());
			question.setOptions(options);
		}
		vo.setQuestions(questions);
		return vo;
	}
	@Override
	public void delOption(String optionId) {
		voteDao.delOption(optionId);
	}
	@Override
	public void del(String voteId) {
		voteDao.del(voteId);
	}
	@Override
	public boolean checkUserIsParticipate(String voteId, String uid) {
		int count = voteDao.getUserVoteInfo(voteId,uid);
		return count != 0;
	}
	
	@Override
	public List<VoteOptionEntity> checkUserIsCreatedOption(String questionId, String openId) {
		return voteDao.getUserOptionInfo(questionId,openId);
	}
	@Override
	public boolean saveUserVote(String voteId, String uid,String openId) {
		try{
			voteDao.addUserVote(voteId,uid,openId);
			voteDao.updateUserVoteNum(voteId);
			return true;
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}
	

	public String getCoverBasePath (){
		return coverBasePath;
	}
	
	public String getSuffix(){
		return suffix;
	}
	
	@Override
	public void saveOrUpdateStep1(VoteEntity entity) {
		voteDao.saveOrUpdateStep1(entity);
	}
	@Override
	public void saveOrUpdateVoteQuestionEntity(VoteQuestionEntity entity) {
		if(null==entity){
			return;
		}
		
		if(entity.getType()==5){
			entity.setMust(0);
		}
		if(StringUtils.isBlank(entity.getId())){
			entity.setId(IdGenerator.nextId32().toString());
			voteQuestionService.insert(entity);
		} else {
			voteQuestionService.update(entity);
		}
	}
	@Override
	public void saveOrUpdateVoteOptionEntity(VoteOptionEntity optionEntity) {
		voteDao.saveOrUpdateVoteOptionEntity(optionEntity);
	}
	@Override
	public List<VoteQuestionVO> getVoteQuestionVOByVoteId(String voteId) {
		List<VoteQuestionEntity> list = voteQuestionService.listByVoteId(voteId);
		List<VoteQuestionVO> result = new ArrayList<VoteQuestionVO>();
		if(CollectionUtils.isEmpty(list)){
			return result;
		}
		for (VoteQuestionEntity voteQuestionEntity : list) {
			VoteQuestionVO vo = VoteQuestionEntity.castToVoteQuestionVO(voteQuestionEntity);
			result.add(vo);
		}
		return result;
	}
	@Override
	public void deleteVoteQuestion(String voteQuestionId) {
		voteDao.deleteVoteQuestion(voteQuestionId);
		voteDao.delVoteOption(voteQuestionId);
	}
	
	@Override
	public List<VoteQuestionVO> getVoteQuestions(String voteId) {
		List<VoteQuestionVO> list = getVoteQuestionVOByVoteId(voteId);
		return list;
	}
	
	@Override
	public VoteQuestionVO getVoteQuestionVOByQuestionId(String voteQuestionId) {
		VoteQuestionEntity voteQuestionEntity = voteQuestionService.get(voteQuestionId);
		VoteQuestionVO vo = VoteQuestionEntity.castToVoteQuestionVO(voteQuestionEntity);
		List<VoteOptionVO> options = voteDao.getVoteOptionVOByQuestionId(voteQuestionId);
		vo.setOptions(options);
		if(vo != null && 4==vo.getType()){
			if(CollectionUtils.isNotEmpty(options)){
				
				Collections.sort(options, new Comparator<VoteOptionVO>(){
					@Override
					public int compare(VoteOptionVO o1, VoteOptionVO o2) {
						
						
						long i1 = NumberUtils.toLong(o1.getTitle(),o1.getTimestamp());
						long i2 = NumberUtils.toLong(o2.getTitle(), o2.getTimestamp());
						//return new CompareToBuilder().append(i1, i2).toComparison();
						return (i1==i2)? 0: (i1>i2) ? 1:-1;
					}
					
				});
				
				int minScore = NumberUtils.toInt(options.get(0).getTitle(), 1);
				int maxScore = NumberUtils.toInt(options.get(options.size()-1).getTitle(), 5);
				String content = options.get(0).getContent();
				if(StringUtils.isBlank(content)){
					content = "";
				}
				vo.setMinScore(minScore);
				vo.setMaxScore(maxScore);
				vo.setContent(content);
			}
			
		}
		return vo;
	}
	@Override
	public void deleteVoteOption(String optionId) {
		voteDao.deleteVoteOption(optionId);
	}
	@Override
	public void userVote(String optionId) {
		String questionId = voteDao.userVoteToOption(optionId);
		voteDao.userVoteToQuestion(questionId);
	}
	
	@Override
	public void updateQuestionCount(String qid){
		if(StringUtils.isBlank(qid)){
			return;
		}
		voteDao.updateQuestionCount(qid);
	}
	
	@Override
	public void updateOptionCount(String optionId){
		if(StringUtils.isBlank(optionId)){
			return;
		}
		voteDao.updateOptionCount(optionId);
		
	}
	@Override
	public int getVoteTotalSizeHasKey(String domain) {
		return voteDao.getVoteTotalSizeHasKey(domain);
	}
	@Override
	public List<VoteVO> queryByPageHasKey(int pageSize, int currPage,
			String domain) {
		return voteDao.queryByPageHasKey(pageSize,currPage,domain);
	}
	@Override
	public void saveVoteActionDetail(
			VoteActionDetailEntity voteActionDetailEntity) {
		  voteDao.saveAction(voteActionDetailEntity);
	}
	@Override
	public List<VoteActionDetailEntity> getSelfVoteAction(String openId,
			String voteid,String domain) {
		return this.voteDao.getSelfVoteAction(openId, voteid,domain);
	}
	@Override
	public List<VoteActionDetailEntity> getlist(String voteid,String domain) {
		return this.voteDao.getlist(voteid, domain);
	}
	@Override
	public VoteActionDetailEntity getEntity(String voteid, String domain,
			String openid, String questionid) {
		return this.voteDao.getEntity(voteid, domain, openid, questionid);
	}
//	@Override
//	public Integer updateVoteActionDetailEntity(
//			VoteActionDetailEntity voteActionDetailEntity) {
//		return this.voteDao.updateVoteActionDetailEntity(voteActionDetailEntity);  
//	}
	@Override
	public List<VoteActionDetailEntity> getVoteAction(String voteid) {
		
		return this.voteDao.getVoteAction(voteid);
	}
	
	@Override
	public void deleteVoteOptionByQid(String questionId) {
		voteDao.deleteVoteOptionByQid(questionId);
	}
	
	
	@Override
	public long updateWeight(String qid,long weight){
		
		return this.voteDao.updateWeight(qid, weight);
		
	}
	
	
	@Override
	public List<VoteOptionVO> getVoteOptionByQid(String qid) {
		return this.voteDao.getVoteOptionVOByQuestionId(qid);
	}
	
	@Override
	public List<VoteActionDetailEntity> list(String uid,String voteid){
		return this.voteDao.list(uid, voteid);
	}
	
	/**
	 * 修改投票和调研的排序值
	 * @param qid
	 * @param weight
	 * @return
	 */
	public long updateVoteAndSurveyWeight(String vid,long weight){
		
		return this.voteDao.updateVoteAndSurveyWeight(vid, weight);
	}
	@Override
	public VoteVO queryVoteVOByUpOrDown(String domain,int surveyOrvotes,long weight,String upOrDown,String voteId) {
		// TODO Auto-generated method stub
		return this.voteDao.queryVoteVOByUpOrDown(domain, surveyOrvotes, weight, upOrDown,voteId);
	}
	@Override
	public List<UserVo> queryJoinUser(Page page,String domain, String voteid) {
		// TODO Auto-generated method stub
		return this.voteDao.queryJoinUser(page,domain, voteid);
	}

	@Override
	public List<UserVo> queryNoJoinUser(Page page,String domain,String voteid) {
		// TODO Auto-generated method stub
		return this.voteDao.queryNoJoinUser(page,domain,voteid);
	}
	@Override
	public long getJoinUserCount(String domain, String voteid) {
		// TODO Auto-generated method stub
		return this.voteDao.getJoinUserCount(domain, voteid);
	}
	@Override
	public long getNoJoinUserCount(String domain,String voteid) {
		// TODO Auto-generated method stub
		return this.voteDao.getNoJoinUserCount(domain,voteid);
	}
	@Override
	public List<VoteEntity> querySurveyOrVoteList(int currentpage,
			int pagesize, String param,String domain ,String search) {
		return this.voteDao.querySurveyOrVoteList(currentpage, pagesize, param,domain,search);
	}
	@Override
	public long getSurveyOrVoteCount(String param,String domain,String search) {
		return this.voteDao.getSurveyOrVoteCount(param,domain,search);
	}
	@Override
	public long updaterelase(String vid, int relase)
	{
		return this.voteDao.updaterelase(vid, relase);
	}
	@Override
	public long updateshowinlist(String vid, int showinlist)
	{
		return this.voteDao.updateshowinlist(vid, showinlist);
	}
	@Override
	public long updateshowresult(String vid, int status)
	{
		return this.voteDao.updateshowresult(vid, status);
	}
	
}
