/**
 * Title:
 * Description:
 * @author yangwenkui
 * @version v1.0
 * @time 2016年6月14日 下午11:02:08
 */
package com.longtime.app.ixin.mgr.vote.task;

import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.stereotype.Component;

import com.longtime.app.ixin.mgr.vote.model.VoteActivityEntity;
import com.longtime.app.ixin.mgr.vote.service.VoteActivityService;
import com.longtime.common.utils.Page;
import com.longtime.common.utils.QueryCondition;
import com.longtime.common.utils.ResultSet;

/**
 * 调研活动发布--通知参与人员
 * @author yangwenkui
 * @version v1.0
 * @time 2016年6月14日 下午11:02:08
 */
@Component("voteActivityReleaseNotifyTask")
public class VoteActivityReleaseNotifyTask {
	
	@Resource(name="voteActivityService")
	private VoteActivityService voteActivityService;
	
	public void process(){
		QueryCondition query = new QueryCondition();
		query.addFilterEqual("isrelease", 2);
		query.addFilterEqual("isNotify", 1);
		query.addFilterEqual("hasNotified", 0);
		ResultSet<VoteActivityEntity> rs = voteActivityService.list(query, new Page(1, Integer.MAX_VALUE));
		if(CollectionUtils.isEmpty(rs.getItems())){
			return;
		}
		
		for(VoteActivityEntity entity : rs.getItems()){
			voteActivityService.doSendNotify(entity.getId());
		}
	}
	
}
