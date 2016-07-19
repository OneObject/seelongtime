package com.longtime.app.base.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.googlecode.genericdao.search.Filter;
import com.longtime.app.base.model.Role;
import com.longtime.app.base.model.User;
import com.longtime.app.base.model.UserRole;
import com.longtime.app.base.service.RoleService;
import com.longtime.app.base.service.UserRoleService;
import com.longtime.app.base.service.UserService;
import com.longtime.app.util.PageUtil;
import com.longtime.common.utils.HtmlUtils;
import com.longtime.common.utils.LoginSessionHelper;
import com.longtime.common.utils.Page;
import com.longtime.common.utils.QueryCondition;
import com.longtime.common.utils.QueryFilter;
import com.longtime.common.utils.ResultSet;
import com.longtime.common.utils.Sort;

@Controller
@RequestMapping("/base/admin/user_role")
public class UserRoleController {
	
	@Resource
	private UserRoleService userRoleService;
	
	@Resource
	private UserService userService;
	
	@Resource
	private RoleService roleService;
	
	@RequestMapping("/roleuser")
	public String List(HttpServletRequest request,ModelMap model){
		String roleId = request.getParameter("roleId");
		Role role = roleService.get(roleId);
		
		model.put("role", role);
		return "base/admin/role/roleuser";
	}
	
	
	/**
	 * 角色下用户列表
	 * @param request
	 * @param model
	 */
	@RequestMapping("/listbyrole")
	public String listPage(HttpServletRequest request,ModelMap model){
		String roleId = request.getParameter("roleId");
        String orderField = request.getParameter("orderField");
        String orderDirection = request.getParameter("orderDirection");

        if(StringUtils.isBlank(roleId)){
             return "base/admin/role/listbyrole";
        }
        
		Role role = roleService.get(roleId);
		
		Page page = PageUtil.getPage(request);
		 
		QueryCondition query = new QueryCondition();
		
		query.addFilter("roleId.id", roleId);
//		query.addFilter("isdel", 0);
//		query.addSort(new Sort("createDate", Sort.ORDER_ASC));
        if(StringUtils.isNotBlank(orderField) && StringUtils.isNotBlank(orderDirection)){
            model.put("orderField", orderField);
            model.put("orderDirection", orderDirection);
            if(orderDirection.equals("_asc")){
                query.addSort(new Sort(orderField, Sort.ORDER_ASC));
            }else{
                query.addSort(new Sort(orderField, Sort.ORDER_DES));
            }
        }else{
        }
		ResultSet<UserRole> res = userRoleService.list(query, page);
		
		 model.put("role", role); 
		 model.put("list", res.getItems());
		 model.put("pager", res.getPage());
		 
		 return "base/admin/role/listbyrole";
	}
	
	
	/**
	 * 选择用户列表
	 * @param request
	 * @param model
	 */
	@RequestMapping("/listforchooseuser")
	public String userlistPage(HttpServletRequest request,ModelMap model){
		QueryCondition queryuser = new QueryCondition();
		String userName = HtmlUtils.getAvailableString(request, "userName");
		String orgName = HtmlUtils.getAvailableString(request, "orgName");
		String roleId = request.getParameter("roleId");
		String userIds = request.getParameter("userIds");
        String orderField = request.getParameter("orderField");
        String orderDirection = request.getParameter("orderDirection");
		
	    List<String> userIdList = userRoleService.getUserIds(roleId);
		
		if(CollectionUtils.isNotEmpty(userIdList)){
		    queryuser.addFilter("id", userIdList, Filter.OP_NOT_IN);
		}
		if(StringUtils.isNotBlank(userName)){
			QueryFilter filter = new QueryFilter("username", "%"+userName+"%", Filter.OP_LIKE);
			queryuser.addFilter(filter);
		}
		if(StringUtils.isNotBlank(orgName)){
			QueryFilter filter = new QueryFilter("organization.name", "%"+orgName+"%", Filter.OP_LIKE);
			queryuser.addFilter(filter);
		}
		queryuser.addFilter("isDel", 0);
		queryuser.addFilter("domain", LoginSessionHelper.getCurrentDomain(request));
		
        if(StringUtils.isNotBlank(orderField) && StringUtils.isNotBlank(orderDirection)){
            model.put("orderField", orderField);
            model.put("orderDirection", orderDirection);
            if(orderDirection.equals("_asc")){
                queryuser.addSort(new Sort(orderField, Sort.ORDER_ASC));
            } else{
                queryuser.addSort(new Sort(orderField, Sort.ORDER_DES));
            }
        }else{
            queryuser.addSort(new Sort("createTime", Sort.ORDER_DES));
            model.put("orderField", "createTime");
            model.put("orderDirection", "_desc");
        }
		
		Page pageuser = PageUtil.getPage(request);
		
		ResultSet<User> resuser = userService.list(queryuser, pageuser);
		model.put("list", resuser.getItems());
		model.put("pager", resuser.getPage());
		model.put("userIds", userIds);
		
        return "base/admin/role/listforchooseuser";
	}
	

	@RequestMapping("/save")
	@ResponseBody
	public boolean save(HttpServletRequest request,ModelMap model){
		String roleId = request.getParameter("roleId");
		
		String ids = request.getParameter("ids");
		String[] userIds = ids.split(",");
		
		Role role = null;
		
		if(StringUtils.isNotBlank(roleId)){
			role = roleService.get(roleId);
		}
		else{
			return false;
		}
		if(role!=null){
			for(String userId : userIds){
				User user = userService.get(userId);
				if(user!=null){
					QueryCondition query = new QueryCondition();
					if(StringUtils.isNotBlank(roleId)){
						query.addFilter("roleId.id", roleId);
					}
					
					if(StringUtils.isNotBlank(user.getId())){
						query.addFilter("userId.id", user.getId());
					}
//					query.addFilter("isdel",0);
					ResultSet<UserRole> res = userRoleService.list(query);
					if(res.getItems().size()==0){
						UserRole userRole = new UserRole();
						userRole.setRoleId(role);
						userRole.setUserId(user);
						userRoleService.insert(userRole);
					}
				}
			}
			return true;
		}
		else{
			return false;
		}
		
	}
	
	
	@RequestMapping("/delete")
	@ResponseBody
	public boolean delete(HttpServletRequest request,ModelMap model){
		String userRoleId = request.getParameter("userRoleId");
		
		if(StringUtils.isNotBlank(userRoleId)){
//			UserRole userRole = userRoleService.get(userRoleId);
//			userRole.setIsdel(1);
//			userRoleService.update(userRole);
			userRoleService.deleteById(userRoleId);
			return true;
		}
		
		return false;
		
		
	}
	
	@RequestMapping("/remove")
	@ResponseBody
	public boolean remove(HttpServletRequest request,ModelMap model){
		String userRoleIds = request.getParameter("userRoleIds");
		
		String[] user_Ids = userRoleIds.split(",");
		
		for(String userId : user_Ids){
//			UserRole userRole = userRoleService.get(userId);
//			userRole.setIsdel(1);
//			userRoleService.update(userRole);
			userRoleService.deleteById(userId);
		}
		return true;
	}
	
	public UserRoleService getUserRoleService() {
		return userRoleService;
	}

	public void setUserRoleService(UserRoleService userRoleService) {
		this.userRoleService = userRoleService;
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public RoleService getRoleService() {
		return roleService;
	}

	public void setRoleService(RoleService roleService) {
		this.roleService = roleService;
	}
	
	
}
