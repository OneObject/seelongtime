<%@page import="org.apache.commons.lang3.math.NumberUtils"%>
<%@page import="com.longtime.app.admin.course.service.remote.RemotePlayerService"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Map"%>
<%@page import="org.springframework.jdbc.core.RowMapper"%>
<%@page import="org.springframework.jdbc.core.JdbcTemplate"%>
<%@page import="com.longtime.common.spring.SpringContextUtil"%>
<%@page contentType="text/html; charset=utf-8" %>
<%!

public void doSync(){
	JdbcTemplate jdbcTemplate  = (JdbcTemplate)SpringContextUtil.getBean("ixin_jdbcTemplate");
	
	RemotePlayerService remotePlayerService = (RemotePlayerService)SpringContextUtil.getBean("remotePlayerService");

	String sql = "SELECT count(*) FROM `study_course_trace`";
	long count = jdbcTemplate.queryForLong(sql);
	
	int size = 5000;
	int pageSize = (int)( (count+size-1)/size);//  一次5k

	String uid =null;
	String cid = null;
	String id = null;
	String type = null;
	int sec = 0;
	for(int i=1;i<=pageSize;i++){
		
		List<Map> list = jdbcTemplate.query(String.format("SELECT t.id id, t.user_id uid, t.course_id cid, c.restype type FROM study_course_trace t  left join  study_course c on c.id=t.course_id order by t.start_date asc limit %s,%s ",(i-1)*size, size),new RowMapper<Map>(){
			public Map mapRow(ResultSet rs, int rowNum) throws SQLException{
				Map<String ,String> item  = new HashMap();
				item.put("id", rs.getString("id"));
				item.put("uid", rs.getString("uid"));
				item.put("cid", rs.getString("cid"));
				item.put("type", rs.getString("type"));
				return item;
			}
		});
		
		
		if(null==list || list.isEmpty()){
			continue;
		}
		
		
		for(Map item:list){
			id  = (String)item.get("id");
			uid = (String)item.get("uid");
			cid = (String)item.get("cid");
			type = (String)item.get("type");
			
			boolean isScorm = "1".equals(type);
			
			
			// 获取计时信息
			
			Map<String, String> map =remotePlayerService.getCourseInfo(cid, NumberUtils.toInt(type), uid);
			
			sec = NumberUtils.toInt(map.get("sec"));
			String lesson_status = null;
			if(isScorm){
				lesson_status = map.get("lesson_status");
			}
			
			
			System.out.println(String.format("update study_course_trace set total_time_sec=%s  where id=%s",sec,id));
			
			
			
		}
		
		
	}
	
	
	

}	

%>
<%
doSync();
%>
<!DOCTYPE html>
<html lang="en" id="top" class="no-js">
<head>
<meta charset="utf-8">
<title>sync all cource trace</title>
</head>
<body>



</body>
</html>