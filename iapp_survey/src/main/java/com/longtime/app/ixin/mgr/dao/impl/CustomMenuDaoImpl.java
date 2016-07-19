package com.longtime.app.ixin.mgr.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import org.apache.commons.collections.CollectionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.longtime.app.ixin.mgr.dao.CustomMenuDao;
import com.longtime.app.ixin.mgr.model.CustomMenu;

@Repository("custommenuDao")
public class CustomMenuDaoImpl implements CustomMenuDao{
    
    private static final Logger logger = LoggerFactory.getLogger(CustomMenuDaoImpl.class);

    @Resource(name = "ixin_jdbcTemplate")
    private JdbcTemplate jdbcTemplate;
    
    @Override
    public void insert(CustomMenu entity) {
        String sql = "insert into ixin_custom_menu(id,domain,name,type,keycode,linkurl,parent_id,depth,is_leaf,left_weight,right_weight,"
        		+ "isdel,creater,create_time,updater,update_time,refoptionname) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        logger.debug("sql~~~:"+sql);
        
        int ret = jdbcTemplate.update(
                sql,
                entity.getId(),
                entity.getDomain(),
                entity.getName(),
                entity.getType(),
                entity.getKeycode(),
                entity.getLinkurl(),
                entity.getParentId(),
                entity.getDepth(),
                entity.getIsLeaf(),
                entity.getLeftWeight(),
                entity.getRightWeight(),
                entity.getIsdel(),
                entity.getCreater(),
                System.currentTimeMillis(),
                null,
                null,
                entity.getRefoptionname()
                );
        logger.debug("effect row count:"+ret);
    }

    @Override
    public void update(CustomMenu entity) {
        String sql = "update ixin_custom_menu set name=?, type=?, keycode=?, linkurl=?,refoptionname=?" +
        		", parent_id=?, depth=?, is_leaf=?, left_weight=?, right_weight=?" +
        		", isdel=?, updater=?, update_time=? " +
        		" where id=? ";
        logger.debug("sql~~~:"+sql);
        
        int ret = jdbcTemplate.update(
                sql,
                entity.getName(),
                entity.getType(),
                entity.getKeycode(),
                entity.getLinkurl(),
                entity.getRefoptionname(),
                entity.getParentId(),
                entity.getDepth(),
                entity.getIsLeaf(),
                entity.getLeftWeight(),
                entity.getRightWeight(),
                entity.getIsdel(),
                entity.getUpdater(),
                System.currentTimeMillis(), 
                entity.getId()
                );
        logger.debug("effect row count:"+ret);
    }

    @Override
    public void remove(String nodeId) {
        
    }

    @Override
    public CustomMenu get(String id) {
        String sql = "SELECT " +
                    "id," +
                    "domain, " +
                    "name, " +
                    "type, " +
                    "keycode, " +
                    "linkurl, " +
                    "refoptionname,"+
                    "parent_id, " +
                    "depth, " +
                    "is_leaf, " +
                    "left_weight, " +
                    "right_weight, " +
                    "isdel, " +
                    "creater, " +
                    "create_time, " +
                    "updater, " +
                    "update_time " +
                    " FROM" +
                    " `ixin_custom_menu` menu" +
                    " where" +
                    " id= ? ";
        logger.debug("sql~~~:"+sql);
        
        List<CustomMenu> list = jdbcTemplate.query(sql, new Object[]{id }, new RowMapper<CustomMenu>(){
            public CustomMenu mapRow(ResultSet rs, int rowNum) throws SQLException {
                CustomMenu entity = new CustomMenu();
                entity.setId(rs.getString("id"));
                entity.setDomain(rs.getString("domain"));
                entity.setName(rs.getString("name"));
                entity.setType(rs.getInt("type"));
                entity.setKeycode(rs.getString("keycode"));
                entity.setLinkurl(rs.getString("linkurl"));
                entity.setRefoptionname(rs.getString("refoptionname"));
                entity.setParentId(rs.getString("parent_id"));
                entity.setDepth(rs.getInt("depth"));
                entity.setIsLeaf(rs.getInt("is_leaf"));
                entity.setLeftWeight(rs.getInt("left_weight"));
                entity.setRightWeight(rs.getInt("right_weight"));
                entity.setIsdel(rs.getInt("isdel"));
                entity.setCreater(rs.getString("creater"));
                entity.setCreateTime(rs.getLong("create_time"));
                entity.setUpdater(rs.getString("updater"));
                entity.setUpdateTime(rs.getLong("update_time"));
                return entity;
            }
        });
        if(CollectionUtils.isNotEmpty(list)){
            return list.get(0);
        }
        return null;
    }

	public void shiftLeft(int after_right) {
		this.shift(after_right, -2);
	}

	public void shiftRight(int after_right) {
		this.shift(after_right, 2);
	}

	public void shift(int after_right, int width) {
        int ret = jdbcTemplate.update("update ixin_custom_menu set left_weight = left_weight + ? where left_weight > ?", width, after_right);
        logger.debug("1effect row count:"+ret);
        
        int ret2 = jdbcTemplate.update("update ixin_custom_menu set right_weight = right_weight + ? where right_weight > ?", width, after_right);
        logger.debug("2effect row count:"+ret2);
        
        int ret3 = jdbcTemplate.update("update ixin_custom_menu set is_leaf = ? where right_weight-left_weight=1", CustomMenu.IS_LEAF_YES);
        logger.debug("3effect row count:"+ret3);
        
        int ret4 = jdbcTemplate.update("update ixin_custom_menu set is_leaf = ? where right_weight-left_weight<>1", CustomMenu.IS_LEAF_NO);
        logger.debug("4effect row count:"+ret4);
	}
	
	public List<CustomMenu> getAlltree(String domain){
        String sql = "SELECT " +
                    "node.id," +
                    "node.domain, " +
                    "node.name, " +
                    "node.type, " +
                    "node.keycode, " +
                    "node.linkurl, " +
                    "node.refoptionname, " +
                    "node.parent_id, " +
                    "node.depth, " +
                    "node.is_leaf, " +
                    "node.left_weight, " +
                    "node.right_weight, " +
                    "node.isdel, " +
                    "node.creater, " +
                    "node.create_time, " +
                    "node.updater, " +
                    "node.update_time " +
                    " FROM" +
                    " `ixin_custom_menu` parent,"  +
                    " `ixin_custom_menu` node"  +
                    " where node.left_weight BETWEEN node.left_weight AND parent.right_weight "+
                    " AND parent.id = ? and node.id <> ? AND parent.isDel='0' AND node.isDel='0' and node.domain = ? "+
                    "ORDER BY node.left_weight";
        
        logger.debug("sql~~~:"+sql);
        
        List<CustomMenu> list = jdbcTemplate.query(sql, new Object[]{CustomMenu.root_id, CustomMenu.root_id, domain}, new RowMapper<CustomMenu>(){
            public CustomMenu mapRow(ResultSet rs, int rowNum) throws SQLException {
                CustomMenu entity = new CustomMenu();
                entity.setId(rs.getString("id"));
                entity.setDomain(rs.getString("domain"));
                entity.setName(rs.getString("name"));
                entity.setType(rs.getInt("type"));
                entity.setKeycode(rs.getString("keycode"));
                entity.setLinkurl(rs.getString("linkurl"));
                entity.setRefoptionname(rs.getString("refoptionname"));
                entity.setParentId(rs.getString("parent_id"));
                entity.setDepth(rs.getInt("depth"));
                entity.setIsLeaf(rs.getInt("is_leaf"));
                entity.setLeftWeight(rs.getInt("left_weight"));
                entity.setRightWeight(rs.getInt("right_weight"));
                entity.setIsdel(rs.getInt("isdel"));
                entity.setCreater(rs.getString("creater"));
                entity.setCreateTime(rs.getLong("create_time"));
                entity.setUpdater(rs.getString("updater"));
                entity.setUpdateTime(rs.getLong("update_time"));
                return entity;
            }
        });
        if(CollectionUtils.isNotEmpty(list)){
            return list;
        }
        return new ArrayList<CustomMenu>();
    }
	
	public Map<String, CustomMenu> getGlobalMap(String domain){
	    Map<String, CustomMenu> map = new HashMap<String, CustomMenu>();
	    List<CustomMenu> list = this.getAlltree( domain);
	    for(CustomMenu p : list){
	        map.put(p.getId(), p);
	    }
	    return map;
	}
	
	//根据子节点id查询父节点
	public List<CustomMenu> getFatherCustomMenu(String subId, String domain){
        String sql = "SELECT " +
                "parent.id," +
                "parent.domain, " +
                "parent.name, " +
                "parent.type, " +
                "parent.keycode, " +
                "parent.linkurl, " +
                "parent.refoptionname, "+
                "parent.parent_id, " +
                "parent.depth, " +
                "parent.is_leaf, " +
                "parent.left_weight, " +
                "parent.right_weight, " +
                "parent.isdel, " +
                "parent.creater, " +
                "parent.create_time, " +
                "parent.updater, " +
                "parent.update_time " +
                " FROM" +
                " `ixin_custom_menu` parent,"  +
                " `ixin_custom_menu` node"  +
                " where node.left_weight BETWEEN parent.left_weight AND parent.right_weight "+
                " AND node.id = ? AND parent.isDel='0' AND node.isDel='0' and parent.domain = ? "+
                "ORDER BY parent.left_weight";
        
        logger.debug("sql~~~:"+sql);
        
        List<CustomMenu> list = jdbcTemplate.query(sql, new Object[]{subId, domain}, new RowMapper<CustomMenu>(){
            public CustomMenu mapRow(ResultSet rs, int rowNum) throws SQLException {
                CustomMenu entity = new CustomMenu();
                entity.setId(rs.getString("id"));
                entity.setDomain(rs.getString("domain"));
                entity.setName(rs.getString("name"));
                entity.setType(rs.getInt("type"));
                entity.setKeycode(rs.getString("keycode"));
                entity.setLinkurl(rs.getString("linkurl"));
                entity.setRefoptionname(rs.getString("refoptionname"));
                entity.setParentId(rs.getString("parent_id"));
                entity.setDepth(rs.getInt("depth"));
                entity.setIsLeaf(rs.getInt("is_leaf"));
                entity.setLeftWeight(rs.getInt("left_weight"));
                entity.setRightWeight(rs.getInt("right_weight"));
                entity.setIsdel(rs.getInt("isdel"));
                entity.setCreater(rs.getString("creater"));
                entity.setCreateTime(rs.getLong("create_time"));
                entity.setUpdater(rs.getString("updater"));
                entity.setUpdateTime(rs.getLong("update_time"));
                return entity;
            }
        });
        if(CollectionUtils.isNotEmpty(list)){
            return list;
        }
        return new ArrayList<CustomMenu>();
	}
    
    public Map<String, CustomMenu> getFatherMap(String subId, String domain){
        Map<String, CustomMenu> map = new HashMap<String, CustomMenu>();
        List<CustomMenu> list = this.getFatherCustomMenu(subId, domain);
        for(CustomMenu p : list){
            map.put(p.getId(), p);
        }
        return map;
    }

    @Override
    public String getMenuData(String domain) {
        CustomMenu domainNode = this.getByDomain(domain);
        
        List<Map<String, Object>> menuDataList = new ArrayList<Map<String,Object>>();
        Map<String, Object> tempMap = new HashMap<String, Object>();
        
        List<CustomMenu> firstLevlist = this.getNextCustomMenu(domainNode.getId(), domain);
        if(CollectionUtils.isEmpty(firstLevlist)){
        	return "";
        }
        for (CustomMenu entity : firstLevlist) {
            Map<String, Object> firstLevMenu = new HashMap<String, Object>();
            firstLevMenu.put("name", entity.getName());
            
            if(getChildCount(entity) <= 0){
                if(entity.getType()==CustomMenu.MENU_TYPE_CLICK){
                    firstLevMenu.put("type", "click");
                    firstLevMenu.put("key", entity.getKeycode());
                } else{
                    firstLevMenu.put("type", "view");
                    firstLevMenu.put("url", entity.getLinkurl());
                }
            } else{
                List<CustomMenu> secondLevlist = this.getNextCustomMenu(entity.getId(), domain);
                List<Object> subBtnList = new ArrayList<Object>();
                for (CustomMenu node : secondLevlist) {
                    Map<String, Object> secondLevMenu = new HashMap<String, Object>();
                    secondLevMenu.put("name", node.getName());
                    if(node.getType()==CustomMenu.MENU_TYPE_CLICK){
                        secondLevMenu.put("type", "click");
                        secondLevMenu.put("key", node.getKeycode());
                    } else{
                        secondLevMenu.put("type", "view");
                        secondLevMenu.put("url", node.getLinkurl());
                    }
                    
                    subBtnList.add(secondLevMenu);
                }
                firstLevMenu.put("sub_button", subBtnList);
            }
            menuDataList.add(firstLevMenu);
        }
        
        tempMap.put("button", menuDataList);
        
        JSONObject json =  JSONObject.fromObject(tempMap);
        
        return json.toString();
    }

    @Override
    public void initTree() {
        if(this.getRoot() == null){
            CustomMenu root = new CustomMenu();
            root.setId(CustomMenu.root_id);
            root.setName("root");
            root.setParentId("-1");
            root.setDepth(1);
            root.setIsLeaf(CustomMenu.IS_LEAF_YES);
            root.setLeftWeight(1);
            root.setRightWeight(2);
            root.setCreater("longtime");
            root.setCreateTime(System.currentTimeMillis());
            
            this.insert(root);
        }
    }

    @Override
    public CustomMenu getRoot() {
        return this.get(CustomMenu.root_id);
    }

    @Override
    public CustomMenu getByDomain(String domain) {
        String sql = "SELECT " +
                "id," +
                "domain, " +
                "name, " +
                "type, " +
                "keycode, " +
                "linkurl, " +
                "refoptionname, "+
                "parent_id, " +
                "depth, " +
                "is_leaf, " +
                "left_weight, " +
                "right_weight, " +
                "isdel, " +
                "creater, " +
                "create_time, " +
                "updater, " +
                "update_time " +
                " FROM" +
                " `ixin_custom_menu` node"  +
                " where parent_id = ? AND isDel='0' and domain = ? "+
                "ORDER BY left_weight";
        
        logger.debug("sql~~~:"+sql);
        
        List<CustomMenu> list = jdbcTemplate.query(sql, new Object[]{CustomMenu.root_id, domain}, new RowMapper<CustomMenu>(){
            public CustomMenu mapRow(ResultSet rs, int rowNum) throws SQLException {
                CustomMenu entity = new CustomMenu();
                entity.setId(rs.getString("id"));
                entity.setDomain(rs.getString("domain"));
                entity.setName(rs.getString("name"));
                entity.setType(rs.getInt("type"));
                entity.setKeycode(rs.getString("keycode"));
                entity.setLinkurl(rs.getString("linkurl"));
                entity.setRefoptionname(rs.getString("refoptionname"));
                entity.setParentId(rs.getString("parent_id"));
                entity.setDepth(rs.getInt("depth"));
                entity.setIsLeaf(rs.getInt("is_leaf"));
                entity.setLeftWeight(rs.getInt("left_weight"));
                entity.setRightWeight(rs.getInt("right_weight"));
                entity.setIsdel(rs.getInt("isdel"));
                entity.setCreater(rs.getString("creater"));
                entity.setCreateTime(rs.getLong("create_time"));
                entity.setUpdater(rs.getString("updater"));
                entity.setUpdateTime(rs.getLong("update_time"));
                return entity;
            }
        });
        if(CollectionUtils.isNotEmpty(list)){
            return list.get(0);
        }
        return null;
    }

    @Override
    public List<CustomMenu> getNextCustomMenu(String parentId, String domain) {
        String sql = "SELECT " +
            "node.id," +
            "node.domain, " +
            "node.name, " +
            "node.type, " +
            "node.keycode, " +
            "node.linkurl, " +
            "node.refoptionname, " +
            "node.parent_id, " +
            "node.depth, " +
            "node.is_leaf, " +
            "node.left_weight, " +
            "node.right_weight, " +
            "node.isdel, " +
            "node.creater, " +
            "node.create_time, " +
            "node.updater, " +
            "node.update_time " +
            " FROM" +
            " `ixin_custom_menu` node"  +
            " where node.parent_id = ? AND node.isDel='0' and node.domain = ? "+
            "ORDER BY node.left_weight";
    
        logger.debug("sql~~~:"+sql);
        
        List<CustomMenu> list = jdbcTemplate.query(sql, new Object[]{parentId, domain}, new RowMapper<CustomMenu>(){
            public CustomMenu mapRow(ResultSet rs, int rowNum) throws SQLException {
                CustomMenu entity = new CustomMenu();
                entity.setId(rs.getString("id"));
                entity.setDomain(rs.getString("domain"));
                entity.setName(rs.getString("name"));
                entity.setType(rs.getInt("type"));
                entity.setKeycode(rs.getString("keycode"));
                entity.setLinkurl(rs.getString("linkurl"));
                entity.setRefoptionname(rs.getString("refoptionname"));
                entity.setParentId(rs.getString("parent_id"));
                entity.setDepth(rs.getInt("depth"));
                entity.setIsLeaf(rs.getInt("is_leaf"));
                entity.setLeftWeight(rs.getInt("left_weight"));
                entity.setRightWeight(rs.getInt("right_weight"));
                entity.setIsdel(rs.getInt("isdel"));
                entity.setCreater(rs.getString("creater"));
                entity.setCreateTime(rs.getLong("create_time"));
                entity.setUpdater(rs.getString("updater"));
                entity.setUpdateTime(rs.getLong("update_time"));
                return entity;
            }
        });
        if(CollectionUtils.isNotEmpty(list)){
            return list;
        }
        return new ArrayList<CustomMenu>();
    }

    @Override
    public int getChildCount(CustomMenu parent) {
        String sql = "select count(id) as total from ixin_custom_menu where isdel=? and parent_id=?";
        logger.debug("sql~~~:"+sql);
        List<Integer> list = jdbcTemplate.query(sql, new Object[]{CustomMenu.IS_DEL_NO, parent.getId()},new RowMapper<Integer>(){
            public Integer mapRow(ResultSet rs, int rowNum) throws SQLException {
                return rs.getInt("total");
            }
        });
        if(list!= null && list.size()>0){
            logger.debug("total count:"+list.get(0));
            return list.get(0);
        }
        logger.debug("total count:"+list.get(0));
        return 0;
    }
}
