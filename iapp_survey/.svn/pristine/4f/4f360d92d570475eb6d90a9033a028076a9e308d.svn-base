package com.longtime.app.base.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.longtime.app.base.controller.vo.PermissionShort;
import com.longtime.app.base.model.RolePerUnion;
import com.longtime.common.service.BaseService;

public interface RolePerUnionService extends BaseService<RolePerUnion, String>{
    
    /**
     * 获得角色的权限id列表
     * @param roleId
     * @return
     */
    public List<String> getPermissions(String roleId);

    /**
     * 更新角色-权限关联
     * @param idstr 权限id字符串
     * @param roleId 角色id
     * @return
     */
    public boolean updateUnion(String idstr, String roleId);

    /**
     * 获得用户的权限id列表
     * @param map
     * @param orderMap
     * @return
     */
    public Map<String, PermissionShort> getUserPermissions(String userId);
    
    /**
     * 获得用户的权限sourceId列表
     * @param map
     * @param orderMap
     * @return
     */
    public List<String> getUserAcl(String userId);

    /**
     * 获得系统的权限列表
     * @return
     */
    public List<PermissionShort> getGlobalPermissions(HttpServletRequest req);
}
