package com.longtime.app.base.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.json.JSONArray;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.math.NumberUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import com.google.common.collect.Lists;
import com.googlecode.genericdao.search.Filter;
import com.googlecode.genericdao.search.Search;
import com.longtime.app.base.dao.AclResourceDao;
import com.longtime.app.base.dao.AclResourceDomainDao;
import com.longtime.app.base.dao.AclRoleDao;
import com.longtime.app.base.dao.AclRoleResourceDao;
import com.longtime.app.base.dao.AclRoleUserDao;
import com.longtime.app.base.model.AclResource;
import com.longtime.app.base.model.AclResourceDomain;
import com.longtime.app.base.model.AclResourceVo;
import com.longtime.app.base.model.AclRole;
import com.longtime.app.base.model.AclRoleResource;
import com.longtime.app.base.model.AclRoleUser;
import com.longtime.app.base.service.AclService;
import com.longtime.common.dao.BaseDAO;
import com.longtime.common.service.BaseService4HImpl;
import com.longtime.common.utils.QueryCondition;
import com.longtime.common.utils.ResultSet;

@Service("aclService")
public class AclServiceImpl extends BaseService4HImpl<AclRole, Long> implements AclService{
    
    @Resource 
    private AclRoleDao	aclRoleDao;
    
    @Resource 
    private AclResourceDao	aclResourceDao;
    
    @Resource 
    private AclResourceDomainDao  aclResourceDomainDao;
    
    @Resource 
    private AclRoleResourceDao	aclRoleResourceDao;
    
    @Resource 
    private AclRoleUserDao	aclRoleUserDao;
    
    @Override
    public BaseDAO<AclRole, Long> getDAO() {
        return aclRoleDao;
    }
    

	@Override
	public List<Long> getDomainResource(String domain,Integer type) {
		
		Map<String, Object> params = new HashMap<String, Object>();
		
		//所有菜单资源
		if (type!=null) {
			params.put("type",type);
		}
		List<AclResource> list =  this.aclResourceDao.list(params);
		
		//当前域下特定的资源
		params.clear();
		params.put("domain",domain);
		List<AclResourceDomain> ards = this.aclResourceDomainDao.list(params);
		
		//获取特定资源id列表
		List<Long> ardIds = new ArrayList<Long>();
		for (AclResourceDomain aclResourceDomain : ards) {
			ardIds.add(aclResourceDomain.getResourceid());
		}
		
		//获取白名单菜单资源id列表
		List<Long> resourceIds = new ArrayList<Long>();
		for (AclResource aclResource : list) {
			
			//所有公开菜单资源id
			if (aclResource.getIsopen()==1) {
				
				resourceIds.add(aclResource.getId());
				
			//非公开菜单资源id
			}else if (ardIds.contains(aclResource.getId())) {
				
				resourceIds.add(aclResource.getId());
				
			}
		}
		return resourceIds;
	}

	@Override
	public List<Long> getUserResourceIds(String uid, String domain) {
		
		QueryCondition query = new QueryCondition();
		
		query.addFilterEqual("uid", uid);
		
		List<AclResource> list =  this.aclResourceDao.listByUid(uid);
		
		//获取当前用户觉得所有用的资源的id列表
		List<Long> resourceIds = new ArrayList<Long>();
		
		for (AclResource aclResource : list) {
			
			resourceIds.add(aclResource.getId());
			
		}
		
		return resourceIds;
	}


	
	@Override
	public List<Long> getResourceIdsByRoleId(String id) {
		List<Long> ids = Lists.newArrayList();
		
		if (StringUtils.isBlank(id)) {
			return ids;
		}
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("roleid", id);
		List<AclRoleResource> list = this.aclRoleResourceDao.list(params);
		if (CollectionUtils.isNotEmpty(list)) {
			for (AclRoleResource aclRoleResource : list) {
				ids.add(aclRoleResource.getResourceid());
			}
		}
		
		return ids;
	}


	@Override
	public JSONArray getCanDisplayResourceTree(List<Long> checklist,String domain) {
		
		List<AclResourceVo> list = Lists.newArrayList();
		//获取可显示菜单资源
		Search search = new Search();
		search.addFilter(Filter.notEqual("type", 10));
		ResultSet<AclResource> rs = this.aclResourceDao.query(search);
		List<AclResource> globalList = rs.getItems();
		
		//当前域下特定的资源
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("domain",domain);
		List<AclResourceDomain> ards = this.aclResourceDomainDao.list(params);
		
		//获取特定资源id列表
		List<Long> ardIds = new ArrayList<Long>();
		for (AclResourceDomain aclResourceDomain : ards) {
			ardIds.add(aclResourceDomain.getResourceid());
		}
		//去除非公开资源中本域无权限访问的,得到本站可访问的全部权限
		for(Iterator<AclResource> it = globalList.iterator();it.hasNext();){
			AclResource aclResource = it.next();
			if (aclResource.getIsopen() == 0) {
				if (!ardIds.contains(aclResource.getId())) {
					it.remove();
				}
			}
		}
//		for (AclResource aclResource : globalList) {
//			if (aclResource.getIsopen() == 0) {
//				if (!ardIds.contains(aclResource.getId())) {
//					globalList.remove(aclResource);
//				}
//			}
//		}
		
        for(AclResource per: globalList){
            AclResourceVo vo = new AclResourceVo();
            vo.setId(per.getId());
            if(per.getName().length()<15){
                vo.setName(per.getName());
            } else{
                vo.setName(per.getName().substring(0, 15)+"...");
            }
            vo.setTitle(per.getName());
            vo.setpId(per.getPid());
            if(checklist.contains(per.getId())){
                vo.setOpen(true);
                vo.setChecked(true);
                vo.setClick(true);
                vo.setDefaultchecked(true);
            }
            if(per.getId()==0){
                vo.setOpen(true);
            }
            
            list.add(vo);
        }
		
       return JSONArray.fromObject(list);
        
	}


	@Override
	public void deleteResourceByRoleId(long roleid) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("roleid", roleid);
		List<AclRoleResource> list  = this.aclRoleResourceDao.list(params);
		if (CollectionUtils.isNotEmpty(list)) {
			for (AclRoleResource aclRoleResource : list) {
				this.aclRoleResourceDao.delete(aclRoleResource);
			}
		}
	}


	@Override
	public void addAclRoleResource(AclRoleResource entity) {
		this.aclRoleResourceDao.insert(entity);
	}


	@Override
	public List<String> getUidsByRoleId(String id) {
		List<String> uids = Lists.newArrayList();
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("roleid", NumberUtils.toLong(id));
		List<AclRoleUser> list = this.aclRoleUserDao.list(params);
		if (CollectionUtils.isNotEmpty(list)) {
			for (AclRoleUser aclRoleUser : list) {
				uids.add(aclRoleUser.getUid());
			}
		}
		return uids;
	}


	@Override
	public boolean deleteRoleUserByUidAndRoleId(String uid,String rid) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("roleid", NumberUtils.toLong(rid));
		params.put("uid", uid);
		List<AclRoleUser> list = this.aclRoleUserDao.list(params);
		if (CollectionUtils.isNotEmpty(list)) {
			AclRoleUser aclRoleUser = list.get(0);
				return this.aclRoleUserDao.delete(aclRoleUser);
		}
		return false;
	}


	@Override
	public void addAclRoleUser(AclRoleUser entity) {
		this.aclRoleUserDao.insert(entity);
	}


	@Override
	public boolean checkUserHasOtherRoleByUid(String uid) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("uid", uid);
		List<AclRoleUser> list = this.aclRoleUserDao.list(params);
		if (CollectionUtils.isNotEmpty(list)) {
			return true;
		}
		return false;
	}


	@Override
	public boolean checkIsHadUsersByRoleId(long id) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("roleid", id);
		List<AclRoleUser> list = this.aclRoleUserDao.list(params);
		if (CollectionUtils.isNotEmpty(list)) {
			return true;
		}
		return false;
	}

}
