package com.longtime.app.base.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.longtime.app.base.controller.vo.PermissionVo;
import com.longtime.app.base.model.Permission;
import com.longtime.common.service.BaseService;

public interface PermissionService extends BaseService<Permission, String>{

	void initTree();

	void removeTree();

	Permission getRoot();

	/**
	 * 插入新节点(在兄弟节点中找到right最大的节点,在其后插入新节点)
	 * 
	 * @param node
	 * @param parent_id 父节点,不能为空
	 */
	void insert(Permission node, String parent_id);

	/**
	 * 插入新节点(在给定节点之后)
	 * 
	 * @param node
	 * @param after_id 在那个兄弟节点之后插入.
	 */
	void insertAfter(Permission node, String after_id);

	void remove(String nodeId);

	Permission getByRight(int insert_after);
	
	public List<Permission> getAlltree(HttpServletRequest request);
	//根据子节点id查询父节点
	public List<Permission> getFatherPermission(String subId, HttpServletRequest request);
	
	 //根据父节点查询下一级子节点
	public List<Permission> getNextPermission(String parentId, HttpServletRequest request);
	
	public void getlistToJson1(List<PermissionVo> list,String id, HttpServletRequest request);
	
	public void getlistToJson1(List<PermissionVo> list,String[] ids, HttpServletRequest request);
	
}
