package com.longtime.app.base.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.Validate;
import org.springframework.stereotype.Service;

import com.longtime.app.base.controller.vo.PermissionVo;
import com.longtime.app.base.dao.PermissionDao;
import com.longtime.app.base.model.Permission;
import com.longtime.app.base.service.PermissionService;
import com.longtime.common.dao.BaseDAO;
import com.longtime.common.service.BaseService4HImpl;

@Service("permissionService")
public class PermissionServiceImpl extends BaseService4HImpl<Permission, String> implements PermissionService{

	@Resource
	private PermissionDao permissionDao;
	
    @Override
    public BaseDAO<Permission, String> getDAO() {
        // TODO Auto-generated method stub
        return permissionDao;
    }

    @Override
	public void initTree() {
		// TODO Auto-generated method stub
		/* 删除整棵树 */
		this.removeTree();

		/* 添加根节点 */
		Permission root = new Permission();
		root.setId(Permission.root_id);
		root.setName("所有权限");
		root.setLeftWeight(1);
		root.setRightWeight(2);
		root.setDepth(1);
		root.setParentId(null);
		root.setChildren(null);

		permissionDao.insert(root);
	}

	@Override
	public void removeTree() {
		// TODO Auto-generated method stub
		this.remove(Permission.root_id);
	}

	@Override
	public Permission getRoot() {
		// TODO Auto-generated method stub
		return this.get(Permission.root_id);
	}

	@Override
	public void insert(Permission node, String parent_id) {
		// TODO Auto-generated method stub
		this.insert(node, parent_id, null);
	}

	@Override
	public void insertAfter(Permission node, String after_id) {
		// TODO Auto-generated method stub
	    Permission after = this.get(after_id);
		Validate.notNull(after, "after with id:[%s] can not be found", after_id);
//		this.insert(node, after.getParentId().getId(), after_id);
		this.insert(node, after.getParentId(), after_id);
	}

	@Override
	public void remove(String nodeId) {
		// TODO Auto-generated method stub
	    Permission node = this.get(nodeId);
		if (node == null) {
			return;
		}

		/* 将右边的兄弟节点左移 */
		permissionDao.shiftLeft(node.getRightWeight());
		/* 删除当前节点 */
		
		node.setIsDel(Permission.IS_DEL_YES);
		
//		PermissionDao.delete(node);
		permissionDao.update(node);
	}

	@Override
	public Permission getByRight(int insert_after) {
		// TODO Auto-generated method stub
//		List<TreeNode> nodes = this.find("rightPriority", insert_after);
//		return nodes == null || nodes.isEmpty() ? null : nodes.get(0);
		return null;
	}
	
	

	protected void insert(Permission node, String parent_id, String after_id) {
		Validate.notNull(node, "node can not be null");
		Validate.notNull(parent_id, "parent_id can not be null");

		Permission parent = this.get(parent_id);
		Validate.notNull(parent, "parent with id:[%s] can not be found", parent);
		node.setParentId(parent.getId());

		if (StringUtils.isBlank(node.getId())) {
			node.setId(UUID.randomUUID().toString());
		}

		Integer after_right = null;
		if (StringUtils.isBlank(after_id)) {
			/* 在兄弟节点中找到right最大的节点,在其后插入新节点 */
			/* 作为中序加权树,兄弟节点中最右边的righ=parent.right-1 */
			after_right = parent.getRightWeight() - 1;
		} else {
		    Permission after = this.get(after_id);
			after_right = after.getRightWeight();
		}

		/* 更新插入位置之后节点的left和right */
		/* 在插入新节点之前,需要将插入位置之后的节点都向后移2位,腾出空间 */
		/* 具体操作为: */
		/* (1)找到left和right大于给定right_priority的节点 */
		/* (2)将这些节点的left和right都+2 */
		permissionDao.shiftRight(after_right);

		/* 设置要插入节点的left和right */
		node.setLeftWeight(after_right + 1);
		node.setRightWeight(node.getLeftWeight() + 1);
		node.setIsLeaf(Permission.IS_LEAF_YES);

		/* 设置节点的层深 */
		node.setDepth(parent.getDepth() + 1);
		/* 保存节点 */
		permissionDao.insert(node);
	}
	
	public List<Permission> getAlltree(HttpServletRequest request){
		return permissionDao.getAlltree(request);
	}
	
	//根据子节点id查询父节点
	public List<Permission> getFatherPermission(String subId, HttpServletRequest request){
		return permissionDao.getFatherPermission(subId,request);
	}
	
	 //根据父节点查询下一级子节点
	public List<Permission> getNextPermission(String parentId, HttpServletRequest request){
		return permissionDao.getNextPermission(parentId, request);
	}
	
	public void getlistToJson1(List<PermissionVo> list,String id, HttpServletRequest request){
		List<Permission> list2 = this.getAlltree(request);
		List<Permission> fatherList = new ArrayList<Permission>();
		
		if(StringUtils.isBlank(id)){
			id = Permission.root_id;
		}
		else{
		    Permission search = this.get(id);
			if(search==null){
				id = Permission.root_id;
			}
			else{
				fatherList = this.getFatherPermission(id,request);
			}
		}
		
		for(int i=0;i<list2.size();i++){
			Permission per = (Permission) list2.get(i);
			PermissionVo permissionVo = new PermissionVo();
			permissionVo.setId(per.getId());
			if(per.getName().length()<15){
			    permissionVo.setName(per.getName());
			} else{
			    permissionVo.setName(per.getName().substring(0, 15)+"...");
			}
			permissionVo.setTitle(per.getName());
			permissionVo.setpId(per.getParentId());
			
			if(fatherList.size()!=0){
				for(int j=0;j<fatherList.size();j++){
					Permission parent = (Permission) fatherList.get(j);
					if(parent.getId().equals(per.getId())){
						permissionVo.setOpen(true);
						permissionVo.setChecked(true);
						permissionVo.setClick(true);
						permissionVo.setDefaultchecked(true);
					}
				}
			}
			
			else if(id.equals(per.getId())){
				permissionVo.setOpen(true);
				permissionVo.setChecked(true);
				permissionVo.setClick(true);
				permissionVo.setDefaultchecked(true);
			}
			list.add(permissionVo);
		}
	}
	
	
	
	public void getlistToJson1(List<PermissionVo> list, String[] ids, HttpServletRequest request){
		List<Permission> globalList = permissionDao.getAlltree(request);
		Map<String, Permission> checkMap = new HashMap<String, Permission>();
		for(int i=0;i<ids.length;i++){
			String id = ids[i];
			Permission search = this.get(id);
			if(search!=null){
			    checkMap.putAll(permissionDao.getFatherMap(id,request));
			}
		}
		for(Permission per: globalList){
		    PermissionVo permissionVo = new PermissionVo();
		    permissionVo.setId(per.getId());
            if(per.getName().length()<15){
                permissionVo.setName(per.getName());
            } else{
                permissionVo.setName(per.getName().substring(0, 15)+"...");
            }
            permissionVo.setTitle(per.getName());
		    permissionVo.setpId(per.getParentId());
		    if(checkMap.containsKey(per.getId())){
		        permissionVo.setOpen(true);
		        permissionVo.setChecked(true);
		        permissionVo.setClick(true);
		        permissionVo.setDefaultchecked(true);
		    }
		    if(per.getId().equals(Permission.root_id)){
                permissionVo.setOpen(true);
		    }
			
			list.add(permissionVo);
		}
	}
}
