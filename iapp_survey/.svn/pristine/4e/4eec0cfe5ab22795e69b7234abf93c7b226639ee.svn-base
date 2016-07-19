package com.longtime.app.base.dao;

import com.longtime.app.base.model.Organization;
import com.longtime.common.dao.BaseDAO;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

public interface OrganizationDao  extends BaseDAO<Organization, String>{

	public Organization getByRight(int right) ;

	public void shiftLeft(int after_right) ;

	public void shiftRight(int after_right) ;

	public void shift(int after_right, int width);

	/* 兄弟节点的数量 */
	public int countBrother(String nodeId, String domain) ;

	/* 子节点的数量 */
	public int countChildren(String parentId, HttpServletRequest request) ;
	
	public List getAlltree(String domain);
	
	//根据子节点id查询父节点
	public List getFatherOrg(String subId, HttpServletRequest request);
	
	//根据父节点查找下一一级子节点数
	//public List getNextOrg(String parentId, HttpServletRequest request);
	
	public List getNextOrg(String parentId, String domain);

	List getNextOrgOrderByName(String parentId, String domain);

    public List<Organization> getChildOrg(String parentId, HttpServletRequest request);
    public List<Organization> getChildOrg(String parentId, String domain);
   // public List<Organization> getChildren(String parentId, HttpServletRequest request);

    public List<String> getChildOrgIds(String parentId, HttpServletRequest request);
    
    public List<String> getChildOrgIds(String parentId, String domain);
    
    /** 获得map */
    public Map<String, Organization> getFatherMap(String subId, HttpServletRequest request);

	public Map<String,  Organization> getChildrenMap(String id, HttpServletRequest request);

	public boolean[] update(List<Organization> orgs);

	public void updateSyncronousstaus(List<String> oids, String domain);

	/**
	 * 查找指定组织从根到id的路径
	 * @author yangwenkui
	 * @time 2016年6月12日 下午11:37:36
	 * @param orgId
	 * @Param domain
	 * @return
	 */
	public List<Organization> getFatherNode(String orgId, String domain);

}
