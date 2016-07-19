/**
 * project : iask
 * user created : yangwk
 * date created : 2013-7-12 - 下午2:03:26
 */
package com.longtime.ajy.student.service;

import java.util.List;

import com.longtime.ajy.model.TagEntity;
import com.longtime.common.service.IService;


/**
 * @since 2013-9-29
 * @author yangwk
 * 
 */
public interface TagService extends IService<TagEntity,String>{

	/**
	 * 系统内新添加的标签放入队列，由系统异步处理
	 * @param tags
	 */
	void putQueue(List<String> tags);
	
	 void addTags(List<String> tags);
	 
	 long count(String tag);
}
