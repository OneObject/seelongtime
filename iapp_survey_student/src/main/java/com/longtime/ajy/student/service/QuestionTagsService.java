package com.longtime.ajy.student.service;

import java.util.List;

import com.longtime.ajy.model.QuestionTags;
import com.longtime.common.service.IService;

public interface QuestionTagsService extends IService<QuestionTags,Long> {
     List<String> getTagsList(String questionid);
     
     void deleteByquestionid(String questionid);
}
