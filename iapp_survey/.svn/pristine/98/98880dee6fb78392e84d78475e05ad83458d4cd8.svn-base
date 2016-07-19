/**
 * project : lms_portal_admin
 * user created : songsp
 * date created : 2013-3-28 - 下午3:44:53
 */
package com.longtime.common.web.utils;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;

import com.longtime.common.utils.LoginSessionHelper;


/**
 * @since 2013-3-28
 * @author songsp
 */
public class SystemUtil {

	/**
	 * 判断用户是否具备操作某个资源得权限, 从数据库中读取
	 * 
	 * @param request
	 * @param id 0 id 1 名称 2
	 * @return
	 */
	public static boolean isAccess(HttpServletRequest request, String id) {
	    /**
	     * 开发中，下面注释的代码为正确代码
	     */
	    if(true){
	        return true;
	    }
	    
	    
	    
		if (StringUtils.isBlank(id)) {
			return true;
		}
		
		
		if(id.equals("null")){
		    return true;
		}
		
		//判断用户类型，如果为type 为1 2 返回ture
		
		
		List<String> acl = LoginSessionHelper.getCurrentUserAcl(request);
		if(null == acl){
		    return false;
		}
		for (String rid : acl) {
		    if(StringUtils.isBlank(rid)){
		        return false;
		    }
			if (rid.equals(id)) {
				return true;
			}
		}
		return false;

	}

}
