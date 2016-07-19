package com.longtime.app.base.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Repository;

import com.longtime.app.base.dao.PermissionDao;
import com.longtime.app.base.model.Permission;
import com.longtime.common.dao.BaseDAOImpl;
import com.longtime.common.utils.LoginSessionHelper;

@Repository("permissionDao")
public class PermissionDaoImpl extends BaseDAOImpl<Permission, String> implements PermissionDao{

	public Permission getByRight(int right) {
		return query("from Permission where rightWeight = ?", right);
	}

	public void shiftLeft(int after_right) {
		this.shift(after_right, -2);
	}

	public void shiftRight(int after_right) {
		this.shift(after_right, 2);
	}

	public void shift(int after_right, int width) {
		super.execute("update Permission set leftWeight = leftWeight + ? where leftWeight > ?", width, after_right);
		super.execute("update Permission set rightWeight = rightWeight + ? where rightWeight > ?",
			width,after_right);
		super.execute("update Permission p set p.isLeaf = ? where p.rightWeight-p.leftWeight=1", Permission.IS_LEAF_YES);
		super.execute("update Permission p set p.isLeaf = ? where p.rightWeight-p.leftWeight<>1", Permission.IS_LEAF_NO);
	}

	 //兄弟节点的数量 
	public int countBrother(String nodeId, HttpServletRequest request) {
	    Permission node = super.find(nodeId);
		
		if (node == null || node.getParentId() == null) {
			return 0;
		}

		Number count = super.query("select count(node.id) from Permission node where node.parentId.id = ? and node.domain = ?",
			new Object[]{node.getParentId(), LoginSessionHelper.getCurrentDomain(request)});
		return count.intValue();
	}

	 //子节点的数量 
	public int countChildren(String parentId, HttpServletRequest request) {
	    Permission parent = super.find(parentId);
		if (parent == null) {
			return 0;
		}

		Number count = super.query("select count(node.id) from Permission node where node.left between ? and ? and node.domain = ? ",
			parent.getLeftWeight(),
			parent.getRightWeight(), LoginSessionHelper.getCurrentDomain(request));
		return count.intValue();
	}
	
	public List<Permission> getAlltree(HttpServletRequest request){
		
		String sql ="SELECT node "+
					"FROM Permission node,"+
					"Permission parent "+
					"WHERE node.leftWeight BETWEEN parent.leftWeight AND parent.rightWeight "+
					" AND parent.id = ? AND parent.isDel='0' AND node.isDel='0' and node.domain = ?  "+
					"ORDER BY node.leftWeight";
		
		List<Permission> list = this.list(sql, new Object[]{Permission.root_id, LoginSessionHelper.getCurrentDomain(request)});
		return list;
	}
	
	public Map<String, Permission> getGlobalMap(HttpServletRequest request){
	    Map<String, Permission> map = new HashMap<String, Permission>();
	    List<Permission> list = this.getAlltree(request);
	    for(Permission p : list){
	        map.put(p.getId(), p);
	    }
	    return map;
	}
	
	//根据子节点id查询父节点
	public List<Permission> getFatherPermission(String subId, HttpServletRequest request){
		String hql = "SELECT parent "+
					 "FROM Permission node,"+
					 "Permission parent "+
					 " WHERE node.leftWeight BETWEEN parent.leftWeight AND parent.rightWeight "+
					 " AND node.id = ? AND parent.isDel='0' AND node.isDel='0' and parent.domain = ? "+
					 " ORDER BY parent.leftWeight";
		
		List<Permission> list = this.list(hql, new Object[]{subId, LoginSessionHelper.getCurrentDomain(request)});
		return list;
	}
    
    public Map<String, Permission> getFatherMap(String subId, HttpServletRequest request){
        Map<String, Permission> map = new HashMap<String, Permission>();
        List<Permission> list = this.getFatherPermission(subId, request);
        for(Permission p : list){
            map.put(p.getId(), p);
        }
        return map;
    }
	
	//根据父Id查找下一级同级组织
	public List<Permission> getNextPermission(String parentId, HttpServletRequest request){
		if(parentId==null){
			parentId = Permission.root_id;
		}
		String hql = "select per from Permission per "+
					 " where per.parentId= ? and per.isDel='0' and per.domain = ? order by per.leftWeight";
		List<Permission> list = this.list(hql, new Object[]{parentId, LoginSessionHelper.getCurrentDomain(request)});
		return list;
	}
	
	
}
