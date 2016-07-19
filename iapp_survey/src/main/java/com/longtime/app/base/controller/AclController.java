package com.longtime.app.base.controller;


import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.apache.commons.lang.ArrayUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.googlecode.genericdao.search.Filter;
import com.longtime.app.base.model.AclRole;
import com.longtime.app.base.model.AclRoleResource;
import com.longtime.app.base.model.AclRoleUser;
import com.longtime.app.base.model.User;
import com.longtime.app.base.service.AclService;
import com.longtime.app.base.service.UserService;
import com.longtime.app.util.PageUtil;
import com.longtime.common.utils.HtmlUtils;
import com.longtime.common.utils.LoginSessionHelper;
import com.longtime.common.utils.Page;
import com.longtime.common.utils.QueryCondition;
import com.longtime.common.utils.ResultSet;
import com.longtime.common.utils.Sort;
import com.myctu.platform.utils.NumberUtils;

@Controller
@RequestMapping("/base/admin/acl")
public class AclController {
	
	@Resource
	private AclService aclService;
	
	@Resource
	private UserService userService;
	
	@RequestMapping("/role/index")
	public String list(HttpServletRequest request, HttpServletResponse response,ModelMap model) {
		
		return "base/admin/acl/role/index";
	}
	
	
	@RequestMapping("/role/list")
	public String rolelist(HttpServletRequest request, HttpServletResponse response,ModelMap model) {
		
		String domain = LoginSessionHelper.getCurrentDomain(request);
		
		QueryCondition query = new QueryCondition();
		query.addFilterEqual("domain", domain);
		
		Page page = PageUtil.getPage(request);
		
		ResultSet<AclRole> res = aclService.list(query, page);
		
		model.put("list", res.getItems());
		model.put("pager", res.getPage());
		
		return "base/admin/acl/role/list";
	}
	
	@RequestMapping("/role/tosave")
	public String tosave(HttpServletRequest request, HttpServletResponse response,ModelMap model) {
		
		String id = request.getParameter("id");
		if (StringUtils.isNotBlank(id)) {
			AclRole entity = this.aclService.get(NumberUtils.toLong(id));
			model.put("entity", entity);
		}
		model.put("id", id);
		
		return "base/admin/acl/role/save";
	}
	
	@RequestMapping(value="/role/save",method=RequestMethod.POST)
	@ResponseBody
	public boolean save(HttpServletRequest request, HttpServletResponse response) {
		String id =request.getParameter("id");
		String name =request.getParameter("name");
		String rids =request.getParameter("rids");
		String domain = LoginSessionHelper.getCurrentDomain(request);
		
		long roleid = 0L;
		if(StringUtils.isBlank(id)){
			AclRole role = new AclRole();
			role.setDomain(domain);
			role.setName(name);
			roleid = this.aclService.insert(role);
		}else{
			roleid = NumberUtils.toLong(id);
			AclRole role = this.aclService.get(roleid);
			role.setName(name);
			this.aclService.update(role);
		}
		
		this.aclService.deleteResourceByRoleId(roleid);
		
		if (StringUtils.isNotBlank(rids)) {
			String[] resourceids = rids.split(",");
			for (String rid : resourceids) {
				if (StringUtils.isNotBlank(rid)) {
					AclRoleResource entity = new AclRoleResource();
					entity.setResourceid(NumberUtils.toLong(rid));
					entity.setRoleid(roleid);
					this.aclService.addAclRoleResource(entity);
				}
			}
		}
		
		return true;
	}
	@RequestMapping(value="/role/delete",method=RequestMethod.POST)
	@ResponseBody
	public ModelMap delete(HttpServletRequest request, HttpServletResponse response,ModelMap map) {
		String id =request.getParameter("id");
		
		boolean has = this.aclService.checkIsHadUsersByRoleId(NumberUtils.toLong(id));
		
		if (has) {
			map.put("flag", false);
			map.put("message", "删除失败，请先移除该角色下的所有用户！");
			return map;
		}
		
		this.aclService.deleteResourceByRoleId(NumberUtils.toLong(id));
		
		this.aclService.deleteById(NumberUtils.toLong(id));
		
		map.put("flag", true);
		map.put("message", "删除成功！");
		
		return map;
	}
	
	@RequestMapping("/role/resource")
	public String resource(HttpServletRequest request, HttpServletResponse response,ModelMap model) {
		
		String id = request.getParameter("id");
		
		String domain = LoginSessionHelper.getCurrentDomain(request);
		
		List<Long> resourceids =aclService.getResourceIdsByRoleId(id);
		
		
		JSONArray array = this.aclService.getCanDisplayResourceTree(resourceids, domain);
		
        model.put("idstr", array.toString());
		
        return "base/admin/acl/role/resourcetree";
	}
	
	
	@RequestMapping("/role/tolinkuser")
	public String tolinkuser(HttpServletRequest request, HttpServletResponse response,ModelMap model) {
		
		String id = request.getParameter("id");
		
		model.put("id",id);
		
		return "base/admin/acl/role/linkuser";
	}
	
	
	@RequestMapping("/role/choseuserlist")
	public String choseuserlist(HttpServletRequest request, HttpServletResponse response,ModelMap model) {
		
		Page page = PageUtil.getPage(request);
		String id = request.getParameter("id");
		String domain = LoginSessionHelper.getCurrentDomain(request);
		
		List<String> uids = this.aclService.getUidsByRoleId(id);
		
        QueryCondition query = new QueryCondition();
        query.addFilter("id", uids, Filter.OP_IN);
        query.addFilterEqual("domain",domain);
        query.addFilterEqual("isDel", User.ISDEL_NO);
        query.addSort(new Sort("createTime", Sort.ORDER_DES));
         
        ResultSet<User> res = userService.list(query, page);
        
        
        if(res==null || null==res.getItems() || 0==res.getItems().size()){
            model.put("page", page);
            return "base/admin/acl/role/choseuserlist";
        }
        
        model.put("list", res.getItems());
        model.put("page", res.getPage());

        return "base/admin/acl/role/choseuserlist";
		
	}
	
	
	@RequestMapping(value = "/role/unchoseuserlist", method = RequestMethod.POST)
	public String unchoseuserlist(HttpServletRequest req, ModelMap model) {
		String id = req.getParameter("id");
		String username = HtmlUtils.getAvailableString(req, "username");
		String name = HtmlUtils.getAvailableString(req, "name");
		String orgname = HtmlUtils.getAvailableString(req, "orgname");
		String userids = req.getParameter("userids");
		String domain = LoginSessionHelper.getCurrentDomain(req);
		Page page = PageUtil.getPage(req);

		List<String> uids = this.aclService.getUidsByRoleId(id);

		QueryCondition query = new QueryCondition();
		query.addFilter("id", uids, Filter.OP_NOT_IN);
		query.addFilterEqual("domain", domain);
		query.addFilterEqual("isDel", User.ISDEL_NO);
		query.addFilterEqual("usertype", 0);

		if (StringUtils.isNotBlank(username)) {
			query.addFilterLike("username", "%" + username + "%");
		}
		if (StringUtils.isNotBlank(name)) {
			query.addFilterLike("name", "%" + name + "%");
		}
		if (StringUtils.isNotBlank(orgname)) {
			query.addFilterLike("organization.name", "%" + orgname + "%");
		}

		query.addSort(new Sort("createTime", Sort.ORDER_DES));

		ResultSet<User> res = userService.list(query, page);

		model.put("list", res.getItems());
		
		model.put("userids",userids);

		model.put("page", res.getPage());

		return "base/admin/acl/role/unchoseuserlist";
	}
	
	
	
	@RequestMapping("role/delete")
	@ResponseBody
	public ModelMap delete(HttpServletRequest req, ModelMap model) {
		
		String[] uids = req.getParameterValues("ids");
		
		String rid = req.getParameter("rid");
		
		int sucNO = 0 ;

		if (ArrayUtils.isEmpty(uids)) {
			model.put("message", "删除失败，没有选择要删除的授权！");
			model.put("flag", false);
			return model;
		}

		for (String id : uids) {
			if (StringUtils.isNotBlank(id)) {
				
				boolean flag = this.aclService.deleteRoleUserByUidAndRoleId(id,rid);
				if (flag) {
					sucNO++;
				}
				//判断当前普通管理员是否存在其他角色，不存在则设置为学员
				User user  = this.userService.get(id);
				if (user.getType()==User.TYPE_MANAGER) {
					boolean has = this.aclService.checkUserHasOtherRoleByUid(id);
					if (!has) {
						user.setType(User.TYPE_DEFAULT);
						this.userService.update(user);
					}
				}
			}
		}

		model.put("flag", true);
		model.put("message", "成功删除" + sucNO + "条授权信息！");
		return model;
	}
	
	
	@RequestMapping("/role/addroleuser")
	@ResponseBody
	public ModelMap doAdd(HttpServletRequest req, ModelMap model) {
		String uids = req.getParameter("uids");
		String id = req.getParameter("id");
		
		if (StringUtils.isBlank(uids) || StringUtils.isBlank(id)) {
			model.put("message", "参数不能为空");
			model.put("flag", false);
			return model;
		}
		
		String[] userids = uids.split(",");

		for (String uid : userids) {
				if (StringUtils.isNotBlank(uid)) {
					AclRoleUser entity = new AclRoleUser();
					entity.setRoleid(NumberUtils.toLong(id));
					entity.setUid(uid);
					this.aclService.addAclRoleUser(entity);
					
					User user = userService.get(uid);
					
					if (user.getType() == User.TYPE_DEFAULT) {
						user.setType(User.TYPE_MANAGER);
						this.userService.update(user);
					}
					
				}
		}
		model.put("message", "授权成功！");
		model.put("flag", true);
		return model;
	}
	

}
