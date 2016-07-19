package com.longtime.app.base.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


import com.longtime.app.base.model.Role;
import com.longtime.app.base.service.RoleService;
import com.longtime.app.base.service.UserRoleService;
import com.longtime.app.util.PageUtil;
import com.longtime.common.utils.HtmlUtils;
import com.longtime.common.utils.LoginSessionHelper;
import com.longtime.common.utils.Page;
import com.longtime.common.utils.QueryCondition;
import com.longtime.common.utils.ResultSet;
import com.longtime.common.utils.Sort;
import com.longtime.common.web.utils.SortCss;

@Controller
@RequestMapping("/base/admin/role")
public class RoleController {

	@Resource
	private RoleService roleService;
	
	@Resource
	private UserRoleService userRoleService;
	
	/**
	 * 列表
	 * @param request
	 * @param model
	 */
	@RequestMapping("role")
	public String list(HttpServletRequest request,ModelMap model){
		 return "base/admin/role/role";
	}
	
	/**
	 * 列表
	 * @param request
	 * @param model
	 */
	@RequestMapping(value="/list", method=RequestMethod.POST)
	public ModelMap listPage(HttpServletRequest request,ModelMap model){
		 Page page = PageUtil.getPage(request);
        String orderField = request.getParameter("orderField");
        String orderDirection = request.getParameter("orderDirection");
		 QueryCondition query = new QueryCondition();
		 query.addFilter("isdel", 0);
		 query.addFilter("domain", LoginSessionHelper.getCurrentDomain(request));
        if(StringUtils.isNotBlank(orderField) && StringUtils.isNotBlank(orderDirection)){
            model.put("orderField", orderField);
            model.put("orderDirection", orderDirection);
            if(orderDirection.equals(SortCss.ASC)){
                query.addSort(new Sort(orderField, Sort.ORDER_ASC));
            }else{
                query.addSort(new Sort(orderField, Sort.ORDER_DES));
            }
        }else{
            query.addSort(new Sort("createDate", Sort.ORDER_DES));
            model.put("orderField", "createDate");
            model.put("orderDirection", SortCss.DESC);
        }
		 ResultSet<Role> res = roleService.list(query, page);
	        
		 model.put("list", res.getItems());
		 model.put("pager", res.getPage());
		 
		 return model;
	}
	
	
	
	/**
	 * 插入角色
	 * @param request
	 * @param model
	 */
	@RequestMapping("/insert")
	@ResponseBody
	public boolean insert(HttpServletRequest request,ModelMap model){
//		String name = request.getParameter("name");
//		String remark = request.getParameter("remark");

        String name = HtmlUtils.getAvailableString(request, "name");
        String remark = HtmlUtils.getAvailableString(request, "remark");
//        for (int i = 30; i >0; i--) {
            Role role = new Role();
//            role.setName(i+name);
//            role.setRemark(i+remark);
            role.setName(name);
            role.setRemark(remark);
            role.setUpdateDate(System.currentTimeMillis());
            role.setCreateDate(System.currentTimeMillis());
            role.setDomain(LoginSessionHelper.getCurrentDomain(request));
            roleService.insert(role);
//        }
		return true;
	}
	
	/**
	 * 修改角色
	 * @param request
	 * @param model
	 */
	@RequestMapping("/update")
	@ResponseBody
	public boolean update(HttpServletRequest request,ModelMap model){
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String remark = request.getParameter("remark");
		if(StringUtils.isNotBlank(id)){
			Role role = roleService.get(id);
			role.setName(name);
			role.setRemark(remark);
			role.setUpdateDate(System.currentTimeMillis());
			roleService.update(role);
			return true;
		}
		return false;
		
	}
	
	/**
	 * 删除角色
	 * @param request
	 * @param model
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public boolean delete(HttpServletRequest request,ModelMap model){
		String id = request.getParameter("id");
		
	    Page page = PageUtil.getPage(request);
	    QueryCondition query = new QueryCondition();
	    if(StringUtils.isNotBlank(id)){
	    	query.addFilter("roleId.id", id);
	    }
	    query.addFilter("isdel", 0);
	    ResultSet<Role> res = userRoleService.list(query, page);
	    if(res.getItems().size()==0){
	    	Role role = roleService.get(id);
			role.setIsdel(1);
			
			roleService.update(role);
			
//			roleService.deleteById(id);
			return true;
	    }
	    else{
	    	return false;
	    }
		
		
	}
	
	
	/**
	 * 角色详情
	 * @param request
	 * @param model
	 */
	@RequestMapping("/detail")
	@ResponseBody
	public Role detail(HttpServletRequest request,ModelMap model){
		String id = request.getParameter("id");
		Role role = roleService.get(id);
		return role;
	}
	
	public RoleService getRoleService() {
		return roleService;
	}
	public void setRoleService(RoleService roleService) {
		this.roleService = roleService;
	}

	public UserRoleService getUserRoleService() {
		return userRoleService;
	}

	public void setUserRoleService(UserRoleService userRoleService) {
		this.userRoleService = userRoleService;
	}
	
	
}
