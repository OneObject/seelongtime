package com.longtime.ajy.mweb.repository;

import java.beans.PropertyDescriptor;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.sql.DataSource;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.math.NumberUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.longtime.ajy.model.Authorize;
import com.longtime.ajy.model.Course;
import com.longtime.ajy.model.StudyVO;
import com.longtime.ajy.model.User;
import com.longtime.ajy.model.vo.CourseVO;
import com.longtime.ajy.model.vo.ResourceVO;
import com.longtime.ajy.mweb.model.ActivityInfo;
import com.longtime.common.dao.mysql.SpringJdbcRepositoryImpl;
import com.longtime.common.model.BaseEntity.Delete;
import com.longtime.common.model.search.Pageable;
import com.longtime.common.model.search.ResultSet;
import com.telecom.ctu.platform.common.cache.CacheService;

public class NSpecialRepository extends
		SpringJdbcRepositoryImpl<Course, String> {

	public NSpecialRepository(Class<Course> clazz, DataSource dataSource,
			String tableName) {
		super(clazz, dataSource, tableName);
	}

	@Resource(name = "lt.cacheService")
	private CacheService cacheService;

	private static Logger logger = LoggerFactory
			.getLogger(NSpecialRepository.class);

	/**
	 * 我可见的课程
	 */
	public ResultSet<Course> listMyCourses(User user, String domain,
			String name, boolean isMobile, List<String> categoryIds,
			Pageable page) {
		return this.listMyCourses(user, domain, name, isMobile, categoryIds, page,null);
	}
	public ResultSet<Course> listMyCoursesOrderName(User user, String domain,
		String name, boolean isMobile, List<String> categoryIds,
		Pageable page) {
		if("mercer".equalsIgnoreCase(domain)){
			return this.listMyCourses(user, domain, name, isMobile, categoryIds, page," order by CONVERT(sc.name USING gbk) , sc.releasetime desc ");
		}
		return this.listMyCourses(user, domain, name, isMobile, categoryIds, page,null);
}
	
	
	/**
	 * 我可见的课程
	 */
	private ResultSet<Course> listMyCourses(User user, String domain,
			String name, boolean isMobile, List<String> categoryIds,
			Pageable page,String orderby) {
		long t1 = System.currentTimeMillis();
		List<String> sids = getUserAuthConditionIds(user, domain);

		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT distinct sc.* from study_course sc LEFT JOIN (select rid from iapp_base_authorize auth where domain=:domain and rcategory=:rcategory and sid in (:sids)  ) t on sc.id=t.rid WHERE ((sc.domainid=:domain AND sc.openstate=:openstate_domain) or sc.openstate=:openstate_all or t.rid is not null) and sc.isdel=:isdel and sc.released=:released");
		if (StringUtils.isNotBlank(name)) {
			sql.append(" and sc.name like :name ");
			paramMap.put("name", String.format("%%%s%%", name));
		}
		if (isMobile) {
			sql.append(" and sc.supportmobile=:supportmobile ");
			paramMap.put("supportmobile", Course.SUPPORTMOBILE_YES);
		}
		if (CollectionUtils.isNotEmpty(categoryIds)) {
			sql.append(" and sc.categoryid in (:categoryids) ");
			paramMap.put("categoryids", categoryIds);
		}

		String countSql = String.format("select count(*) total from (%s) t",
				sql.toString());
		if(StringUtils.isNotBlank(orderby)){
			sql.append(orderby );
		}else{
			sql.append(" order by  sc.releasetime desc ");
		}
		//sql.append(" order by CONVERT(sc.name USING gbk) , sc.releasetime desc limit :start,:pagesize ");
		sql.append(" limit :start,:pagesize ");
		paramMap.put("sids", sids);
		paramMap.put("rcategory", Authorize.R_CATEGORY_COURSE);
		paramMap.put("released", Course.RELEASEED_YES);
		paramMap.put("domain", domain);
		paramMap.put("openstate_domain", Course.OPEN_STATE_OPENED);
		paramMap.put("openstate_all", Course.OPEN_STATE_ALL);
		paramMap.put("isdel", Delete.NORMAL.code);
		paramMap.put("start", page.getOffset());
		paramMap.put("pagesize", page.getPageSize());
		List<Course> list = this.query(sql.toString(), paramMap, Course.class);

		long count = this.count(countSql, paramMap);
		
		logger.debug(String.format("usertime=%d", System.currentTimeMillis()-t1));
		return new ResultSet<Course>(list, page, count);
	}
	
	
	
	public ResultSet<ResourceVO> listResourceVO(User user,String domain, Pageable page) {
		List<String> sids = getUserAuthConditionIds(user, domain);
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		StringBuffer sql = new StringBuffer();
		sql.append("SELECT DISTINCT t1.* from (select ere.*,iba.path,iba.module,iba.size,iba.suffix,iba.`name` from iapp_base_ext_resource ere INNER JOIN iapp_base_attachment iba on ere.resid = iba.id WHERE ere.domain=:domain1 and ere.releasestatus = 1 and ere.isdel=0) t1 LEFT JOIN (select rid from iapp_base_authorize auth where domain=:domain2 and rcategory=:rcategory and sid in (:sids) ) t2 ON t1.id=t2.rid where (t2.rid is not null) or t1.openstatus =1 ");
		
		String countSql = String.format("select count(*) total from (%s) t",
			sql.toString());
		
		sql.append(" order by t1.releasetime desc limit :start,:pagesize ");
		paramMap.put("domain1", domain);
		paramMap.put("domain2", domain);
		paramMap.put("rcategory", Authorize.R_EXT_RESOURCE);
		paramMap.put("sids", sids);
		paramMap.put("start", page.getOffset());
		paramMap.put("pagesize", page.getPageSize());
		List<ResourceVO> list = this.query(sql.toString(), paramMap, ResourceVO.class);

		long count = this.count(countSql, paramMap);
		return new ResultSet<ResourceVO>(list, page, count);
	}

	public List<Course> listTopViewCourse(String domain, String uid,
			boolean isMobile, String sort) {
		User user = getUser(uid);
		List<String> sids = getUserAuthConditionIds(user, domain);

		Map<String, Object> paramMap = new HashMap<String, Object>();
		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT distinct sc.* from study_course sc LEFT JOIN (select rid from iapp_base_authorize auth where domain=:domain and rcategory=:rcategory and sid in (:sids)  ) t on sc.id=t.rid WHERE ((sc.domainid=:domain AND sc.openstate=:openstate_domain) or sc.openstate=:openstate_all or t.rid is not null) and sc.isdel=:isdel and sc.released=:released");

		if (isMobile) {
			sql.append(" and sc.supportmobile=:supportmobile ");
			paramMap.put("supportmobile", Course.SUPPORTMOBILE_YES);
		}
		if ("name".equals(sort)) {
			sql.append(" order by sc.name desc");
		} else if ("time".equals(sort)) {
			sql.append(" order by sc.createtime desc");
		}

		paramMap.put("sids", sids);
		paramMap.put("rcategory", Authorize.R_CATEGORY_COURSE);
		paramMap.put("released", Course.RELEASEED_YES);
		paramMap.put("domain", domain);
		paramMap.put("openstate_domain", Course.OPEN_STATE_OPENED);
		paramMap.put("openstate_all", Course.OPEN_STATE_ALL);
		paramMap.put("isdel", Delete.NORMAL.code);
		List<Course> list = this.query(sql.toString(), paramMap, Course.class);
		return list;
	}

	/**
	 * 带分页的已学课程
	 * 
	 * @param uid
	 * @param domain
	 * @return
	 */
	public List<CourseVO> getLearningCourse(User user, String domain,
			Pageable page) {
		List<String> sids = getUserAuthConditionIds(user, domain);
		String sql = "select distinct course.*,trace.end_date,trace.study_total_time,trace.total_time_sec,trace.lesson_status from study_course course left JOIN study_course_trace trace on course.id=trace.course_id LEFT JOIN (select rid from iapp_base_authorize auth where rcategory=:rcategory and sid in (:sids) ) t on course.id=t.rid where trace.user_id=:user_id and (((course.domainid=:domain and course.openstate=:openstate_domain ) or course.openstate=:openstate_all) or t.rid is not null) and released=:released and isdel=:isdel  ORDER BY trace.end_date DESC limit :start,:pagesize ";
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("sids", sids);
		paramMap.put("rcategory", Authorize.R_CATEGORY_COURSE);
		paramMap.put("user_id", user.getId());
		paramMap.put("domain", domain);
		paramMap.put("openstate_domain", Course.OPEN_STATE_OPENED);
		paramMap.put("openstate_all", Course.OPEN_STATE_ALL);
		paramMap.put("released", Course.RELEASEED_YES);
		paramMap.put("isdel", Delete.NORMAL.code);
		paramMap.put("start", page.getOffset());
		paramMap.put("pagesize", page.getPageSize());

		List<CourseVO> rs = this.query(sql, paramMap, CourseVO.class);
		return rs;
	}
	public int checkAuth(User user, String cid, String domain) {
		List<String> sids = getUserAuthConditionIds(user, domain);
		String sql = "select rid from iapp_base_authorize auth where rcategory=:rcategory and rid=:cid and domain=:domain and sid in (:sids)  limit 0,2 ";
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("sids", sids);
		paramMap.put("rcategory", Authorize.R_CATEGORY_COURSE);
		paramMap.put("domain", domain);
		paramMap.put("cid", cid);
		List<Map<String, Object>> list= this.query(sql, paramMap);
		if (CollectionUtils.isEmpty(list)) {
			return 0;
		}
		return list.size();
	}

	/**
	 * 不带分页的已学课程
	 * 
	 * @param uid
	 * @param domain
	 * @return
	 */
	public List<CourseVO> getLearningCourse(User user, String domain) {
		List<String> sids = getUserAuthConditionIds(user, domain);
		String sql = "select distinct course.*,trace.end_date,trace.study_total_time,trace.total_time_sec,trace.lesson_status from study_course course left JOIN study_course_trace trace on course.id=trace.course_id LEFT JOIN (select rid from iapp_base_authorize auth where rcategory=:rcategory and sid in (:sids) ) t on course.id=t.rid where trace.user_id=:user_id and (((course.domainid=:domain and course.openstate=:openstate_domain ) or course.openstate=:openstate_all) or t.rid is not null) and released=:released and isdel=:isdel  ORDER BY trace.end_date DESC ";
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("sids", sids);
		paramMap.put("rcategory", Authorize.R_CATEGORY_COURSE);
		paramMap.put("user_id", user.getId());
		paramMap.put("domain", domain);
		paramMap.put("openstate_domain", Course.OPEN_STATE_OPENED);
		paramMap.put("openstate_all", Course.OPEN_STATE_ALL);
		paramMap.put("released", Course.RELEASEED_YES);
		paramMap.put("isdel", Delete.NORMAL.code);

		List<CourseVO> rs = this.query(sql, paramMap, CourseVO.class);
		return rs;
	}
	
	public CourseVO findByCidAndUid(String rid,String uid) {
		String sql = "select distinct course.*,trace.end_date,trace.study_total_time,trace.total_time_sec,trace.lesson_status from study_course course left JOIN study_course_trace trace on course.id=trace.course_id  where trace.user_id=:user_id and course.id=:rid ";
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("user_id", uid);
	
		paramMap.put("rid", rid);

		List<CourseVO> rs = this.query(sql, paramMap, CourseVO.class);
		if (CollectionUtils.isNotEmpty(rs)) {
			return rs.get(0);
		}
		return null;
	}

	/**
	 * 统计已学习课程数量
	 * 
	 * @param uid
	 * @param domain
	 */
	public long countLearningCourse(User user, String domain) {
		List<String> sids = getUserAuthConditionIds(user, domain);
		String sql = "select count(*) total from (select distinct course.*,trace.end_date,trace.study_total_time,trace.total_time_sec,trace.lesson_status from study_course course left JOIN study_course_trace trace on course.id=trace.course_id LEFT JOIN (select rid from iapp_base_authorize auth where rcategory=:rcategory and sid in (:sids) ) t on course.id=t.rid where trace.user_id=:user_id and (((course.domainid=:domain and course.openstate=:openstate_domain ) or course.openstate=:openstate_all) or t.rid is not null) and released=:released and isdel=:isdel) b";
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("sids", sids);
		paramMap.put("rcategory", Authorize.R_CATEGORY_COURSE);
		paramMap.put("user_id", user.getId());
		paramMap.put("domain", domain);
		paramMap.put("openstate_domain", Course.OPEN_STATE_OPENED);
		paramMap.put("openstate_all", Course.OPEN_STATE_ALL);
		paramMap.put("released", Course.RELEASEED_YES);
		paramMap.put("isdel", Delete.NORMAL.code);
		long num = this.count(sql, paramMap);
		return num;

	}

	/******************* 基础方法 **************************/

	/**
	 * sql语句内的列名要求设为total
	 * 
	 * @param sql
	 * @param paramMap
	 * @return
	 */
	private long count(String sql, Map<String, Object> paramMap) {

		List<Map<String, Object>> rs = this.query(sql, paramMap);
		Long count = null;
		if (!CollectionUtils.isEmpty(rs)) {
			count = (Long) rs.get(0).get("total");
		}
		if (count == null) {
			count = 0L;
		}
		return count;
	}

	/**
	 * 获取授权给用户的某类资源id列表
	 * 
	 * @param rcategory
	 *            资源类型
	 */
	public List<String> getUserAuthResourceIds(User user, String domain,
			int rcategory) {
		List<String> sidList = getUserAuthConditionIds(user, domain);
		if (CollectionUtils.isEmpty(sidList)) {
			return Lists.newArrayList();
		}

		String sql = "select distinct rid from iapp_base_authorize auth where  domain=:domain and rcategory=:rcategory and sid in (:sids)";
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("domain", domain);
		paramMap.put("rcategory", rcategory);
		paramMap.put("sids", sidList);
		List<Map<String, Object>> list = this.query(sql, paramMap);

		if (list == null || list.isEmpty()) {
			return Lists.newArrayList();
		} else {
			List<String> rids = new ArrayList<String>();
			for (Map<String, Object> map : list) {
				Object rid = map.get("rid");
				if (rid != null && StringUtils.isNotBlank(String.valueOf(rid))) {
					rids.add(String.valueOf(rid));
				}
			}
			return rids;
		}
	}

	/**
	 * 获取用户可授权id列表，包括：用户id，用户所属组织id，用户所属职级id，用户所属用户组id
	 */
	public List<String> getUserAuthConditionIds(User user, String domain) {
		long t1 = System.currentTimeMillis();
		if (user == null) {
			return Lists.newArrayList();
		}
		
//		String key = String.format("uacids_%s", user.getId());
//		String idStr = cacheService.get(key);
//		if(idStr == null){
			List<String> ids = new ArrayList<String>();
			String orgid = user.getOid();
			String uid = user.getId();
			List<String> jobLevelIds = getJobLevel(uid);

			if (StringUtils.isNotBlank(uid)) {
				ids.add(uid);
			}
			if (StringUtils.isNotBlank(orgid)) {
				ids.add(orgid);
			}
			if (CollectionUtils.isNotEmpty(jobLevelIds)) {
				ids.addAll(jobLevelIds);
			}

			List<String> groupIds = getGroupIds(user, jobLevelIds, domain);
			if (CollectionUtils.isNotEmpty(groupIds)) {
				ids.addAll(groupIds);
			}
			
			logger.debug(String.format("getUserAuthConditionIds use time=%d ms",System.currentTimeMillis() - t1));
			return ids;
//			if(CollectionUtils.isNotEmpty(ids)){
//				idStr = Joiner.on(",").join(ids);
//			} else {
//				idStr = "";
//			}
//			
//			cacheService.put(key, 300, idStr);
//		}
//		System.err.println(String.format("getUserAuthConditionIds use time=%d",System.currentTimeMillis() - t1));
//		logger.debug("getUserAuthConditionIds use time={}",
//				System.currentTimeMillis() - t1);
//		
//		if(StringUtils.isBlank(idStr)){
//			return null;
//		}
//		return Arrays.asList(idStr.split(","));
		
	}

	/**
	 * 获取用户可授权id列表，包括：用户id，用户所属组织id，用户所属职级id，用户所属用户组id
	 */
	public List<String> getUserAuthConditionIds(String userId, String domain) {
		User user = this.getUser(userId);
		return getUserAuthConditionIds(user, domain);
	}

	/**
	 * 获取用户所属职级
	 */
	private List<String> getJobLevel(String uid) {
		String sql = "select joblevelid from iapp_base_user_joblevel where userid=:userid ";
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("userid", uid);
		List<Map<String, Object>> list = this.query(sql, paramMap);
		if (null == list || list.isEmpty()) {
			return Lists.newArrayList();
		}

		List<String> jobLevelIds = new ArrayList<String>();
		for (Map<String, Object> item : list) {
			String jobLevelId = String.valueOf(item.get("joblevelid"));
			if (StringUtils.isNotBlank(jobLevelId)
					&& !jobLevelIds.contains(jobLevelId)) {
				jobLevelIds.add(jobLevelId);
			}
		}
		return jobLevelIds;
	}

	/**
	 * 获取用户
	 */
	private User getUser(String uid) {
		String sql = String.format("select * from %s where id= :uid",
				RepositoryConfig.TABLE_NAME_USER);
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("uid", uid);

		List<User> list = this.query(sql, paramMap, User.class);

		if (list == null || list.isEmpty()) {
			return null;
		}
		return list.get(0);
	}

	/**
	 * 获取用户所属用户组
	 */
	private List<String> getGroupIds(User user, List<String> jobLevelIds,
			String domain) {
		List<Map<String, Object>> groups = getGroups(user,domain);

		if (CollectionUtils.isEmpty(groups)) {
			return Lists.newArrayList();
		}

		List<String> gids = new ArrayList<String>();
		for (Map<String, Object> item : groups) {
			String gid = String.valueOf(item.get("gid"));
			String rid = String.valueOf(item.get("rid"));
			if (StringUtils.isBlank(gid) || StringUtils.isBlank(rid)
					|| gids.contains(gid)) {
				continue;
			}
			int type = NumberUtils.toInt(String.valueOf(item.get("type")), -1);
			boolean isRightGroup = isRightGroup(gid, rid, type, user,
					jobLevelIds, domain);
			if (isRightGroup) {
				gids.add(gid);
			}
		}

		return gids;
	}

	/**
	 * 获取域下所有用户组
	 */
	private List<Map<String, Object>> getGroups(User user,String domain) {
		// 得到域下的用户组信息
		String sql = "select * from iapp_group_relation where rid=:uid or (domain=:domain and type!=0);";
		Map<String, Object> query = new HashMap<String, Object>();
		query.put("domain", domain);
		query.put("uid", user.getId());
		// 得到用户组关联信息
		List<Map<String, Object>> groups = this.query(sql, query);
		if (groups == null) {
			groups = Lists.newArrayList();
		}
		return groups;
	}

	/**
	 * 判断当前用户是否在该用户组内
	 */
	private boolean isRightGroup(String gid, String rid, int type, User user,
			List<String> jobLevelIds, String domain) {
		if (rid.equals(user.getId())) {// 用户
			return true;
		}

		if (rid.equals(user.getOid())) {// 组织
			return true;
		}

		if (CollectionUtils.isNotEmpty(jobLevelIds)
				&& jobLevelIds.contains(rid)) {// 职级
			return true;
		}
		// 过滤规则
		boolean isMatchRule = isMatchRule(gid, user, jobLevelIds, domain);
		if (isMatchRule) {
			return true;
		}
		return false;
	}

	/**
	 * 判断是否符合规则
	 */
	private boolean isMatchRule(String gid, User user,
			List<String> jobLevelIds, String domain) {
		// 得到用户组的规则
		// String sql2 =
		// "select * from iapp_group_rule where gid=:gid and domain=:domain";
		// 应该查询用户组已关联的规则
		String sql2 = "select * from iapp_group_rule where id in (select rid from iapp_group_relation where gid = :gid and type= :type)";

		Map<String, Object> queryMap = Maps.newHashMap();
		queryMap.put("gid", gid);
		queryMap.put("type", 3);// 规则类型
		List<Map<String, Object>> rulelist = this.query(sql2, queryMap);

		if (CollectionUtils.isEmpty(rulelist)) {// 没有规则存在
			return false;
		}

		// 有规则存在
		int num = 0;
		for (Map<String, Object> rule : rulelist) {
			// 得到属性值
			String pname = String.valueOf(rule.get("property"));
			// 得到操作类型
			int operation = NumberUtils.toInt(
					String.valueOf(rule.get("operation")), -1);

			Object obj = "";
			// type==0 用户
			if (Integer.valueOf(rule.get("type").toString()) == 0) {
				obj = getPropertyValue(user, pname);
			}
			switch (operation) {
			case 0:// 等于
					// 判读值是否相等
				if (obj != null
						&& obj.toString().equals(
								String.valueOf(rule.get("value")))) {
					num++;
				}
				break;
			case 1:// 大于
				if (obj != null
						&& obj.toString().compareTo(
								String.valueOf(rule.get("value"))) > 0) {
					num++;
				}
				break;
			case 2:// 小于
				if (obj != null
						&& obj.toString().compareTo(
								String.valueOf(rule.get("value"))) < 0) {
					num++;
				}
				break;
			case 3:// between
				if (obj != null) {
					String values = String.valueOf(rule.get("value"));
					String[] value = values.split(",");

					if (obj.toString().compareTo(value[0]) > 0
							&& obj.toString().compareTo(value[1]) < 0) {
						num++;
					}

					if (obj.toString().compareTo(value[1]) > 0
							&& obj.toString().compareTo(value[0]) < 0) {
						num++;
					}
				}
				break;
			case 4:// like
				if (obj != null
						&& obj.toString().contains(
								String.valueOf(rule.get("value")))) {
					num++;
				}
				break;
			case 5:// in
				if (obj != null) {
					String values = String.valueOf(rule.get("value"));
					String[] value = values.split(",");

					for (int i = 0; i < value.length; i++) {
						if (obj.toString().equals(value[i])) {
							num++;
							break;
						}
					}
				}
				break;
			default:
				break;
			}
		}

		if (num == rulelist.size()) {// 满足所有条件
			return true;
		}
		return false;
	}

	private Object getPropertyValue(Object obj, String property) {
		try {
			Class<? extends Object> clazz = obj.getClass();
			PropertyDescriptor pd = new PropertyDescriptor(property, clazz);
			Method getMethod = pd.getReadMethod();// 获得get方法

			if (pd != null) {
				Object o = getMethod.invoke(obj);// 执行get方法返回一个Object
				return o;
			}
		} catch (Exception e) {
			logger.error(String
					.format("getPropertyValue due to error,the property=[%s],the message is %s",
							property, e));
		}

		return null;
	}

	public ResultSet<ActivityInfo> listMyActivity(String uid, String domain,
			Pageable page) {
		User user = getUser(uid);
		List<String> sids = getUserAuthConditionIds(user, domain);

		Map<String, Object> paramMap = new HashMap<String, Object>();
		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT distinct activity.* from ixin_activity activity LEFT JOIN (select rid from iapp_base_authorize auth where domain=:domain and rcategory=:rcategory and sid in (:sids)  ) t on activity.id=t.rid WHERE (activity.isopen=:isopen or t.rid is not null) and activity.domain=:domain and activity.isDelete=:isDelete");
		String countSql = String.format("select count(*) total from (%s) t",
				sql.toString());

		sql.append(" order by activity.startDate desc limit :start,:pagesize ");
		paramMap.put("sids", sids);
		paramMap.put("rcategory", Authorize.R_CATEGORY_ACTIVITY);
		paramMap.put("domain", domain);
		paramMap.put("isopen", ActivityInfo.IS_OPEN_YES);
		paramMap.put("isDelete", Delete.NORMAL.code);
		paramMap.put("start", page.getOffset());
		paramMap.put("pagesize", page.getPageSize());
		List<ActivityInfo> list = this.query(sql.toString(), paramMap,
				ActivityInfo.class);

		long count = this.count(countSql, paramMap);
		return new ResultSet<ActivityInfo>(list, page, count);
	}

	/**
	 * 根据资源id列表获取授权的用户id列表
	 * 
	 * @param idList
	 * @param domain
	 * @param page
	 */
	@Deprecated
	public List<String> getUidByResuore(List<String> idList, String domain) {

		// 1、资源直接关联的用户id
		String sql = "select DISTINCT sid as uid from iapp_base_authorize where rid in(:rids) and scategory = :scategory;";
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("rids", idList);
		paramMap.put("scategory", 1);
		List<Map<String, Object>> uidlist = this.query(sql, paramMap);

		// 2、资源直接关联组织，组织关联的用户id
		String sql2 = "select DISTINCT id as uid from iapp_base_user where oid in( select sid from iapp_base_authorize where rid in (:rids) and scategory = 2)";
		Map<String, Object> paramMap2 = new HashMap<String, Object>();
		paramMap2.put("rids", idList);
		paramMap2.put("scategory", 2);
		List<Map<String, Object>> uidlist2 = this.query(sql2, paramMap2);

		// 3、资源直接关联用户组,用户组关联的用户id
		// 3.1、资源直接关联用户组，用户组直接关联的用户id
		String sql3 = "SELECT rid as uid from iapp_group_relation where gid in(select  DISTINCT sid from iapp_base_authorize where rid in (:rids) and scategory = :scategory and domain=:domain) and domain=:domain and type = :type";
		Map<String, Object> paramMap3 = new HashMap<String, Object>();
		paramMap3.put("rids", idList);
		paramMap3.put("scategory", 5);
		paramMap3.put("domain", domain);
		paramMap3.put("type", 0);
		List<Map<String, Object>> uidlist3 = this.query(sql3, paramMap3);
		// 3.2、资源直接关联用户组，用户组关联组织，组织直接关联的用户id
//		String sql4 = "select DISTINCT id as uid from iapp_base_user where oid in (select rid from iapp_group_relation where gid in(select sid from iapp_base_authorize where rid in (:rids) and scategory = :scategory and domain=:domain) and domain=:domain and type = :type)";
		String sql4 = "select DISTINCT u.id as uid from iapp_base_user u LEFT JOIN iapp_group_relation r ON r.rid = u.oid LEFT JOIN iapp_base_authorize a ON r.gid = a.sid where a.rid in(:rids) and a.scategory= :scategory and a.domain= :domain and r.domain= :domain and r.type= :type";
		Map<String, Object> paramMap4 = new HashMap<String, Object>();
		paramMap4.put("rids", idList);
		paramMap4.put("scategory", 5);
		paramMap4.put("domain", domain);
		paramMap4.put("type", 1);
		List<Map<String, Object>> uidlist4 = this.query(sql4, paramMap4);
		// 3.3、资源直接关联用户组，用户组关联职级，职级直接关联的用户id
		String sql5 = "select userid as uid from iapp_base_user_joblevel where joblevelid in(select rid from iapp_group_relation where gid in(	select  DISTINCT sid from iapp_base_authorize where rid in (:rids) and scategory = :scategory and domain= :domain) and domain= :domain and type = :type)";
		Map<String, Object> paramMap5 = new HashMap<String, Object>();
		paramMap5.put("rids", idList);
		paramMap5.put("scategory", 5);
		paramMap5.put("domain", domain);
		paramMap5.put("type", 2);
		List<Map<String, Object>> uidlist5 = this.query(sql5, paramMap5);
		// 3.4、根据用户id判断该用户是否在该规则内
		// 用户组id
		String sql6 = "select gid, rid from iapp_group_relation where gid in(select sid from iapp_base_authorize where rid in (:rids) and scategory = :scategory)";
		Map<String, Object> paramMap6 = new HashMap<String, Object>();
		paramMap6.put("rids", idList);
		paramMap6.put("scategory", 5);
		List<Map<String, Object>> groupids = this.query(sql6, paramMap6);

		List<String> guserids = new ArrayList<String>();
		List<Map<String, Object>> guids = new ArrayList<Map<String, Object>>();
		guids.addAll(uidlist3);
		guids.addAll(uidlist4);
		guids.addAll(uidlist5);

		for (Map<String, Object> item : groupids) {
			String gid = String.valueOf(item.get("gid"));
			String rid = String.valueOf(item.get("rid"));
			if (StringUtils.isBlank(gid) || StringUtils.isBlank(rid)
					|| guserids.contains(rid)) {
				continue;
			}
			int type = NumberUtils.toInt(String.valueOf(item.get("type")), -1);
			for (Map<String, Object> uidmap : guids) {
				String uid = String.valueOf(uidmap.get("uid"));
				User user = getUser(uid);
				if (rid == null)
					rid = "";
				if (user != null) {
					boolean isRightGroup = isRightGroup(gid, rid, type, user,
							null, domain);
					if (isRightGroup) {
						guserids.add(uid);
					}
				}
			}
		}
		
		//处理资源直接管理的用户id,和通过组织间接关联的用户id
		List<Map<String, Object>> guids2 = new ArrayList<Map<String, Object>>();
		guids2.addAll(uidlist);
		guids2.addAll(uidlist2);		
		for (Map<String, Object> item : guids2) {
			String uid = String.valueOf(item.get("uid"));
			guserids.add(uid);
		}
		return guserids;
	}
	public StudyVO findStudyCourseTrace(String rid, String uid) {
		String sql = "select * from study_course_trace where course_id =:rid and user_id = :uid ;";
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("rid", rid);
		paramMap.put("uid", uid);
		List<Map<String, Object>> list = this.query(sql, paramMap);
		if (CollectionUtils.isEmpty(list)) {
			return null;
		}
		
		Map<String, Object> map = list.get(0);
		
		StudyVO entity = new StudyVO();
		entity.setEnd_date((Long)map.get("end_date"));
		entity.setLesson_status((String)map.get("lesson_status"));
		entity.setRid((String)map.get("course_id"));
		entity.setSec((Long)map.get("total_time_sec"));
		entity.setUid((String)map.get("user_id"));
		
		return entity;
		
	}
	

}
