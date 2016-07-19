package com.longtime.ajy.filter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.BooleanUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.longtime.ajy.common.track.model.UserTrackEntity;
import com.longtime.ajy.common.track.model.UserTrackModel;
import com.longtime.ajy.common.track.task.UserTrackTask;
import com.longtime.ajy.mweb.MwebHelper;
import com.longtime.ajy.session.SessionHelper;
import com.longtime.ajy.student.utils.WebUtil;
import com.longtime.ajy.support.HttpServletHelper;


public class UserTrackFilter implements Filter{
	
	private static Logger logger = LoggerFactory.getLogger(UserTrackFilter.class);
	
	private static boolean ISTRACK = false;
	
	private static List<ModelRole> modelRoleList = new ArrayList<ModelRole>();
	static{
		//http://localhost:8080/student/m/ixin/fodder/detail.xhtml?id=ae8d0ed512a947389db6f84a54a8feb7
		// 课程学习
		modelRoleList.add(new ModelRole("course","/m/study/detail/(\\w+).xhtml","/study/toStudy.xhtml\\?cid=(\\w+)&?"));
		modelRoleList.add(new ModelRole("fodder","/m/ixin/fodder/detail.xhtml\\?id=(\\w+)&?"));
		modelRoleList.add(new ModelRole("survey","/m/ixin/nsurvey/index.xhtml\\?.*voteId=(\\w+)&?"));
		modelRoleList.add(new ModelRole("activity","/m/ixin/activity/detaildispatch.xhtml\\?id=(\\w+)&?","/m/ixin/activity/.*activity.xhtml\\?id=(\\w+)&?"));
		
		//question
		modelRoleList.add(new ModelRole("question","/m/ext/enn/ask/detail.xhtml\\?id=(\\w+)&?","/m/h5/nask/detail.xhtml\\?id=(\\w+)&?"));
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		logger.debug("user track filter init~~~~~~~~~~~~");
		String isTrack = filterConfig.getInitParameter("isTrack");
		if(StringUtils.isNotBlank(isTrack)){
			ISTRACK = BooleanUtils.toBoolean(isTrack);
		}
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		String sessionid = req.getSession().getId();
	    try {
			chain.doFilter(request, response);
		} catch (Exception e) {
			logger.error("system error",e);
		}
		if(ISTRACK){
			String url = HttpServletHelper.getCurrentUrl(req);
			String uid = SessionHelper.getCurrentUid();
			String openId = MwebHelper.getCurrentOpenId();
			long time = System.currentTimeMillis();
			String domain = SessionHelper.getCurrentDomain();
			if (StringUtils.isBlank(domain)) {
				return;
			}
			String User_Agent = ((HttpServletRequest) request).getHeader("User-Agent");
			String ip = WebUtil.getRemortIP(req);
			String request_method = StringUtils.lowerCase(req.getMethod());
			UserTrackModel userTrackModel =new UserTrackModel(uid,openId,domain,url,time,User_Agent,ip,request_method,sessionid);
			proccessModelRole(userTrackModel);
			userTrackModel.setDevice(WebUtil.isMoblie(User_Agent)?UserTrackEntity.CODE_MOBILE:UserTrackEntity.CODE_PC);
			UserTrackTask.save(userTrackModel);
			
			// 内容访问量统计到mysql
//			countVisitDetail(userTrackModel);
		}
	}


	@Override
	public void destroy() {
		logger.debug("user track filter destroy~~~~~~~~~~~~");
	}
	/**
	 * 访问量明细统计
	 * @param userTrackModel
	 */
	
//	private void countVisitDetail(UserTrackModel userTrackModel) {
//		if (StringUtils.isBlank(userTrackModel.getModel())) {
//			return;
//		}
//		ReportVisitEntity entity = ReportVisitEntity.Builder.build(userTrackModel);
//		ReportVisitTask.save(entity);
//	}
	
	static class ModelRole{
		String name;
		String[] pattern;
		public ModelRole(String name,String... pattern){
			this.name =  name;
			this.pattern = pattern;
		}
	}
	
	private void proccessModelRole(UserTrackModel  userTrace){
		
		if(null==userTrace || modelRoleList.isEmpty()){
			return;
		}
		String url = userTrace.getUrl();
		for (ModelRole modelRole : modelRoleList) {
			for(String pattern:modelRole.pattern){
				 Pattern p = Pattern.compile( pattern);
		         Matcher m = p.matcher(url);
		         if (m.find()) {
		        	 try{
		             String rid = m.group(1);
		             userTrace.setRid(rid);
		        	 }catch(Exception e){
		        		 
		        	 }
		             userTrace.setModel(modelRole.name);
		         }
			}
		}
		
		
		
	}
	
//	private long getToDay() {
//		String dateStr = DateUtils.longToString(System.currentTimeMillis());
//		DateUtils.getTodayStartTime();
//		System.err.println();
//		return DateUtils.parseStringToLong(dateStr);
//	}
	
	
	
	
	public static void main(String[] args) {
		String url = "http://demo.aijiayou.com/student/m/study/detail/ff8080814bee0dd2014bee107db50001.xhtml?fdomain=ajy&v=0.7827831853868165";
		url="http://demo.aijiayou.com/student/m/ixin/fodder/detail.xhtml?id=659eb41c7f4341c587d3e0d506be34bb&fdomain=ajy";
		for (ModelRole modelRole : modelRoleList) {
			for(String pattern:modelRole.pattern){
				 Pattern p = Pattern.compile( pattern);
		         Matcher m = p.matcher(url);
		         if (m.find()) {
		        	 try{
		             String rid = m.group(1);
		             System.err.println(rid);
		            // userTrace.setRid(rid);
		        	 }catch(Exception e){
		        		 
		        	 }
		        	 System.err.println(modelRole.name);
		             //userTrace.setModel(modelRole.name);
		         }
			}
		}
	}

}
