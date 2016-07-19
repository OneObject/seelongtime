/**
 * project : iask
 * user created : yangwk
 * date created : 2013-7-12 - 下午2:03:26
 */
package com.longtime.app.iask.service;

import java.util.List;

import com.longtime.app.iask.model.TagEntity;
import com.longtime.common.mongo.CommonService;

/**
 * @since 2013-9-29
 * @author yangwk
 * 
 */
public interface TagService extends CommonService<TagEntity, String>{

	/**
	 * 系统内新添加的标签放入队列，由系统异步处理
	 * @param tags
	 */
	void putQueue(List<String> tags);
}
