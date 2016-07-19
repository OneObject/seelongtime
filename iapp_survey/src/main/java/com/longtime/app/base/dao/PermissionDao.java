package com.longtime.app.base.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.longtime.app.base.model.Permission;
import com.longtime.common.dao.BaseDAO;

public interface PermissionDao  extends BaseDAO<Permission, String>{

    public Permission getByRight(int right) ;

    public void shiftLeft(int after_right) ;

    public void shiftRight(int after_right) ;

    public void shift(int after_right, int width);

    /* 兄弟节点的数量 */
    public int countBrother(String nodeId, HttpServletRequest request) ;

    /* 子节点的数量 */
    public int countChildren(String parentId, HttpServletRequest request) ;
    
    public List<Permission> getAlltree(HttpServletRequest request);
    
    public Map<String, Permission> getGlobalMap(HttpServletRequest request);
    
    //根据子节点id查询父节点
    public List<Permission> getFatherPermission(String subId, HttpServletRequest request);
    
    public Map<String, Permission> getFatherMap(String subId, HttpServletRequest request);
    
    //根据父节点查找下一一级子节点数
    public List<Permission> getNextPermission(String parentId, HttpServletRequest request);

}
