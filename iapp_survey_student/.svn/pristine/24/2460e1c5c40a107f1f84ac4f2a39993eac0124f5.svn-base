/**
 * project : iask
 * user created : yangwk
 * date created : 2013-7-12 - 下午2:03:26
 */
package com.longtime.ajy.student.service;

import java.util.List;

import com.longtime.ajy.model.QuestionEntity;
import com.longtime.ajy.model.QuestionVO;
import com.longtime.common.model.search.Pageable;
import com.longtime.common.service.IService;


public interface QuestionService extends IService<QuestionEntity, String>{

	List<QuestionVO> listQuestion(String domain, String status, Pageable page);

	List<QuestionVO> listRemindQuestion(String domain, String uid, String model, Pageable page);

}
