
package com.longtime.app.base.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.longtime.app.base.controller.vo.PermissionVo;
import com.longtime.app.base.model.Permission;
import com.longtime.app.base.model.Role;
import com.longtime.app.base.service.PermissionService;
import com.longtime.app.base.service.RolePerUnionService;
import com.longtime.app.base.service.RoleService;
import com.longtime.common.utils.LoginSessionHelper;


/**
 * 
 * @author liuxl
 *
 */

@Controller
@RequestMapping("/base/admin/permission")
public class PermissionController {
	private static final Logger logger = LoggerFactory.getLogger(PermissionController.class);

	@Resource
	private PermissionService permissionService;
	@Resource
	private RoleService roleService;
	@Resource
	private RolePerUnionService rolePerUnionService;

	@RequestMapping("/permission")
	public String tree(HttpServletRequest request,ModelMap model) {

		String id = request.getParameter("id");
		
		List<PermissionVo> list = new ArrayList<PermissionVo>();
		permissionService.getlistToJson1(list,id, request);
		JSONArray array = JSONArray.fromObject(list);
		
		model.put("tree", array.toString());
		return "base/admin/permission/permission";
	}
	
	

	@RequestMapping("/insert")
    @ResponseBody
	public ModelMap insert(HttpServletRequest request,ModelMap model) {
		
	    String parentId = request.getParameter("parentId");
		String name = StringUtils.trimToNull(request.getParameter("name"));
		String url = StringUtils.trimToNull(request.getParameter("url"));
		String sourceId = StringUtils.trimToNull(request.getParameter("sourceId"));
		String remark = StringUtils.trimToNull(request.getParameter("remark"));
		
		if(StringUtils.isNotBlank(name)){
		    Permission node = new Permission();
		    node.setName(name);
		    node.setUrl(url);
		    node.setSourceId(sourceId);
		    node.setRemark(remark);
		    node.setDomain(LoginSessionHelper.getCurrentDomain(request));
		    permissionService.insert(node, parentId);
		    
		    logger.debug("inser new node:[{}]", node);
            model.put("id", node.getId());
            model.put("flag", true);
            model.put("message", "添加成功！");
            return model;
//          return "redirect:/base/admin/course/coursecategory/coursecategory.xhtml?id="+node.getId();
        }
        model.put("id", parentId);
        model.put("flag", false);
        model.put("message", "添加失败！");
        return model;
//      return "redirect:/base/admin/course/coursecategory/coursecategory.xhtml?id="+parentId;
		
	}

	@RequestMapping("/delete")
    @ResponseBody
	public ModelMap delete(HttpServletRequest request,ModelMap model) {
		//要删除的id
		String perId = request.getParameter("delete_id");
		//父节点id
		String parentId = request.getParameter("delete_parentId");
		
		Permission permission = permissionService.get(perId);
		
		/**
		 * 前台已经限制，安全起见，此处再进行判断
		 */
		if((!permission.isLeaf()) || permission.isSystemType()){
//          return "redirect:/base/admin/course/coursecategory/coursecategory.xhtml?id="+perId;
            model.put("flag", false);
            model.put("message", "该节点类型为父节点或系统节点，不能删除！");
            model.put("id", perId);
            return model;
        }

        /**
         * 前台已经限制，安全起见，此处再进行判断
         */
		permissionService.remove(perId);

        model.put("flag", true);
        model.put("message", "删除成功！");
        model.put("id", parentId);
        return model;
//		return "redirect:/base/admin/permission/permission.xhtml?id="+parentId;
	}
	
	@RequestMapping("/update")
    @ResponseBody
	public ModelMap update(HttpServletRequest request,ModelMap model) {
		String perId = request.getParameter("update_parentId");
		String name = StringUtils.trimToNull(request.getParameter("name"));
		String url = StringUtils.trimToNull(request.getParameter("url"));
        String sourceId = StringUtils.trimToNull(request.getParameter("sourceId"));
		String remark = StringUtils.trimToNull(request.getParameter("remark"));

		Permission permission = permissionService.get(perId);
		
        if(permission.isSystemType()){
            model.put("flag", false);
            model.put("message", "该节点类型为系统节点，不能修改！");
            model.put("id", perId);
            return model;
        }
        
		if(StringUtils.isNotBlank(name)){
		    permission.setName(name);
		    permission.setUrl(url);
		    permission.setSourceId(sourceId);
		    permission.setRemark(remark);
		    permissionService.update(permission);
		}

        model.put("flag", true);
        model.put("message", "修改成功！");
        model.put("id", perId);
        return model;
//		return "redirect:/base/admin/permission/permission.xhtml?id="+perId;
	}
	@RequestMapping("/detail")
	@ResponseBody
	public Permission detail(HttpServletRequest request,ModelMap model) {
		
		String perId = request.getParameter("treeId");
		if(perId==null){
			perId=Permission.root_id;
		}
		Permission permission = permissionService.get(perId);
		
		model.put("permission", permission);
		model.put("method", "detail");
		return permission;
	}
	
	@RequestMapping(value="/permissionUpdate")
	public String permissionUpdate(HttpServletRequest request,ModelMap model) {
        String id = request.getParameter("id");

        Role role = roleService.get(id);
        
        List<String> idList = rolePerUnionService.getPermissions(id);
        String[] ids = idList.toArray(new String[]{});
        
        List<PermissionVo> list = new ArrayList<PermissionVo>();
        permissionService.getlistToJson1(list, ids, request);
        JSONArray array = JSONArray.fromObject(list);
        
        model.put("idstr", array.toString());
        model.put("role", role);
        return "/base/admin/permission/permissionUpdate";
	}
	
	
	@RequestMapping(value="/saveRolePermission", method=RequestMethod.POST)
    public void saveRolePermission(HttpServletRequest request,HttpServletResponse response, ModelMap model) throws IOException {
	    String idstr = request.getParameter("idstr");
	    String roleId = request.getParameter("roleId");
	    
	    boolean ret = rolePerUnionService.updateUnion(idstr, roleId);
	    
	    response.sendRedirect(request.getContextPath()+"/base/admin/role/role.xhtml");
        return;
	}
	
}

