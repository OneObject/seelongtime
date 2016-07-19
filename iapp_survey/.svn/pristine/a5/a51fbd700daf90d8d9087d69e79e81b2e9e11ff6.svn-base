package com.longtime.app.base.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.Validate;
import org.springframework.stereotype.Service;

import com.google.common.collect.Lists;
import com.longtime.app.base.controller.vo.OrganizationVo;
import com.longtime.app.base.dao.OrganizationDao;
import com.longtime.app.base.model.Organization;
import com.longtime.app.base.service.OrganizationService;
import com.longtime.app.ixin.mgr.service.ITokenService;
import com.longtime.app.oplog.model.OpLog;
import com.longtime.common.dao.BaseDAO;
import com.longtime.common.service.BaseService4HImpl;
import com.longtime.common.utils.LoginSessionHelper;
import com.longtime.common.utils.QueryCondition;
import com.longtime.common.utils.ResultSet;


@Service("organizationService")
public class OrganizationServiceImpl extends BaseService4HImpl<Organization, String> implements OrganizationService{

	@Resource(name = "tokenService")
	private ITokenService tokenService;
	@Resource
	private OrganizationDao organizationDao;
	
	public OrganizationDao getOrganizationDao() {
		return organizationDao;
	}

	public void setOrganizationDao(OrganizationDao organizationDao) {
		this.organizationDao = organizationDao;
	}

	@Override
	public BaseDAO<Organization, String> getDAO() {
		// TODO Auto-generated method stub
		return organizationDao;
	}
	
	@Override
	public List<String> getRootPaths(String orgId,String domain) {
		List<Organization> list = organizationDao.getFatherNode(orgId, domain);
		List<String> paths = Lists.newArrayList();
		if(CollectionUtils.isEmpty(list)){
			paths.add(orgId);
			return paths;
		}
		for(Organization org : list){
			paths.add(org.getId());
		}
		return paths;
	}

	@Override
	public void initTree(String rootId,HttpServletRequest request) {

		/* 添加根节点 */
		Organization root = new Organization();
		root.setId(getRootId(request));
		root.setName("组织结构");
		root.setLeftWeight(1);
		root.setRightWeight(2);
		root.setDepth(1);
		root.setIsSystemType(Organization.IS_SYSTEM_YES);
		root.setParentId(null);
		root.setChildren(null);
		root.setDomain(LoginSessionHelper.getCurrentDomain(request));
		
		organizationDao.insert(root);
	}
	
	@Override
	public void initTree(String rootId, String domain) {
		/* 添加根节点 */
		Organization root = new Organization();
		root.setId(getRootId(domain));
		root.setName("组织结构");
		root.setLeftWeight(1);
		root.setRightWeight(2);
		root.setDepth(1);
		root.setIsSystemType(Organization.IS_SYSTEM_YES);
		root.setParentId(null);
		root.setChildren(null);
		root.setDomain(domain);
		organizationDao.insert(root);
	}

//	@Override
//	public void removeTree() {
//		// TODO Auto-generated method stub
//		this.remove(getRootId(request));
//	}

	@Override
	public Organization getRoot(String rootId) {
		// TODO Auto-generated method stub
		return this.get(rootId);
	}

	@Override
	public String insert(Organization node, String parent_id) {
		// TODO Auto-generated method stub
		return this.insert(node, parent_id, null);
	}

	@Override
	public void insertAfter(Organization node, String after_id) {
		// TODO Auto-generated method stub
		Organization after = this.get(after_id);
		Validate.notNull(after, "after with id:[%s] can not be found", after_id);
//		this.insert(node, after.getParentId().getId(), after_id);
		this.insert(node, after.getParentId(), after_id);
	}

	@Override
	public void remove(String nodeId) {
		// TODO Auto-generated method stub
		Organization node = this.get(nodeId);
		if (node == null) {
			return;
		}

		/* 将右边的兄弟节点左移 */
		organizationDao.shiftLeft(node.getRightWeight());
		/* 删除当前节点 */
		
		node.setIsdel(1);
		
		if(node.getSynchronousstatus() == 0){
			node.setSynchronousstatus(-2);
		} else if(node.getSynchronousstatus() == 1) {
			node.setSynchronousstatus(0);
			node.setSynctype(OpLog.ACTION_DEL);
		}
		
//		organizationDao.delete(node);
		organizationDao.update(node);
	}

	@Override
	public Organization getByRight(int insert_after) {
		// TODO Auto-generated method stub
//		List<TreeNode> nodes = this.find("rightPriority", insert_after);
//		return nodes == null || nodes.isEmpty() ? null : nodes.get(0);
		return null;
	}
	
	

	protected String insert(Organization node, String parent_id, String after_id) {
		Validate.notNull(node, "node can not be null");
		Validate.notNull(parent_id, "parent_id can not be null");

		Organization parent = this.get(parent_id);
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
			Organization after = this.get(after_id);
			after_right = after.getRightWeight();
		}

		/* 更新插入位置之后节点的left和right */
		/* 在插入新节点之前,需要将插入位置之后的节点都向后移2位,腾出空间 */
		/* 具体操作为: */
		/* (1)找到left和right大于给定right_priority的节点 */
		/* (2)将这些节点的left和right都+2 */
		organizationDao.shiftRight(after_right);

		/* 设置要插入节点的left和right */
		node.setLeftWeight(after_right + 1);
		node.setRightWeight(node.getLeftWeight() + 1);

		/* 设置节点的层深 */
		node.setDepth(parent.getDepth() + 1);
		/* 保存节点 */
		organizationDao.insert(node);
		
		return node.getId();
	}
	
	public List getAlltree(String domain){
		return organizationDao.getAlltree(domain);
	}
	
	//根据子节点id查询父节点
	public List getFatherOrg(String subId, HttpServletRequest request){
		return organizationDao.getFatherOrg(subId,request);
	}
	
	 //根据父节点查询下一级子节点
//	public List getNextOrg(String parentId, HttpServletRequest request){
//		return organizationDao.getNextOrg(parentId,request);
//	}

	 //根据父节点查询下一级子节点
	public List getNextOrg(String parentId,String domain){
		return organizationDao.getNextOrg(parentId,domain);
	}

    @Override
	public List<Organization> getChildOrg(String parentId, HttpServletRequest request){
	    return organizationDao.getChildOrg(parentId,request);
	}
    @Override
    public List<Organization> getChildOrg(String parentId, String domain){
    	return organizationDao.getChildOrg(parentId,domain);
    }

    @Override
    public List<String> getChildOrgIds(String parentId, HttpServletRequest request) {
        return organizationDao.getChildOrgIds(parentId,request);
    }
	
    public void getlistToJson1(List list, String id, HttpServletRequest request){
        
        String domain = LoginSessionHelper.getCurrentDomain(request);
        List list2 = this.getAlltree(domain);
		List fatherList = new ArrayList();
		
		if(StringUtils.isBlank(id)){
			id = getRootId(request);
		}
		else{
			Organization search = this.get(id);
			if(search==null){
				id = getRootId(request);
			}
			else{
				fatherList = this.getFatherOrg(id,request);
			}
		}
		//TokenInfo tokenInfo = tokenService.getTokenInfoByDomain(domain);
		//boolean isWXQY=tokenInfo.isWXQY();
		for(int i=0;i<list2.size();i++){
			Organization org = (Organization) list2.get(i);
			OrganizationVo organizationVo = new OrganizationVo();
			organizationVo.setId(org.getId());
			String name = org.getName();
			String status="";
			//	 status = org.getSyncStatus();
			organizationVo.setSynchronousstatus(org.getSynchronousstatus());
			organizationVo.setSynctype(org.getSynctype());
			if(org.getName().length() > 20){
			    organizationVo.setName(org.getName().substring(0, 20)+"...");
			} else{
			    organizationVo.setName(org.getName());
			}
			organizationVo.setTitle(org.getName());
			organizationVo.setpId(org.getParentId());
			
			if(fatherList.size()!=0){
				for(int j=0;j<fatherList.size();j++){
					Organization parent = (Organization) fatherList.get(j);
					if(parent.getId().equals(org.getId())){
						organizationVo.setOpen(true);
						organizationVo.setChecked(true);
						organizationVo.setClick(true);
						organizationVo.setDefaultchecked(true);
					}
				}
			}
			
			else if(id.equals(org.getId())){
				organizationVo.setOpen(true);
				organizationVo.setChecked(true);
				organizationVo.setClick(true);
				organizationVo.setDefaultchecked(true);
			}
			list.add(organizationVo);
		}
		
		/*if(list.size()==0){
			this.initTree();
	            Organization root = this.getRoot();
	            list.add(root);
		}*/
	}
    
    @Override
    public List<String> getChildIds(String parentId, String domain) {
    	return organizationDao.getChildOrgIds(parentId,domain);
    }
	
	
	public void getlistToJson1(List list,String[] ids, HttpServletRequest request){
	    String domain = LoginSessionHelper.getCurrentDomain(request);
		List list2 = this.getAlltree(domain);
		List fatherList = new ArrayList();
		for(int i=0;i<ids.length;i++){
			String id = ids[i];
			Organization search = this.get(id);
			if(search!=null){
				fatherList.addAll(this.getFatherOrg(id,request));
			}
		}
		for(int i=0;i<list2.size();i++){
			Organization org = (Organization) list2.get(i);
			OrganizationVo organizationVo = new OrganizationVo();
			organizationVo.setId(org.getId());
			organizationVo.setName(org.getName());
			organizationVo.setpId(org.getParentId());
			
			if(fatherList.size()!=0&&(ids.length==1&&!ids[0].equals(getRootId(request)))){
				for(int j=0;j<fatherList.size();j++){
					Organization parent = (Organization) fatherList.get(j);
					if(parent.getId().equals(org.getId())){
						organizationVo.setOpen(true);
					}
				}
				
				for(int j=0;j<ids.length;j++){
					String id = ids[j];
					if(id.equals(org.getId())){
						organizationVo.setOpen(true);
						organizationVo.setChecked(true);
						organizationVo.setDefaultchecked(true);
					}
				}
			}
			else if(ids[0].equals(org.getId())){
				organizationVo.setOpen(true);
//				organizationVo.setChecked(true);
				organizationVo.setClick(true);
//				organizationVo.setDefaultchecked(true);
			}
			
			list.add(organizationVo);
		}
	}

    public void getlistToJson2(List<OrganizationVo> list, String[] ids, HttpServletRequest request){
        String domain = LoginSessionHelper.getCurrentDomain(request);
        @SuppressWarnings("unchecked")
        List<Organization> globalList = organizationDao.getAlltree(domain);
        Map<String, Organization> checkMap = new HashMap<String, Organization>();
        if(ids!=null && ids.length>0){
			for (int i = 0; i < ids.length; i++) {
				String id = ids[i];
				Organization search = this.get(id);
				if (search != null) {
					//                checkMap.putAll(organizationDao.getFatherMap(id,request));
					checkMap.putAll(organizationDao.getChildrenMap(id, request));
				}
			}
        }
        for(Organization per: globalList){
            OrganizationVo vo = new OrganizationVo();
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
            if(per.getId().equals(getRootId(request))){
                vo.setOpen(true);
            }
            
            list.add(vo);
        }
    }
    
    private String getRootId(HttpServletRequest req) {
		return String.format("domain_%s", LoginSessionHelper.getCurrentDomain(req));
	}
    
    public static String getRootId(String domain) {
		return String.format("domain_%s", domain);
	}

	@Override
	public Organization getOrganization(String domain, String name) {
		if(StringUtils.isBlank(domain) || StringUtils.isBlank(name)){
			return null;
		}
		QueryCondition queryCondition=new QueryCondition();
		queryCondition.addFilterEqual("domain",domain);
		queryCondition.addFilterEqual("name", name);
		queryCondition.addFilterEqual("isdel",0);
		ResultSet<Organization> rSet=this.list(queryCondition);
		if(rSet!=null && rSet.getItems()!=null && rSet.getItems().size()>0){
			return rSet.getItems().get(0);
		}
		return null;
	}
	
	@Override
	public Organization getOrganization(String domain, String orgname, String parentId) {
		if(StringUtils.isBlank(domain) || StringUtils.isBlank(orgname) || StringUtils.isBlank(parentId)){
			return null;
		}
		QueryCondition queryCondition=new QueryCondition();
		queryCondition.addFilterEqual("domain",domain);
		queryCondition.addFilterEqual("name", orgname);
		queryCondition.addFilterEqual("parentId", parentId);
		queryCondition.addFilterEqual("isdel",0);
		ResultSet<Organization> rSet=this.list(queryCondition);
		if(rSet!=null && rSet.getItems()!=null && rSet.getItems().size()>0){
			return rSet.getItems().get(0);
		}
		return null;
	}
 
	
	@Override
	public void update(List<Organization> orgs) {
		this.organizationDao.update(orgs);
	}

	@Override
	public Organization getByCpid(Integer cpid,String domain) {
		if(cpid == 1){
			return this.organizationDao.get(String.format("domain_%s", domain));
		}
		
		String hql = "from Organization org where cpid=? and domain=? and isdel=0";
		List<Organization> list = this.organizationDao.list(hql, cpid,domain);
		if(CollectionUtils.isNotEmpty(list)){
			return list.get(0);
		}
		return null;
	}

	@Override
	public void updateSyncronousstaus(List<String> oids, String domain) {
		this.organizationDao.updateSyncronousstaus(oids,domain);
	}
	
	@Override
	public Organization getByName(String parentId, String name) {
		String hql = "from Organization org where parentId=? and name=? and isdel=0";
		List<Organization> list = this.organizationDao.list(hql, parentId,name);
		if(CollectionUtils.isNotEmpty(list)){
			return list.get(0);
		}
		return null;
	}
	
	
	/**
     * 
     * 重新生成该域下组织的左右权重
     * @param domain
     */
	@Override
    public void reflushTreeWeigth(String domain){
        Organization root = this.get(String.format("domain_%s", domain));
        int start_index = 1;
        int start_depth = 1;
        root.setLeftWeight(start_index);
        root.setDepth(start_depth);
        int index = computeWeight(root.getId(),start_index,start_depth,domain);
        index ++;
        root.setRightWeight(index);
        root.setLeaf(root.getRightWeight()-root.getLeftWeight()==1);
        this.update(root);
    }
	
	private int computeWeight(String pid ,int index,int depth,String domain){
	    
	    List<Organization> childrens = this.organizationDao.getNextOrg(pid, domain);
	    
	    if(null==childrens || childrens.isEmpty()){
	        return index;
	    }
	    
	    depth ++;
	    for (Organization organization : childrens) {
            index++;
	        organization.setLeftWeight(index);
	        
	        index =  computeWeight(organization.getId(),index,depth,domain);
	        
	        index ++;
	        organization.setRightWeight(index);
	        
	        organization.setLeaf(organization.getRightWeight()-organization.getLeftWeight()==1);
	        organization.setDepth(depth);
	        
	        // update organization
	        this.update(organization);
        }
	    
	    return index;
	    
	    
	    
	}

	private String toStringOrgName(String oid,String orgName){
		Organization org = this.get(oid);
		if (org != null) {
			orgName = String.format("/%s%s",org.getName(),orgName);
		}
		if (org != null  && StringUtils.isNotBlank(org.getParentId())) {
			orgName = toStringOrgName(org.getParentId(), orgName);
		}
		return orgName;
	} 
	
	@Override
	public String parseStringRoottoCurrentOrgName(String oid) {
		String orgName = "";
		orgName = toStringOrgName(oid, orgName);
		return orgName;
	}
	
	public static void main(String[] args) {
		String str = "b";
		doS(str);
		System.out.println(str);
	}
	
	private static void doS(String str){
		str = "a";
	}
	
}
