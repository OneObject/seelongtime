package com.longtime.app.base.service;
import com.longtime.app.base.model.JobLevelEntity;
import com.longtime.app.base.model.JobLevelEntityVo;
import com.longtime.common.service.BaseService;
import java.util.List;

public interface JobLevelService extends BaseService<JobLevelEntity,String> {
   JobLevelEntity getRoot(String rootId);
   
   void initTree(String rootId,String domain);
   
   List<JobLevelEntityVo> getJobLevelEntityVos(String rootId,String id,String domain);
   
   List<JobLevelEntityVo> getJobLevelEntityVos(String rootId,String[] ids,String domain);
   
   List<JobLevelEntity> getChildLevelEntities(String id,String domain);
   
   void insert(JobLevelEntity node, String parent_id);
   
   void remove(String nodeId);
   
   /**
	 * 判断同意父职称下的新添加的职称名称是否唯一
	 * @return 唯一  true
	 */
   boolean judge(String parentid,String name,String domain);
   
   
   JobLevelEntity getByName(String name,String domain);
   
}
