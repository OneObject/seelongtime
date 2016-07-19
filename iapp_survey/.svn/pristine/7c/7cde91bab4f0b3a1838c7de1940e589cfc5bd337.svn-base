package com.longtime.app.base.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.joda.time.DateTime;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.longtime.app.base.dao.UserDao;
import com.longtime.app.base.model.JobLevelEntity;
import com.longtime.app.base.model.Organization;
import com.longtime.app.base.model.User;
import com.longtime.app.base.model.UserVo;
import com.longtime.common.dao.BaseDAOImpl;
import com.longtime.common.utils.DateUtils;
import com.longtime.common.utils.Page;
import com.longtime.common.web.utils.SortCss;

@Repository("userDao")
public class UserDaoImpl extends BaseDAOImpl<User, String> implements UserDao {
	
	@Resource(name = "ixin_jdbcTemplate")
	private JdbcTemplate jdbcTemplate;
	
	@Resource(name = "apps.namedParameterJdbcTemplate")
	private NamedParameterJdbcTemplate nJdbcTemplate;
	/**
	 * 查询用的的用户名、邮箱、手机是否重复
	 */
	@Override
	public boolean queryUserNameAndEmailAndMobileIsRepeat(String uid, String domain, Map<String, String> map) {
		if (map != null) {

			Set<String> keysSet = map.keySet();
			//从Map中取出所有的key，然后根据key获取value判断是否为空，不为空则进行查询
			for (String str : keysSet) {
				if (!StringUtils.isBlank(map.get(str))) {
					List<Object> param = Lists.newArrayList();
					StringBuilder sb = new StringBuilder("select u from User as u where ? in(username,email,mobile) and isDel= ");
					sb.append( User.ISDEL_NO );
					param.add(map.get(str));

					if (StringUtils.isNotBlank(domain)) {
						sb.append( " and domain=? ");

						param.add(domain);
					}

					if (StringUtils.isNotBlank(uid)) {
						sb.append(  " and id!=? ");
						param.add(uid);
					}

					List<User> list = this.list(sb.toString(), param.toArray());
					if (null != list && list.size() > 0) {
						return true;
					}
				}
			}
		}

		return false;

	}
	
	/**
     * 获取值在username，email mobile中匹配的uids
     * @param domain
     * @param property
     * @param value
     * @return
     */
	@Override
    public List<String>  queryUidsValueInUNameOrEmailOrMobile(String domain,String value){
	    
        List<Object> param = Lists.newArrayList();
	    StringBuilder sb = new StringBuilder("select u from User as u where ? in(username,email,mobile) and isDel= ");
        sb.append( User.ISDEL_NO );
        param.add(value);

        if (StringUtils.isNotBlank(domain)) {
            sb.append( " and domain=? ");

            param.add(domain);
        }
        List<String> rs = Lists.newArrayList();
        List<User> list = this.list(sb.toString(), param.toArray());
        if (null != list && list.size() > 0) {
            for (User user : list) {
                rs.add(user.getId());
            }
        }
	    
        return rs;
	    
	}

	@Override
	public List<UserVo> queryUserByBinding(String domain, int isDel) {
		String sql = "select u.username as username,u.name as uname,u.email as uemail,u.usertype as usertype ,u.mobile as umobile,u.attentionstatus,u.synchronousstatus as usynchronousstatus,u.synctype as usynctype,o.name as oname,u.gender as ugender" +
				",u.isbind as isbind from iapp_base_user u  left join   " +
				" iapp_base_organization o on u.oid =o.id   " +
				" where u.isbind=1 and  u.domain=?   and u.isdel=?";
		List<UserVo> list = jdbcTemplate.query(sql,new Object[]{domain,isDel}, new UserVoRowMapper());
		if(CollectionUtils.isNotEmpty(list)) {
			return list;
		}
		return null;
	}
	public List<UserVo> queryUserByNotBinding(String domain,int isDel){
		String sql = "select u.username as username,u.name as uname,u.email as uemail,u.usertype as usertype,u.mobile as umobile,u.attentionstatus,u.synchronousstatus as usynchronousstatus,u.synctype as usynctype,o.name as oname,u.gender as ugender" +
				",u.isbind as isbind  from iapp_base_user u left join   " +
				" iapp_base_organization o on u.oid =o.id   " +
				" where u.isbind=0 and  u.domain=?   and u.isdel=?";
		List<UserVo> list = jdbcTemplate.query(sql,new Object[]{domain,isDel}, new UserVoRowMapper());
		if(CollectionUtils.isNotEmpty(list)) {
			return list;
		}
		return null;
	}

	@Override
	public com.longtime.common.utils.ResultSet<UserVo> queryListByAllParams(String domain,
			String searchContent, List<String> OrgIds, String gender,
			String orderField, String orderDirection, String isBanding,String attentionstatus,Page page) {
		List<Object> pramList = new ArrayList<Object>();
		pramList.add(domain);
		
		StringBuilder sBuilder =  new StringBuilder();
		sBuilder.append("select u.id as id, u.username as username,u.name as uname,u.email as uemail,u.usertype"+
						" as usertype ,u.mobile as umobile,u.isbind as isbind,o.id as oid,o.name as oname,u.gender as ugender," +
						"jo.name as jname,u.nickname as nickname,u.phone as phone,u.certificatecode as certificatecode," +
						"u.birthday as birthday,u.attentionstatus,u.synchronousstatus as usynchronousstatus,u.synctype as usynctype" +
						" from iapp_base_user u");
		//sBuilder.append(" left join ixin_user xu on u.id = xu.base_id");
		sBuilder.append(" left join iapp_base_organization o on u.oid =o.id");
		sBuilder.append(" left join iapp_base_user_joblevel uj on uj.userid = u.id");
		sBuilder.append(" left join iapp_base_joblevel jo on jo.id = uj.joblevelid");
		sBuilder.append(" where u.domain=? and u.isdel= 0");
		sBuilder.append(" and u.usertype = 0");
		if (StringUtils.isNotEmpty(isBanding)) {
			sBuilder.append(" and u.isbind = "+isBanding);
		}
		if(StringUtils.isNotBlank(attentionstatus) && !"-100".equals(attentionstatus)){
		    sBuilder.append(" and u.attentionstatus = ?");
		    pramList.add(attentionstatus);
		}
		if (null!= OrgIds&&OrgIds.size()>0) {
			sBuilder.append(" and o.id in (");
			for (int i = 0; i < OrgIds.size(); i++) {
				if (i!=0) sBuilder.append(","); 
				sBuilder.append("?");
				pramList.add(OrgIds.get(i));
			}
			sBuilder.append(")");
		}
		if(StringUtils.isNotBlank(gender)){
			sBuilder.append(" and u.gender =?");
			pramList.add(gender);
		}
		
		if (StringUtils.isNotBlank(searchContent)) {
			sBuilder.append(" and (u.username like ? or u.name like ? or u.nickname like ?" +
					" or u.phone like ? or u.mobile like ? or u.email like ? or u.certificatecode like ?)");
			searchContent = toLikeParam(searchContent);
			pramList.add(searchContent);
			pramList.add(searchContent);
			pramList.add(searchContent);
			pramList.add(searchContent);
			pramList.add(searchContent);
			pramList.add(searchContent);
			pramList.add(searchContent);
		}
		sBuilder.append(" order by ");
		 if (StringUtils.isNotBlank(orderField) && StringUtils.isNotBlank(orderDirection)) {
				if (orderDirection.equals(SortCss.ASC)) {
					sBuilder.append("u."+orderField+" asc");
				} else {
					sBuilder.append("u."+orderField+" desc");
					}
			} else {
				sBuilder.append("u.createtime desc");	
			}
		String countSql = sBuilder.toString() + ";";
		List<UserVo> listAll =  jdbcTemplate.query(countSql, pramList.toArray(),new UserVoRowMapper());
		
		sBuilder.append(" limit ?,?;");
		int limit_from = (page.getStart());
		int limit_to = page.getLimit();
		pramList.add(limit_from);
		pramList.add(limit_to);
		List<UserVo> list = jdbcTemplate.query(sBuilder.toString(), pramList.toArray(), new UserVoForListRowMapper());
		page.setTotal_size(listAll.size());
		com.longtime.common.utils.ResultSet<UserVo> rs =new com.longtime.common.utils.ResultSet<UserVo>(); 
		rs.setItems(list);
		rs.setPage(page);
		return rs;
	}
	
	@Override
	public List<UserVo> ListByAllParams(String domain,
			String searchContent, List<String> OrgIds, String gender,
			String orderField, String orderDirection, String isBanding,String attentionstatus) {
		if(StringUtils.isBlank(isBanding)){
			isBanding="-1";
		}
		List<Object> pramList = new ArrayList<Object>();
		pramList.add(domain);
		
		StringBuilder sBuilder =  new StringBuilder();
		sBuilder.append("select u.id as id, u.username as username,u.name as uname,u.email as uemail,u.usertype"+
						" as usertype ,u.mobile as umobile,u.isbind as isbind,o.id as oid,o.name as oname,u.gender as ugender," +
						"jo.name as jname,u.nickname as nickname,u.phone as phone,u.certificatecode as certificatecode," +
						"u.birthday as birthday,u.attentionstatus,u.synchronousstatus as usynchronousstatus,u.synctype as usynctype,u.offertime as offertime ,u.boardtime as boardtime " +
						" from iapp_base_user u");
		//sBuilder.append(" left join ixin_user xu on u.id = xu.base_id");
		sBuilder.append(" left join iapp_base_organization o on u.oid =o.id");
		sBuilder.append(" left join iapp_base_user_joblevel uj on uj.userid = u.id");
		sBuilder.append(" left join iapp_base_joblevel jo on jo.id = uj.joblevelid");
		sBuilder.append(" where u.domain=? and u.isdel= 0");
		sBuilder.append(" and u.usertype = 0");
		if (!isBanding.equals("-1")) {
			sBuilder.append(" and u.isbind = "+isBanding);
		}
		if(StringUtils.isNotBlank(attentionstatus) && !"-100".equals(attentionstatus)){
		    sBuilder.append(" and u.attentionstatus = ?");
		    pramList.add(attentionstatus);
		}
		if (null!= OrgIds&&OrgIds.size()>0) {
			sBuilder.append(" and o.id in (");
			for (int i = 0; i < OrgIds.size(); i++) {
				if (i!=0) sBuilder.append(","); 
				sBuilder.append("?");
				pramList.add(OrgIds.get(i));
			}
			sBuilder.append(")");
		}
		if(StringUtils.isNotBlank(gender)){
			sBuilder.append(" and u.gender =?");
			pramList.add(gender);
		}
		
		if (StringUtils.isNotBlank(searchContent)) {
			sBuilder.append(" and (u.username like ? or u.name like ? or u.nickname like ?" +
					" or u.phone like ? or u.mobile like ? or u.email like ? or u.certificatecode like ?)");
			searchContent = toLikeParam(searchContent);
			pramList.add(searchContent);
			pramList.add(searchContent);
			pramList.add(searchContent);
			pramList.add(searchContent);
			pramList.add(searchContent);
			pramList.add(searchContent);
			pramList.add(searchContent);
		}
		sBuilder.append(" order by ");
		 if (StringUtils.isNotBlank(orderField) && StringUtils.isNotBlank(orderDirection)) {
				if (orderDirection.equals(SortCss.ASC)) {
					sBuilder.append("u."+orderField+" asc");
				} else {
					sBuilder.append("u."+orderField+" desc");
					}
			} else {
				sBuilder.append("u.createtime desc");	
			}
		String countSql = sBuilder.toString() + ";";
		List<UserVo> listAll =  jdbcTemplate.query(countSql, pramList.toArray(),new UserVoRowMapperExt());
		
		return listAll;
	}
	
	private String toLikeParam(String str){
	    return String.format("%%%s%%", str);
	}
	@Override
	public User findByUsername(String username, String domain) {
		List<Object> param = Lists.newArrayList();
		StringBuilder sb = new StringBuilder("from User where username=? and domain=? and isDel=? ");
		param.add(username);
		param.add(domain);
		param.add(User.ISDEL_NO);

		List<User> list = this.list(sb.toString(), param.toArray());
		if(CollectionUtils.isNotEmpty(list)){
			return list.get(0);
		}
		return null;
	}
	
	@Override
	public List<User> listByDomain(String domain) {
		String hql = "from User where domain=? and isDel=? ";
		List<Object> param = Lists.newArrayList();
		param.add(domain);
		param.add(User.ISDEL_NO);
		return this.list(hql, param.toArray());
	}
	
	@Override
	public List<String> getByOids(Collection<String> oids) {
		String sql = "select id from iapp_base_user where oid in(:oids) and isdel=0 and enable=1 and usertype=0";
		Map<String, Object> paramMap = Maps.newHashMap();
		paramMap.put("oids", oids);
		List<Map<String, Object>> list = nJdbcTemplate.queryForList(sql, paramMap);
		if(CollectionUtils.isEmpty(list)){
			return Lists.newArrayList();
		}
		List<String> uids = Lists.newArrayList();
		for(Map<String, Object> entity : list){
			uids.add(String.valueOf(entity.get("id")));
		}
		return uids;
	}
	
	@Override
	public void updateSyncronousstaus(List<String> uids, String domain) {
		if(CollectionUtils.isEmpty(uids)){
			return;
		}
		String sql = "update iapp_base_user set synchronousstatus=-4 where domain=:domain and id not in(:ids)";
		Map<String, Object> params = Maps.newHashMap();
		params.put("domain", domain);
		params.put("ids", uids);
		this.nJdbcTemplate.update(sql, params);
	}
	
	@Override
	public Map<String, Long> getDimissionRate(long startime, long endtime,String domain, Organization org, boolean isSubOrg) {
		
		Map<String,Long> m = Maps.newHashMap();
		m.put("delnum", getDelListStartAndEnd(startime, endtime, domain, org, isSubOrg));
		m.put("insnum", getInsListStartAndEnd(startime, endtime, domain, org, isSubOrg));
		m.put("total", getTotalEndMinusStart(startime, endtime, domain, org, isSubOrg));
		return m;
	}
	
	
	
	private long getDelListStartAndEnd(long startime, long endtime,String domain, Organization org, boolean isSubOrg) {
		if(!isSubOrg ){
			String sql = " select count(id) from iapp_base_user where isDel=1 and oid=:oid and domain=:domain and updatetime between :start AND  :end ";
			Map<String, Object> params = Maps.newHashMap();
			params.put("oid", org.getId());
			params.put("domain", domain);
			params.put("start", startime);
			params.put("end", endtime);
			return nJdbcTemplate.queryForLong(sql, params);
		}
		
		
		// 包括子部门
		int lw = org.getLeftWeight()==null?0:org.getLeftWeight();
		int rw = org.getRightWeight()==null?0:org.getRightWeight();

		String sql = "select count(u.id) from iapp_base_user u  where  u.oid in (select o.id from iapp_base_organization o where o.left_weight>=:lw and o.right_weight <=:rw and domain=:domain) and u.domain=:domain and u.isDel=1 and u.updatetime BETWEEN :start AND :end ";
		Map<String, Object> params = Maps.newHashMap();
		params.put("lw", lw);
		params.put("rw", rw);
		params.put("domain", domain);
		params.put("start", startime);
		params.put("end", endtime);
		return nJdbcTemplate.queryForLong(sql, params);
	}

	
	private long getInsListStartAndEnd(long startime, long endtime,String domain, Organization org, boolean isSubOrg) {
		if (!isSubOrg) {
			String hql = " select count(id) from iapp_base_user where isDel=0 and oid=:oid and domain=:domain and createTime BETWEEN :start AND :end ";
			Map<String, Object> params = Maps.newHashMap();
			params.put("oid", org.getId());
			params.put("domain", domain);
			params.put("start", startime);
			params.put("end", endtime);
			return nJdbcTemplate.queryForLong(hql, params);
		}
		
		// 包括子部门
		int lw = org.getLeftWeight()==null?0:org.getLeftWeight();
		int rw = org.getRightWeight()==null?0:org.getRightWeight();

		String sql = "select count(u.id) from iapp_base_user u  where  u.oid in (select o.id from iapp_base_organization o where o.left_weight>=:lw and o.right_weight <=:rw and domain=:domain) and u.domain=:domain and u.isDel=1 and u.createTime BETWEEN :start AND :end ";
		Map<String, Object> params = Maps.newHashMap();
		params.put("lw", lw);
		params.put("rw", rw);
		params.put("domain", domain);
		params.put("start", startime);
		params.put("end", endtime);
		return nJdbcTemplate.queryForLong(sql, params);
	}

	private long getTotalEnd(long startime, long endtime,String domain, Organization org, boolean isSubOrg){
		if (!isSubOrg) {
			String ins = " select count(id) from iapp_base_user where isDel=0 and oid=:oid and domain=:domain and createTime <= :end ";
			Map<String, Object> paramsIns = Maps.newHashMap();
			paramsIns.put("oid", org.getId());
			paramsIns.put("domain", domain);
			paramsIns.put("end", endtime);
			return nJdbcTemplate.queryForLong(ins, paramsIns);
		}
		
		// 包括子部门
		int lw = org.getLeftWeight()==null?0:org.getLeftWeight();
		int rw = org.getRightWeight()==null?0:org.getRightWeight();
		
		
		String ins = " select count(u.id) from iapp_base_user u where u.isDel=0 and u.oid in (select o.id from iapp_base_organization o where o.left_weight>=:lw and o.right_weight <=:rw and domain=:domain) and u.domain=:domain and createTime <= :end ";
		Map<String, Object> paramsIns = Maps.newHashMap();
		paramsIns.put("lw", lw);
		paramsIns.put("rw", rw);
		paramsIns.put("domain", domain);
		paramsIns.put("end", endtime);
		return nJdbcTemplate.queryForLong(ins, paramsIns);
	}
	
	private long getTotalStart(long startime, long endtime,String domain, Organization org, boolean isSubOrg){
		if (!isSubOrg) {
			String del = " select count(id) from iapp_base_user where isDel=1 and oid=:oid and domain=:domain and updatetime <= :start ";
			Map<String, Object> paramsDel = Maps.newHashMap();
			paramsDel.put("oid", org.getId());
			paramsDel.put("domain", domain);
			paramsDel.put("start", startime);
			return nJdbcTemplate.queryForLong(del, paramsDel);
		}
		
		// 包括子部门
		int lw = org.getLeftWeight()==null?0:org.getLeftWeight();
		int rw = org.getRightWeight()==null?0:org.getRightWeight();
		
		String del = " select count(u.id) from iapp_base_user u where u.isDel=0 and u.oid in (select o.id from iapp_base_organization o where o.left_weight>=:lw and o.right_weight <=:rw and domain=:domain) and u.domain=:domain and updatetime <= :start ";
		Map<String, Object> paramsDel = Maps.newHashMap();
		paramsDel.put("lw", lw);
		paramsDel.put("rw", rw);
		paramsDel.put("domain", domain);
		paramsDel.put("start", startime);
		return nJdbcTemplate.queryForLong(del, paramsDel);
	}
	
	
	private long getTotalEndMinusStart(long startime, long endtime,String domain, Organization org, boolean isSubOrg) {
		return this.getTotalEnd(startime,endtime,domain,org,isSubOrg) - this.getTotalStart(startime,endtime,domain,org,isSubOrg);
	}
	
	@Override
	public long countUserinOrg(Organization org,String domain, Boolean isSubOrg){
		
		if(!isSubOrg ){
			String sql = " select count(id) from iapp_base_user where oid=:oid and isDel=0 and domain=:domain ";
			Map<String, Object> params = Maps.newHashMap();
			params.put("oid", org.getId());
			params.put("domain", domain);
			return nJdbcTemplate.queryForLong(sql, params);
		}
		
		// 包括子部门
		
		int lw = org.getLeftWeight()==null?0:org.getLeftWeight();
		int rw = org.getRightWeight()==null?0:org.getRightWeight();
		
		String sql = "select count(u.id) from iapp_base_user u  where  u.oid in (select o.id from iapp_base_organization o where o.left_weight>=:lw and o.right_weight <=:rw and domain=:domain) and u.domain=:domain and u.isDel=0 ";
		Map<String, Object> params = Maps.newHashMap();
		params.put("domain", domain);
		params.put("lw", lw);
		params.put("rw", rw);
		return nJdbcTemplate.queryForLong(sql, params);
	}
	
	@Override
	public long getSex(String domain, Organization org,boolean isSubOrg, int gender){
		
		if(!isSubOrg ){
			String sql = " select count(id) from iapp_base_user where oid=:oid and isDel=0 and domain=:domain and gender=:gender";
			Map<String, Object> params = Maps.newHashMap();
			params.put("oid", org.getId());
			params.put("domain", domain);
			params.put("gender", gender);
			return nJdbcTemplate.queryForLong(sql, params);
		}
		
		// 包括子部门
		
		int lw = org.getLeftWeight()==null?0:org.getLeftWeight();
		int rw = org.getRightWeight()==null?0:org.getRightWeight();
		
		String sql = "select count(u.id) from iapp_base_user u  where  u.oid in (select o.id from iapp_base_organization o where o.left_weight>=:lw and o.right_weight <=:rw and domain=:domain) and u.domain=:domain and u.isDel=0 and gender=:gender";
		Map<String, Object> params = Maps.newHashMap();
		params.put("domain", domain);
		params.put("gender", gender);
		params.put("lw", lw);
		params.put("rw", rw);
		return nJdbcTemplate.queryForLong(sql, params);
	}
	
	
	@Override
	public long getAgeDistribution(boolean isSubOrg, Organization org,int startagenum,int endagenum, String domain) {
		
		long[] s = DateUtils.getStartAndEndOfYear(new DateTime().getYear()-startagenum);
		long[] e = DateUtils.getStartAndEndOfYear(new DateTime().getYear()-endagenum);
		
		long startage =  s[1];
		long endage = e[0];
		
		if (!isSubOrg) {
			String sql = " select count(id) from iapp_base_user where oid=:oid and isDel=0 and domain=:domain and birthday BETWEEN :endage AND :startage ";
			Map<String, Object> params = Maps.newHashMap();
			params.put("oid", org.getId());
			params.put("domain", domain);
			params.put("endage", endage);
			params.put("startage", startage);
			return nJdbcTemplate.queryForLong(sql, params);
		}
		
		// 包括子部门
		int lw = org.getLeftWeight()==null?0:org.getLeftWeight();
		int rw = org.getRightWeight()==null?0:org.getRightWeight();
		
		String sql = "select count(u.id) from iapp_base_user u  where  u.oid in (select o.id from iapp_base_organization o where o.left_weight>=:lw and o.right_weight <=:rw and domain=:domain) and u.domain=:domain and u.isDel=0 and birthday BETWEEN :endage AND :startage ";
		Map<String, Object> params = Maps.newHashMap();
		params.put("domain", domain);
		params.put("lw", lw);
		params.put("rw", rw);
		params.put("endage", endage);
		params.put("startage", startage);
		return nJdbcTemplate.queryForLong(sql, params);
	}
	
	@Override
	public long countUserbycategory(int category,String domain) {

		String sql = " select count(DISTINCT id) from iapp_base_user where isDel=0 and category=:category and domain=:domain ";
		Map<String, Object> params = Maps.newHashMap();
		
		params.put("domain", domain);
		params.put("category", category);
		
		return nJdbcTemplate.queryForLong(sql, params);
	}
	@Override
	public long countAll(String domain) {
		String sql = "select count(*) from iapp_base_user u where u.domain=:domain and u.isdel=0 and usertype=0";
		Map<String, Object> params = Maps.newHashMap();
		params.put("domain", domain);
		return nJdbcTemplate.queryForLong(sql, params);
	}
	
	class UserVoRowMapper implements RowMapper<UserVo> {
		@Override
		public UserVo mapRow(ResultSet rs, int rowNum) throws SQLException {
			UserVo user = new UserVo();
			Organization o = new Organization();
			o.setName(rs.getString("oname"));
//			IXinUser xu = new IXinUser();
//			xu.setOpenid(rs.getString("openId"));
			user.setUsername(rs.getString("username"));
			user.setName(rs.getString("uname"));
			user.setEmail(rs.getString("uemail"));
			user.setMobile(rs.getString("umobile"));
			user.setIsbind(rs.getInt("isbind"));
			user.setOrganization(o);
			user.setGender(rs.getInt("ugender"));
//			user.setiXinUser(xu);
			user.setUsertype(rs.getInt("usertype"));
			user.setAttentionstatus(rs.getInt("attentionstatus"));
			user.setSynctype(rs.getInt("usynctype"));
			user.setSynchronousstatus(rs.getInt("usynchronousstatus"));
			
			return user;
		}
	}
	
	class UserVoRowMapperExt extends UserVoRowMapper{
		@Override
		public UserVo mapRow(ResultSet rs, int rowNum) throws SQLException {
			
			UserVo user = super.mapRow(rs, rowNum);
			
			user.setBoardtime(rs.getLong("boardtime"));
			user.setOffertime(rs.getLong("offertime"));
			
			return user;
		}
	}

	
	public static void main(String[] args) {
        
	    System.out.println(String.format("%%%s%%", "1"));
    }
	
}

class UserVoForListRowMapper implements RowMapper<UserVo> {

	@Override
	public UserVo mapRow(ResultSet rs, int rowNum) throws SQLException {
		UserVo user = new UserVo();
		Organization o = new Organization();
		JobLevelEntity jo = new JobLevelEntity();
		jo.setName(rs.getString("jname"));
		o.setName(rs.getString("oname"));
//		IXinUser xu = new IXinUser();
//		xu.setOpenid(rs.getString("openId"));
		user.setId(rs.getString("id"));
		user.setUsername(rs.getString("username"));
		user.setName(rs.getString("uname"));
		user.setEmail(rs.getString("uemail"));
		user.setIsbind(rs.getInt("isbind"));
		user.setMobile(rs.getString("umobile"));
		user.setOrganization(o);
		user.setGender(rs.getInt("ugender"));
	   //user.setiXinUser(xu);
		user.setNickName(rs.getString("nickname"));
		user.setUsertype(rs.getInt("usertype"));
		user.setPhone(rs.getString("phone"));
		user.setCertificateCode(rs.getString("certificatecode"));
		user.setJobLevelEntity(jo);
		user.setBirthday(rs.getLong("birthday"));
		return user;
	}
	
		
}
