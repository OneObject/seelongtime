package com.longtime.app.ixin.mgr.pull.service;

import java.util.List;

import com.longtime.app.ixin.mgr.model.OptionEntity;
import com.longtime.app.ixin.mgr.model.QuestionEntity;
import com.longtime.app.ixin.model.vote.VoteEntity;
import com.longtime.app.ixin.protal.poll.vo.VoteVO;

public interface PollService {


	public void saveVoteEntity(VoteEntity entity);

	public void saveQuestionEntity(QuestionEntity question);

	public void saveOptionEntity(OptionEntity option);

	public VoteVO getVoteVO(String voteId);

	public void updateOptionVoteNum(String selectOptId);

	public void updateVoteUserNum(String voteId);

	public void addToUserVote(String voteId, String openId);

	public boolean checkExits(String openId, String voteId);

	public VoteVO getVoteVOByVoteId(String voteId);

	public int getTotalSize(String currentDomain);

	public List<VoteVO> queryVoteVOByPage(int currpage, int pageSize,
			String domain);

	public void delVoteById(String voteId);

}
