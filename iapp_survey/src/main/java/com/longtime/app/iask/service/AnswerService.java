/**
 * project : iask
 * user created : yangwk
 * date created : 2013-7-12 - 下午2:03:26
 */
package com.longtime.app.iask.service;

import java.util.List;

import com.longtime.app.iask.model.AnswerEntity;
import com.longtime.common.mongo.CommonService;

/**
 * @since 2013-9-29
 * @author yangwk
 * 
 */
public interface AnswerService extends CommonService<AnswerEntity, String>{

	/**
	 * 根据问题id删除其回答
	 * @param askid
	 */
	void delByQid(String askid);

	/**
	 * 查找一个问题的最佳答案
	 * @param id
	 * @return
	 */
	AnswerEntity findBestAnswer(String id);

	/**
	 * 查找我的回答
	 * @param uid
	 * @return
	 */
	List<AnswerEntity> findMyAnswer(String uid);

}
