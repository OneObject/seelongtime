package com.longtime.app.ixin.mgr.dao;

import java.util.List;
import java.util.Map;

import com.longtime.app.ixin.mgr.model.CustomMenu;

public interface CustomMenuDao {
    /**
     * 插入新节点(在兄弟节点中找到right最大的节点,在其后插入新节点)
     * @param node
     * @param parent_id 父节点,不能为空
     */
    void insert(CustomMenu node);
    
    /**
     * 插入新节点(在兄弟节点中找到right最大的节点,在其后插入新节点)
     * @param node
     * @param parent_id 父节点,不能为空
     */
    void update(CustomMenu node);

    void remove(String nodeId);
    
    CustomMenu get(String id);

    public void shiftLeft(int after_right) ;

    public void shiftRight(int after_right) ;

    public void shift(int after_right, int width);

    public List<CustomMenu> getAlltree(String domain);
    
    public Map<String, CustomMenu> getGlobalMap(String domain);
    
    //根据子节点id查询父节点
    public List<CustomMenu> getFatherCustomMenu(String subId, String domain);
    
    public Map<String, CustomMenu> getFatherMap(String subId, String domain);

    String getMenuData(String domain);

    void initTree();

    CustomMenu getRoot();

    CustomMenu getByDomain(String domain);

    //根据父节点查找下一级子节点
    public List<CustomMenu> getNextCustomMenu(String parentId, String domain);
    
    int getChildCount(CustomMenu parent);

}
