/**
 * project : iapp
 * user created : yangwk
 * date created : 2013-9-29 - 上午10:45:07
 */
package com.longtime.app.iask.repository.impl;

import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

import com.longtime.app.iask.model.TagEntity;
import com.longtime.app.iask.repository.TagRepository;
import com.myctu.platform.repository.engine.storage.mongo.repository.BaseMongoCRUDRepository;

/**
 * @since 2013-9-29
 * @author yangwk
 * 
 */
@Repository("tagRepository")
public class TagRepositoryImpl extends BaseMongoCRUDRepository<TagEntity, String> implements TagRepository{

	@Override
	public void addTags(List<String> tags) {
		if(CollectionUtils.isEmpty(tags)){
			return;
		}
		for(String tag : tags){
			long count = count(tag);
			if(count == 0){
				TagEntity tagEntity = new TagEntity();
				tagEntity.setName(tag);
				save(tagEntity);
			}
		}
		
	}

	/**
	 * 检查这个tag在数据库内的数量
	 * @param tag
	 * @return
	 */
	private long count(String tag) {
		Query query = new Query();
		query.addCriteria(Criteria.where("name").is(tag));
		return count(query);
	}

}
