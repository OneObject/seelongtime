package com.longtime.app.base.dao.impl;

import com.google.common.collect.Maps;
import com.longtime.app.base.dao.OrganizationDao;
import com.longtime.app.base.model.Organization;
import com.longtime.app.util.IdGenerator;
import com.longtime.common.dao.BaseDAOImpl;
import com.longtime.common.utils.LoginSessionHelper;
import com.myctu.platform.utils.MapUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.*;

@Repository("organizationDao")
public class OrganizationDaoImpl extends BaseDAOImpl<Organization, String> implements OrganizationDao {
	@Resource
	private NamedParameterJdbcTemplate jdbcTemplate;

	@Override
	public String insert(Organization entity) {
		if (StringUtils.isBlank(entity.getId())) {
			entity.setId(IdGenerator.nextId32().toString());
		}
		return super.insert(entity);
	}

	public Organization getByRight(int right) {
		return query("from Organization where rightWeight = ?", right);
	}

	public void shiftLeft(int after_right) {
		this.shift(after_right, -2);
	}

	public void shiftRight(int after_right) {
		this.shift(after_right, 2);
	}

	public void shift(int after_right, int width) {
		super.execute("update Organization set leftWeight = leftWeight + ? where leftWeight > ?", width, after_right);
		super.execute("update Organization set rightWeight = rightWeight + ? where rightWeight > ?", width, after_right);

		super.execute("update Organization set isLeaf = 1 where rightWeight - leftWeight = 1");
		super.execute("update Organization set isLeaf = 0 where rightWeight - leftWeight > 1");
	}

	/* 兄弟节点的数量 */
	public int countBrother(String nodeId, String domain) {
		Organization node = super.find(nodeId);

		if (node == null || node.getParentId() == null) {
			return 0;
		}

		Number count = super.query(
				"select count(node.id) from Organization node where node.parentId.id = ? and node.domain = ?",
				node.getParentId(), domain);
		return count.intValue();
	}

	/* 子节点的数量 */
	public int countChildren(String parentId, HttpServletRequest request) {
		Organization parent = super.find(parentId);
		if (parent == null) {
			return 0;
		}

		Number count = super.query(
				"select count(node.id) from Organization node where node.left between ? and ? and node.domain = ?",
				parent.getLeftWeight(), parent.getRightWeight(), LoginSessionHelper.getCurrentDomain(request));
		return count.intValue();
	}

	public List getAlltree(String domain) {
	    
	    String rootId = getRootId(domain);
	    
	    Organization root = this.get(rootId);
	    
	    
	    if(null==root || root.getIsdel() == 1){
	        return Collections.emptyList();
	    }
	    
//
//		String sql = "SELECT node " + "FROM Organization node," + "Organization parent "
//				+ "WHERE node.leftWeight BETWEEN parent.leftWeight AND parent.rightWeight "
//				+ " AND parent.id = ? AND parent.isdel='0' AND node.isdel='0' and node.domain = ? "
//				+ "ORDER BY node.leftWeight";
//		
		
		String sql = "SELECT node " + "FROM Organization node  "
                + "WHERE node.leftWeight BETWEEN ? AND ? "
                + "  AND node.isdel=0 and node.domain = ? "
                + "ORDER BY node.leftWeight";
		/*
		 * String sql ="SELECT node "+ "FROM Organization node,"+
		 * "Organization parent "+
		 * "WHERE node.leftWeight BETWEEN parent.leftWeight AND parent.rightWeight "
		 * + " AND parent.name = 'root' "+ "ORDER BY node.leftWeight";
		 */

		
		
		
		List list = this.list(sql, new Object[]{root.getLeftWeight(), root.getRightWeight(), domain});
		return list;
	}

	// 根据子节点id查询父节点
	public List getFatherOrg(String subId, HttpServletRequest request) {
	    
	    
	    
		/*
		 * String hql = "SELECT parent "+ "FROM Organization node,"+
		 * "Organization parent "+
		 * " WHERE node.leftWeight BETWEEN parent.leftWeight AND parent.rightWeight "
		 * +
		 * " AND node.id = '"+subId+"' AND parent.isdel='0' AND node.isdel='0' "
		 * + " ORDER BY parent.leftWeight";
		 */
		String hql = "SELECT parent " + "FROM Organization node," + "Organization parent "
				+ " WHERE node.leftWeight BETWEEN parent.leftWeight AND parent.rightWeight "
				+ " AND node.id = ? AND parent.isdel='0' AND node.isdel='0' and parent.domain = ?  "
				+ " ORDER BY parent.leftWeight";

		/*
		 * String hql = "SELECT parent "+ "FROM Organization node,"+
		 * "Organization parent "+
		 * " WHERE node.leftWeight BETWEEN parent.leftWeight AND parent.rightWeight "
		 * + " AND node.id = '"+subId+"' "+ " ORDER BY parent.leftWeight";
		 */
		List list = this.list(hql, subId, LoginSessionHelper.getCurrentDomain(request));
		return list;
	}

	// 根据父Id查找下一级同级组织
	@Deprecated
	public List getNextOrg(String parentId, HttpServletRequest request) {
	    
	    String domain = LoginSessionHelper.getCurrentDomain(request);
		if (parentId == null) {
			parentId = getRootId(domain);
		}
		String hql = "select org from Organization org "
				+ " where org.parentId=? and org.isdel='0' and org.leftWeight!='0' and org.domain = ?  order by org.leftWeight";
		List list = this.list(hql, parentId, domain);
		return list;
	}

	public List getNextOrg(String parentId, String domain) {
		if (parentId == null) {
			parentId = String.format("domain_%s", domain);
		}
		String hql = "select org from Organization org "
				+ " where org.parentId=? and org.isdel='0' and org.domain = ?  order by org.leftWeight";
		List list = this.list(hql, parentId, domain);
		return list;
	}
	public List getNextOrgOrderByName(String parentId, String domain){
		if (parentId == null) {
			parentId = String.format("domain_%s", domain);
		}
		String hql = "select org from Organization org "
				+ " where org.parentId=? and org.isdel='0' and org.domain = ?  order by org.name";
		List list = this.list(hql, parentId, domain);
		return list;
	}


	@Deprecated
	public List<Organization> getChildren(String parentId, HttpServletRequest request) {
		List<Organization> ret = new ArrayList<Organization>();
		
		String domain = LoginSessionHelper.getCurrentDomain(request);
		if (parentId == null) {
			parentId = getRootId(domain);
		}
		Organization org = this.find(parentId);
		if (null == org) {
			parentId = getRootId(domain);
		}
		String sql = "SELECT child " + "FROM Organization node," + "Organization child "
				+ "WHERE child.leftWeight BETWEEN node.leftWeight AND node.rightWeight "
				+ " AND child.id = ? AND node.isdel='0' AND child.isdel='0'  and node.domain = ?  "
				+ "ORDER BY node.leftWeight";
		ret = this.list(sql, parentId, LoginSessionHelper.getCurrentDomain(request));
		
		return ret;
	}
	
	public List<Organization> getChildOrg(String parentId, HttpServletRequest request) {

		String domain = LoginSessionHelper.getCurrentDomain(request);
		
		return this.getChildOrg(parentId, domain);
	}
	public List<Organization> getChildOrg(String parentId, String domain) {
		List<Organization> ret = new ArrayList<Organization>();
		
		if (parentId == null) {
			parentId = getRootId(domain);
		}
		Organization org = this.find(parentId);
		if (null == org && ! parentId.equals(getRootId(domain))) {
            parentId = getRootId(domain);
            org = this.find(parentId);
        }
		
		if(null==org || org.getIsdel()==1){
		    return ret;
		}
		
//		String sql = "SELECT node " + "FROM Organization node," + "Organization parent "
//				+ "WHERE node.leftWeight BETWEEN parent.leftWeight AND parent.rightWeight "
//				+ " AND parent.id = ? AND parent.isdel='0' AND node.isdel='0'  and node.domain = ?  "
//				+ "ORDER BY node.leftWeight";


        String sql = "SELECT node " + "FROM Organization node "
                + "WHERE node.leftWeight BETWEEN ? AND ? "
                + "  AND node.isdel='0'  and node.domain = ?  "
                + "ORDER BY node.leftWeight";
        
        ret = this.list(sql, org.getLeftWeight(),org.getRightWeight(), domain);

        
		return ret;
	}

	public List<String> getChildOrgIds(String parentId, HttpServletRequest request) {
		String domain = LoginSessionHelper.getCurrentDomain(request);
		return this.getChildOrgIds(parentId, domain);
	}
	@SuppressWarnings("unchecked")
	public List<String> getChildOrgIds(String parentId, String domain) {
		List<String> ret = new ArrayList<String>();
		
		if (parentId == null) {
			parentId = getRootId(domain);
		}
		Organization org = this.find(parentId);
        if (null == org && ! parentId.equals(getRootId(domain))) {
            parentId = getRootId(domain);
            org = this.find(parentId);
        }
        
        if(null==org || org.getIsdel()==1){
            return ret;
        }
        
        
        String sql = "SELECT node.id " + "FROM iapp_base_organization node "
                + "WHERE node.left_weight BETWEEN " + org.getLeftWeight() +" AND " + org.getRightWeight() 
                + "  AND node.isdel='0' and node.domain = '"
                + domain + "'" + "ORDER BY node.left_weight";
        
        
        ret = jdbcTemplate.queryForList(sql, MapUtils.EMPTY_MAP, String.class);

        return ret;
	}

	public Map<String, Organization> getFatherMap(String subId, HttpServletRequest request) {
		Map<String, Organization> map = new HashMap<String, Organization>();
		@SuppressWarnings("unchecked")
		List<Organization> list = this.getFatherOrg(subId, request);
		for (Organization p : list) {
			map.put(p.getId(), p);
		}
		return map;
	}

//	private String getRootId(HttpServletRequest req) {
//		return String.format("domain_%s", LoginSessionHelper.getCurrentDomain(req));
//	}
	
	
	private String getRootId(String domain) {
        return String.format("domain_%s", domain);
    }
    

	public Map<String, Organization> getChildrenMap(String id, HttpServletRequest request) {
		Map<String, Organization> map = new HashMap<String, Organization>();
		List<Organization> list = this.getChildren(id, request);
		for (Organization p : list) {
			map.put(p.getId(), p);
		}
		return map;
	}

	@Override
	public boolean[] update(List<Organization> orgs) {
		Organization[] arrays = orgs.toArray(new Organization[orgs.size()]);
		return save(arrays);
	}
	
	@Override
	public void updateSyncronousstaus(List<String> oids, String domain) {
		String sql = "update iapp_base_organization set synchronousstatus=-4 where domain=:domain and id not in(:ids)";
		Map<String, Object> params = Maps.newHashMap();
		params.put("domain", domain);
		params.put("ids", oids);
		this.jdbcTemplate.update(sql, params);
	}
	
	
	@Override
	public List<Organization> getFatherNode(String orgId, String domain) {
		String hql = "SELECT parent " + "FROM Organization node," + "Organization parent "
				+ " WHERE node.leftWeight BETWEEN parent.leftWeight AND parent.rightWeight "
				+ " AND node.id = ? AND parent.isdel='0' AND node.isdel='0' and parent.domain = ?  "
				+ " ORDER BY parent.leftWeight";

		List<Organization> list = this.list(hql, orgId, domain);
		return list;
	}
}
