package com.longtime.app.base.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.longtime.app.base.dao.JobLevelDao;
import com.longtime.app.base.model.JobLevelEntity;
import com.longtime.common.dao.BaseDAOImpl;

@Repository(value="jobLevelDao")
public class JobLevelDaoImpl extends BaseDAOImpl<JobLevelEntity,String> implements JobLevelDao {
    
	public List<JobLevelEntity> getAlltree(String rootId,String domain){
		 
		 StringBuilder sb=new StringBuilder("select node from JobLevelEntity node,JobLevelEntity parent ");
		 sb.append(" where node.leftWeight between parent.leftWeight and parent.rightWeight");
		 sb.append(" and parent.id=? ");
		 sb.append(" and parent.isdel=0 ");
		 sb.append(" and node.isdel=0 ");
		 sb.append(" and node.domain=?");
		 sb.append(" order by node.leftWeight");
		 
		 return this.list(sb.toString(),rootId,domain);
	 }
	 
	public  List<JobLevelEntity> getFatherJobLevel(String childrenId,String domain){
		
		StringBuilder sb=new StringBuilder("select parent from JobLevelEntity node ,JobLevelEntity parent ");
		sb.append("where node.leftWeight between parent.leftWeight and parent.rightWeight");
		sb.append(" and node.id=? ");
		sb.append(" and parent.isdel=0 ");
		sb.append(" and node.isdel=0 ");
		sb.append(" and parent.domain=? ");
		sb.append(" order by parent.leftWeight ");
		
		return this.list(sb.toString(),childrenId,domain);
	}

	public void shiftRight(int after_right) {
		this.shift(after_right, 2);
	}

	public void shiftLeft(int after_right) {
		this.shift(after_right, -2);
	}
	
	public void shift(int after_right, int width) {
		super.execute("update JobLevelEntity set leftWeight = leftWeight + ? where leftWeight > ?", width, after_right);
		super.execute("update JobLevelEntity set rightWeight = rightWeight + ? where rightWeight > ?",
			width,after_right);
		
		super.execute("update JobLevelEntity set isLeaf = 1 where rightWeight - leftWeight = 1");
		super.execute("update JobLevelEntity set isLeaf = 0 where rightWeight - leftWeight > 1");
	}
	
	 public Map<String,JobLevelEntity> getFatherMap(String childrenId,String domain){
		 Map<String,JobLevelEntity> map = new HashMap<String, JobLevelEntity>();
	        List<JobLevelEntity> list = this.getFatherJobLevel(childrenId, domain);
	        for(JobLevelEntity p : list){
	            map.put(p.getId(), p);
	        }
	        return map;
	 }
	/**
	 * 获得某个节点下层的节点 
	 */
	public List<JobLevelEntity> getChildren(String id,String domain)
	{
		
		StringBuilder sb=new StringBuilder("select child from JobLevelEntity node ,JobLevelEntity child ");
		sb.append("where child.leftWeight between node.leftWeight and node.rightWeight");
		sb.append(" and child.id=? ");
		sb.append(" and node.isdel=0 ");
		sb.append(" and child.isdel=0 ");
		sb.append(" and node.domain=? ");
		sb.append(" order by node.leftWeight ");
		 
		return this.list(sb.toString(),id,domain);
	}

	public Map<? extends String, ? extends JobLevelEntity> getChildrenMap(
			String id, String domain) {
		 Map<String,JobLevelEntity> map = new HashMap<String, JobLevelEntity>();
	        List<JobLevelEntity> list = this.getChildren(id, domain);
	        for(JobLevelEntity p : list){
	            map.put(p.getId(), p);
	        }
	        return map;
	}
	
	public boolean judge(String parentid,String name,String domain){
		String sql = "from JobLevelEntity  where isdel=0 and parentId=? and name=? and domain=?";
		if (parentid==null) {//根节点
			return true;
		}
		List<JobLevelEntity> list = this.list(sql,parentid,name,domain);
		
		if (list.size()>0) {
			return false;
		} else {
			return true;
		}
	}
	
}
