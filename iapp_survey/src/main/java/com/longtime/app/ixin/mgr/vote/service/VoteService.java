package com.longtime.app.ixin.mgr.vote.service;

import java.util.List;

import com.longtime.app.base.model.UserVo;
import com.longtime.app.ixin.mgr.vote.model.VoteActionDetailEntity;
import com.longtime.app.ixin.mgr.vote.model.VoteEntity;
import com.longtime.app.ixin.mgr.vote.model.VoteOptionEntity;
import com.longtime.app.ixin.mgr.vote.model.VoteQuestionEntity;
import com.longtime.app.ixin.mgr.vote.vo.VoteOptionVO;
import com.longtime.app.ixin.mgr.vote.vo.VoteQuestionVO;
import com.longtime.app.ixin.mgr.vote.vo.VoteVO;
import com.longtime.common.service.BaseService;
import com.longtime.common.utils.Page;
import com.longtime.common.utils.ResultSet;

public interface VoteService extends BaseService<VoteEntity, String>{

	/**
	 * 保存投票信息
	 * @param vo
	 */
	String saveVoteInfo(VoteVO vo,String domain);

	/**
	 * 得到投票记录中的总数
	 * @param domain
	 * @return
	 */
	int getVoteTotalSize(String domain);

	/**
	 * 分页获取投票信息
	 * @param pageSize
	 * @param currPage
	 * @param domain
	 * @return
	 */
	List<VoteVO> queryByPage(int pageSize, int currPage, String domain);
	
	ResultSet<VoteVO> queryByPage(Page page, String domain,String name,int surveyOrvote) ;

	/**
	 * 查询投票详情
	 * @param id
	 * @return
	 */
	VoteVO getVoteVOById(String id);

	/**
	 * 删除选项
	 * @param optionId
	 */
	void delOption(String optionId);

	/**
	 * 删除投票信息
	 * @param voteId
	 */
	void del(String voteId);

	/**
	 * 查看该用户是否已经投票
	 * @param voteId
	 * @param openId
	 * @return
	 */
	boolean checkUserIsParticipate(String voteId, String uid);

	
	/**
	 * 判断用户是否创建选项
	 * @param questionId
	 * @param openId
	 * @return
	 */
	List<VoteOptionEntity> checkUserIsCreatedOption(String questionId, String openId);
	/**
	 * 保存用户投票信息
	 * @param oId
	 * @param qId
	 * @param voteId
	 * @param openId
	 * @return
	 */
	boolean saveUserVote(String voteId, String uid,String openId);

//////////////////////////////下面的是最新的
	public String getCoverBasePath ();
	public String getSuffix();
	/**
	 * 保存或者修改第一步的信息
	 * @param entity
	 */
	void saveOrUpdateStep1(VoteEntity entity);
	
	
	
	
	void saveVoteActionDetail(VoteActionDetailEntity voteActionDetailEntity);

	/**
	 * 保存或者修改问题信息
	 * @param entity
	 */
	void saveOrUpdateVoteQuestionEntity(VoteQuestionEntity entity);

	/**
	 * 保存或者修改选项信息
	 * @param optionEntity
	 */
	void saveOrUpdateVoteOptionEntity(VoteOptionEntity optionEntity);

	/**
	 * 根据voteId获取所有问题
	 * @param voteId
	 * @return
	 */
	List<VoteQuestionVO> getVoteQuestionVOByVoteId(String voteId);

	/**
	 * 删除试题
	 * @param voteQuestionId
	 */
	void deleteVoteQuestion(String voteQuestionId);

	/**
	 * 根据试题Id获取试题信息
	 * @param voteQuestionId
	 * @return
	 */
	VoteQuestionVO getVoteQuestionVOByQuestionId(String voteQuestionId);

	/**
	 * 删除选项
	 * @param optionId
	 */
	void deleteVoteOption(String optionId);

	/**
	 * 用户投票
	 * @param optionId
	 */
	void userVote(String optionId);
	
	void updateQuestionCount(String qid);
	
	void updateOptionCount(String optionId);

	int getVoteTotalSizeHasKey(String domain);

	List<VoteVO> queryByPageHasKey(int pageSize, int currPage, String domain);

	
	 @Deprecated
	 List<VoteActionDetailEntity> getSelfVoteAction(String openId,String voteid,String domain);
    
	 @Deprecated
	 List<VoteActionDetailEntity> getVoteAction(String voteid);
	
	public List<VoteVO> queryByPage(int pageSize, int currPage, String domain,int surveyOrvote);
	
	@Deprecated
	List<VoteActionDetailEntity> getlist(String voteid,String domain);
	
	@Deprecated
	VoteActionDetailEntity getEntity(String voteid,String domain,String openid,String questionid);
	
//	@Deprecated
//	Integer updateVoteActionDetailEntity(VoteActionDetailEntity voteActionDetailEntity);
//	
	
	long updateWeight(String qid,long weight);
	

	void deleteVoteOptionByQid(String id);
	List<VoteOptionVO> getVoteOptionByQid(String id);
	
	
	List<VoteActionDetailEntity> list(String uid,String voteid);

	/**
	 * 修改投票和调研的排序值
	 * @param qid
	 * @param weight
	 * @return
	 */
	public long updateVoteAndSurveyWeight(String vid,long weight);
	
	
	/**
	 * 根据排序的操作和id查询对象
	 * @param vid
	 * @param weight
	 * @param upOrDown
	 * @return
	 */
	public VoteVO queryVoteVOByUpOrDown(String domain,int surveyOrvotes,long weight,String upOrDown,String voteId);

	/**
	 * 根据domain和voteid查询参与的人
	 * @param domain
	 * @param voteid
	 * @return
	 */
	public List<UserVo> queryJoinUser(Page page,String domain,String voteid);
	/**
	 * 根据domain和voteid查询参与的人的总条数
	 * @param domain
	 * @param voteid
	 * @return
	 */
	public long getJoinUserCount(String domain, String voteid);
	/**
	 * 根据domain和voteid查询未参与的用户
	 * @param domain
	 * @param surveyOrvote
	 * @return
	 */
	public List<UserVo> queryNoJoinUser(Page page,String domain,String voteid);
	
	/**
	 * 根据domain查询未参与用户的总条数
	 * @param domain
	 * @param voteid
	 * @return
	 */
	public long getNoJoinUserCount(String domain,String voteid);
	
	/**
	 * 根据domain和param查询调研或者投票信息
	 * @param currentpage
	 * @param pagesize
	 * @param param
	 * @param domain
	 * @return
	 */
	public List<VoteEntity> querySurveyOrVoteList(int currentpage,int pagesize,String param,String domain,String search);
	/**
	 * 根据domain和param查询调研或者投票信息
	 * @param domain
	 * @param voteid
	 * @return
	 */
	public long getSurveyOrVoteCount(String param,String domain,String search);
	/**
	 *以下是发布、列表展示、以及结果页展示状态
	 */
	long updaterelase(String vid,int relase);
	long updateshowinlist(String vid,int showinlist);
	long updateshowresult(String vid,int status);

	/**
	 * @author yangwenkui
	 * @time 2016年6月19日 下午8:52:12
	 * @param questionVO
	 */
	boolean doSaveQuestions(VoteQuestionVO questionVO);

	/**
	 * 查找调研关联的所有问题
	 * @author yangwenkui
	 * @time 2016年6月19日 下午9:52:04
	 * @param voteId
	 * @return
	 */
	List<VoteQuestionVO> getVoteQuestions(String voteId);

	/**
	 * 获取问题及选项
	 * @author yangwenkui
	 * @time 2016年7月4日 下午11:10:01
	 * @param voteQuestionVO
	 * @return
	 */
	VoteQuestionVO getVoteQuestionVOWithOption(VoteQuestionVO voteQuestionVO);
}
