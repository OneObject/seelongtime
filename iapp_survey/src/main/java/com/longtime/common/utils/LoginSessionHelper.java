package com.longtime.common.utils;

import com.longtime.app.base.controller.vo.PermissionShort;
import com.longtime.app.base.model.Organization;
import com.longtime.app.base.model.Tenant;
import com.longtime.app.base.model.User;
import java.util.Collections;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.lang.StringUtils;

public class LoginSessionHelper {
	public final static String USER = "user";
	public final static String USER_ID = "userId";
	public final static String USERNAME = "username";

	public final static String PERMISSION_URL_LIST = "permissionUrlList";
	public final static String USER_PERMISSION_SHORT_MAP = "userPermissionShortMap";
	public final static String SEESION_GLOBAL_ACL = "session_global_acl";

	public static final String SEESION_USER = "session_user";
	public static final String SEESION_DOMAIN = "session_domain";
	public static final String SEESION_USER_ORG = "session_user_org";
	public static final String SEESION_USER_ACL = "session_user_acl";
	public static final String SEESION_USER_ROLES = "session_user_roles";

	public static final String SEESION_UID = "uid";
	
	
	private static final ThreadLocal<User> tl_user = new InheritableThreadLocal<User>();
	   
	
	public static String getThreadLocalUid() {
		User user = tl_user.get();
		return null!=user?user.getId():null;
	}
	public static String getThreadLocalUname() {
		User user = tl_user.get();
		return null!=user?user.getName():null;
	}
	public static void setThreadLocalUserInfo(User user) {
		tl_user.set(user);
	}

	public static void clearThreadLocalUserInfo() {
		tl_user.remove();
	}
	public static boolean isLogin(HttpServletRequest request) {
		User user = getCurrentUser(request);
		return (null != user && StringUtils.isNotBlank(user.getId()));
	}

	/**
	 * 获得全局权限
	 * 
	 * @param request
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static List<PermissionShort> getGlobalAcl(HttpServletRequest request) {
		HttpSession session = request.getSession(false);

		if (null == session)
			return null;

		return (List<PermissionShort>) session.getAttribute(SEESION_GLOBAL_ACL);
	}

	/**
	 * 设置全局权限
	 * 
	 * @param request
	 * @return
	 */
	public static void putGlobalAcl(HttpServletRequest request, List<PermissionShort> globalAclList) {
		if (null == request) {
			return;
		}
		HttpSession session = request.getSession();
		session.setAttribute(SEESION_GLOBAL_ACL, globalAclList);
	}

	public static User getCurrentUser(HttpServletRequest request) {
		HttpSession session = request.getSession(false);

		if (null == session)
			return null;

		return (User) session.getAttribute(SEESION_USER);
	}

	public static String getCurrentUserId(HttpServletRequest request) {

		User user = getCurrentUser(request);
		return (null == user) ? null : user.getId();
	}
	public static int getCurrentUserType(HttpServletRequest request) {
		
		User user = getCurrentUser(request);
		
		return (null == user) ? 0 : user.getType();
	}
	
	public static boolean getCurrentUserIsSuperManager(HttpServletRequest request) {
		
		User user = getCurrentUser(request);
		
		return (null == user) ? false : user.isSuperMgr();
	}

	public static String getCurrentUserName(HttpServletRequest request) {

		User user = getCurrentUser(request);
		return (null == user) ? "游客" : user.getName();
	}

	public static Organization getCurrentUserOrg(HttpServletRequest request) {
		HttpSession session = request.getSession(false);

		if (null == session)
			return null;

		return (Organization) session.getAttribute(SEESION_USER_ORG);
	}

	public static String getCurrentUserOrgId(HttpServletRequest request) {
		Organization org = getCurrentUserOrg(request);

		return (null == org) ? null : org.getId();

	}

	public static String getCurrentUserOrgName(HttpServletRequest request) {
		Organization org = getCurrentUserOrg(request);

		return (null == org) ? null : org.getName();

	}
	
	
	public static void removeSession(HttpServletRequest request,HttpServletResponse reponse){
		request.getSession().invalidate();
	}

	public static void putCurrentUser(HttpServletRequest request, User user) {
		if (null == user || null == request) {
			return;
		}
		HttpSession session = request.getSession();
		session.setAttribute(SEESION_USER, user);

		request.getSession().setAttribute(SEESION_UID, user.getId());

	}

	public static void putCurrentUserOrg(HttpServletRequest request, Organization org) {
		if (null == org || null == request) {
			return;
		}
		HttpSession session = request.getSession();
		session.setAttribute(SEESION_USER_ORG, org);

	}

	@SuppressWarnings("unchecked")
	public static List<String> getCurrentUserAcl(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if (null == session)
			return Collections.EMPTY_LIST;
		return (List<String>) session.getAttribute(SEESION_USER_ACL);
	}

	public static void putCurrentUserAcl(HttpServletRequest request, List<String> acl) {
		if (null == request) {
			return;
		}
		HttpSession session = request.getSession();
		session.setAttribute(SEESION_USER_ACL, acl);
	}

	public static void putCurrentUserRole(HttpServletRequest request, List<String> roleIds) {
		if (null == request) {
			return;
		}
		HttpSession session = request.getSession();
		session.setAttribute(SEESION_USER_ROLES, roleIds);
	}

	@SuppressWarnings("unchecked")
	public static List<String> getCurrentUserRole(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if (null == session)
			return Collections.EMPTY_LIST;
		return (List<String>) session.getAttribute(SEESION_USER_ROLES);
	}

	public static boolean hasRole(HttpServletRequest request, String roleId) {

		List<String> roleIds = getCurrentUserRole(request);

		if (null == roleIds)
			return false;
		for (String role : roleIds) {
			if (role.equals(roleId)) {
				return true;
			}
		}
		return false;
	}

	public static boolean hasRole(HttpServletRequest request, List<String> roleIds) {

		List<String> userRoleIds = getCurrentUserRole(request);
		if (null == userRoleIds) {
			return false;
		}

		for (String rid : userRoleIds) {
			if (roleIds.contains(rid)) {
				return true;
			}
		}
		return false;
	}
	
	public static Tenant getCurrentTenant(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if (null == session)
			return null;
		Tenant tenant =  (Tenant) session.getAttribute(SEESION_DOMAIN);
		
		return tenant;
	}
	
	public static String getCurrentDomainLogo(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if (null == session)
			return null;
		Tenant tenant =  (Tenant) session.getAttribute(SEESION_DOMAIN);
		
		return tenant==null ? "" :tenant.getLogo();
	}

	public static String getCurrentDomain(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if (null == session)
			return null;
		Tenant tenant =  (Tenant) session.getAttribute(SEESION_DOMAIN);
		
		return tenant==null ? "" :tenant.getId();
	}
	
	public static String getCurrentDomainName(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if (null == session)
			return null;
		Tenant tenant =  (Tenant) session.getAttribute(SEESION_DOMAIN);
		
		return tenant==null ? "" :tenant.getName();
	}
	
	public static void putCurrentDomain(HttpServletRequest request,Tenant tenant){
		request.getSession().setAttribute(SEESION_DOMAIN, tenant);
	}

}
