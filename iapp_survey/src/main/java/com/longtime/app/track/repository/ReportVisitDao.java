package com.longtime.app.track.repository;

import java.util.List;
import java.util.Map;

import com.longtime.app.track.model.ReportVisitEntity;
import com.longtime.common.dao.BaseDAO;
import com.longtime.common.utils.Page;

public interface ReportVisitDao extends BaseDAO<ReportVisitEntity, String>{

	List<Map<String, Object>> countCourseDetail(String domain, long start, long end);
	
	List<Map<String, Object>> countSurveyOrVoteDetail(String domain, long start, long end);

	List<Map<String, Object>> countFodderDetail(String domain, long start, long end);

	List<ReportVisitEntity> listTopVisitNum(Long start, Long end, Page page, String domain, String model);

	List<Object> countCourseVisit(String domain);

}
