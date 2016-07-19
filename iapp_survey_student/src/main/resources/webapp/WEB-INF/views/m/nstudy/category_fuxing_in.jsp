<%@page import="com.longtime.ajy.support.SpringContextUtil"%>
<%@page import="com.longtime.ajy.student.service.UserService"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@page import="com.longtime.ajy.mweb.MwebHelper"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<%
 	Map<String,String> map = new HashMap<String,String>();

	map.put("a29614a7-0f29-4066-a848-e8ffbd8b5825","root");
	
	map.put("9260dc9e-ce10-4a01-92b5-97428cb08867","root_1");
	map.put("ca614068-1f56-4a6b-9951-eee273d8fb73","root_1");
	map.put("e56ea6bc-3991-4609-a687-139d56701b81","root_1_1");
	map.put("8715235a-83f7-45fe-8d39-77ad163d835e","root_1_2");
	
	map.put("06b5e906-5d92-4550-84c7-45d825c2e500","root_2");
	map.put("5b6e511d-502b-4c36-b4eb-9fbbe5867836","root_2");
	map.put("51f9209a-6d8c-450c-b9f3-3a338eb5e713","root_2_1");
	map.put("57b8e613-6d24-4de9-b98b-8819d0df95c6","root_2_2");
	
	map.put("4babb3d2-0a90-40f5-9671-4cc5c860edef","root_3");
	map.put("12a479c1-dbe5-4e1e-b15a-4e6d7f4885b6","root_3");
	map.put("399afe0e-5b36-4fa1-bd02-c82c21acb2c3","root_3_1");
	map.put("1b5b9257-0277-4c42-be71-2c7a0729b650","root_3_2");
	
	map.put("0c5400f7-acf5-41a1-ab02-97da11b267b4","root_4");
	map.put("adc2bd4f-a6f9-418e-8c90-fc64721d2706","root_4");
	map.put("9a61295c-e4e9-4383-b489-de0e54145d82","root_4_1");
	map.put("05874c16-7bd8-44ba-8f6c-6bdad991dd36","root_4_2");
	
%>
<%  
	String uid = MwebHelper.getCurrentUid();

	UserService userService=(UserService) SpringContextUtil.getBean("userService");
	String jobId = userService.getJobLevel(uid);
	
	String cid = map.get(jobId);
	
	if(StringUtils.isBlank(cid)){
		cid = "-1";
	}
	
	response.sendRedirect(request.getContextPath() +"/m/nstudy/category_fuxing.xhtml?id="+cid);
   	
%>

