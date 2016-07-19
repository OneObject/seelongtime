package com.longtime.app.ixin.mgr.service;

import java.util.List;

import com.longtime.app.ixin.mgr.model.CustomMenu;
import com.longtime.app.ixin.vo.CustomMenuVO;

public interface CustomMenuService {
	void removeTree();

	CustomMenu getRoot();

	CustomMenu getByDomain(String domain);
	
	/**
	 * 插入新节点(在兄弟节点中找到right最大的节点,在其后插入新节点)
	 * @param node
	 * @param parent_id 父节点,不能为空
	 */
	void insert(CustomMenu node, String parent_id);
	
	/**
	 * 插入新节点(在兄弟节点中找到right最大的节点,在其后插入新节点)
	 * @param node
	 * @param parent_id 父节点,不能为空
	 */
	void update(CustomMenu node);

	void remove(String nodeId);
	
	CustomMenu get(String id);

	public List<CustomMenu> getAlltree(String domain);
	
	//根据子节点id查询父节点
	public List<CustomMenu> getFatherCustomMenu(String subId, String domain);
	
	public void getlistToJson1(List<CustomMenuVO> list, String id, String domain);
	
	public void getlistToJson1(List<CustomMenuVO> list, String[] ids, String domain);

    public String getMenuData(String domain);

    void initTree();

    void initDomainNode(String currentDomain, String currentUserId);
    
    int getChildCount(String id);
	
}
