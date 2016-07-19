package com.longtime.app.base.dao;

import java.util.List;
import java.util.Map;
import com.longtime.app.base.model.JobLevelEntity;
import com.longtime.common.dao.BaseDAO;

public interface JobLevelDao extends BaseDAO<JobLevelEntity,String> {
	
	 List<JobLevelEntity> getAlltree(String rootId,String domain);
	 
	 List<JobLevelEntity> getFatherJobLevel(String childrenId,String domain);
	 
	 List<JobLevelEntity> getChildren(String id,String domain);
	 
	 void shiftRight(int after_right);
	 
	 void shiftLeft(int after_right);
	 
	 public Map<String,JobLevelEntity> getFatherMap(String childrenId,String domain);

	Map<? extends String, ? extends JobLevelEntity> getChildrenMap(String id,
			String domain);
	/**
	 * 判断同意父职称下的新添加的职称名称是否唯一
	 * @return 唯一  true
	 */
	boolean judge(String parentid,String name,String domain);
	
}
