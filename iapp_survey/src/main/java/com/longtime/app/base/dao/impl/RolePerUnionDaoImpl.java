package com.longtime.app.base.dao.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Repository;

import com.longtime.app.base.controller.vo.PermissionShort;
import com.longtime.app.base.dao.PermissionDao;
import com.longtime.app.base.dao.RolePerUnionDao;
import com.longtime.app.base.dao.UserRoleDao;
import com.longtime.app.base.model.Permission;
import com.longtime.app.base.model.RolePerUnion;
import com.longtime.common.dao.BaseDAOImpl;
import com.longtime.common.utils.LoginSessionHelper;

@Repository("rolePerUnionDao")
public class RolePerUnionDaoImpl extends BaseDAOImpl<RolePerUnion, String> implements RolePerUnionDao{
    @Resource
    private UserRoleDao userRoleDao;
    @Resource
    private PermissionDao permissionDao;
    
    @Override
    public Map<String, PermissionShort> getUserPermissions(List<String> roleIds) {
        StringBuffer roleIdsStr = new StringBuffer(); 
        for (int i=0; i<roleIds.size(); i++) {
            if(i != roleIds.size()-1){
                roleIdsStr.append(roleIds.get(i)+",");
            }
            roleIdsStr.append(roleIds.get(i));
        }
        
        StringBuffer hql = new StringBuffer();
        hql.append(" from RolePerUnion rp where ");

        System.out.println("roleIds.size()"+roleIds.size());
        hql.append(" rp.roleId in ? ");
        hql.append(" order by rp.depth desc ");
        
        System.out.println(hql.toString());
        List<RolePerUnion> rpList = this.list(hql.toString(), roleIdsStr.toString());
        System.out.println("rpList.size()"+rpList.size());
        Map<String, PermissionShort> map = new HashMap<String, PermissionShort>();
        for (RolePerUnion rp : rpList) {
            Permission per = permissionDao.get(rp.getPerId()); 

            PermissionShort ps = new PermissionShort();
            ps.setId(per.getId());
            ps.setUrl(per.getUrl());
            ps.setDepth(per.getDepth());
            
            map.put(ps.getId(), ps);
        }
        System.out.println("map.size()"+map.size());
        return map==null? new HashMap<String, PermissionShort>():map;
    }
    
    @Override
    public List<RolePerUnion> getGlobalPermissions(HttpServletRequest req){
        StringBuffer hql = new StringBuffer();
        hql.append(" from RolePerUnion rp where rp.perId <> ? and rp.domain = ? order by rp.depth desc ");
        List<RolePerUnion> rpList = this.list(hql.toString(), new Object[]{Permission.root_id, LoginSessionHelper.getCurrentDomain(req)});
        
        return rpList;
    }
    
    @Override
    public List<String> getUserAcl(List<String> roleIds){
        StringBuffer roleIdsStr = new StringBuffer(); 
        for (int i=0; i<roleIds.size(); i++) {
            if(i != roleIds.size()-1){
                roleIdsStr.append(roleIds.get(i)+",");
            }
            roleIdsStr.append(roleIds.get(i));
        }
        
        StringBuffer hql = new StringBuffer();
        hql.append(" from RolePerUnion rp where rp.roleId in ? and rp.perId <> ? order by rp.depth desc ");
        
        List<RolePerUnion> rpList = this.list(hql.toString(), new Object[]{roleIdsStr.toString(), Permission.root_id});
        
        List<String> ret = new ArrayList<String>();
        for (RolePerUnion rp : rpList) {
            Permission per = permissionDao.get(rp.getPerId()); 
            
            if(StringUtils.isNotBlank(per.getSourceId())){
                ret.add(per.getSourceId());
            }
        }
        return ret;
    }
}







