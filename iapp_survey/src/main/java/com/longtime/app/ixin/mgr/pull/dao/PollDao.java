package com.longtime.app.ixin.mgr.pull.dao;

import java.util.List;

import com.longtime.app.ixin.mgr.model.OptionEntity;
import com.longtime.app.ixin.mgr.model.QuestionEntity;
import com.longtime.app.ixin.model.vote.VoteEntity;
import com.longtime.app.ixin.protal.poll.vo.OptionVO;
import com.longtime.app.ixin.protal.poll.vo.QuestionVO;
import com.longtime.app.ixin.protal.poll.vo.VoteVO;
import com.longtime.app.ixin.protocol.ItemArticle;

public interface PollDao {

	void saveVoteEntity(VoteEntity entity);

	void saveQuestionEntity(QuestionEntity question);

	void saveOptionEntity(OptionEntity option);

	VoteVO getVoteVO(String voteId);

	List<QuestionVO> getQuestionVO(String voteId);

	List<OptionVO> getOptionVO(String qid);

	void updateOptionVoteNum(String selectOptId);

	void updateVoteUserNum(String voteId);

	void addToUserVote(String voteId, String openId);

	boolean checkExits(String openId, String voteId);

	VoteVO getVoteVOByVoteId(String voteId);

	List<QuestionVO> getQuestionVos(String voteId);

	List<OptionVO> getOptionVOs(String qid);

	int getTotalSize(String currentDomain);

	List<VoteVO> queryVoteVOByPage(int currpage, int pageSize, String domain);

	List<ItemArticle> queryItemArticle(int itemNum,String coverBasePath,String suffix,String voteBasePath,String openId);

	ItemArticle queryItemArticleByKewWords(String kewwords, String coverBasePath,
			String suffix, String voteBasePath, String openId);

	void delVoteById(String voteId);

}
