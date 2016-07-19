package com.longtime.app.ixin.mgr.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.Validate;
import org.springframework.stereotype.Service;

import com.longtime.app.ixin.mgr.dao.CustomMenuDao;
import com.longtime.app.ixin.mgr.model.CustomMenu;
import com.longtime.app.ixin.mgr.service.CustomMenuService;
import com.longtime.app.ixin.vo.CustomMenuVO;

@Service("custommenuService")
public class CustomMenuServiceImpl implements CustomMenuService{

	@Resource
	private CustomMenuDao customMenuDao;
	
	@Override
	public void removeTree() {
		this.remove(CustomMenu.root_id);
	}

	@Override
	public CustomMenu getRoot() {
		return this.customMenuDao.getRoot();
	}

	@Override
	public void insert(CustomMenu node, String parent_id) {
		this.insert(node, parent_id, null);
	}

    @Override
    public void update(CustomMenu node) {
        customMenuDao.update(node);
    }

    @Override
    public CustomMenu get(String id) {
        return customMenuDao.get(id);
    }
    
    @Override
    public void remove(String nodeId) {
        // TODO Auto-generated method stub
        CustomMenu node = this.get(nodeId);
        if (node == null) {
            return;
        }

        /* 将右边的兄弟节点左移 */
        customMenuDao.shiftLeft(node.getRightWeight());
        /* 删除当前节点 */
        
        node.setIsdel(CustomMenu.IS_DEL_YES);
        
//      customMenuDao.delete(node);
        customMenuDao.update(node);
    }

    @Override
    public List<CustomMenu> getAlltree(String domain) {
        return this.customMenuDao.getAlltree(domain);
    }

	protected void insert(CustomMenu node, String parent_id, String after_id) {
		Validate.notNull(node, "node can not be null");
		Validate.notNull(parent_id, "parent_id can not be null");

		CustomMenu parent = this.get(parent_id);
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
		    CustomMenu after = this.get(after_id);
			after_right = after.getRightWeight();
		}

		/* 更新插入位置之后节点的left和right */
		/* 在插入新节点之前,需要将插入位置之后的节点都向后移2位,腾出空间 */
		/* 具体操作为: */
		/* (1)找到left和right大于给定right_priority的节点 */
		/* (2)将这些节点的left和right都+2 */
		customMenuDao.shiftRight(after_right);

		/* 设置要插入节点的left和right */
		node.setLeftWeight(after_right + 1);
		node.setRightWeight(node.getLeftWeight() + 1);
		node.setIsLeaf(CustomMenu.IS_LEAF_YES);

		/* 设置节点的层深 */
		node.setDepth(parent.getDepth() + 1);
		/* 保存节点 */
		customMenuDao.insert(node);
	}
	
	//根据子节点id查询父节点
	public List<CustomMenu> getFatherCustomMenu(String subId, String domain){
		return customMenuDao.getFatherCustomMenu(subId,domain);
	}
	
	public void getlistToJson1(List<CustomMenuVO> list, String id, String domain){
		List<CustomMenu> list2 = this.getAlltree( domain);
		List<CustomMenu> fatherList = new ArrayList<CustomMenu>();
		
		CustomMenu customMenu = customMenuDao.getByDomain(domain);
		
		if(StringUtils.isBlank(id)){
			id = customMenu.getId();
		}
		else{
		    CustomMenu search = this.get(id);
			if(search==null){
	            id = customMenu.getId();
			}
			else{
				fatherList = this.getFatherCustomMenu(id,domain);
			}
		}
		
		if(CollectionUtils.isEmpty(list2)){
		    return ;
		}
		
		for(int i=0;i<list2.size();i++){
			CustomMenu entity = (CustomMenu) list2.get(i);
			CustomMenuVO vo = new CustomMenuVO();
			
			vo.setId(entity.getId());
//			vo.setType(entity.getType());
//			vo.setKeycode(entity.getKeycode());
//			vo.setLinkurl(entity.getLinkurl());
            vo.setTitle(entity.getName());
            vo.setpId(entity.getParentId());
            
            vo.setIsLeaf(entity.getIsLeaf());
            
			if(entity.getName().length()<15){
			    vo.setName(entity.getName());
			} else{
			    vo.setName(entity.getName().substring(0, 15)+"...");
			}
			
			if(fatherList.size()!=0){
				for(int j=0;j<fatherList.size();j++){
					CustomMenu parent = (CustomMenu) fatherList.get(j);
					if(parent.getId().equals(entity.getId())){
						vo.setOpen(true);
						vo.setChecked(true);
						vo.setClick(true);
						vo.setDefaultchecked(true);
					}
				}
			}
			
			else if(id.equals(entity.getId())){
				vo.setOpen(true);
				vo.setChecked(true);
				vo.setClick(true);
				vo.setDefaultchecked(true);
			}
			list.add(vo);
		}
	}
	
	
	
	public void getlistToJson1(List<CustomMenuVO> list, String[] ids, String domain){
		List<CustomMenu> globalList = customMenuDao.getAlltree( domain);
		Map<String, CustomMenu> checkMap = new HashMap<String, CustomMenu>();
		for(int i=0;i<ids.length;i++){
			String id = ids[i];
			CustomMenu search = this.get(id);
			if(search!=null){
			    checkMap.putAll(customMenuDao.getFatherMap(id,domain));
			}
		}
		for(CustomMenu entity: globalList){
		    CustomMenuVO vo = new CustomMenuVO();
		    
		    vo.setId(entity.getId());
//            vo.setType(entity.getType());
//            vo.setKeycode(entity.getKeycode());
//            vo.setLinkurl(entity.getLinkurl());
            vo.setTitle(entity.getName());
            vo.setpId(entity.getParentId());
            
            if(entity.getName().length()<15){
                vo.setName(entity.getName());
            } else{
                vo.setName(entity.getName().substring(0, 15)+"...");
            }
		    if(checkMap.containsKey(entity.getId())){
		        vo.setOpen(true);
		        vo.setChecked(true);
		        vo.setClick(true);
		        vo.setDefaultchecked(true);
		    }
		    if(entity.getId().equals(CustomMenu.root_id)){
                vo.setOpen(true);
		    }
			
			list.add(vo);
		}
	}

    @Override
    public String getMenuData(String domain) {
        return this.customMenuDao.getMenuData(domain);
    }

    @Override
    public void initTree() {
        this.customMenuDao.initTree();
    }

    @Override
    public CustomMenu getByDomain(String domain) {
        return this.customMenuDao.getByDomain(domain);
    }

    @Override
    public void initDomainNode(String currentDomain, String currentUserId) {
        CustomMenu root = this.getRoot();
        
        if(this.getByDomain(currentDomain) == null){
            CustomMenu domainNode = new CustomMenu();
            domainNode.setId(UUID.randomUUID().toString().replace("-", ""));
            domainNode.setDomain(currentDomain);
            domainNode.setName(currentDomain);
            domainNode.setCreater(currentUserId);
            
            this.insert(domainNode, root.getId());
        }
        
    }

    @Override
    public int getChildCount(String id) {
        return this.customMenuDao.getChildCount(this.get(id));
    }

}
