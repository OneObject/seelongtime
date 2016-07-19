/**
 * project : iapp
 * user created : yangwk
 * date created : 2013-9-25 - 下午1:03:22
 */
package com.longtime.app.ixin.mgr.vote.task;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import com.longtime.app.ixin.mgr.vote.model.VoteActivityEntity;
import com.longtime.app.ixin.mgr.vote.model.VoteQueueModel;
import com.longtime.app.ixin.mgr.vote.service.VoteActivityService;
import com.longtime.app.ixin.mgr.vote.service.VoteQueueService;
import com.longtime.common.utils.QueryCondition;
import com.longtime.common.utils.ResultSet;

/**
 * 生成静态调研活动信息--包括问卷
 * @since 2013-9-25
 * @author yangwk
 */
@Component("createStaticVoteInfoTask")
public class CreateStaticVoteInfoTask {
	
	@Resource(name = "voteQueueService")
	private VoteQueueService voteQueueService;
	
	@Resource(name = "voteActivityService")
	private VoteActivityService voteActivityService;
	
	private Logger logger = LoggerFactory.getLogger(CreateStaticVoteInfoTask.class);
	
	public void process(){
		logger.info("CreateStaticVoteInfoTask start");
		QueryCondition queryCondition = new QueryCondition();
		queryCondition.addFilterEqual("status", VoteQueueModel.STATUS_TO_CREATE);
		ResultSet<VoteQueueModel> rs = this.voteQueueService.list(queryCondition,null);
		for(VoteQueueModel entity : rs.getItems()){
			VoteActivityEntity voteActivityEntity = voteActivityService.get(entity.getVote_activity_id());
			try {
				boolean flag = voteActivityService.createPaper(entity.getVote_activity_id());
				if(flag){
					voteActivityEntity.setIsrelease(2);
				} else {
					voteActivityEntity.setIsrelease(-1);
				}
				entity.setStatus(VoteQueueModel.STATUS_COMPLETE);
				voteQueueService.update(entity);
			} catch (Exception e) {
				logger.error(String.format("create test paper due error,the exam_id=%s", entity.getVote_activity_id()),e);
				voteActivityEntity.setIsrelease(-1);
			}
			voteActivityService.update(voteActivityEntity);
		}
		
		logger.info("CreateStaticVoteInfoTask success");
	}
}
