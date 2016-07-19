package com.longtime.app.base.service.impl;

import com.google.common.collect.Lists;
import com.longtime.app.base.dao.JobLevelDao;
import com.longtime.app.base.model.JobLevelEntity;
import com.longtime.app.base.model.JobLevelEntityVo;
import com.longtime.app.base.model.Organization;
import com.longtime.app.base.service.JobLevelService;
import com.longtime.common.dao.BaseDAO;
import com.longtime.common.service.BaseService4HImpl;
import com.longtime.common.utils.QueryCondition;
import com.longtime.common.utils.ResultSet;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import javax.annotation.Resource;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.Validate;
import org.springframework.stereotype.Service;

@Service(value="jobLevelService")
public class JobLevelServiceImpl extends BaseService4HImpl<JobLevelEntity,String> implements JobLevelService {
    
	@Resource
	private JobLevelDao jobLevelDao;
	
	@Override
	public BaseDAO<JobLevelEntity, String> getDAO() {
		return this.jobLevelDao;
	}

	@Override
	public JobLevelEntity getRoot(String rootId) {
		return this.get(rootId);
	}

	@Override
	public void initTree(String rootId,String domain) {
		/* 添加根节点 */
		JobLevelEntity root= new JobLevelEntity();
		root.setId(rootId);
		root.setName("职级结构");
		root.setLeftWeight(1);
		root.setRightWeight(2);
		root.setDepth(1);
		root.setIsSystemType(Organization.IS_SYSTEM_YES);
		root.setParentId(null);
		root.setChildren(null);
		root.setDomain(domain);
		this.jobLevelDao.insert(root);
	}
	
	

	@Override
	public List<JobLevelEntityVo> getJobLevelEntityVos(String rootId,String id,String domain) {
		
		List<JobLevelEntityVo> list=Lists.newArrayList();
		
		List<JobLevelEntity> jobLevelEntities=this.jobLevelDao.getAlltree(rootId, domain);
		
		List<JobLevelEntity> fatherList=null;
		
		if(StringUtils.isBlank(id)){
			id = rootId;
		}
		else{
			JobLevelEntity jobLevelEntity=this.jobLevelDao.get(id);
			if(jobLevelEntity==null){
				id =rootId;
			}else{
				fatherList =this.jobLevelDao.getFatherJobLevel(id, domain);
			}
		}
		if(!CollectionUtils.isEmpty(jobLevelEntities)){
			
			for(JobLevelEntity jobLevelEntity:jobLevelEntities){
				
				JobLevelEntityVo jobLevelEntityVo=new JobLevelEntityVo();
				
				jobLevelEntityVo.setId(jobLevelEntity.getId());
				if(jobLevelEntity.getName().length() > 10){
				    jobLevelEntityVo.setName(jobLevelEntity.getName().substring(0, 10)+"...");
				} else{
				   jobLevelEntityVo.setName(jobLevelEntity.getName());
				}
				
				jobLevelEntityVo.setTitle(jobLevelEntity.getName());
				jobLevelEntityVo.setpId(jobLevelEntity.getParentId());
				
				if(fatherList!=null && fatherList.size()>0){
					
					for(JobLevelEntity jobLevelEntity2:fatherList){
						if(jobLevelEntity2.getId().equals(jobLevelEntity.getId())){
							jobLevelEntityVo.setOpen(true);
							jobLevelEntityVo.setChecked(true);
							jobLevelEntityVo.setClick(true);
							jobLevelEntityVo.setDefaultchecked(true);
						}
					}
					
				}else if(id.equals(jobLevelEntity.getId())){
					jobLevelEntityVo.setOpen(true);
					jobLevelEntityVo.setChecked(true);
					jobLevelEntityVo.setClick(true);
					jobLevelEntityVo.setDefaultchecked(true);
				}
				
				list.add(jobLevelEntityVo);
			}
		}
		return list;
	}
    
	

	protected void insert(JobLevelEntity node, String parent_id, String after_id) {
		Validate.notNull(node, "node can not be null");
		Validate.notNull(parent_id, "parent_id can not be null");

		JobLevelEntity parent = this.get(parent_id);
		Validate.notNull(parent, "parent with id:[%s] can not be found", parent);
		node.setParentId(parent.getId());
		if (StringUtils.isBlank(node.getId())) {
			node.setId(UUID.randomUUID().toString());
		}
		Integer after_right = null;
		if (StringUtils.isBlank(after_id)) {
			after_right = parent.getRightWeight() - 1;
		} else {
			JobLevelEntity after = this.get(after_id);
			after_right = after.getRightWeight();
		}
		jobLevelDao.shiftRight(after_right);
		node.setLeftWeight(after_right + 1);
		node.setRightWeight(node.getLeftWeight() + 1);
		node.setDepth(parent.getDepth() + 1);
		this.jobLevelDao.insert(node);
	}

	@Override
	public void insert(JobLevelEntity node, String parent_id) {
       this.insert(node, parent_id,null);		
	}

	@Override
	public void remove(String nodeId) {
		JobLevelEntity node = this.get(nodeId);
		if (node == null) {
			return;
		}
		jobLevelDao.shiftLeft(node.getRightWeight());
		node.setIsdel(1);
		jobLevelDao.update(node);
	}

	@Override
	public List<JobLevelEntityVo> getJobLevelEntityVos(String rootId,String[] ids, String domain) {
		
		
		List<JobLevelEntityVo> list=Lists.newArrayList();
		
		 List<JobLevelEntity> globalList = this.jobLevelDao.getAlltree(rootId, domain);
	        Map<String, JobLevelEntity> checkMap = new HashMap<String,JobLevelEntity>();
	        if(ids.length>0){
	        for(int i=0;i<ids.length;i++){
	            String id = ids[i];
	            JobLevelEntity search = this.get(id);
	            if(search!=null){
	                checkMap.putAll(this.jobLevelDao.getChildrenMap(id,domain));
	            }
	        }
	       }
	        for(JobLevelEntity per: globalList){
	            JobLevelEntityVo vo = new JobLevelEntityVo();
	            vo.setId(per.getId());
	            if(per.getName().length()<15){
	                vo.setName(per.getName());
	            } else{
	                vo.setName(per.getName().substring(0, 15)+"...");
	            }
	            vo.setTitle(per.getName());
	            vo.setpId(per.getParentId());
	            if(checkMap.containsKey(per.getId())){
	                vo.setOpen(true);
	                vo.setChecked(true);
	                vo.setClick(true);
	                vo.setDefaultchecked(true);
	            }
	            if(per.getId().equals(rootId)){
	                vo.setOpen(true);
	            }
	            
	            list.add(vo);
	        }
		return list;
	}

	@Override
	public List<JobLevelEntity> getChildLevelEntities(String id,
			String domain)
	{
		// TODO 得到某个节点下的子节点
		List<JobLevelEntity> jobLevelEntities=this.jobLevelDao.getChildren(id, domain);
		return jobLevelEntities;
	}

	@Override
	public boolean judge(String parentid, String name, String domain) {
		boolean isUniqueness = this.jobLevelDao.judge(parentid, name, domain);
		return isUniqueness;
	}
	
	@Override
	public JobLevelEntity getByName(String name,String domain){
	    if(StringUtils.isBlank(name)){
	        return null;
	    }
	    
	    QueryCondition queryCondition = new QueryCondition();
	    if(StringUtils.isNotBlank(domain)){
	        queryCondition.addFilterEqual("domain", domain);
	    }
        queryCondition.addFilterEqual("name", name);
        queryCondition.addFilterEqual("isdel", 0);

        ResultSet<JobLevelEntity> rs = this.list(queryCondition);

        
        if (rs != null && rs.getItems() != null && rs.getItems().size() > 0) {
            return rs.getItems().get(0);
        }
        return null;
	}
}
