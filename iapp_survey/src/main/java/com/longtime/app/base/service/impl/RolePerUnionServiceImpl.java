package com.longtime.app.base.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import com.longtime.app.base.controller.vo.PermissionShort;
import com.longtime.app.base.dao.PermissionDao;
import com.longtime.app.base.dao.RolePerUnionDao;
import com.longtime.app.base.model.Permission;
import com.longtime.app.base.model.Role;
import com.longtime.app.base.model.RolePerUnion;
import com.longtime.app.base.service.RolePerUnionService;
import com.longtime.app.base.service.RoleService;
import com.longtime.app.base.service.UserRoleService;
import com.longtime.common.dao.BaseDAO;
import com.longtime.common.service.BaseService4HImpl;
import com.longtime.common.utils.LoginSessionHelper;

@Service("rolePerUnionService")
public class RolePerUnionServiceImpl extends BaseService4HImpl<RolePerUnion, String> implements RolePerUnionService{

    @Resource
    private RolePerUnionDao rolePerUnionDao;
    @Resource
    private PermissionDao permissionDao;
    @Resource
    private RoleService roleService;
    @Resource
    private UserRoleService userRoleService;
    
    @Override
    public BaseDAO<RolePerUnion, String> getDAO() {
        return rolePerUnionDao;
    }

    @Override
    public List<String> getPermissions(String roleId) {
        Map<String, Object> map = new HashMap<String, Object>();
        List<String> list = new ArrayList<String>();
        map.put("roleId", roleId);
        
        List<RolePerUnion> rpList = rolePerUnionDao.list(map);
        for(RolePerUnion rp: rpList){
            list.add(rp.getPerId());
        }
        return list;
    }

    @Override
    public boolean updateUnion(String idstr, String roleId) {
        if(StringUtils.isBlank(roleId)){
            return false;
        }
        Role r = roleService.get(roleId);
        if(null == r){
            return false;
        }
        
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("roleId", roleId);
        List<RolePerUnion> removeList = rolePerUnionDao.list(map);
        for(RolePerUnion rp: removeList){
            rolePerUnionDao.delete(rp);
        }
        
        String[] perIds = idstr.split(",");
        for(String s: perIds){
            if(StringUtils.isBlank(s)){
                continue;
            }
            Permission p = permissionDao.get(s);
            if(null == p){
                continue;
            }
            
            RolePerUnion rp = new RolePerUnion();
            rp.setPerId(s);
            rp.setRoleId(roleId);
            rolePerUnionDao.insert(rp);
        }
        return true;
    }

    @Override
    public Map<String, PermissionShort> getUserPermissions(String userId) {
        List<String> roleIds = userRoleService.listRoleIdByUserId(userId);
        return rolePerUnionDao.getUserPermissions(roleIds);
    }

    @Override
    public List<PermissionShort> getGlobalPermissions(HttpServletRequest req) {
        List<RolePerUnion> rpList = rolePerUnionDao.getGlobalPermissions(req);
        List<PermissionShort> retList = new ArrayList<PermissionShort>();
        for (RolePerUnion rp : rpList) {
            Permission per = permissionDao.get(rp.getPerId()); 

            PermissionShort ps = new PermissionShort();
            ps.setId(per.getId());
            ps.setUrl(per.getUrl());
            ps.setDepth(per.getDepth());
            ps.setSourceId(per.getSourceId());
            retList.add(ps);
        }
        return retList;
    }

    @Override
    public List<String> getUserAcl(String userId) {
        List<String> roleIds = userRoleService.listRoleIdByUserId(userId);
        return rolePerUnionDao.getUserAcl(roleIds);
    
    }
}
