package com.longtime.app.ixin.mgr.vote.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.stereotype.Service;

import com.google.common.collect.Maps;
import com.longtime.app.ixin.mgr.vote.dao.VoteStatisticsOptionDao;
import com.longtime.app.ixin.mgr.vote.dao.VoteStatisticsQuestionDao;
import com.longtime.app.ixin.mgr.vote.model.VoteActivityEntity;
import com.longtime.app.ixin.mgr.vote.model.VoteStatisticsOptionEntity;
import com.longtime.app.ixin.mgr.vote.model.VoteStatisticsQuestionEntity;
import com.longtime.app.ixin.mgr.vote.service.VoteService;
import com.longtime.app.ixin.mgr.vote.service.VoteStatisticsOptionService;
import com.longtime.app.ixin.mgr.vote.service.VoteStatisticsQuestionService;
import com.longtime.app.ixin.mgr.vote.vo.VoteOptionVO;
import com.longtime.app.ixin.mgr.vote.vo.VoteQuestionVO;
import com.longtime.common.dao.BaseDAO;
import com.longtime.common.dao.IdGenerator;
import com.longtime.common.service.BaseService4HImpl;
import com.longtime.common.utils.Page;
import com.longtime.common.utils.QueryCondition;
import com.longtime.common.utils.ResultSet;


@Service("voteStatisticsQuestionService")
public class VoteStatisticsQestionServiceImpl extends BaseService4HImpl<VoteStatisticsQuestionEntity, String> implements VoteStatisticsQuestionService{

	@Resource(name="voteStatisticsQuestionDao")
	private VoteStatisticsQuestionDao voteStatisticsQuestionDao;
	
	@Resource(name = "voteStatisticsOptionService")
	private VoteStatisticsOptionService voteStatisticsOptionService;
	
	@Resource(name = "voteStatisticsOptionDao")
	private VoteStatisticsOptionDao voteStatisticsOptionDao;
	
	@Resource(name = "voteService")
	private VoteService voteService;
	
	@Override
	public BaseDAO<VoteStatisticsQuestionEntity, String> getDAO() {
		return voteStatisticsQuestionDao;
	}
	
	@Override
	public void doInit(VoteActivityEntity entity) {
		List<VoteQuestionVO> questions = voteService.getVoteQuestions(entity.getVoteId());
		List<VoteQuestionVO> list = new ArrayList<VoteQuestionVO>(questions.size());
		for (VoteQuestionVO voteQuestionVO : questions) {
			VoteQuestionVO questionVO = voteService.getVoteQuestionVOWithOption(voteQuestionVO);
			list.add(questionVO);
		}
		
		List<VoteStatisticsQuestionEntity> qList = getList(entity.getId());
		List<VoteStatisticsOptionEntity> oList = voteStatisticsOptionService.getList(entity.getId());
		
		String hql = "update VoteStatisticsQuestionEntity set isDel = 1 where voteactivityid=?";
		voteStatisticsQuestionDao.execute(hql, entity.getId());
		
		hql = "update VoteStatisticsOptionEntity set isDel = 1 where voteactivityid=?";
		voteStatisticsOptionDao.execute(hql, entity.getId());
		
		List<String> vqIds = new ArrayList<>(50);
		List<String> voIds = new ArrayList<>(100);
		for(VoteQuestionVO questionVO : list){
			VoteStatisticsQuestionEntity vq = getByQid(questionVO.getId(),qList);
			if(vq != null){
				vqIds.add(vq.getId());
			} else {
				vq = new VoteStatisticsQuestionEntity();
				vq.setId(IdGenerator.uuid32());
				vq.setVoteactivityid(entity.getId());
				vq.setVoteid(entity.getVoteId());
				vq.setQuestionid(questionVO.getId());
				vq.setDomain(entity.getDomain());
				voteStatisticsQuestionDao.insert(vq);
			}
			
			if(CollectionUtils.isEmpty(questionVO.getOptions())){
				continue;
			}
			
			for(VoteOptionVO optionVO : questionVO.getOptions()){
				VoteStatisticsOptionEntity vo = getByOptionid(optionVO.getId(),oList);
				if(vo != null){
					voIds.add(vo.getId());
				} else {
					vo = new VoteStatisticsOptionEntity();
					vo.setId(IdGenerator.uuid32());
					vo.setVoteactivityid(entity.getId());
					vo.setVoteid(entity.getVoteId());
					vo.setQuestionid(questionVO.getId());
					vo.setOptionid(optionVO.getId());
					vo.setDomain(entity.getDomain());
					voteStatisticsOptionDao.insert(vo);
				}
			}
		}
		
		if(CollectionUtils.isNotEmpty(vqIds)){
			hql = "update VoteStatisticsQuestionEntity set isDel = 0 where voteactivityid=:voteactivityid and id in(:ids)";
			Map<String, Object> params = Maps.newHashMap();
			params.put("voteactivityid", entity.getId());
			params.put("ids", vqIds);
			voteStatisticsQuestionDao.execute(hql, params);
		}
		
		if(CollectionUtils.isNotEmpty(voIds)){
			hql = "update VoteStatisticsOptionEntity set isDel = 0 where voteactivityid=:voteactivityid and id in(:ids)";
			Map<String, Object> params = Maps.newHashMap();
			params.put("voteactivityid", entity.getId());
			params.put("ids", voIds);
			voteStatisticsOptionDao.execute(hql, params);
		}
	}

	/**
	 * @author yangwenkui
	 * @time 2016年6月26日 上午10:59:30
	 * @param id
	 * @param oList
	 * @return
	 */
	private VoteStatisticsOptionEntity getByOptionid(String id, List<VoteStatisticsOptionEntity> oList) {
		for(VoteStatisticsOptionEntity entity : oList){
			if(entity.getOptionid().equals(id)){
				return entity;
			}
		}
		return null;
	}

	/**
	 * @author yangwenkui
	 * @time 2016年6月26日 上午10:53:55
	 * @param id
	 * @param qList 
	 * @return
	 */
	private VoteStatisticsQuestionEntity getByQid(String id, List<VoteStatisticsQuestionEntity> qList) {
		for(VoteStatisticsQuestionEntity entity : qList){
			if(entity.getQuestionid().equals(id)){
				return entity;
			}
		}
		return null;
	}


	/**
	 * 根据id查询所有统计信息
	 * @author yangwenkui
	 * @time 2016年6月26日 上午10:37:36
	 * @param id
	 * @return
	 */
	@Override
	public List<VoteStatisticsQuestionEntity> getList(String id) {
		QueryCondition query = new QueryCondition();
		query.addFilterEqual("voteactivityid", id);
		query.addFilterEqual("isDel", 0);
		ResultSet<VoteStatisticsQuestionEntity> rs = voteStatisticsQuestionDao.list(query, new Page(1,Integer.MAX_VALUE));
		return rs.getItems();
	}
}
