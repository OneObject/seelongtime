package com.longtime.app.ixin.mgr.vote.dao;

import java.util.List;

import com.longtime.app.base.model.UserVo;
import com.longtime.app.ixin.mgr.vote.model.OptionEntity;
import com.longtime.app.ixin.mgr.vote.model.QuestionEntity;
import com.longtime.app.ixin.mgr.vote.model.VoteActionDetailEntity;
import com.longtime.app.ixin.mgr.vote.model.VoteEntity;
import com.longtime.app.ixin.mgr.vote.model.VoteOptionEntity;
import com.longtime.app.ixin.mgr.vote.model.VoteQuestionEntity;
import com.longtime.app.ixin.mgr.vote.vo.OptionVO;
import com.longtime.app.ixin.mgr.vote.vo.QuestionVO;
import com.longtime.app.ixin.mgr.vote.vo.VoteOptionVO;
import com.longtime.app.ixin.mgr.vote.vo.VoteQuestionVO;
import com.longtime.app.ixin.mgr.vote.vo.VoteVO;
import com.longtime.app.ixin.protocol.ItemArticle;
import com.longtime.common.dao.BaseDAO;
import com.longtime.common.utils.Page;
import com.longtime.common.utils.ResultSet;

public interface VoteDao extends BaseDAO<VoteEntity, String>{

	
	
	/**
	 * 保存问题的基础信息
	 * @param vo
	 * @return
	 */
	String saveOrUpdateVoteEntity(VoteEntity vo);

	/**
	 * 保存问题
	 * @param questionEntity
	 * @return
	 */
	String saveOrUpdateQuestionEntity(QuestionEntity questionEntity);

	/**
	 * 保存选项
	 * @param optionEntity
	 */
	void saveOrUpdateOptionEntity(OptionEntity optionEntity);

	/**
	 * 
	 * @param voteId
	 */
	void setVoteNoDel(String voteId);

	/**
	 * 
	 * @param domain
	 * @return
	 */
	int getVoteTotalSize(String domain);

	/**
	 * 分页查询
	 * @param pageSize
	 * @param currPage
	 * @param domain
	 * @return
	 */
	List<VoteVO> queryByPage(int pageSize, int currPage, String domain);
	
	
	ResultSet<VoteVO> queryByPage(Page page, String domain,String name,int surveyOrvote);

	/**
	 * 查询投票信息详情
	 * @param id
	 * @return
	 */
	VoteVO getVoteVOFormVoteEntityById(String id);

	/**
	 * 根据投票ID获取投票中的问题
	 * @param id
	 * @return
	 */
	List<QuestionVO> getQuestionVOSByVoteId(String voteId);

	/**
	 * 根据问题获取选项
	 */
	List<OptionVO> getOptionVOByQID(String qid);

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
	 * 查询该用户是否已经投过票了
	 * @param voteId
	 * @param openId
	 * @return
	 */
	int getUserVoteInfo(String voteId, String uid);

	
	/**
	 * 查询用户是否已经创建选项
	 * @param voteId
	 * @param openId
	 * @return
	 */
	List<VoteOptionEntity> getUserOptionInfo(String questionId, String openId);
	/**
	 * ixin_vote表中voteNum++
	 * @param voteId
	 */
	void addUserVoteInfo(String voteId)throws Exception;

	/**
	 * ixin_question表中voteNum++
	 * @param qId
	 */
	void addUserVoteQuestion(String qId)throws Exception;

	/**
	 * ixin_option表中voteNum++
	 * @param oId
	 */
	void addUserVoteOption(String oId)throws Exception;

	/**
	 * 向ixin_user_vote表中添加记录
	 * @param voteId
	 * @param openId
	 */
	void addUserVote(String voteId,String uid,String openId)throws Exception;

	/**
	 * 根据关键字查询一条记录
	 * @param kewwords
	 * @param coverBasePath
	 * @param suffix
	 * @param voteBasePath
	 * @param openId
	 * @param domain 
	 * @return
	 */
	ItemArticle queryItemArticleByKewWords(String kewwords,
			String coverBasePath, String suffix, String voteBasePath,
			String openId, String domain);

	/**
	 * 查询多条记录
	 * @param itemNum
	 * @param coverBasePath
	 * @param suffix
	 * @param voteBasePath
	 * @param openId
	 * @param domain 
	 * @return
	 */
	List<ItemArticle> queryItemArticle(int itemNum, String coverBasePath,
			String suffix, String voteBasePath, String openId, String domain);

	///////////////////////////////////////////////////TODO
	
	/**
	 * 保存或者修改第一步的信息
	 * @param entity
	 */
	void saveOrUpdateStep1(VoteEntity entity);
	
	/**
	 * 保存投票或者调研动作信息
	 */
	void saveAction(VoteActionDetailEntity voteActionDetailEntity);
	
	
	

	/**
	 * 保存或者修改投票问题
	 * @param entity
	 */
	void saveOrUpdateVoteQuestionEntity(VoteQuestionEntity entity);

	/**
	 * 保存或者修改问题选项
	 * @param optionEntity
	 */
	void saveOrUpdateVoteOptionEntity(VoteOptionEntity optionEntity);

	/**
	 * 根据voteId获取题目信息
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
	 * 删除选项
	 * @param voteQuestionId
	 */
	void delVoteOption(String voteQuestionId);

	/**
	 * 根据试题ID获取试题信息
	 * @param voteQuestionId
	 * @return
	 */
	VoteQuestionVO getVoteQuestionVOById(String voteQuestionId);

	/**
	 * 根据试题ID获取选项
	 * @param voteQuestionId
	 * @return
	 */
	List<VoteOptionVO> getVoteOptionVOByQuestionId(String voteQuestionId);

	/**
	 * 根据ID删除选项
	 * @param optionId
	 */
	void deleteVoteOption(String optionId);

	/**
	 * 增加投票人数
	 * @param voteId
	 */
	void updateUserVoteNum(String voteId);

	/**
	 * 增加选项的投票数量
	 * @param optionId
	 * @return
	 */
	String userVoteToOption(String optionId);

	/**
	 * 增加问题的投票数量
	 * @param questionId
	 */
	void userVoteToQuestion(String questionId);
	
	
	void updateQuestionCount(String questionId);
	
	
	void updateOptionCount(String optionId);

	int getVoteTotalSizeHasKey(String domain);

	List<VoteVO> queryByPageHasKey(int pageSize, int currPage, String domain);

    
	@Deprecated
	List<VoteActionDetailEntity> getSelfVoteAction(String openid,String voteid,String domain);
	
	 List<VoteActionDetailEntity> getVoteAction(String voteid);
	
	//根据参数查询投票或调研
	public List<VoteVO> queryByPage(int pageSize, int currPage, String domain,int surveyOrvote);

    
	List<VoteActionDetailEntity> getlist(String voteid,String domain);
	
	VoteActionDetailEntity getEntity(String voteid,String domain,String openid,String questionid);
		
//	Integer updateVoteActionDetailEntity(VoteActionDetailEntity voteActionDetailEntity);

	void deleteVoteOptionByQid(String questionId);
	
	long updateWeight(String qid,long weight);

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
	 * 根据domain和voteid查询所有参与的人
	 * @param domain
	 * @param voteid
	 * @return
	 */
	public List<UserVo> queryJoinUser(Page page,String domain,String voteid);
	/**
	 * 根据domain和voteid查询所有参与的人总条数
	 * @param domain
	 * @param voteid
	 * @return
	 */
	public long getJoinUserCount(String domain,String voteid);

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
	 * 分页查询调研、投票信息
	 * @param vo
	 * @return
	 */
	public List<VoteEntity> querySurveyOrVoteList(int currentpage,int pagesize,String param,String domain,String search);
	/**
	 * 根据param 和domin查询调研/投票信息的总条数
	 * @param param
	 * @param domain
	 * @return
	 */
	public long getSurveyOrVoteCount(String param,String domain,String search);
	
	long updaterelase(String vid,int relase);
	long updateshowinlist(String vid,int showinlist);
	long updateshowresult(String vid,int status);
}
