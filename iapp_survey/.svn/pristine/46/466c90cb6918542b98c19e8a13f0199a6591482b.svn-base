package com.longtime.app.base.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.longtime.app.base.controller.vo.PermissionShort;
import com.longtime.app.base.model.RolePerUnion;
import com.longtime.common.dao.BaseDAO;

public interface RolePerUnionDao  extends BaseDAO<RolePerUnion, String>{

    /**
     * 根据用户roleIds获得权限
     * @param userId
     * @return
     */
    Map<String, PermissionShort> getUserPermissions(List<String> roleIds);
    
    /**
     * 根据用户roleIds获得权限sourceIds
     * @param userId
     * @return
     */
    List<String> getUserAcl(List<String> roleIds);

    /**
     * 获得系统所有权限
     * @param userId
     * @return
     */
    List<RolePerUnion> getGlobalPermissions(HttpServletRequest req);
    
}
