/**
 * project : iask
 * user created : yangwk
 * date created : 2013-7-12 - 下午2:03:26
 */
package com.longtime.app.iask.service;

import java.util.List;

import com.longtime.app.iask.model.ReviewEntity;
import com.longtime.common.mongo.CommonService;

/**
 * @since 2013-9-29
 * @author yangwk
 * 
 */
public interface ReviewService extends CommonService<ReviewEntity, String>{

	/**
	 * 根据用户id和回答id查找用户评价信息
	 * @param uid
	 * @param answerid
	 * @return
	 */
	ReviewEntity findByUidAndSid(String uid, String answerid);

	/**
	 * 根据用户id和回答列表查询
	 * @param uid
	 * @param answerids
	 * @return
	 */
	List<ReviewEntity> findByUidAndSids(String uid, List<String> answerids);

}
