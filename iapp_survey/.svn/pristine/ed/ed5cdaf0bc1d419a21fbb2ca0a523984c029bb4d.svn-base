package com.longtime.app.base.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.longtime.app.base.controller.vo.OrganizationVo;
import com.longtime.app.base.model.Organization;
import com.longtime.common.service.BaseService;

public interface OrganizationService extends BaseService<Organization, String>{
   
	
	Organization getOrganization(String domain,String name);
	
	void initTree(String rootId,HttpServletRequest req);

//	void removeTree();

	Organization getRoot(String oid);

	/**
	 * 插入新节点(在兄弟节点中找到right最大的节点,在其后插入新节点)
	 * 
	 * @param node
	 * @param parent_id 父节点,不能为空
	 */
	String insert(Organization node, String parent_id);

	/**
	 * 插入新节点(在给定节点之后)
	 * 
	 * @param node
	 * @param after_id 在那个兄弟节点之后插入.
	 */
	void insertAfter(Organization node, String after_id);

	void remove(String nodeId);

	Organization getByRight(int insert_after);
	
	public List getAlltree(String domain);
	//根据子节点id查询父节点
	//public List getFatherOrg(String subId, HttpServletRequest request);
	
	 //根据父节点查询下一级子节点
	//public List getNextOrg(String parentId, HttpServletRequest request);
	
	public List getNextOrg(String parentId, String domain);
	
	/** 根据父节点查询所有孩子节点 */
	public List<Organization> getChildOrg(String parentId, HttpServletRequest request);
	
	/** 根据父节点查询所有孩子节点 */
	public List<Organization> getChildOrg(String parentId, String domain);
	
	/** 根据父节点查询所有孩子节点id */
	public List<String> getChildOrgIds(String parentId, HttpServletRequest request);
	
	public void getlistToJson1(List list,String id, HttpServletRequest request);
	
	public void getlistToJson1(List list,String[] ids, HttpServletRequest request);
	
	/** 获得ztree数据，list，整棵树的节点列表，ids，已选择节点id */
	public void getlistToJson2(List<OrganizationVo> list,String[] ids, HttpServletRequest request);

	void initTree(String rootId, String domain);

	void update(List<Organization> orgs);

	Organization getOrganization(String domain, String orgname, String parentId);

	Organization getByCpid(Integer id,String domain);

	void updateSyncronousstaus(List<String> oids, String domain);

	Organization getByName(String parentId, String name);

	List<String> getChildIds(String id, String domain);
	
	
	/**
	 * 
	 * 从新生成该域下组织的左右权重
	 * @param domain
	 */
	void reflushTreeWeigth(String domain);


	String parseStringRoottoCurrentOrgName(String oid);

	/**
	 * 查找指定组织从根到指定节点的路径（包括该节点）
	 * @author yangwenkui
	 * @time 2016年6月12日 下午11:37:36
	 * @param orgId
	 * @Param domain
	 * @return
	 */
	List<String> getRootPaths(String orgId,String domain);
	
	
	
	
}
