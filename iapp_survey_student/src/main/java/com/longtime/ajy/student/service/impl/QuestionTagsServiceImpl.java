package com.longtime.ajy.student.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.longtime.ajy.model.QuestionTags;
import com.longtime.ajy.model.TagEntity;
import com.longtime.ajy.student.service.QuestionTagsService;
import com.longtime.ajy.student.service.TagService;
import com.longtime.common.dao.Repository;
import com.longtime.common.model.search.Search;
import com.longtime.common.service.BaseServiceImpl;

@Service(value="questionTagsService")
public class QuestionTagsServiceImpl extends BaseServiceImpl<QuestionTags,Long> implements QuestionTagsService {
    @Resource
    private Repository<QuestionTags,Long> questionTagsRepository;
    
    @Resource
    private TagService tagService;
	
	@Override
	public Repository<QuestionTags, Long> getRepository() {
		return this.questionTagsRepository;
	}

	@Override
	public List<String> getTagsList(String questionid) {
		Search search=new Search();
		search.addEqualFilter("questionid",questionid);
		List<QuestionTags> list=this.list(search);
		
		List<String> tagsnameList=new ArrayList<String>();
		if(list!=null && list.size()>0){
			for(QuestionTags questionTags:list){
				TagEntity tagEntity=this.tagService.findOne(questionTags.getTagsid());
				String tagname=tagEntity.getName();
				tagsnameList.add(tagname);
			}
		}
		if(tagsnameList!=null && tagsnameList.size()>0){
		return tagsnameList;
		}
		
		return null;
	}

	@Override
	public void  deleteByquestionid(String questionid) {
		Search search=Search.newInstance();
		search.addEqualFilter("questionid",questionid);
		List<QuestionTags> list=this.list(search);
		if(list!=null && list.size()>0){
			for(QuestionTags questionTags:list){
				this.questionTagsRepository.delete(questionTags.getId());
			}
		}
	}

}
