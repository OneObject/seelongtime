/**
 * project : iask
 * user created : yangwk
 * date created : 2013-7-12 - 下午2:03:57
 */
package com.longtime.ajy.student.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.longtime.ajy.model.QuestionEntity;
import com.longtime.ajy.model.QuestionVO;
import com.longtime.ajy.mweb.repository.SpecialRepository;
import com.longtime.ajy.student.service.QuestionService;
import com.longtime.common.dao.Repository;
import com.longtime.common.model.search.Pageable;
import com.longtime.common.service.BaseServiceImpl;
/**
 * @since 2013-7-12
 * @author yangwk
 * 
 */
@Service("questionService")
public class QuestionServiceImpl extends BaseServiceImpl<QuestionEntity,String> implements QuestionService{

	@Resource(name = "questionRepository")
	private Repository<QuestionEntity,String> questionRepository;
	
	@Resource
	private SpecialRepository specialRepository;

	@Override
	public Repository<QuestionEntity, String> getRepository() {
		return this.questionRepository;
	}

	@Override
	public List<QuestionVO> listQuestion(String domain, String status, Pageable page) {
		List<QuestionVO> list = this.specialRepository.listQuestion(domain,status,page);
		return list;
	}

	@Override
	public List<QuestionVO> listRemindQuestion(String domain, String uid, String model, Pageable page) {
		List<QuestionVO> list = this.specialRepository.listRemindQuestion(domain,uid,model,page);
		return list;
	}
	

}
