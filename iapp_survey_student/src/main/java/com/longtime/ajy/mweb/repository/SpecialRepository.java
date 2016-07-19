package com.longtime.ajy.mweb.repository;

import java.beans.PropertyDescriptor;
import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.longtime.ajy.common.track.model.ReportVisitEntity;
import com.longtime.ajy.model.Authorize;
import com.longtime.ajy.model.CommentStudentVo;
import com.longtime.ajy.model.Course;
import com.longtime.ajy.model.CourseTraceVO;
import com.longtime.ajy.model.IndexEntityVO;
import com.longtime.ajy.model.IndexModuleEntity;
import com.longtime.ajy.model.NoticeVisitTimelineEntity;
import com.longtime.ajy.model.QuestionEntity;
import com.longtime.ajy.model.QuestionTags;
import com.longtime.ajy.model.QuestionVO;
import com.longtime.ajy.model.RewardActivity;
import com.longtime.ajy.model.RewardCardItem;
import com.longtime.ajy.model.RewardExplain;
import com.longtime.ajy.model.RewardRuleContainer;
import com.longtime.ajy.model.Template;
import com.longtime.ajy.model.Topic;
import com.longtime.ajy.model.User;
import com.longtime.ajy.model.vo.ApplyRewardVO;
import com.longtime.ajy.model.vo.CourseTopVo;
import com.longtime.ajy.model.vo.CourseVO;
import com.longtime.ajy.model.vo.FodderVO;
import com.longtime.ajy.model.vo.TemplateVO;
import com.longtime.ajy.model.vo.UserFriendVO;
import com.longtime.ajy.mweb.model.ActivityInfo;
import com.longtime.ajy.mweb.model.ApplyRewardRecord;
import com.longtime.ajy.mweb.model.ChannelEntity;
import com.longtime.ajy.mweb.model.ChannelResourceEntity;
import com.longtime.ajy.mweb.model.Practice;
import com.longtime.ajy.mweb.model.SeriseCourseVO;
import com.longtime.ajy.mweb.model.TaskUser;
import com.longtime.ajy.mweb.model.TaskUserVo;
import com.longtime.ajy.mweb.model.TopicConfig;
import com.longtime.ajy.mweb.model.VoteActionDetailEntity;
import com.longtime.ajy.mweb.model.VoteActivityEntity;
import com.longtime.ajy.mweb.model.VoteEntity;
import com.longtime.common.dao.mysql.SpringJdbcRepositoryImpl;
import com.longtime.common.model.BaseEntity.Delete;
import com.longtime.common.model.search.Pageable;
import com.longtime.common.model.search.ResultSet;

public class SpecialRepository extends SpringJdbcRepositoryImpl<Course, String> {

	private static Logger logger = LoggerFactory
			.getLogger(SpecialRepository.class);

	public SpecialRepository(Class<Course> clazz, DataSource dataSource,
			String tableName) {
		super(clazz, dataSource, tableName);
	}

	public String STUDY_COURSE = "study_course";

	public String STUDY_USER_COURSE = "study_user_course";

	public String SERIES_COURSE_VIEW = "series_course_view";

	public String STUDY_COURSE_TRACE = "study_course_trace";

	public List<Course> listSeriseCourse(String packageId) {
		// String sql =
		// "select sc.* from study_course sc left JOIN study_package_course spc on sc.id = spc.courseid where spc.packageid =:pid and isdel=:isdel and openstate=:openstate and released=:released and supportmobile=:supportmobile ";
		String sql = "select sc.* from study_course sc left JOIN study_package_course spc on sc.id = spc.courseid where spc.packageid =:pid and isdel=:isdel  and released=:released and supportmobile=:supportmobile ";
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("pid", packageId);
		paramMap.put("isdel", Delete.NORMAL.code);
		// 是否公开
		// paramMap.put("openstate", Course.OPEN_STATE_OPENED);
		paramMap.put("released", Course.RELEASEED_YES);
		paramMap.put("supportmobile", Course.SUPPORTMOBILE_YES);
		List<Course> list = this.query(sql, paramMap, Course.class);
		return list;
	}

	public ResultSet<Course> listAllViewingCourse(String domain, String uid,
			boolean isSupportMobile, String name, String categoryid,
			Pageable page) {
		StringBuffer sql = new StringBuffer();

		Map<String, Object> paramMap = new HashMap<String, Object>();
		sql.append(" SELECT distinct sc.* from study_course sc LEFT JOIN (select * from v_authorize v where v.uid=:vuid) t on sc.id=t.rid WHERE (((sc.domainid=:domain AND sc.openstate=:openstate_domain) or sc.openstate=:openstate_all) OR t.uid=:uid) and sc.isdel=:isdel and sc.released=:released ");
		if (StringUtils.isNotBlank(name)) {
			sql.append(" and sc.name like :name ");
			paramMap.put("name", String.format("%%%s%%", name));
		}
		if (isSupportMobile) {
			sql.append(" and sc.supportmobile=:supportmobile ");
			paramMap.put("supportmobile", Course.SUPPORTMOBILE_YES);
		}
		if (StringUtils.isNotBlank(categoryid)) {
			sql.append(" and sc.categoryid=:categoryid ");
			paramMap.put("categoryid", categoryid);
		}
		sql.append(" order by sc.releasetime desc limit :start,:pagesize ");

		paramMap.put("released", Course.RELEASEED_YES);
		paramMap.put("domain", domain);
		paramMap.put("vuid", uid);
		paramMap.put("openstate_domain", Course.OPEN_STATE_OPENED);
		paramMap.put("openstate_all", Course.OPEN_STATE_ALL);
		paramMap.put("isdel", Delete.NORMAL.code);
		paramMap.put("uid", uid);
		paramMap.put("start", page.getOffset());
		paramMap.put("pagesize", page.getPageSize());
		List<Course> list = this.query(sql.toString(), paramMap, Course.class);

		sql = new StringBuffer();
		paramMap = new HashMap<String, Object>();
		sql.append("SELECT count(*) as total from ( SELECT distinct sc.* from study_course sc LEFT JOIN (select * from v_authorize v where v.uid=:vuid) t on sc.id=t.rid WHERE (((sc.domainid=:domain AND sc.openstate=:openstate_domain) or sc.openstate=:openstate_all) OR t.uid=:uid) and sc.isdel=:isdel and sc.released=:released ");
		if (StringUtils.isNotBlank(name)) {
			sql.append(" and sc.name like :name ");
			paramMap.put("name", String.format("%%%s%%", name));
		}
		if (isSupportMobile) {
			sql.append(" and sc.supportmobile=:supportmobile ");
			paramMap.put("supportmobile", Course.SUPPORTMOBILE_YES);
		}
		if (StringUtils.isNotBlank(categoryid)) {
			sql.append(" and sc.categoryid=:categoryid ");
			paramMap.put("categoryid", categoryid);
		}
		sql.append(" ) tmp ");
		paramMap.put("released", Course.RELEASEED_YES);
		paramMap.put("domain", domain);
		paramMap.put("vuid", uid);
		paramMap.put("openstate_domain", Course.OPEN_STATE_OPENED);
		paramMap.put("openstate_all", Course.OPEN_STATE_ALL);
		paramMap.put("isdel", Delete.NORMAL.code);
		paramMap.put("uid", uid);
		long count = this.count(sql.toString(), paramMap);
		return new ResultSet<Course>(list, page, count);
	}

	public List<Course> listAllCourseByCategoryid(String domain,
			boolean isSupportMobile, String categoryid) {
		StringBuffer sql = new StringBuffer();

		Map<String, Object> paramMap = new HashMap<String, Object>();
		// sql.append(" SELECT distinct sc.* from study_course sc where ((sc.domainid=:domain AND sc.openstate=:openstate_domain) or sc.openstate=:openstate_all) and sc.isdel=:isdel and sc.released=:released ");
		sql.append(" SELECT distinct sc.* from study_course sc where (sc.domainid=:domain or sc.openstate=:openstate_all) and sc.isdel=:isdel and sc.released=:released ");

		if (isSupportMobile) {
			sql.append(" and sc.supportmobile=:supportmobile ");
			paramMap.put("supportmobile", Course.SUPPORTMOBILE_YES);
		}
		if (StringUtils.isNotBlank(categoryid)) {
			sql.append(" and sc.categoryid=:categoryid ");
			paramMap.put("categoryid", categoryid);
		}
		sql.append(" order by sc.releasetime  desc");

		paramMap.put("released", Course.RELEASEED_YES);
		paramMap.put("domain", domain);
		// paramMap.put("openstate_domain", Course.OPEN_STATE_OPENED);
		paramMap.put("openstate_all", Course.OPEN_STATE_ALL);
		paramMap.put("isdel", Delete.NORMAL.code);
		List<Course> list = this.query(sql.toString(), paramMap, Course.class);
		return list;
	}

	public List<Course> listAllViewingCourse(String domain, String uid,
			boolean isSupportMobile, List<String> categoryids) {
		StringBuffer sql = new StringBuffer();

		Map<String, Object> paramMap = new HashMap<String, Object>();
		sql.append(" SELECT distinct sc.* from study_course sc LEFT JOIN (select * from v_authorize v where v.uid=:vuid) t on sc.id=t.rid WHERE (((sc.domainid=:domain AND sc.openstate=:openstate_domain) or sc.openstate=:openstate_all) OR t.uid=:uid) and sc.isdel=:isdel and sc.released=:released ");

		if (isSupportMobile) {
			sql.append(" and sc.supportmobile=:supportmobile ");
			paramMap.put("supportmobile", Course.SUPPORTMOBILE_YES);
		}
		if (categoryids != null && categoryids.size() > 0) {
			sql.append(" and sc.categoryid in (:categoryids) ");
			paramMap.put("categoryids", categoryids);
		}
		sql.append(" order by sc.releasetime  ");
		paramMap.put("released", Course.RELEASEED_YES);
		paramMap.put("domain", domain);
		paramMap.put("vuid", uid);
		paramMap.put("openstate_domain", Course.OPEN_STATE_OPENED);
		paramMap.put("openstate_all", Course.OPEN_STATE_ALL);
		paramMap.put("isdel", Delete.NORMAL.code);
		paramMap.put("uid", uid);
		List<Course> list = this.query(sql.toString(), paramMap, Course.class);
		return list;
	}

	public List<TaskUserVo> getNotPigaiList(String domain, int[] status,
			String taskid) {
		List<Integer> statuslist = new ArrayList<Integer>();
		for (int i : status) {
			statuslist.add(i);
		}

		String sql = "SELECT  DISTINCT (t.uid), t.attachment, t.attachmenturl, t.begintime, t.`comment`, t.content, t.createtime, t.endtime, t.id, t.score, t.`status`, t.taskid, t.taskname, t.updatetime,u.avatar,u.name FROM v_authorize a LEFT JOIN ixin_taskuser t ON a.uid = t.uid left join iapp_base_user u on t.uid=u.id WHERE a.domain =:domain AND a.rcategory =:rcategory AND t.isdel =:isdel AND t.STATUS in (:status)  and t.taskid=:taskid ";
		Map<String, Object> paramMap = new HashMap<String, Object>();

		paramMap.put("domain", domain);
		paramMap.put("rcategory", Authorize.R_CATEGORY_TASK);
		paramMap.put("isdel", TaskUser.ISDEL_NO);
		paramMap.put("status", statuslist);
		paramMap.put("taskid", taskid);
		List<TaskUserVo> list = this.query(sql, paramMap, TaskUserVo.class);
		if (list != null && list.size() > 0) {
			return list;
		}
		return null;
	}

	public List<TaskUserVo> listNotInform(String domain, String taskid) {
		String sql = "select * from v_authorize a where a.rid=:rid and a.domain=:domain and a.rcategory=:rcategory and a.uid not in(select uid from ixin_taskuser where taskid=:rid)";
		Map<String, Object> paramMap = new HashMap<String, Object>();

		paramMap.put("domain", domain);
		paramMap.put("rcategory", Authorize.R_CATEGORY_TASK);
		paramMap.put("isdel", TaskUser.ISDEL_NO);
		paramMap.put("status", TaskUser.STATUS_NOT_INFORM);
		paramMap.put("rid", taskid);
		List<TaskUserVo> list = this.query(sql, paramMap, TaskUserVo.class);
		if (list != null && list.size() > 0) {
			return list;
		}
		return null;
	}

	public ResultSet<Course> findMyCourses(String uid, String domain,
			Pageable page) {
		String sql = "select distinct course.* from study_user_course usercourse left join study_course course on usercourse.cid=course.id LEFT JOIN (select * from v_authorize v where v.uid=:vuid) t on course.id=t.rid where usercourse.uid=:uid and (((course.domainid=:domain and course.openstate=:openstate_domain) or course.openstate=:openstate_all) or t.uid=:tuid) and released=:released and isdel=:isdel limit :start,:pagesize ";
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("uid", uid);
		paramMap.put("vuid", uid);
		paramMap.put("tuid", uid);
		paramMap.put("start", page.getOffset());
		paramMap.put("pagesize", page.getPageSize());
		paramMap.put("domain", domain);
		paramMap.put("openstate_domain", Course.OPEN_STATE_OPENED);
		paramMap.put("openstate_all", Course.OPEN_STATE_ALL);
		paramMap.put("released", Course.RELEASEED_YES);
		paramMap.put("isdel", Delete.NORMAL.code);
		List<Course> list = this.query(sql, paramMap, Course.class);

		sql = "select count(*) as total from (select distinct course.* from study_user_course usercourse left join study_course course on usercourse.cid=course.id LEFT JOIN (select * from v_authorize v where v.uid=:vuid) t on course.id=t.rid where usercourse.uid=:uid and (((course.domainid=:domain and course.openstate=:openstate_domain) or course.openstate=:openstate_all) or t.uid=:tuid) and released=:released and isdel=:isdel ) tmp ";
		paramMap = new HashMap<String, Object>();
		paramMap.put("uid", uid);
		paramMap.put("vuid", uid);
		paramMap.put("tuid", uid);
		paramMap.put("domain", domain);
		paramMap.put("openstate_domain", Course.OPEN_STATE_OPENED);
		paramMap.put("openstate_all", Course.OPEN_STATE_ALL);
		paramMap.put("released", Course.RELEASEED_YES);
		paramMap.put("isdel", Delete.NORMAL.code);
		long total = this.count(sql, paramMap);

		ResultSet<Course> rs = new ResultSet<Course>(list, page, total);
		return rs;
	}

	/**
	 * sql语句内的列名要求设为total
	 * 
	 * @param sql
	 * @param paramMap
	 * @return
	 */
	private long count(String sql, Map<String, Object> paramMap) {
		
		Long count = this.namedParameterJdbcTemplate.queryForLong(sql, paramMap);
		
		return null==count?0:count;
		/*List<Map<String, Object>> rs = this.query(sql, paramMap);
		Long count = null;
		if (!CollectionUtils.isEmpty(rs)) {
			count = (Long) rs.get(0).get("total");
		}
		if (count == null) {
			count = 0L;
		}
		return count;*/
	}

	/**
	 * 获取分类的名称
	 * 
	 * @param categoryid
	 * @return
	 */
	public String getCategoryName(String categoryid) {
		String sql = "select name from study_course_category where id=:id ";
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("id", categoryid);
		List<Map<String, Object>> rs = this.query(sql, paramMap);
		if (!CollectionUtils.isEmpty(rs)) {
			Map<String, Object> map = rs.get(0);
			return (String) map.get("name");
		}
		return null;
	}

	/**
	 * 获取已学的课程
	 * 
	 * @param uid
	 * @param domain
	 * @return
	 */
	public List<CourseVO> getLearningCourse(String uid, String domain) {
		String sql = "select distinct course.*,trace.end_date,trace.study_total_time,trace.total_time_sec,trace.lesson_status from study_course course left JOIN study_course_trace trace on course.id=trace.course_id LEFT JOIN (select * from v_authorize v where v.uid=:vuid) t on course.id=t.rid where trace.user_id=:user_id and (((course.domainid=:domain and course.openstate=:openstate_domain) or course.openstate=:openstate_all) or t.uid=:tuid) and released=:released and isdel=:isdel  ORDER BY trace.end_date DESC limit 0,9 ";
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("user_id", uid);
		paramMap.put("vuid", uid);
		paramMap.put("tuid", uid);
		paramMap.put("domain", domain);
		paramMap.put("openstate_domain", Course.OPEN_STATE_OPENED);
		paramMap.put("openstate_all", Course.OPEN_STATE_ALL);
		paramMap.put("released", Course.RELEASEED_YES);
		paramMap.put("isdel", Delete.NORMAL.code);

		List<CourseVO> rs = this.query(sql, paramMap, CourseVO.class);
		return rs;
	}

	/**
	 * 带分页的已学课程
	 * 
	 * @param uid
	 * @param domain
	 * @return
	 */
	public List<CourseVO> getLearningCourse(String uid, String domain,
			Pageable page) {
		String sql = "select distinct course.*,trace.end_date,trace.study_total_time,trace.total_time_sec,trace.lesson_status from study_course course left JOIN study_course_trace trace on course.id=trace.course_id LEFT JOIN (select * from v_authorize v where v.uid=:vuid) t on course.id=t.rid where trace.user_id=:user_id and (((course.domainid=:domain and course.openstate=:openstate_domain) or course.openstate=:openstate_all) or t.uid=:tuid) and released=:released and isdel=:isdel  ORDER BY trace.end_date DESC limit :start,:pagesize ";
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("user_id", uid);
		paramMap.put("vuid", uid);
		paramMap.put("tuid", uid);
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

	/**
	 * 统计已学习课程数量
	 * 
	 * @param uid
	 * @param domain
	 */
	public long countLearningCourse(String uid, String domain) {
		String sql = "select count(*) from (select distinct course.*,trace.end_date,trace.study_total_time,trace.total_time_sec,trace.lesson_status from study_course course left JOIN study_course_trace trace on course.id=trace.course_id LEFT JOIN (select * from v_authorize v where v.uid=:vuid) t on course.id=t.rid where trace.user_id=:user_id and (((course.domainid=:domain and course.openstate=:openstate_domain) or course.openstate=:openstate_all) or t.uid=:tuid) and released=:released and isdel=:isdel)   ";
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("user_id", uid);
		paramMap.put("vuid", uid);
		paramMap.put("tuid", uid);
		paramMap.put("domain", domain);
		paramMap.put("openstate_domain", Course.OPEN_STATE_OPENED);
		paramMap.put("openstate_all", Course.OPEN_STATE_ALL);
		paramMap.put("released", Course.RELEASEED_YES);
		paramMap.put("isdel", Delete.NORMAL.code);

		return this.count(sql, paramMap);

	}

	public List<Course> listTopViewCourse(String domain, String uid,
			boolean isSupportMobile, String sort) {
		StringBuffer sql = new StringBuffer();
		Map<String, Object> paramMap = new HashMap<String, Object>();
		sql.append(" SELECT DISTINCT sc.* from study_course sc LEFT JOIN (select * from v_authorize v where v.uid=:vuid) t on sc.id=t.rid WHERE (((sc.domainid=:domain AND sc.openstate=:openstate_domain) or sc.openstate=:openstate_all) OR t.uid=:uid) and sc.isdel=:isdel and sc.released=:released and sc.topindex>0 ");
		if (isSupportMobile) {
			sql.append(" and sc.supportmobile=:supportmobile ");
			paramMap.put("supportmobile", Course.SUPPORTMOBILE_YES);
		}
		if ("name".equals(sort)) {
			sql.append(" order by sc.name desc");
		} else if ("time".equals(sort)) {
			sql.append(" order by sc.createtime desc");
		}
		paramMap.put("released", Course.RELEASEED_YES);
		paramMap.put("domain", domain);
		paramMap.put("vuid", uid);
		paramMap.put("openstate_domain", Course.OPEN_STATE_OPENED);
		paramMap.put("openstate_all", Course.OPEN_STATE_ALL);
		paramMap.put("isdel", Delete.NORMAL.code);
		paramMap.put("uid", uid);
		List<Course> list = query(sql.toString(), paramMap, Course.class);
		return list;
	}

	public List<Course> listTopViewCourse(String domain, String uid,
			int topNumber, boolean isSupportMobile) {
		StringBuffer sql = new StringBuffer();
		Map<String, Object> paramMap = new HashMap<String, Object>();
		// sql.append(" SELECT DISTINCT sc.* from study_course sc LEFT JOIN (select * from v_authorize v where v.uid=:vuid) t on sc.id=t.rid WHERE (((sc.domainid=:domain AND sc.openstate=:openstate_domain) or sc.openstate=:openstate_all) OR t.uid=:uid) and sc.isdel=:isdel and sc.released=:released and sc.topindex>0 ");
		sql.append(" SELECT DISTINCT sc.* from study_course sc LEFT JOIN (select * from v_authorize v where v.uid=:vuid) t on sc.id=t.rid WHERE (((sc.domainid=:domain AND sc.openstate=:openstate_domain) or sc.openstate=:openstate_all) OR t.uid=:uid) and sc.isdel=:isdel and sc.released=:released ");
		if (isSupportMobile) {
			sql.append(" and sc.supportmobile=:supportmobile ");
			paramMap.put("supportmobile", Course.SUPPORTMOBILE_YES);
		}

		sql.append(" order by sc.createtime desc limit 0,:topNumber ");

		paramMap.put("released", Course.RELEASEED_YES);
		paramMap.put("domain", domain);
		paramMap.put("vuid", uid);
		paramMap.put("openstate_domain", Course.OPEN_STATE_OPENED);
		paramMap.put("openstate_all", Course.OPEN_STATE_ALL);
		paramMap.put("isdel", Delete.NORMAL.code);
		paramMap.put("uid", uid);
		paramMap.put("topNumber", topNumber);

		List<Course> list = query(sql.toString(), paramMap, Course.class);

		return list;
	}

	public List<Course> listNewViewCourse(String domain, String uid,
			int newNumber, boolean isSupportMobile) {
		StringBuffer sql = new StringBuffer();
		Map<String, Object> paramMap = new HashMap<String, Object>();
		sql.append(" SELECT DISTINCT sc.* from study_course sc LEFT JOIN (select * from v_authorize v where v.uid=:vuid) t on sc.id=t.rid WHERE (((sc.domainid=:domain AND sc.openstate=:openstate_domain) or sc.openstate=:openstate_all) OR t.uid=:uid) and sc.isdel=:isdel and sc.released=:released ");
		if (isSupportMobile) {
			sql.append(" and sc.supportmobile=:supportmobile ");
			paramMap.put("supportmobile", Course.SUPPORTMOBILE_YES);
		}

		sql.append(" order by sc.createtime desc limit 0,:newNumber ");

		paramMap.put("released", Course.RELEASEED_YES);
		paramMap.put("domain", domain);
		paramMap.put("vuid", uid);
		paramMap.put("openstate_domain", Course.OPEN_STATE_OPENED);
		paramMap.put("openstate_all", Course.OPEN_STATE_ALL);
		paramMap.put("isdel", Delete.NORMAL.code);
		paramMap.put("uid", uid);
		paramMap.put("newNumber", newNumber);

		List<Course> list = query(sql.toString(), paramMap, Course.class);

		return list;
	}

	public ResultSet<SeriseCourseVO> listSeriseCourseByCategory(
			String categoryid, String uid, boolean isSupportMobile,
			String domain, Pageable page) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT sc.* from series_course_view sc LEFT JOIN (select * from v_authorize v where v.uid=:vuid) t on sc.id=t.rid WHERE (sc.released=:released and ((sc.domain=:domain AND  sc.openstate=:openstate_domain) or sc.openstate=:openstate_all) ) OR t.uid=:tuid ");
		if (isSupportMobile) {
			sql.append(" and sc.supportmobile=:supportmobile ");
			paramMap.put("supportmobile", Course.SUPPORTMOBILE_YES);
		}
		if (StringUtils.isNotBlank(categoryid)) {
			sql.append(" and sc.categoryid=:categoryid ");
			paramMap.put("categoryid", categoryid);
		}
		sql.append(" order by sc.createtime desc limit :start,:pagesize");

		paramMap.put("vuid", uid);
		paramMap.put("tuid", uid);
		paramMap.put("released", Course.RELEASEED_YES);
		paramMap.put("domain", domain);
		paramMap.put("openstate_domain", Course.OPEN_STATE_OPENED);
		paramMap.put("openstate_all", Course.OPEN_STATE_ALL);
		paramMap.put("start", page.getOffset());
		paramMap.put("pagesize", page.getPageSize());

		List<SeriseCourseVO> list = this.query(sql.toString(), paramMap,
				SeriseCourseVO.class);

		sql = new StringBuffer();
		sql.append(" SELECT count(*) as total from series_course_view sc LEFT JOIN (select * from v_authorize v where v.uid=:vuid) t on sc.id=t.rid WHERE (sc.released=:released and ((sc.domain=:domain AND  sc.openstate=:openstate_domain) or sc.openstate=:openstate_all) ) OR t.uid=:tuid ");
		if (isSupportMobile) {
			sql.append(" and sc.supportmobile=:supportmobile ");
			paramMap.put("supportmobile", Course.SUPPORTMOBILE_YES);
		}
		if (StringUtils.isNotBlank(categoryid)) {
			sql.append(" and sc.categoryid=:categoryid ");
			paramMap.put("categoryid", categoryid);
		}
		paramMap = new HashMap<String, Object>();
		paramMap.put("vuid", uid);
		paramMap.put("tuid", uid);
		paramMap.put("released", Course.RELEASEED_YES);
		paramMap.put("domain", domain);
		paramMap.put("openstate_domain", Course.OPEN_STATE_OPENED);
		paramMap.put("openstate_all", Course.OPEN_STATE_ALL);
		long total = this.count(sql.toString(), paramMap);

		ResultSet<SeriseCourseVO> rs = new ResultSet<SeriseCourseVO>(list,
				page, total);

		return rs;
	}

	public List<Topic> topiclist(String domain, long num, String timestamp) {
//		String sql = "select * from ixin_student_topic t where t.isdel=0 and t.domain=:tdomain and t.shield =:shield and t.id not in(select DISTINCT(t.id) from ixin_activity_item a ,ixin_student_topic t where a.resid=t.id and t.isdel=0 and t.domain=:adomain) and t.createtime<:createtime order by t.createtime desc  limit :pagenum,:pagesize ";
		String sql="select * from ixin_student_topic t where t.isdel=0 and t.domain=:tdomain and t.shield =:shield and t.channel='0' and t.createtime<:createtime order by t.createtime desc  limit :pagenum,:pagesize  ";
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("tdomain", domain);
		paramMap.put("adomain", domain);
		paramMap.put("createtime", timestamp);
		paramMap.put("pagenum", 0);
		paramMap.put("pagesize", num);
		paramMap.put("shield", 0);
		List<Topic> list = this.query(sql, paramMap, Topic.class);
		return list;
	}

	/**
	 * 关联活动的话题
	 * 
	 * @param domain
	 * @param activityid
	 * @return
	 */
	public List<Topic> gettopTopiclist(String domain, String activityid) {
		String sql = "select t.* from ixin_activity_item a ,ixin_student_topic t where t.top>0 and a.resid=t.id and a.aid=:aid and t.isdel=0 and  t.domain=:domain and t.shield =:shield order by top desc limit 1";
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("aid", activityid);
		paramMap.put("domain", domain);
		paramMap.put("shield", 0);
		List<Topic> list = this.query(sql, paramMap, Topic.class);
		return list;
	};

	/**
	 * 未关联活动的话题
	 * 
	 * @param domain
	 * @return
	 */
	public List<Topic> gettopTopiclist(String domain) {
	//	String sql = "select * from ixin_student_topic t where t.top>0 and t.isdel=0 and  t.domain=:tdomain and t.shield =:shield and t.id not in(select DISTINCT(t.id) from ixin_activity_item a ,ixin_student_topic t where a.resid=t.id and t.isdel=0 and t.domain=:domain) order by top desc limit 1";
		String sql="select * from ixin_student_topic t where t.top>0 and t.isdel=0 and  t.domain=:tdomain and t.shield =:shield and t.channel='0' order by top desc limit 1";
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("tdomain", domain);
		paramMap.put("domain", domain);
		paramMap.put("shield", 0);
		List<Topic> list = this.query(sql, paramMap, Topic.class);
		return list;
	}

	// 修改 赞统计信息 value 为需要 + or -的值
	public void updatePraiseNum(String id, boolean isAdd, int value) {
		String sql = null;
		if (isAdd) {
			sql = String
					.format("update base_praise  set total=total + %s , updatetime=:updatetime where id=:id",
							value);
		} else {

			sql = String
					.format("update base_praise  set total=total - %s , updatetime=:updatetime where id=:id and total>0",
							value);
		}

		Map<String, Object> paramMap = new HashMap<String, Object>(2);
		paramMap.put("id", id);
		paramMap.put("updatetime", System.currentTimeMillis());
		this.update(sql, paramMap);
	}

	public int getUserVoteInfo(String activityId, String uid) {
		String sql = "select * from ixin_user_vote where activityId=:activityId and base_uid=:userId";
		Map<String, Object> paramMap = new HashMap<String, Object>(2);
		paramMap.put("activityId", activityId);
		paramMap.put("userId", uid);

		List<Map<String, Object>> list = this.query(sql, paramMap);
		long num = 0l;

		if (list != null && list.size() > 0) {
			num = list.size();
		}
		return (int) num;
	}

	public void addUserVote(String voteId, String uid, String openId)
			throws Exception {
		try {
			String sql = "insert into ixin_user_vote (voteId,userId,timestamp,base_uid) value (:voteId,:userId,:timestamp,:uid)";
			Map<String, Object> paramMap = new HashMap<String, Object>(3);
			paramMap.put("voteId", voteId);
			paramMap.put("userId", openId);
			paramMap.put("timestamp", System.currentTimeMillis());
			paramMap.put("uid", uid);
			this.update(sql, paramMap);
		} catch (Exception e) {
			throw new Exception(e);
		}
	}

	public void updateUserVoteNum(String voteId) {
		String sql = "update ixin_vote set voteNum = voteNum+1 where id=:id";
		Map<String, Object> paramMap = new HashMap<String, Object>(1);
		paramMap.put("id", voteId);
		this.update(sql, paramMap);
	}

	public void updateQuestionCount(String questionId) {
		String sql = "update ixin_vote_question set voteNum = voteNum+1 where id=:id";
		Map<String, Object> paramMap = new HashMap<String, Object>(1);
		paramMap.put("id", questionId);
		this.update(sql, paramMap);
	}

	public void saveAction(VoteActionDetailEntity voteActionDetailEntity) {
		String sql = "insert into ixin_vote_action_detail(voteid,uid,openid,questionid,optionid,domain)values(:voteid,:uid,:openid,:questionid,:optionid,:domain)";
		Map<String, Object> paramMap = new HashMap<String, Object>(6);
		paramMap.put("voteid", voteActionDetailEntity.getVoteid());
		paramMap.put("uid", voteActionDetailEntity.getUid());
		paramMap.put("openid", voteActionDetailEntity.getOpenid());
		paramMap.put("questionid", voteActionDetailEntity.getQuestionid());
		paramMap.put("optionid", voteActionDetailEntity.getOptionid());
		paramMap.put("domain", voteActionDetailEntity.getDomain());
		this.update(sql, paramMap);
	}

	public void updateOptionCount(String optionId) {
		String sql = "update ixin_vote_option set voteNum = voteNum+1 where id=:id";
		Map<String, Object> paramMap = new HashMap<String, Object>(1);
		paramMap.put("id", optionId);
		this.update(sql, paramMap);
	}

	public List<VoteActionDetailEntity> getVoteActionDetailEntity(
			String domain, String uid, String voteactivityid) {
		String sql = "select * from ixin_vote_action_detail where domain=:domain and uid=:uid and voteactivityid=:voteactivityid";
		Map<String, Object> paramMap = new HashMap<String, Object>(3);
		paramMap.put("domain", domain);
		paramMap.put("uid", uid);
		paramMap.put("voteactivityid", voteactivityid);

		List<VoteActionDetailEntity> list = this.query(sql, paramMap,VoteActionDetailEntity.class);

		if (CollectionUtils.isEmpty(list)) {
			return Lists.newArrayList();
		}

		return list;
	}

	public List<ChannelResourceEntity> channelResourceEntities(
			String channelid, String name) {
		StringBuffer sql = new StringBuffer();

		sql.append("select * from ixin_channel_resource where channelid=:channelid ");
		Map<String, Object> paramMap = new HashMap<String, Object>();
		if (StringUtils.isNotBlank(name)) {
			sql.append(" and resname like :name ");
		}

		if (StringUtils.isNotBlank(name)) {
			paramMap.put("name", "%" + name + "%");
		}
		paramMap.put("channelid", channelid);

		sql.append(" order by weight desc");

		List<ChannelResourceEntity> list = this.query(sql.toString(), paramMap,
				ChannelResourceEntity.class);

		if (null == list) {
			return Lists.newArrayList();
		}

		return list;
	}

	public List<ChannelResourceEntity> channelResourceEntities(
			String channelid, Pageable page, String name) {
		StringBuffer sql = new StringBuffer();
		StringBuffer sql2 = new StringBuffer();
		sql.append("select * from ixin_channel_resource where channelid=:channelid ");
		sql2.append("select count(*) as total from ixin_channel_resource where channelid=:channelid ");
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("channelid", channelid);
		if (StringUtils.isNotBlank(name)) {
			sql.append(" and resname like :name ");
			sql2.append(" and resname like :name ");
			paramMap.put("name", "%" + name + "%");
		}
		sql.append(" order by weight desc ");
		if (page != null) {
			long count = this.count(sql2.toString(), paramMap);
			page.setTotal(count);
			sql.append(" limit :start, :pagesize ");
			paramMap.put("start", page.getOffset());
			paramMap.put("pagesize", page.getPageSize());
 		}

		List<ChannelResourceEntity> list = this.query(sql.toString(), paramMap,	ChannelResourceEntity.class);

		if (null == list) {
			return Lists.newArrayList();
		}

		return list;
	}

	public ChannelEntity getChannelEntity(String channelid) {

		String sql = "select * from ixin_channel where id=:channelid ";

		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("channelid", channelid);

		List<ChannelEntity> list = this.query(sql, paramMap,
				ChannelEntity.class);

		if (CollectionUtils.isEmpty(list)) {
			return new ChannelEntity();
		}
		return list.get(0);
	}

	/**
	 * 得到用户的所有的学习记录
	 * 
	 * @param uid
	 * @return
	 */
	public ResultSet<CourseTraceVO> getCourseTraceVOsById(String uid,
			String domain, Pageable page) {
		String sql = "select t.*,c.name,c.restype restype,c.tid from study_course_trace t LEFT JOIN study_course c on t.course_id = c.id and t.domain=c.domainid where t.user_id=:uid and t.domain =:domain and c.released= 1 and c.isdel = 0 order by t.end_date desc ";
		String limit = "";
		if (page != null) {
			limit = String.format(" limit %s,%s", page.getOffset(),
					page.getPageSize());
		}
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("uid", uid);
		paramMap.put("domain", domain);
		List<CourseTraceVO> list = this.query(sql + limit, paramMap,
				CourseTraceVO.class);
		if (null == list) {
			list = Lists.newArrayList();
		}
		String sql4totla = "select count(*) as total from study_course_trace t LEFT JOIN study_course c on t.course_id = c.id  and t.domain=c.domainid  where t.user_id=:uid and t.domain =:domain and c.released= 1 and c.isdel = 0  ";
		Map<String, Object> paramMaps = new HashMap<String, Object>();
		paramMaps.put("uid", uid);
		paramMaps.put("domain", domain);
		long total = this.count(sql4totla, paramMaps);
		ResultSet<CourseTraceVO> rs = new ResultSet<CourseTraceVO>(list, page,
				total);

		return rs;
	}

	public String getJobLevel(String uid) {
		String sql = "select joblevelid from iapp_base_user_joblevel where userid=:userid ";
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("userid", uid);
		List<Map<String, Object>> list = this.query(sql, paramMap);
		if (null == list || list.isEmpty()) {
			return null;
		}
		return list.get(0).get("joblevelid").toString();
	}

	public TemplateVO getTemplate(String domain, String id) {
		String sql = "select a.name modulename,c.* from (base_module a LEFT JOIN base_domain_template b ON a.id=b.mid and b.domain=:domain and b.isdel=0),base_template c  where ((b.tid=c.id) or (b.tid IS null and c.is_default=0 and a.id=c.mid)) and a.id=:id ";
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("domain", domain);
		paramMap.put("id", id);
		List<TemplateVO> list = this.query(sql, paramMap, TemplateVO.class);
		if (null == list || list.isEmpty()) {
			return null;
		}
		return list.get(0);

	}

	public Template getSingleTemplate(String id) {
		String sql = "select b.* from base_single_template a ,base_template b where a.tid=b.id and a.sid=:sid ";

		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("sid", id);
		List<Template> list = this.query(sql, paramMap, Template.class);
		if (null == list || list.isEmpty()) {
			return null;
		}
		return list.get(0);

	}

	/* 用户组模式的授权 */
	@SuppressWarnings("unchecked")
	public ResultSet<Course> listAllViewingCourse(String domain, User user,
			boolean isSupportMobile, String name, String categoryid,
			Pageable page) {

		List<String> categoryids = Lists.newArrayList();
		if (StringUtils.isNotBlank(categoryid)) {
			categoryids.add(categoryid);
		}

		List<Course> list = (List<Course>) this
				.listResourceInfo(Course.class, Authorize.R_CATEGORY_COURSE,
						user, domain, STUDY_COURSE, isSupportMobile, page,
						"releasetime", "desc", name, categoryids);

		List<Course> list2 = (List<Course>) this.listResourceInfo(Course.class,
				Authorize.R_CATEGORY_COURSE, user, domain, STUDY_COURSE,
				isSupportMobile, null, null, null, name, categoryids);
		int count = 0;
		if (list2 != null && list2.size() > 0) {
			count = list2.size();
		}

		return new ResultSet<Course>(list, page, count);
	}

	@SuppressWarnings("unchecked")
	public List<Course> listAllViewingCourse(String domain, User user,
			boolean isSupportMobile, List<String> categoryids) {

		return (List<Course>) this.listResourceInfo(Course.class,
				Authorize.R_CATEGORY_COURSE, user, domain, STUDY_COURSE,
				isSupportMobile, null, null, null, null, categoryids);
	}

	@SuppressWarnings("unchecked")
	public ResultSet<Course> findMyCourses(User user, String domain,
			Pageable page) {

		List<Course> list = (List<Course>) this.listResourceInfo(Course.class,
				Authorize.R_CATEGORY_COURSE, user, domain, STUDY_COURSE, false,
				page, null, null, null, null);

		List<Course> list2 = (List<Course>) this.listResourceInfo(Course.class,
				Authorize.R_CATEGORY_COURSE, user, domain, STUDY_COURSE, false,
				null, null, null, null, null);

		int count = 0;
		if (list2 != null && list2.size() > 0) {
			count = list2.size();
		}
		ResultSet<Course> rs = new ResultSet<Course>(list, page, count);
		return rs;
	}

	/**
	 * 获取已学的课程
	 * 
	 * @param uid
	 * @param domain
	 * @return
	 */
	public List<CourseVO> getLearningCourse2(String uid, String domain) {
		
		String sql = "select distinct course.*,trace.end_date,trace.study_total_time,trace.total_time_sec,trace.lesson_status from study_course course left JOIN study_course_trace trace on course.id=trace.course_id LEFT JOIN (select * from iapp_base_authorize v where v.domain=:vdomain) t on course.id=t.rid where trace.user_id=:user_id and (((course.domainid=:domain and course.openstate=:openstate_domain) or course.openstate=:openstate_all) or t.rid is not null ) and released=:released and isdel=:isdel  ORDER BY trace.end_date DESC limit 0,9 ";
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("user_id", uid);
		paramMap.put("vuid", uid);
		paramMap.put("tuid", uid);
		paramMap.put("domain", domain);
		paramMap.put("vdomain", domain);
		paramMap.put("openstate_domain", Course.OPEN_STATE_OPENED);
		paramMap.put("openstate_all", Course.OPEN_STATE_ALL);
		paramMap.put("released", Course.RELEASEED_YES);
		paramMap.put("isdel", Delete.NORMAL.code);

		List<CourseVO> rs = this.query(sql, paramMap, CourseVO.class);
		return rs;
	}

	@SuppressWarnings("unchecked")
	public List<Course> listTopViewCourse(String domain, User user,
			boolean isSupportMobile, String sort) {

		String orderBy = "";
		if ("name".equals(sort)) {
			orderBy = "name";
		} else {
			orderBy = "createtime";
		}

		List<Course> list = (List<Course>) this.listResourceInfo(Course.class,
				Authorize.R_CATEGORY_COURSE, user, domain, STUDY_COURSE,
				isSupportMobile, null, orderBy, "desc", null, null);

		List<Course> list2 = Lists.newArrayList();

		if (list != null && list.size() > 0) {
			for (Course course : list) {
				if (course.getTopindex() > 0) {
					list2.add(course);
				}
			}
		}
		return list2;
	}

	@SuppressWarnings("unchecked")
	public List<Course> listTopViewCourse(String domain, User user,
			int topNumber, boolean isSupportMobile) {

		Pageable page = new Pageable(Pageable.FIRST_PAGE_NUMBER, topNumber);

		return (List<Course>) this.listResourceInfo(Course.class,
				Authorize.R_CATEGORY_COURSE, user, domain, STUDY_COURSE,
				isSupportMobile, page, "createtime", "desc", null, null);
	}

	@SuppressWarnings("unchecked")
	public List<Course> listNewViewCourse(String domain, User user,
			int newNumber, boolean isSupportMobile) {

		Pageable page = new Pageable(Pageable.FIRST_PAGE_NUMBER, newNumber);

		return (List<Course>) this.listResourceInfo(Course.class,
				Authorize.R_CATEGORY_COURSE, user, domain, STUDY_COURSE,
				isSupportMobile, page, "createtime", "desc", null, null);
	}

	@SuppressWarnings("unchecked")
	public ResultSet<SeriseCourseVO> listSeriseCourseByCategory(
			String categoryid, User user, boolean isSupportMobile,
			String domain, Pageable page) {

		List<String> categoryids = Lists.newArrayList();

		if (StringUtils.isNotBlank(categoryid)) {
			categoryids.add(categoryid);
		}

		List<SeriseCourseVO> list = (List<SeriseCourseVO>) this
				.listResourceInfo(SeriseCourseVO.class,
						Authorize.R_CATEGORY_COURSE, user, domain,
						SERIES_COURSE_VIEW, isSupportMobile, page,
						"createtime", "desc", null, categoryids);

		List<SeriseCourseVO> list2 = (List<SeriseCourseVO>) this
				.listResourceInfo(SeriseCourseVO.class,
						Authorize.R_CATEGORY_COURSE, user, domain,
						SERIES_COURSE_VIEW, isSupportMobile, null, null, null,
						null, categoryids);

		int count = 0;
		if (list2 != null && list2.size() > 0) {
			count = list2.size();
		}
		ResultSet<SeriseCourseVO> rs = new ResultSet<SeriseCourseVO>(list,
				page, count);
		return rs;
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

	private Map<String, Object> getConditionOfAuthorize(User user, String domain) {

		String orgid = user.getOid();
		String uid = user.getId();
		String joblevelid = getJobLevel(uid);
		List<String> grouplist = Lists.newArrayList();
		Map<String, Object> condition = Maps.newHashMap();

		// 得到域下的用户组信息
		String sql = "select * from iapp_group_relation where domain=:domain ";

		Map<String, Object> query = new HashMap<String, Object>();

		query.put("domain", domain);

		// 得到用户组关联信息
		List<Map<String, Object>> list = this.query(sql, query);

		Map<String, Object> maps = Maps.newHashMap();

		if (list != null && list.size() > 0) {
			for (Map<String, Object> map : list) {

				String gid = map.get("gid").toString();

				if (maps.containsKey(gid)) {
					continue;
				}

				if (map.containsValue(orgid) || map.containsValue(uid)
						|| map.containsValue(joblevelid)) {
					maps.put(gid, gid);
				}

				// 判断是否符合规则

				// 得到用户组的规则
				String sql2 = "select * from iapp_group_rule where gid=:gid and domain=:domain";

				Map<String, Object> queryMap = Maps.newHashMap();

				queryMap.put("gid", gid);
				queryMap.put("domain", domain);

				List<Map<String, Object>> rulelist = this.query(sql2, queryMap);

				// 有规则存在
				if (rulelist != null && rulelist.size() > 0) {
					int num = 0;
					for (Map<String, Object> map2 : rulelist) {

						// 得到属性值
						String pname = map2.get("property").toString();

						// 得到操作类型
						int operation = Integer.valueOf(map2.get("operation")
								.toString());

						Object obj = "";

						// type==0 用户
						if (Integer.valueOf(map2.get("type").toString()) == 0) {
							obj = getPropertyValue(user, pname);
						}
						switch (operation) {
						case 0:// 等于
							if (obj != null) {
								// 判读值是否相等
								if (obj.toString().equals(
										map2.get("value").toString())) {
									// 说明符合规则
									num++;
								}
							}
							break;
						case 1:// 大于
							if (obj != null) {
								if (obj.toString().compareTo(
										map2.get("value").toString()) > 0) {
									num++;
								}
							}
							break;
						case 2:// 小于
							if (obj != null) {
								if (obj.toString().compareTo(
										map2.get("value").toString()) < 0) {
									num++;
								}
							}
							break;
						case 3:// between
							if (obj != null) {
								String values = map2.get("value").toString();

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
							if (obj != null) {
								if (obj.toString().contains(
										map2.get("value").toString())) {
									num++;
								}
							}
							break;
						case 5:// in
							if (obj != null) {
								String values = map2.get("value").toString();

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
						maps.put(gid, gid);
					}
				}
			}
		}

		for (Object obj : maps.values()) {
			grouplist.add(obj.toString());
		}

		condition.put("orgid", orgid);
		condition.put("uid", uid);
		condition.put("joblevelid", joblevelid);
		condition.put("grouplist", grouplist);

		return condition;

	}

	/**
	 * 
	 * @param map
	 *            用户的授权信息
	 * @param queryMap
	 *            查询条件
	 * @return
	 */
	@SuppressWarnings("unchecked")
	private String getCommonAuthorizeSql(Map<String, Object> map,
			Map<String, Object> queryMap, String domain) {

		List<String> grouplist = (List<String>) map.get("grouplist");
		String groups = StringUtils.join(grouplist.toArray(), ",");

		StringBuilder sb = new StringBuilder(
				"select * from iapp_base_authorize a where 1=1");

		sb.append(" and a.sid in(:uid");
		queryMap.put("uid", map.get("uid").toString());

		if (map.get("orgid") != null) {
			sb.append(",:orgid");
			queryMap.put("orgid", map.get("orgid").toString());
		}

		if (map.get("joblevelid") != null) {
			sb.append(",:joblevelid");
			queryMap.put("joblevelid", map.get("joblevelid").toString());
		}
		if (map.get("grouplist") != null) {
			sb.append(",:groups");
			queryMap.put("groups", groups);
		}

		sb.append(") and a.domain=:domain");
		queryMap.put("domain", domain);

		return sb.toString();

	}

	/**
	 * 
	 * @param tablename
	 *            表名称
	 * @param searchName
	 *            默认是按名称查询
	 * @param isSupportMobile
	 *            是否支持移动端
	 * @param page
	 *            分页信息
	 * @param orderBy
	 *            排序规则
	 * @return
	 */
	private String getCommonSql(Map<String, Object> queryMap,
			Map<String, Object> map, String tablename, String searchName,
			boolean isSupportMobile, Pageable page, String orderBy,
			String orderRule, String domain, List<String> categoryids) {

		StringBuilder sb = new StringBuilder("select s.* from ");

		sb.append(tablename);
		sb.append(" s left join( ");
		sb.append(getCommonAuthorizeSql(map, queryMap, domain));
		sb.append(") t");
		sb.append(" on s.id=t.rid");
		sb.append(" where s.isdel=:isdel and s.released=:released and s.openstate=:openstate_domain or s.openstate=:openstate_all or t.rid is not null");

		queryMap.put("isdel", 0);
		queryMap.put("released", Course.RELEASEED_YES);
		queryMap.put("openstate_domain", Course.OPEN_STATE_OPENED);
		queryMap.put("openstate_all", Course.OPEN_STATE_ALL);

		if (StringUtils.isNotBlank(searchName)) {// 名称模糊查询
			sb.append(" and s.name like %:searchName%");
			queryMap.put("searchName", searchName);
		}

		if (isSupportMobile) {// 支持移动端
			sb.append(" and s.supportmobile=:supportmobile");
			queryMap.put("supportmobile", isSupportMobile);
		}

		if (categoryids != null && categoryids.size() > 0) {
			if (categoryids.size() == 1) {
				sb.append(" and s.categoryid=:categoryid ");
				queryMap.put("categoryid", categoryids.get(0));
			} else {
				sb.append(" and s.categoryid in(:categoryids)");
				queryMap.put("categoryids",
						StringUtils.join(categoryids.toArray(), ","));
			}
		}

		if (StringUtils.isNotBlank(orderBy)) {// 需要排序
			sb.append(" order by :orderBy :orderRule");
			queryMap.put("orderBy", orderBy);
			queryMap.put("orderRule", orderRule);
		}

		if (page != null) {// 需要分页
			sb.append(" limit :currentpage,:pagesize");
			queryMap.put("currentpage",
					(page.getPageNumber() - 1) * page.getPageSize());
			queryMap.put("pagesize", page.getPageSize());
		}

		return sb.toString();
	}

	private Map<String, Object> getCourseSql(Map<String, Object> map,
			String tablename, boolean isSupportMobile, Pageable page,
			String orderBy, String orderRule, String searchName, String domain,
			List<String> categoryids) {

		Map<String, Object> conditionMap = Maps.newHashMap();
		Map<String, Object> map2 = Maps.newHashMap();

		String sql = getCommonSql(map2, map, tablename, searchName,
				isSupportMobile, page, orderBy, orderRule, domain, categoryids);

		conditionMap.put("conditionMap", map2);
		conditionMap.put("sql", sql);

		return conditionMap;
	}

	@SuppressWarnings("unchecked")
	private List<?> listResourceInfo(Class<?> class1, int rcategory, User user,
			String domain, String tablename, boolean isSupportMobile,
			Pageable page, String orderBy, String orderRule, String searchName,
			List<String> categoryids) {
		Map<String, Object> map = getConditionOfAuthorize(user, domain);
		// 查询是否有用户组

		List<?> list = Lists.newArrayList();

		if (rcategory == Authorize.R_CATEGORY_COURSE) {// 课程

			Map<String, Object> condition = getCourseSql(map, tablename,
					isSupportMobile, page, orderBy, orderRule, searchName,
					domain, categoryids);

			list = this
					.query(condition.get("sql").toString(),
							(Map<String, Object>) condition.get("conditionMap"),
							class1);

		} else if (rcategory == Authorize.R_CATEGORY_VOTE_ACTIVITY) {// 考试
			Map<String, Object> queryMap = Maps.newHashMap();
			String sql = getCommonAuthorizeSql(map, queryMap, domain);

			list = this.query(sql, queryMap);

		} else if (rcategory == Authorize.R_CATEGORY_TASK) {// 作业

		}
		return list;
	}

	@SuppressWarnings("unchecked")
	public List<Authorize> listExamAuthorizes(int rcategory, String domain,
			User user) {
		List<Map<String, Object>> list = (List<Map<String, Object>>) listResourceInfo(
				null, Authorize.R_CATEGORY_VOTE_ACTIVITY, user, domain, null, false,
				null, null, null, null, null);

		List<Authorize> authorizes = Lists.newArrayList();

		if (list != null && list.size() > 0) {
			for (Map<String, Object> map : list) {
				Authorize authorize = new Authorize();

				authorize.setDomain(map.get("domain").toString());
				authorize.setId(map.get("id").toString());
				authorize.setRcategory(Integer.valueOf(map.get("rcategory")
						.toString()));
				authorize.setRid(map.get("rid").toString());
				authorize.setScategory(Integer.valueOf(map.get("scategory")
						.toString()));
				// authorize.setSid(map.get("sid").toString());

				authorizes.add(authorize);
			}
		}

		return authorizes;
	}

	/**
	 * 根据练习id获取题库id数组
	 * 
	 * @param practiceid
	 * @return
	 */
	public List<String> listPracticeItemids(String practiceid) {
		String sql = " select spi.itemblank_id from study_practice_itemblank spi where spi.practice_id = :practiceid";
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("practiceid", practiceid);
		List<Map<String, Object>> list = this.query(sql, paramMap);
		List<String> itemIds = new ArrayList<String>();
		for (Map<String, Object> map : list) {
			Object obj = map.get("itemblank_id");
			if (obj != null && !"".equals((String) obj))
				itemIds.add((String) obj);
		}
		return itemIds;
	}

	/**
	 * 根据课程id获取练习id
	 * 
	 * @param courseid
	 *            课程id
	 * @return 练习id
	 */
	public String getPracticeIdByCourseId(String courseid) {
		String sql = " select scp.pid from study_course_practice scp where scp.cid = :courseid";
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("courseid", courseid);
		List<Map<String, Object>> list = this.query(sql, paramMap);
		if (list.size() > 0) {
			Object obj = list.get(0).get("pid");
			if (obj != null && !"".equals((String) obj))
				return (String) obj;
		}
		return null;
	}

	public Practice PracticeById(String id) {
		String sql = " select * from study_practice sp where sp.id = :pid";
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("pid", id);
		List<Map<String, Object>> list = this.query(sql, paramMap);
		Practice practice = new Practice();
		if (list.size() > 0) {
			practice.setId((String) list.get(0).get("id"));
			practice.setName((String) list.get(0).get("name"));
			practice.setTotal((Integer) list.get(0).get("total"));
			Object cover = list.get(0).get("cover");
			if (cover != null)
				practice.setCover((String) cover);
			Object content = list.get(0).get("content");
			if (content != null)
				practice.setContent((String) content);
			practice.setStatus((String) list.get(0).get("status"));
			practice.setCreater((String) list.get(0).get("creater"));
			Object isdel = list.get(0).get("isdel");
			if (isdel != null)
				practice.setIsDel(Integer.parseInt((String) isdel));
			practice.setDomain((String) list.get(0).get("domain"));
			practice.setCreateTime((Long) list.get(0).get("create_time"));
			Object updateTime = list.get(0).get("update_time");
			if (updateTime != null)
				practice.setUpdateTime((Long) updateTime);
			Object updater = list.get(0).get("updater");
			if (updater != null)
				practice.setUpdater((String) updater);

			return practice;
		}
		return null;
	}

	public TopicConfig topicConfig(String domain) {

		String sql = "select * from iapp_topic_config where domain=:domain";

		Map<String, Object> querymap = new HashMap<String, Object>();

		querymap.put("domain", domain);
		List<Map<String, Object>> list = this.query(sql, querymap);

		TopicConfig topicConfig = new TopicConfig();

		if (list != null && list.size() > 0) {
			Map<String, Object> map = list.get(0);

			topicConfig.setCover(StringUtils.trimToEmpty(map.get("cover")
					.toString()));
			topicConfig.setDescript(StringUtils.trimToEmpty(map.get("descript")
					.toString()));
			topicConfig.setDomain(StringUtils.trimToEmpty("domain").toString());
			topicConfig
					.setId(StringUtils.trimToEmpty(map.get("id").toString()));
			topicConfig.setTitle(StringUtils.trimToEmpty(map.get("title")
					.toString()));
		}

		return topicConfig;
	}

	public String getOrganizationNama(String oid) {
		String sql = "select name from iapp_base_organization where id=:oid";
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("oid", oid);
		List<Map<String, Object>> list = this.query(sql, paramMap);
		if (list.size() > 0) {
			return list.get(0).get("name").toString();
		}
		return null;
	}

	public String getPasswordByUid(String uid, String domain) {
		String sql = "select pwd from base_account where uid=:uid and domainid=:domain";
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("uid", uid);
		paramMap.put("domain", domain);
		List<Map<String, Object>> list = this.query(sql, paramMap);
		if (list.size() > 0) {
			return list.get(0).get("pwd").toString();
		}
		return null;
	}

	public int updatePassword(String uid, String domain, String password) {
		String sql = "update base_account set pwd=:password where uid=:uid and domainid=:domain";
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("password", password);
		paramMap.put("uid", uid);
		paramMap.put("domain", domain);
		int result = this.update(sql, paramMap);
		return result;
	}

	public ResultSet<ActivityInfo> getActivityListByUid(String uid,
			int isDelete, Pageable page) {
		String sql = "SELECT count(*) as count FROM ixin_activity AS a WHERE  a.isDelete = :isDelete and a.id IN (SELECT DISTINCT	b.activityId FROM ixin_activity_apply_list AS b WHERE b.baseuid = :uid)";
		String sql2 = "SELECT id, name, startDate, endDate FROM ixin_activity AS a WHERE a.isDelete = :isDelete and  a.id IN (SELECT DISTINCT b.activityId FROM ixin_activity_apply_list AS b WHERE b.baseuid = :uid) limit :currentpage,:pagesize";
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("isDelete", isDelete);
		paramMap.put("uid", uid);
		List<Map<String, Object>> all = this.query(sql, paramMap);
		long count = 0;
		if (all != null && all.size() > 0)
			count = (Long) all.get(0).get("count");

		paramMap.put("currentpage",
				(page.getPageNumber() - 1) * page.getPageSize());// 略前面几条
		paramMap.put("pagesize", page.getPageSize());// 要取多少条

		List<Map<String, Object>> list = this.query(sql2, paramMap);
		List<ActivityInfo> activitys = new ArrayList<ActivityInfo>();
		if (list != null && list.size() > 0) {
			for (int i = 0; i < list.size(); i++) {
				Map<String, Object> map = list.get(i);
				ActivityInfo activityInfo = new ActivityInfo();
				activityInfo.setId(StringUtils.trimToEmpty(map.get("id")
						.toString()));
				activityInfo.setName(StringUtils.trimToEmpty(map.get("name")
						.toString()));
				activityInfo.setStartDate(Long.parseLong(map.get("startDate")
						.toString()));
				activityInfo.setEndDate(Long.parseLong(map.get("endDate")
						.toString()));
				activitys.add(activityInfo);
			}
		}

		page.setTotal(count);

		com.longtime.common.model.search.ResultSet<ActivityInfo> rs = new com.longtime.common.model.search.ResultSet<ActivityInfo>(
				activitys, page, count);
		return rs;
	}

	public RewardRuleContainer queryRuleContainer(String rewardId) {
		String sql = "SELECT * from ixin_reward_rule_container where rewardId= :rewardId and startTime<= :startTime and endTime> :endTime ";
		long current = System.currentTimeMillis();
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("rewardId", rewardId);
		paramMap.put("startTime", current);
		paramMap.put("endTime", current);

		List<Map<String, Object>> list = this.query(sql, paramMap);
		List<RewardRuleContainer> activitys = new ArrayList<RewardRuleContainer>();
		if (list != null && list.size() > 0) {
			for (int i = 0; i < list.size(); i++) {
				Map<String, Object> map = list.get(i);
				RewardRuleContainer activity = new RewardRuleContainer();
				activity.setId(StringUtils
						.trimToEmpty(map.get("id").toString()));
				activity.setRewardId(StringUtils.trimToEmpty(map
						.get("rewardId").toString()));
				activity.setRewardRate(Double.parseDouble(map.get("rewardRate")
						.toString()));
				activity.setMaxAttendNum(Integer.parseInt(map.get(
						"maxAttendNum").toString()));
				activity.setStartTime(Long.parseLong(map.get("startTime")
						.toString()));
				activity.setEndTime(Long.parseLong(map.get("endTime")
						.toString()));
				// activity.setDomain(StringUtils.trimToEmpty(map.get("domain")
				// .toString()));
				activitys.add(activity);
			}
		}

		if (CollectionUtils.isEmpty(list)) {
			return null;
		}
		if (activitys.size() == 1) {
			return activitys.get(0);
		}
		RewardRuleContainer container = activitys.get(0);
		for (RewardRuleContainer item : activitys) {
			if (item.getStartTime() < container.getStartTime()) {
				container = item;
			}
		}
		return container;
	}

	public int queryApplyCountByUid(String rewardId, String containerId,
			String uid) {
		String sql = "select count(id) as count from ixin_reward_record where rewardId= :rewardId and containerId= :containerId and base_uid= :uid";
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("rewardId", rewardId);
		paramMap.put("containerId", containerId);
		paramMap.put("uid", uid);

		List<Map<String, Object>> list = this.query(sql, paramMap);
		if (list.size() > 0) {
			return Integer.parseInt(list.get(0).get("count").toString());
		}
		return 0;
	}

	public ApplyRewardVO queryWiningRecordByUserid(String rewardId, String uid) {
		String sql = "select ixin_reward_record.id, userId, awardId, title, content, applyDate, phone, base_uid, sncode from "
				+ "ixin_reward_record, ixin_reward_card_award where ixin_reward_record.rewardId=:rewardId and "
				+ "isWining=1 and ixin_reward_record.awardId=ixin_reward_card_award.id "
				+ "and ixin_reward_record.base_uid=:uid";

		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("rewardId", rewardId);
		paramMap.put("uid", uid);

		List<Map<String, Object>> list = this.query(sql, paramMap);
		List<ApplyRewardVO> applys = new ArrayList<ApplyRewardVO>();

		if (list != null && list.size() > 0) {
			for (int i = 0; i < list.size(); i++) {
				Map<String, Object> map = list.get(i);
				ApplyRewardVO applyRewardVO = new ApplyRewardVO();
				applyRewardVO.setId(StringUtils.trimToEmpty(map.get("id")
						.toString()));
				applyRewardVO.setAwardId(StringUtils.trimToEmpty(map.get(
						"awardId").toString()));
				if (map.get("title") != null)
					applyRewardVO.setAwardTitle(StringUtils.trimToEmpty(map
							.get("title").toString()));
				if (map.get("content") != null)
					applyRewardVO.setAwardContent(StringUtils.trimToEmpty(map
							.get("content").toString()));
				if (map.get("phone") != null)
					applyRewardVO.setPhone(StringUtils.trimToEmpty(map.get(
							"phone").toString()));
				if (map.get("sncode") != null)
					applyRewardVO.setSncode(StringUtils.trimToEmpty(map.get(
							"sncode").toString()));
				if (map.get("base_uid") != null)
					applyRewardVO.setBaseUid(StringUtils.trimToEmpty(map.get(
							"base_uid").toString()));
				applys.add(applyRewardVO);
			}
		}

		if (applys != null && !applys.isEmpty()) {
			return applys.get(0);
		}
		return null;
	}

	public List<RewardCardItem> queryAwards(String containerId) {
		String sql = "select * from ixin_reward_card_award where containerId=:containerId order by weight asc";
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("containerId", containerId);

		List<Map<String, Object>> list = this.query(sql, paramMap);
		List<RewardCardItem> items = new ArrayList<RewardCardItem>();

		if (list != null && list.size() > 0) {
			for (int i = 0; i < list.size(); i++) {
				Map<String, Object> map = list.get(i);
				RewardCardItem item = new RewardCardItem();
				item.setId(StringUtils.trimToEmpty(map.get("id").toString()));
				item.setContainerId(StringUtils.trimToEmpty(map.get(
						"containerId").toString()));
				item.setTitle(StringUtils.trimToEmpty(map.get("title")
						.toString()));
				item.setContent(StringUtils.trimToEmpty(map.get("content")
						.toString()));
				item.setNum(Integer.parseInt(StringUtils.trimToEmpty(map.get(
						"num").toString())));
				item.setRemainingNum(Integer.parseInt(StringUtils
						.trimToEmpty(map.get("remainingNum").toString())));
				item.setWeight(Integer.parseInt(StringUtils.trimToEmpty(map
						.get("weight").toString())));
				items.add(item);
			}
		}

		return items;
	}

	public RewardRuleContainer getRuleContainerById(String containerId) {
		String sql = "SELECT * from ixin_reward_rule_container where id=:containerId ";
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("containerId", containerId);

		List<Map<String, Object>> list = this.query(sql, paramMap);
		List<RewardRuleContainer> rewardRules = new ArrayList<RewardRuleContainer>();

		if (list != null && list.size() > 0) {
			for (int i = 0; i < list.size(); i++) {
				Map<String, Object> map = list.get(i);
				RewardRuleContainer activity = new RewardRuleContainer();
				activity.setId(StringUtils
						.trimToEmpty(map.get("id").toString()));
				activity.setRewardId(StringUtils.trimToEmpty(map
						.get("rewardId").toString()));
				activity.setRewardRate(Double.parseDouble(map.get("rewardRate")
						.toString()));
				activity.setMaxAttendNum(Integer.parseInt(map.get(
						"maxAttendNum").toString()));
				activity.setStartTime(Long.parseLong(map.get("startTime")
						.toString()));
				activity.setEndTime(Long.parseLong(map.get("endTime")
						.toString()));
				// activity.setDomain(StringUtils.trimToEmpty(map.get("domain")
				// .toString()));
				rewardRules.add(activity);
			}
		}

		if (rewardRules != null && !rewardRules.isEmpty()) {
			return rewardRules.get(0);
		}
		return null;
	}

	public boolean addApplyRewardRecord(ApplyRewardRecord record) {
		String sql = "insert into ixin_reward_record(id, userId, rewardId,containerId, awardId, isWining, applyDate, phone, sncode, base_uid) "
				+ "values (:id,:userId,:rewardId,:containerId,:awardId,:isWining,:applyDate,:phone,:sncode,:baseuid)";
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("id", record.getId());
		paramMap.put("userId", record.getUserId());
		paramMap.put("rewardId", record.getRewardId());
		paramMap.put("containerId", record.getContainerId());
		paramMap.put("awardId", record.getAwardId());
		paramMap.put("isWining", record.getIsWining());
		paramMap.put("applyDate", record.getApplyDate());
		paramMap.put("phone", record.getPhone());
		paramMap.put("sncode", record.getSncode());
		paramMap.put("baseuid", record.getBaseUid());
		int result = this.update(sql, paramMap);
		return result == 1;
	}

	public int queryAwardsNum(String containerId) {
		String sql = "select sum(remainingNum) as count from ixin_reward_card_award where containerId=:cid";
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("cid", containerId);

		List<Map<String, Object>> list = this.query(sql, paramMap);

		if (list != null && list.size() > 0) {
			Map<String, Object> map = list.get(0);
			if (map.get("count") != null)
				return Integer.parseInt(map.get("count").toString());
		}
		return 0;
	}

	public RewardCardItem queryAwardById(String id) {
		String sql = "select * from ixin_reward_card_award where id=:id";
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("id", id);
		List<Map<String, Object>> list = this.query(sql, paramMap);
		List<RewardCardItem> items = new ArrayList<RewardCardItem>();

		if (list != null && list.size() > 0) {
			for (int i = 0; i < list.size(); i++) {
				Map<String, Object> map = list.get(i);
				RewardCardItem item = new RewardCardItem();
				item.setId(StringUtils.trimToEmpty(map.get("id").toString()));
				item.setContainerId(StringUtils.trimToEmpty(map.get(
						"containerId").toString()));
				item.setTitle(StringUtils.trimToEmpty(map.get("title")
						.toString()));
				item.setContent(StringUtils.trimToEmpty(map.get("content")
						.toString()));
				item.setNum(Integer.parseInt(StringUtils.trimToEmpty(map.get(
						"num").toString())));
				item.setRemainingNum(Integer.parseInt(StringUtils
						.trimToEmpty(map.get("remainingNum").toString())));
				item.setWeight(Integer.parseInt(StringUtils.trimToEmpty(map
						.get("weight").toString())));
				items.add(item);
			}
		}
		if (null != items && !items.isEmpty()) {
			return items.get(0);
		}
		return null;
	}

	public boolean updateRecord(ApplyRewardRecord record) {
		String sql = "update ixin_reward_record set awardId=:awardId,isWining=:isWining,phone=:phone,sncode=:sncode where id=:id";
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("awardId", record.getAwardId());
		paramMap.put("isWining", record.getIsWining());
		paramMap.put("phone", record.getPhone());
		paramMap.put("sncode", record.getSncode());
		paramMap.put("id", record.getId());
		int result = this.update(sql, paramMap);
		return result == 1;
	}

	public boolean cutAwardRemainingNum(RewardCardItem award) {
		String sql = "update ixin_reward_card_award set remainingNum=:num where id=:id";
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("num", award.getRemainingNum() - 1);
		paramMap.put("id", award.getId());
		int result = this.update(sql, paramMap);
		return result == 1;
	}

	public RewardActivity queryRewardActivityById(String id) {
		String sql = "select * from ixin_reward_info where id=:id and isDelete=0";
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("id", id);
		List<Map<String, Object>> list = this.query(sql, paramMap);
		List<RewardActivity> activitys = new ArrayList<RewardActivity>();
		if (list != null && list.size() > 0) {
			for (int i = 0; i < list.size(); i++) {
				Map<String, Object> map = list.get(i);
				RewardActivity reward = new RewardActivity();
				reward.setId(StringUtils.trimToEmpty(map.get("id").toString()));
				reward.setCreateDate(Long.parseLong(map.get("createDate")
						.toString()));
				reward.setStartDate(Long.parseLong(map.get("startDate")
						.toString()));
				reward.setEndDate(Long.parseLong(map.get("endDate").toString()));
				if (map.get("replyKeys") != null)
					reward.setKey(StringUtils.trimToEmpty(map.get("replyKeys")
							.toString()));
				if (map.get("replyContent") != null)
					reward.setReplyContent(StringUtils.trimToEmpty(map.get(
							"replyContent").toString()));
				if (map.get("type") != null)
					reward.setRewardType(StringUtils.trimToEmpty(map
							.get("type").toString()));
				if (map.get("maxAttendNum") != null)
					reward.setMaxAttendNum(Integer.parseInt(map.get(
							"maxAttendNum").toString()));
				if (map.get("rewardRate") != null) {
					String rate = map.get("rewardRate").toString();
					double rewardRate = Double.parseDouble(rate);
					reward.setRewardRate(rewardRate);
				}
				if (map.get("showRewardNum") != null)
					reward.setShowRewardNum(Integer.parseInt(map.get(
							"showRewardNum").toString()));
				reward.setIsCreateFinish(Integer.parseInt(map.get(
						"isCreateFinish").toString()));
				reward.setDomain(StringUtils.trimToEmpty(map.get("domain")
						.toString()));
				reward.setIsDelete(Integer.parseInt(map.get("isDelete")
						.toString()));
				RewardExplain explain1 = new RewardExplain(
						StringUtils.trimToEmpty(map.get("title1").toString()),
						StringUtils.trimToEmpty(map.get("content1").toString()),
						StringUtils.trimToEmpty(map.get("picUrl1").toString()));
				RewardExplain explain2 = new RewardExplain(
						StringUtils.trimToEmpty(map.get("title2").toString()),
						StringUtils.trimToEmpty(map.get("content2").toString()),
						StringUtils.trimToEmpty(map.get("picUrl2").toString()));
				reward.setExplain1(explain1);
				reward.setExplain2(explain2);
				if (map.get("activityId") != null)
					reward.setActivityId(StringUtils.trimToEmpty(map.get(
							"activityId").toString()));
				activitys.add(reward);
			}
		}

		if (null != activitys && !activitys.isEmpty()) {
			return activitys.get(0);
		}
		return null;
	}

	public ApplyRewardRecord queryRecord(String recordId) {
		String sql = "select * from ixin_reward_record where id=:rid";
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("rid", recordId);
		List<Map<String, Object>> list = this.query(sql, paramMap);
		List<ApplyRewardRecord> rewards = new ArrayList<ApplyRewardRecord>();

		if (list != null && list.size() > 0) {
			for (int i = 0; i < list.size(); i++) {
				Map<String, Object> map = list.get(i);
				ApplyRewardRecord record = new ApplyRewardRecord();
				record.setId(StringUtils.trimToEmpty(map.get("id").toString()));
				record.setUserId(StringUtils.trimToEmpty(map.get("userId")
						.toString()));
				record.setRewardId(StringUtils.trimToEmpty(map.get("rewardId")
						.toString()));
				if (map.get("awardId") != null)
					record.setAwardId(StringUtils.trimToEmpty(map
							.get("awardId").toString()));
				if (map.get("isWining") != null)
					record.setIsWining(Integer.parseInt(map.get("isWining")
							.toString()));
				if (map.get("applyDate") != null)
					record.setApplyDate(Long.parseLong(map.get("applyDate")
							.toString()));
				if (map.get("phone") != null)
					record.setPhone(StringUtils.trimToEmpty(map.get("phone")
							.toString()));
				if (map.get("sncode") != null)
					record.setSncode(StringUtils.trimToEmpty(map.get("sncode")
							.toString()));
				if (map.get("containerId") != null)
					record.setContainerId(StringUtils.trimToEmpty(map.get(
							"containerId").toString()));
				if (map.get("base_uid") != null)
					record.setBaseUid(StringUtils.trimToEmpty(map.get(
							"base_uid").toString()));

				rewards.add(record);
			}
		}
		if (null != rewards && !rewards.isEmpty()) {
			return rewards.get(0);
		}
		return null;
	}

	/**投票调研**/
	public List<Map<String, Object>> getAllOpenId() {
		String sql = "select uv.userId,v.domain from  ixin_user_vote uv left join  ixin_vote v on uv.voteId=v.id";
		List<Map<String, Object>> list = this.query(sql,new HashMap<String,Object>());
		return list;
	}

	/**抽奖**/
	public List<Map<String, Object>> getAllRewardOpenId() {
		String sql = "select record.userId,reward.domain from  ixin_reward_record record left join ixin_reward_info reward on record.rewardId=reward.id";
		List<Map<String, Object>> list = this.query(sql,new HashMap<String,Object>());
		return list;
	}

	public List<Map<String, Object>> getAllActivityOpenId() {
		String sql = "select apply.userId,activity.domain from  ixin_activity_apply_list  apply left join ixin_activity activity on apply.activityId=activity.id";
		List<Map<String, Object>> list = this.query(sql,new HashMap<String,Object>());
		return list;
	}

	public List<FodderVO> listNotice(String domain, String columnType,Pageable page) {
		String sql = "select fodder.*,info.id as columnId from ixin_columninfo info inner join ixin_fodder fodder on info.fodderId=fodder.id where info.domain=:domain and columnType=:columnType and info.del=0 and fodder.del=0 order by info.saveTime desc limit :start,:size";
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("domain", domain);
		paramMap.put("columnType", columnType);
		paramMap.put("start", page.getOffset());
		paramMap.put("size", page.getPageSize());
		List<FodderVO> list = this.query(sql.toString(), paramMap, FodderVO.class);
		return list;
	}

	public long countNotice(String domain, String columnType) {
		String sql = "select count(*) as total from ixin_columninfo info inner join ixin_fodder fodder on info.fodderId=fodder.id where info.domain=:domain and columnType=:columnType and info.del=0 and fodder.del=0 ";
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("domain", domain);
		paramMap.put("columnType", columnType);
		return this.count(sql, paramMap);
	}

	/**
	 * 已报名活动
	 * @param activityIds
	 * @param uid
	 * @param page 
	 * @return
	 */
	public List<ActivityInfo> getActivitysByUid( String uid, Pageable page) {
		String sql = "SELECT id, name, startDate, endDate FROM ixin_activity AS a WHERE a.isDelete = :isDelete and  a.id IN (SELECT DISTINCT b.activityId FROM ixin_activity_apply_list AS b WHERE b.baseuid = :uid) limit :start,:pagesize";
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("uid", uid);
		paramMap.put("isDelete", 0);
		paramMap.put("start", page.getOffset());
		paramMap.put("pagesize", page.getPageSize());
		List<ActivityInfo> list = this.query(sql, paramMap, ActivityInfo.class);
		return list;
	}
	
	/**
	 * 我的授权活动
	 * @param activityIds
	 * @return
	 */
	public List<ActivityInfo> getActivitysByIds(List<String> activityIds) {
		if (activityIds == null || activityIds.isEmpty()) {
			return Lists.newArrayList();
		}
	
		String sql = "select * from ixin_activity act where id in (:ids)";
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("ids", activityIds);
		paramMap.put("isDelete", 0);
		List<ActivityInfo> list = this.query(sql, paramMap, ActivityInfo.class);
		return list;
	}

	/**
	 * 公开的活动
	 * @param domain
	 * @param category
	 * @return
	 */
	public List<String> listPubAuthIds(String domain, int category) {
		String sql = "select id from ixin_activity where domain = :adomain and id not in (select distinct rid from iapp_base_authorize auth where  domain= :badomain and rcategory = :rcategory)";
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("adomain", domain);
		paramMap.put("badomain", domain);
		paramMap.put("rcategory", category); 
		List<Map<String, Object>> list = this.query(sql, paramMap);

		if (list == null || list.isEmpty()) {
			return Lists.newArrayList();
		} else {
			List<String> rids = new ArrayList<String>();
			for (Map<String, Object> map : list) {
				Object rid = map.get("id");
				if (rid != null && StringUtils.isNotBlank(String.valueOf(rid))) {
					rids.add(String.valueOf(rid));
				}
			}
			return rids;
		} 
	}
	
	 public void updateIxinDopenId(String openId,String d_openId,String domain){
	     String sql = "update ixin_user set d_openid=:d_openid where openid=:openid and domain=:domain";
	     Map<String, Object> paramMap = new HashMap<String, Object>(3);
	     paramMap.put("d_openid", d_openId);
	     paramMap.put("openid", openId);
	     paramMap.put("domain", domain); 
	     this.update(sql, paramMap);
	 }

	public void updateBindStatus(String uid, String domain,int bind) {
		String sql = "UPDATE iapp_base_user SET isbind=:bind where id=:id and domain=:domain";
		 Map<String, Object> paramMap = new HashMap<String, Object>();
		 paramMap.put("bind", bind);
	     paramMap.put("id", uid);
	     paramMap.put("domain", domain);
	     this.update(sql, paramMap);
	}

	public IndexEntityVO getIndexEntityById(String id) {
		String sql = "select * from iapp_base_ext_index where id=:id ";
		 Map<String, Object> paramMap = new HashMap<String, Object>();
	     paramMap.put("id", id);
	    List<IndexEntityVO> list = this.query(sql, paramMap,IndexEntityVO.class);
	    if (CollectionUtils.isNotEmpty(list)) {
			
	    	return list.get(0);
		}
		return null;
	}

	public List<IndexModuleEntity> getIndexModuleByIndexId(String id) {
		String sql = "select * from iapp_base_ext_index_module where indexid=:id ";
		 Map<String, Object> paramMap = new HashMap<String, Object>();
	     paramMap.put("id", id);
	    List<IndexModuleEntity> list = this.query(sql, paramMap,IndexModuleEntity.class);
	    
		return list;
		
	}

	public int updateReportVisit(ReportVisitEntity entity) {
		
		String sql = "update report_visit_statistics  set value=value + 1  where model=:model and domain=:domain and timestamp=:timestamp ";
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("model", entity.getModel());
		paramMap.put("domain", entity.getDomain());
		paramMap.put("timestamp", entity.getTimestamp());
		if (StringUtils.isNotBlank(entity.getRid())) {
			sql = String.format("%s%s", sql,"and rid=:rid ");
			paramMap.put("rid",entity.getRid());
			
		}
		
		return this.update(sql, paramMap);
		
	}

	public long countVisitByRid(String id, String model) {
		String sql = "select sum(value) as sum from report_visit_statistics where rid=:rid and model=:model ";
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("rid", id);
		paramMap.put("model", model);
		List<Map<String, Object>> rs = this.query(sql, paramMap);
		long sum = 0;
		if (!CollectionUtils.isEmpty(rs)) {
			
			BigDecimal  bdsum = (BigDecimal)rs.get(0).get("sum");
			if(null!=bdsum){
				sum = bdsum.longValue();
			}
			
		}
		return sum;
	}

	public List<QuestionVO> listQuestion(String domain, String status,Pageable page) {
		String sql = "select question.* , answer.content as answer from base_question question LEFT JOIN base_answer answer on question.best_aid = answer.id where question.is_set_best_answer =:status and question.domain =:domain ORDER BY question.dateCreated DESC LIMIT :start,:size ";
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("status", status);
		paramMap.put("domain", domain);
		paramMap.put("start", page.getOffset());
		paramMap.put("size", page.getPageSize());
		
		List<QuestionVO> list = Lists.newArrayList();
		
		list = this.query(sql.toString(), paramMap, QuestionVO.class);
		
		return list;
		
	}
	
	public List<QuestionVO> listRemindQuestion(String domain, String uid, String model, Pageable page) {
		String sql = "select DISTINCT(invite.id) , invite.model as invitemodel,invite.id  as inviteid , invite.authorid as invite_fromuid,invite.authorname as invite_fromuname,invite.timestamp as invitetime,question.*  from  base_invite invite  inner JOIN " +
				" base_question question on question.id = invite.rid where invite.uid=:uid and invite.model=:model and question.domain =:domain order by invite.timestamp desc  LIMIT :start,:size ";
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("uid",uid );
		paramMap.put("model",model );
		paramMap.put("domain", domain);
		paramMap.put("start", page.getOffset());
		paramMap.put("size", page.getPageSize());
		
		List<QuestionVO> list = Lists.newArrayList();
		
		list = this.query(sql.toString(), paramMap, QuestionVO.class);
		
		
		
		return list;
	}
	public List<QuestionVO> listMyRemindQuestion(String domain, String uid, Pageable page) {
		String sql = "select invite.model as invitemodel,invite.id  as inviteid , invite.authorid as invite_fromuid,invite.uname as invite_uname,invite.timestamp as invitetime,question.*  from  base_invite invite  inner JOIN " +
				" base_question question on question.id = invite.rid where invite.authorid=:uid and invite.model=:model and question.domain =:domain order by invite.timestamp desc  LIMIT :start,:size ";
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("uid",uid );
		paramMap.put("model","q_invite" );
		paramMap.put("domain", domain);
		paramMap.put("start", page.getOffset());
		paramMap.put("size", page.getPageSize());
		
		List<QuestionVO> list = Lists.newArrayList();
		
		list = this.query(sql.toString(), paramMap, QuestionVO.class);
		
		
		
		return list;
	}
	
	
	public List<QuestionVO> listMyAnswer(String domain, String uid, Pageable page) {
		String sql = "select question.*  from  base_question  question  inner JOIN " +
				" base_answer  answer on question.id = answer.question_id where answer.author_id=:uid  and  question.domain =:domain order by question.dateCreated desc  LIMIT :start,:size ";
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("uid",uid );
		paramMap.put("domain", domain);
		paramMap.put("start", page.getOffset());
		paramMap.put("size", page.getPageSize());
		
		List<QuestionVO> list = Lists.newArrayList();
		
		list = this.query(sql.toString(), paramMap, QuestionVO.class);
		
		
		
		return list;
	}
	
	
	public long countListRemindQuestion(String domain, String uid, String model) {
		String sql = "select count(*) as total  from  base_invite invite  inner JOIN base_question question on question.id = invite.rid where invite.uid=:uid and invite.model=:model and question.domain =:domain";
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("uid",uid );
		paramMap.put("model",model );
		paramMap.put("domain", domain);
		return this.count(sql, paramMap);
	}
	public long countMyInvite(String domain, String uid, String model) {
		String sql = "select count(*) as total  from  base_invite invite  inner JOIN base_question question on question.id = invite.rid where invite.authorid=:uid and invite.model=:model and question.domain =:domain";
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("uid",uid );
		paramMap.put("model",model );
		paramMap.put("domain", domain);
		return this.count(sql, paramMap);
	}
	
	public long countListMyAnswer(String domain, String uid) {
		String sql = "select count(*) as total  from  base_question question  inner JOIN base_answer answer on question.id = answer.question_id where answer.author_id=:uid and  answer.domain =:domain";
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("uid",uid );
		paramMap.put("domain", domain);
		return this.count(sql, paramMap);
	}
	
	public long countBestAnswer(String domain, String uid){
		String sql = "select count(*) as total  from  base_question question  inner JOIN base_answer answer on question.id = answer.question_id where answer.author_id=:uid and  answer.domain =:domain and answer.is_best_answer=:is_best";
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("uid",uid );
		paramMap.put("domain", domain);
		paramMap.put("is_best", 1);
		return this.count(sql, paramMap);
	} 
	
	public NoticeVisitTimelineEntity getNoticeVisitTimeline(String uid, String model) {
		String sql = "select * from base_notice_visit_timeline  where uid=:uid and model=:model order by timestamp desc ";
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("uid", uid);
		paramMap.put("model", model);
		List<NoticeVisitTimelineEntity> list = this.query(sql, paramMap, NoticeVisitTimelineEntity.class);
		if (CollectionUtils.isNotEmpty(list)) {
			return list.get(0);
		}
		
		return null;
	}
	

	public void insertNoticeVisitTimeline(NoticeVisitTimelineEntity entity) {
		
		String sql = "insert into base_notice_visit_timeline (id,uid,model,timestamp,resourcetype) value (:id,:uid,:model,:timestamp,:resourcetype)";
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("id", entity.getId());
		paramMap.put("uid", entity.getUid());
		paramMap.put("model", entity.getModel());
		paramMap.put("timestamp", entity.getTimestamp());
		paramMap.put("resourcetype", entity.getResourcetype());
		this.update(sql, paramMap);
		
	}

	public int updateNoticeVisitTimeline(NoticeVisitTimelineEntity entity) {
		String sql = "update base_notice_visit_timeline set timestamp =:timestamp where id=:id ";
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("timestamp", entity.getTimestamp());
		paramMap.put("id", entity.getId());
		return this.update(sql, paramMap);
		
	}
	
	
	public void updateInvitaRead(String id) {
        String sql = "update base_invite set isread =1,read_time=:time where id=:id ";
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("id", id);
        paramMap.put("time", System.currentTimeMillis());
        this.update(sql, paramMap);
        
    }
	public void updateInvitaRead(String model,String uid) {
        String sql = "update base_invite set isread =1,read_time=:time where uid=:uid and model=:model ";
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("uid", uid);
        paramMap.put("model",model);
        paramMap.put("time", System.currentTimeMillis());
        this.update(sql, paramMap);
        
    }
	
	
	
	public int updateNoticeVisitTimeline(String uid,String model,String resourceType) {
        String sql = "update base_notice_visit_timeline set timestamp=:timestamp where uid=:uid and model=:model ";
        Map<String, Object> paramMap = new HashMap<String, Object>();
        if(StringUtils.isNotBlank(resourceType)){
        	sql = sql +" and resourcetype=:resourcetype";
        	paramMap.put("resourcetype", resourceType);
        }
        
        paramMap.put("uid", uid);
        paramMap.put("model", model);
        paramMap.put("timestamp", System.currentTimeMillis());
       
        return this.update(sql, paramMap);
        
    }
	
	

	public long getcommenttotal(Integer restype, String domain, String uid) {
		StringBuilder sql=new StringBuilder();
		//话题
		if(restype==2){
			sql.append("select count(*) as total from base_comment c left join ixin_student_topic t on c.resid=t.id");	
		}else if(restype==1){//课程
			sql.append("select count(*) as total from base_comment c left join study_course t on c.resid=t.id");
		}else if(restype==3){
			sql.append("select count(*) as total from base_comment c left join base_answer t on c.resid=t.id");
		}
		
		sql.append(" where c.restype=:restype and c.domain=:domain and c.uid=:uid");
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("restype", restype);
		paramMap.put("domain", domain);
		paramMap.put("uid", uid);
		long sum = 0;
		sum = this.count(sql.toString(), paramMap);
		
		return sum;
	
	}

	public List<CommentStudentVo> getcommentlist(String domain, Pageable page, Integer restype, String uid) {
		 StringBuilder sql=new StringBuilder();
			//话题
				if(restype==2){
					sql.append("select c.*,t.content as content from base_comment c left join ixin_student_topic t on c.resid=t.id");	
				}else if(restype==1){//课程
					sql.append("select c.*,t.name as content from base_comment c left join study_course t on c.resid=t.id");
				}else if(restype==3){
					sql.append("select c.*,t.content as content from base_comment c left join base_answer t on c.resid=t.id");
				}
				
				sql.append(" where c.restype=:restype and c.domain=:domain and c.uid=:uid");
				
				sql.append(" order by createtime desc limit :start,:end");
				
				Map<String, Object> paramMap = new HashMap<String, Object>();
				paramMap.put("restype", restype);
				paramMap.put("domain", domain);
				paramMap.put("uid", uid);
				paramMap.put("start", page.getOffset());
				paramMap.put("end", page.getPageSize());
				
				return this.query(sql.toString(), paramMap, CommentStudentVo.class);
				
	}
	
	
	

	public List<Map<String, Object>> countCourseVisitRand(String domain, int top) {
		String sql = "select course.*,t.count as sum from study_course course inner join (select rid,sum(value) as count from report_visit_statistics trace  where trace.model='course_detail_pv' and trace.domain =:domain GROUP BY trace.rid ) t on course.id = t.rid where course.isdel = 0 ORDER BY t.count desc LIMIT 0,:top ";
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("domain", domain);
		paramMap.put("top", top);
		List<Map<String, Object>> list= this.query(sql, paramMap);
		return list;
	}
	
	public List<UserFriendVO> listUserFriends(String uid,String name){

		boolean isLikeName = StringUtils.isNotBlank(name);
		
		StringBuilder sql = new StringBuilder("SELECT u.* , f.relation relation ,f.gid gid, f.timestamp timestamp FROM  iapp_base_user u LEFT JOIN sns_friend f ON f.frienduid = u.id WHERE  f.uid=:uid AND u.isdel=0 ");
		
		if(isLikeName){
			sql.append(" AND u.name like :name ");
		}
		
		sql.append(" order by f.timestamp desc");
		
		Map<String, Object> paramMap = new HashMap<String, Object>(2);
		paramMap.put("uid", uid);
		if(isLikeName){
			paramMap.put("name", String.format("%%%s%%", name.trim()));
		}
		
		return this.query(sql.toString(), paramMap, UserFriendVO.class);
	}
	
	public boolean isMyFriends(String uid ,String frienduid){
		String	sql="select count(*) from sns_friend where uid=:uid and frienduid=:frienduid";
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("uid", uid);
		paramMap.put("frienduid", frienduid);
		long i  = this.count(sql, paramMap);
		
			return i>0;
	}
	
	
	public void  addFriends(String uid ,String frienduid){
		String	sql="update sns_friend set relation=1 where uid=:uid and frienduid=:frienduid";
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("uid", uid);
		paramMap.put("frienduid", frienduid);
		this.update(sql, paramMap);
		
			
	}
	
	public void updatefriendrelation(String uid,String frienduid){
			String sql = "update sns_friend set relation = 0 where uid=:uid and frienduid=:frienduid";
			Map<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("uid", uid);
			paramMap.put("frienduid", frienduid);
			this.update(sql, paramMap);
		}
	
	public List<String> listQuestionidsByUid(String uid,String domain){
		StringBuilder sql = new StringBuilder();
		sql.append("select tag.* from base_questiontags tag  INNER JOIN sns_user_fun_tag  funtag WHERE tag.tagsid = funtag.tagid and funtag.uid:uid ");
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("uid", uid);
		paramMap.put("domain", domain);
		List<QuestionTags> list = this.query(sql.toString(), paramMap, QuestionTags.class);
		List<String> l = Lists.newArrayList();
		for (QuestionTags entity : list) {
			l.add(entity.getQuestionid());
		}
		return l;
	}
	

	
	
	public static void main(String[] args) {
		
		System.out.println(String.format("%%%s%%", 1));
	}

	
	  
    public ResultSet<QuestionEntity> listQuestionsInTag(String tagId,String domain,Pageable page){
        
        StringBuffer sql_where = new StringBuffer();
        sql_where.append(" from  base_question q inner JOIN base_questiontags qt on qt.questionid=q.id where qt.tagsid=:tagId  and q.domain=:domain ");
        
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("tagId", tagId);
        paramMap.put("domain", domain);
        paramMap.put("start", page.getOffset());
        paramMap.put("size", page.getPageSize());
        
        
        String count_sql = String.format("select count(q.id) %s ", sql_where.toString());
        
        long count = this.count(count_sql, paramMap);
        if(count<1){
            return new ResultSet<QuestionEntity>(null, page, 0);
        }
        
        String sql = String.format("select q.* %s order by q.dateCreated desc  LIMIT :start,:size ", sql_where.toString());
        
        List<QuestionEntity> list  = this.query(sql, paramMap,QuestionEntity.class);
        return new ResultSet<QuestionEntity>(list, page, count);
    }
    
	public List<CourseTopVo> listCourseTopVoTop5(String domain,int top){
		StringBuffer sql = new StringBuffer();
		sql.append("select DISTINCT c.*,p.total as top from study_course  c  INNER JOIN base_praise p  where p.resid=c.id AND p.restype=1 and p.type=0 and p.domain=:domain and c.domainid=:domain and c.isdel=0 ORDER BY p.total DESC LIMIT :top");
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("domain", domain);
		paramMap.put("top", top);
		List<CourseTopVo> list = this.query(sql.toString(), paramMap, CourseTopVo.class);
		return list;
	}
	
	public NoticeVisitTimelineEntity getNoticeVisitTimeline(String uid, String model,String resourcetype) {
		String sql = "select * from base_notice_visit_timeline  where uid=:uid and model=:model ";
		Map<String, Object> paramMap = new HashMap<String, Object>();
		if(StringUtils.isNotBlank(resourcetype)){
			sql = sql +" and resourcetype=:resourcetype";
			paramMap.put("resourcetype", resourcetype);
		}
		
		paramMap.put("uid", uid);
		paramMap.put("model", model);
		
		List<NoticeVisitTimelineEntity> list = this.query(sql, paramMap, NoticeVisitTimelineEntity.class);
		if (CollectionUtils.isNotEmpty(list)) {
			return list.get(0);
		}
		
		return null;
	}


	// 部门oid 下用户所创建的提问 （不包括子部门）
	public ResultSet<QuestionEntity> listQuestionsInOrg(String oid,String domain,Pageable page){

		StringBuffer sql_where = new StringBuffer();
		sql_where.append(" from  base_question q inner JOIN iapp_base_user u  on u.id=q.author_id where u.oid=:oid  and u.isdel=0 and q.domain=:domain ");

		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("oid", oid);
		paramMap.put("domain", domain);
		paramMap.put("start", page.getOffset());
		paramMap.put("size", page.getPageSize());


		String count_sql = String.format("select count(q.id) %s ", sql_where.toString());

		long count = this.count(count_sql, paramMap);
		if(count<1){
			return new ResultSet<QuestionEntity>(null, page, 0);
		}

		String sql = String.format("select q.* %s order by q.dateCreated desc  LIMIT :start,:size ", sql_where.toString());

		List<QuestionEntity> list  = this.query(sql, paramMap,QuestionEntity.class);
		return new ResultSet<QuestionEntity>(list, page, count);
	}
	
	public int deleteCollection(String resid,String uid,int restype) {
		String sql = "DELETE FROM sns_favorites WHERE resid=:resid AND uid=:uid AND restype=:restype";
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("resid", resid);
		paramMap.put("uid", uid);
		paramMap.put("restype", restype);
		return this.update(sql, paramMap);
		
	}

	/**
	 * 获取我参加的调研
	 * @author yangwenkui
	 * @time 2016年6月8日 下午10:50:01
	 * @param domain
	 * @param uid
	 * @param voteId
	 * @param page
	 * @return
	 */
	public ResultSet<VoteActivityEntity> getMyAttendVote(String domain, String uid, Pageable page) {
		StringBuffer sql_where = new StringBuffer();
		sql_where.append(" from ixin_vote_activity where del=:del and domain=:domain and id in( ");
		sql_where.append(" select activityId from ixin_user_vote where base_uid=:userId ");
		sql_where.append(" )");
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("domain", domain);
		paramMap.put("del", VoteEntity.ISDEL_NO);
		paramMap.put("userId", uid);


		String count_sql = String.format("select count(id) %s ", sql_where.toString());

		long count = this.count(count_sql, paramMap);
		if(count<1){
			return new ResultSet<VoteActivityEntity>(null, page, 0);
		}

		String sql = String.format("select * %s order by createTime desc  LIMIT :start,:size ", sql_where.toString());
		paramMap.put("start", page.getOffset());
		paramMap.put("size", page.getPageSize());
		List<VoteActivityEntity> list  = this.query(sql, paramMap,VoteActivityEntity.class);
		return new ResultSet<VoteActivityEntity>(list, page, count);
	}

	/**
	 * 更新题目的参与者数量
	 * @author yangwenkui
	 * @time 2016年6月25日 下午10:49:05
	 * @param activityId
	 * @param questionIds
	 */
	public void updateVoteQuestionNum(String activityId, List<String> questionIds) {
		if(CollectionUtils.isEmpty(questionIds)){
			return ;
		}
		String sql = "update ixin_vote_statistics_question set voteNum = voteNum+1 where voteactivityid=:voteactivityid and questionid in (:ids)";
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("voteactivityid", activityId);
		paramMap.put("ids", questionIds);
		this.update(sql, paramMap);
	}

	/**
	 * 更新题目选项的选择数量
	 * @author yangwenkui
	 * @time 2016年6月25日 下午10:53:44
	 * @param activityId
	 * @param options
	 */
	public void updateVoteOptionNum(String activityId, List<String> options) {
		if(CollectionUtils.isEmpty(options)){
			return ;
		}
		String sql = "update ixin_vote_statistics_option set voteNum = voteNum+1 where voteactivityid=:voteactivityid and optionid in (:ids)";
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("voteactivityid", activityId);
		paramMap.put("ids", options);
		this.update(sql, paramMap);
	}

	/**
	 * 更新调研活动参与人数
	 * @author yangwenkui
	 * @time 2016年6月28日 下午10:36:01
	 * @param activityId
	 */
	public void updateActivityVoteNum(String activityId) {
		String sql = "update ixin_vote_activity set voteNum = voteNum+1 where id=:id";
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("id", activityId);
		this.update(sql, paramMap);
	}

	/**
	 * @author yangwenkui
	 * @time 2016年6月30日 下午10:12:33
	 * @param rid
	 * @param domain
	 */
	public void deleteLabelRelationByRidAndDomain(String rid, String domain) {
		String sql = "delete from base_label_relation where rid=:rid and domain=:domain";
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("rid", rid);
		paramMap.put("domain", domain);
		this.update(sql, paramMap);
	}
}
