package com.longtime.app.base.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang3.math.NumberUtils;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.longtime.app.base.controller.bean.ImportUserGroupHelper;
import com.longtime.app.base.controller.vo.OrganizationVo;
import com.longtime.app.base.model.BaseGroup;
import com.longtime.app.base.model.BaseGroupRelation;
import com.longtime.app.base.model.BaseGroupRule;
import com.longtime.app.base.model.BaseGroupVo;
import com.longtime.app.base.model.JobLevelEntity;
import com.longtime.app.base.model.JobLevelEntityVo;
import com.longtime.app.base.model.Organization;
import com.longtime.app.base.model.User;
import com.longtime.app.base.service.GroupRelationService;
import com.longtime.app.base.service.GroupRuleService;
import com.longtime.app.base.service.JobLevelService;
import com.longtime.app.base.service.OrganizationService;
import com.longtime.app.base.service.UserGroupService;
import com.longtime.app.base.service.UserService;
import com.longtime.app.util.Constants;
import com.longtime.common.utils.LoginSessionHelper;
import com.longtime.common.utils.Page;
import com.longtime.common.utils.QueryCondition;
import com.longtime.common.utils.ResultSet;
import com.telecom.ctu.platform.common.cache.CacheService;

import net.sf.json.JSONArray;

/**
 * 用户组
 * 
 * @author fangxinyuan
 *
 */
@Controller
@RequestMapping(value="/base/admin/usergroup/")
public class UserGroupController {
	
	@Resource
	private UserGroupService userGroupService;
	@Resource
	private GroupRelationService groupRelationService;

	@Resource
	private UserService userService;

	@Resource
	private OrganizationService organizationService;

	@Resource
	private JobLevelService jobLevelService;

	@Resource
	private GroupRuleService groupRuleService;

	@Resource(name = "lt.cacheService")
	private CacheService cacheService;

	public static final String CACHE_KEY_GROUP_LIST = "glist_%s"; // 用户组列表缓存key

	/**
	 * 到用户组列表页
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "group")
	public String group(HttpServletRequest request) {
		return "/base/admin/usergroup/index";
	}

	/**
	 * 用户组列表
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "list")
	public String list(HttpServletRequest request, ModelMap model) {
		int currentpage = NumberUtils.toInt(
				request.getParameter("currentpage"), Page.CURRENTPAGE_DEFAULT);
		int pagesize = NumberUtils.toInt(request.getParameter("pagesize"),
				Page.PAGESIZE_DEFAULT);
		String domain = LoginSessionHelper.getCurrentDomain(request);
		String searchcontent = request.getParameter("searchcontent");

		QueryCondition queryCondition = new QueryCondition();

		queryCondition.addFilterEqual("domain", domain);
		queryCondition.addFilterEqual("isdel", BaseGroup.ISDEL_NO);
		if (StringUtils.isNotBlank(searchcontent)) {
			queryCondition.addFilterLike("name", "%" + searchcontent + "%");
		}

		Page page = new Page(currentpage, pagesize);

		ResultSet<BaseGroup> rs = this.userGroupService.list(queryCondition,
				page);
		if (rs != null && rs.getItems() != null && rs.getItems().size() > 0) {
			model.put("list", rs.getItems());
			model.put("page", rs.getPage());
		} else {
			model.put("list", Lists.newArrayList());
			model.put("page", page);
		}
		return "/base/admin/usergroup/list";
	}

	@RequestMapping(value = "addgroup", method = RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> addgroup(HttpServletRequest request) {
		String groupname = request.getParameter("groupname");
		String domain = LoginSessionHelper.getCurrentDomain(request);

		Map<Object, Object> map = Maps.newHashMap();

		if (StringUtils.isBlank(groupname)) {
			map.put("flag", false);
			map.put("msg", "名称不能为空");
			return map;
		}
		BaseGroup baseGroup = getBaseGroup(groupname, domain);
		// 插入用户组信息
		String gid = this.userGroupService.insert(baseGroup);

		if (StringUtils.isNotBlank(gid)) {
			map.put("flag", true);
			map.put("msg", gid);
		}

		cacheService
				.remove(String.format("%s%s", CACHE_KEY_GROUP_LIST, domain));
		return map;
	}

	@RequestMapping(value = "updategroup", method = RequestMethod.POST)
	@ResponseBody
	public boolean updategroup(HttpServletRequest request) {
		String groupname = request.getParameter("groupname");
		String id = request.getParameter("id");

		BaseGroup baseGroup = this.userGroupService.get(id);

		if (baseGroup != null) {
			baseGroup.setName(groupname);
			this.userGroupService.update(baseGroup);
			cacheService.remove(String.format("%s%s", CACHE_KEY_GROUP_LIST,
					LoginSessionHelper.getCurrentDomain(request)));
		} else {
			return false;
		}

		return true;
	}

	@RequestMapping(value = "dellink", method = RequestMethod.POST)
	@ResponseBody
	public boolean dellink(HttpServletRequest request) {

		String id = request.getParameter("id");

		if (StringUtils.isBlank(id)) {
			return false;
		}

		boolean flag = this.groupRelationService.deleteById(id);
		if (flag)
			cacheService.remove(String.format("%s%s", CACHE_KEY_GROUP_LIST,
					LoginSessionHelper.getCurrentDomain(request)));
		return flag;
	}

	@RequestMapping(value = "del", method = RequestMethod.POST)
	@ResponseBody
	public boolean del(HttpServletRequest request) {
		String id = request.getParameter("id");

		if (StringUtils.isBlank(id)) {
			return false;
		}

		BaseGroup baseGroup = this.userGroupService.get(id);

		if (baseGroup != null) {
			baseGroup.setIsdel(BaseGroup.ISDEL_YES);
			this.userGroupService.update(baseGroup);
		}

		// 删除关联关系
		this.groupRelationService.deleteByGid(id);

//		QueryCondition queryCondition = new QueryCondition();
//		queryCondition.addFilterEqual("domain",
//				LoginSessionHelper.getCurrentDomain(request));
//		queryCondition.addFilterEqual("gid", id);

//		ResultSet<BaseGroupRelation> rs = this.groupRelationService
//				.list(queryCondition);
//		if (rs != null && rs.getItems() != null && rs.getItems().size() > 0) {
//			for (int i = 0; i < rs.getItems().size(); i++) {
//				this.groupRelationService.deleteById(rs.getItems().get(i)
//						.getId());
//			}
//		}
		cacheService.remove(String.format("%s%s", CACHE_KEY_GROUP_LIST,
				LoginSessionHelper.getCurrentDomain(request)));
		return true;
	}

	@RequestMapping(value = "batchdel", method = RequestMethod.POST)
	@ResponseBody
	public boolean batchdel(HttpServletRequest request) {
		String ids = request.getParameter("ids");

		if (StringUtils.isBlank(ids)) {
			return false;
		}

		String[] idstrs = ids.split(",");

		for (int i = 0; i < idstrs.length; i++) {
			BaseGroup baseGroup = this.userGroupService.get(idstrs[i]);
			if (baseGroup != null) {
				baseGroup.setIsdel(BaseGroup.ISDEL_YES);
				this.userGroupService.update(baseGroup);
			}

			// 删除关联关系
			
			this.groupRelationService.deleteByGid(idstrs[i]);

//			QueryCondition queryCondition = new QueryCondition();
//			queryCondition.addFilterEqual("domain",
//					LoginSessionHelper.getCurrentDomain(request));
//			queryCondition.addFilterEqual("gid", idstrs[i]);
//
//			ResultSet<BaseGroupRelation> rs = this.groupRelationService
//					.list(queryCondition);
//			if (rs != null && rs.getItems() != null && rs.getItems().size() > 0) {
//				for (int j = 0; j < rs.getItems().size(); j++) {
//					this.groupRelationService.deleteById(rs.getItems().get(j)
//							.getId());
//				}
//			}
		}
		cacheService.remove(String.format("%s%s", CACHE_KEY_GROUP_LIST,
				LoginSessionHelper.getCurrentDomain(request)));
		return true;
	}

	@RequestMapping(value = "usergroup")
	public String usergroup(HttpServletRequest request, ModelMap model) {
		String id = request.getParameter("id");
		StringBuffer userids = new StringBuffer();
		String domain = LoginSessionHelper.getCurrentDomain(request);

		BaseGroup baseGroup = this.userGroupService.get(id);

		QueryCondition queryCondition = new QueryCondition();

		queryCondition.addFilterEqual("domain", domain);
		queryCondition.addFilterEqual("gid", id);

		ResultSet<BaseGroupRelation> rs = this.groupRelationService
				.list(queryCondition);

		if (rs != null && rs.getItems() != null && rs.getItems().size() > 0) {
			List<BaseGroupVo> userlist = Lists.newArrayList();
			List<BaseGroupVo> orglist = Lists.newArrayList();
			List<BaseGroupVo> joblevellist = Lists.newArrayList();
			List<BaseGroupVo> rulelist = Lists.newArrayList();

			for (BaseGroupRelation baseGroupRelation : rs.getItems()) {
				BaseGroupVo baseGroupVo = new BaseGroupVo();
				if (baseGroupRelation.getType() == BaseGroupRelation.USER_TYPE) {
					User user = this.userService
							.get(baseGroupRelation.getRid());
					if (user != null) {
						baseGroupVo.setId(baseGroupRelation.getId());
						baseGroupVo.setName(user.getName());
						baseGroupVo.setResourceid(user.getId());
						userids.append(user.getId()).append(",");

						userlist.add(baseGroupVo);
					}
				} else if (baseGroupRelation.getType() == BaseGroupRelation.ORG_TYPE) {
					Organization organization = this.organizationService
							.get(baseGroupRelation.getRid());
					if (organization != null) {
						baseGroupVo.setId(baseGroupRelation.getId());
						baseGroupVo.setName(organization.getName());
						baseGroupVo.setResourceid(organization.getId());
						orglist.add(baseGroupVo);
					}
				} else if (baseGroupRelation.getType() == BaseGroupRelation.JOBLEVEL_TYPE) {
					JobLevelEntity jobLevelEntity = this.jobLevelService
							.get(baseGroupRelation.getRid());
					if (jobLevelEntity != null) {
						baseGroupVo.setId(baseGroupRelation.getId());
						baseGroupVo.setName(jobLevelEntity.getName());
						baseGroupVo.setResourceid(jobLevelEntity.getId());
						joblevellist.add(baseGroupVo);
					}
				} else if (baseGroupRelation.getType() == BaseGroupRelation.RULE_TYPE) {
					BaseGroupRule baseGroupRule = this.groupRuleService
							.get(baseGroupRelation.getRid());
					if (baseGroupRule != null) {
						String str = "";
						if (baseGroupRule.getType() == BaseGroupRule.USER_TYPE) {
							str = "(用户)";
						} else if (baseGroupRule.getType() == BaseGroupRule.ORG_TYPE) {
							str = "(组织)";
						} else if (baseGroupRule.getType() == BaseGroupRule.JOBLEVEL_TYPE) {
							str = "(职级)";
						}
						baseGroupVo.setId(baseGroupRelation.getId());
						baseGroupVo.setName(baseGroupRule.getProperty() + str);
						baseGroupVo.setResourceid(baseGroupRule.getId());
						rulelist.add(baseGroupVo);
					}

				}
			}

			model.put("userlist", userlist);
			model.put("orglist", orglist);
			model.put("joblevels", joblevellist);
			model.put("rulelist", rulelist);
		}
		model.put("userids", userids.toString());
		model.put("basegroup", baseGroup);
		return "/base/admin/usergroup/group";
	}

	@RequestMapping(value = "userlink", method = RequestMethod.POST)
	@ResponseBody
	public boolean userlink(HttpServletRequest request) {

		String ids = request.getParameter("ids");
		String domain = LoginSessionHelper.getCurrentDomain(request);
		String gid = request.getParameter("gid");

		if (StringUtils.isBlank(ids)) {
			return false;
		}

		grouplink(BaseGroupRelation.USER_TYPE, ids, gid, domain);
		cacheService.remove(String.format("%s%s", CACHE_KEY_GROUP_LIST,
				LoginSessionHelper.getCurrentDomain(request)));
		return true;
	}

	@RequestMapping(value = "orglink", method = RequestMethod.POST)
	@ResponseBody
	public boolean orglink(HttpServletRequest request) {

		String orgids = request.getParameter("orgids");
		String domain = LoginSessionHelper.getCurrentDomain(request);
		String gid = request.getParameter("gid");

		if (StringUtils.isBlank(orgids)) {
			return false;
		}

		grouplink(BaseGroupRelation.ORG_TYPE, orgids, gid, domain);
		cacheService.remove(String.format("%s%s", CACHE_KEY_GROUP_LIST,
				LoginSessionHelper.getCurrentDomain(request)));
		return true;
	}

	@RequestMapping(value = "joblevellink", method = RequestMethod.POST)
	@ResponseBody
	public boolean joblevellink(HttpServletRequest request) {
		String joblevels = request.getParameter("joblevels");
		String domain = LoginSessionHelper.getCurrentDomain(request);
		String gid = request.getParameter("gid");

		if (StringUtils.isBlank(joblevels)) {
			return false;
		}
		grouplink(BaseGroupRelation.JOBLEVEL_TYPE, joblevels, gid, domain);
		cacheService.remove(String.format("%s%s", CACHE_KEY_GROUP_LIST,
				LoginSessionHelper.getCurrentDomain(request)));
		return true;
	}

	@RequestMapping(value = "rulelink", method = RequestMethod.POST)
	@ResponseBody
	public boolean rulelink(HttpServletRequest request) {
		String ids = request.getParameter("ids");
		String domain = LoginSessionHelper.getCurrentDomain(request);
		String gid = request.getParameter("gid");

		if (StringUtils.isBlank(ids)) {
			return false;
		}

		grouplink(BaseGroupRelation.RULE_TYPE, ids, gid, domain);
		cacheService.remove(String.format("%s%s", CACHE_KEY_GROUP_LIST,
				LoginSessionHelper.getCurrentDomain(request)));
		return true;
	}

	/**
	 * 职级列表
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("joblevellist")
	@ResponseBody
	public String joblevellist(HttpServletRequest request) {

		String domain = LoginSessionHelper.getCurrentDomain(request);
		List<JobLevelEntityVo> jobLevelEntityVos = this.jobLevelService
				.getJobLevelEntityVos(getJobLevelRootId(request),
						new String[] {}, domain);
		JSONArray array = JSONArray.fromObject(jobLevelEntityVos);
		return array.toString();
	}

	/**
	 * 组织树
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "orglist", method = RequestMethod.POST)
	@ResponseBody
	public String orglist(HttpServletRequest request, ModelMap model) {
		List<OrganizationVo> list = new ArrayList<OrganizationVo>();
		organizationService.getlistToJson2(list, null, request);

		JSONArray array = JSONArray.fromObject(list);

		return array.toString();
	}

	/**
	 * 用户列表
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("userlist")
	public String userlist(HttpServletRequest request, ModelMap model) {
		  String userids = request.getParameter("userids");
		int current_page = NumberUtils.toInt(
				request.getParameter("currentpage"), Page.CURRENTPAGE_DEFAULT);
		int page_size = NumberUtils.toInt(request.getParameter("pagesize"),
				Page.PAGESIZE_DEFAULT);
		String domain = LoginSessionHelper.getCurrentDomain(request);
		String pageFn = request.getParameter("pageFn");

		String username = request.getParameter("username");
		
		String name = request.getParameter("addusername");
		Page page = new Page(current_page, page_size);

		QueryCondition queryCondition = new QueryCondition();

		queryCondition.addFilterEqual("domain", domain);
		queryCondition.addFilterEqual("isDel", 0);
		queryCondition.addFilterEqual("usertype", User.USER_TYPE_COMMON);
		if (StringUtils.isNotBlank(username)) {
			queryCondition.addFilterLike("username", "%" + username + "%");	
		}
		if (StringUtils.isNotBlank(name)) {
			
			queryCondition.addFilterLike("name", "%" + name + "%");
		}
		ResultSet<User> rs = this.userService.list(queryCondition, page);

		if (rs != null && rs.getItems() != null && rs.getItems().size() > 0) {
			model.put("list", rs.getItems());
			model.put("page", rs.getPage());
		}
		model.put("pageFn", pageFn);
		model.put("userids", userids);
		return "/base/admin/usergroup/userlist";
	}

	@RequestMapping(value = "clearuser", method = RequestMethod.POST)
	@ResponseBody
	public boolean clearuser(HttpServletRequest request) {

		String ids = request.getParameter("ids");
		if (StringUtils.isBlank(ids)) {
			return false;
		}

		String[] id = ids.split(",");
		try {
			for (int i = 0; i < id.length; i++) {
				this.groupRelationService.deleteById(id[i]);
			}
		} catch (Exception e) {
			return false;
		}
		cacheService.remove(String.format("%s%s", CACHE_KEY_GROUP_LIST,
				LoginSessionHelper.getCurrentDomain(request)));
		return true;
	}

	@RequestMapping(value = "clearorg", method = RequestMethod.POST)
	@ResponseBody
	public boolean clearOrg(HttpServletRequest request) {
		String orgids = request.getParameter("orgids");

		if (StringUtils.isBlank(orgids)) {
			return false;
		}

		String[] orgid = orgids.split(",");
		try {
			for (int i = 0; i < orgid.length; i++) {
				this.groupRelationService.deleteById(orgid[i]);
			}
		} catch (Exception e) {
			return false;
		}
		cacheService.remove(String.format("%s%s", CACHE_KEY_GROUP_LIST,
				LoginSessionHelper.getCurrentDomain(request)));
		return true;
	}

	@RequestMapping(value = "clearjoblevel", method = RequestMethod.POST)
	@ResponseBody
	public boolean clearJoblevel(HttpServletRequest request) {
		String joblevels = request.getParameter("joblevels");

		if (StringUtils.isBlank(joblevels)) {
			return false;
		}

		String[] joblevelid = joblevels.split(",");
		try {
			for (int i = 0; i < joblevelid.length; i++) {
				this.groupRelationService.deleteById(joblevelid[i]);
			}
		} catch (Exception e) {
			return false;
		}
		cacheService.remove(String.format("%s%s", CACHE_KEY_GROUP_LIST,
				LoginSessionHelper.getCurrentDomain(request)));
		return true;
	}

	@RequestMapping(value = "clearrule", method = RequestMethod.POST)
	@ResponseBody
	public boolean clearRule(HttpServletRequest request) {
		String rule = request.getParameter("rule");

		if (StringUtils.isBlank("rule")) {
			return false;
		}

		String[] rules = rule.split(",");

		try {
			for (int i = 0; i < rules.length; i++) {
				this.groupRelationService.deleteById(rules[i]);
			}
		} catch (Exception e) {
			return false;
		}
		cacheService.remove(String.format("%s%s", CACHE_KEY_GROUP_LIST,
				LoginSessionHelper.getCurrentDomain(request)));
		return true;
	}

	private BaseGroup getBaseGroup(String groupname, String domain) {

		BaseGroup baseGroup = new BaseGroup();

		baseGroup.setCreatetime(System.currentTimeMillis());
		baseGroup.setDomain(domain);
		baseGroup.setName(groupname);
		baseGroup.setType(BaseGroup.COMMON_TYPE);
		return baseGroup;
	}

	private BaseGroupRelation getBaseGroupRelation(String gid, int type,
			String rid, String domain) {

		BaseGroupRelation baseGroupRelation = new BaseGroupRelation();

		baseGroupRelation.setDomain(domain);
		baseGroupRelation.setGid(gid);
		baseGroupRelation.setRid(rid);
		baseGroupRelation.setType(type);
		return baseGroupRelation;
	}

	private String getJobLevelRootId(HttpServletRequest req) {
		return JobLevelController.getJobLevelRootId(req);
	}

	private void grouplink(int type, String ids, String gid, String domain) {
		String[] idStrs = ids.split(",");
		Set<String> set = new HashSet<String>(Arrays.asList(idStrs));
		
		this.groupRelationService.deleteByGidAndType(gid,type);

		for (int i = 0; i < set.size(); i++) {
			if(StringUtils.isBlank(idStrs[i])){
				continue;
			}
			BaseGroupRelation baseGroupRelation = getBaseGroupRelation(gid,
					type, idStrs[i], domain);
			this.groupRelationService.insert(baseGroupRelation);
		}
	}
	
	
	@RequestMapping(value = "loadindex")
	public String loadindex(HttpServletRequest request,ModelMap model) {
		
		String gid = request.getParameter("gid");
		
		
		model.put("gid",gid);
		
		return "/base/admin/usergroup/excelload";
	}
	
	
	@RequestMapping(value="batchuser",method={RequestMethod.POST})
	public String importUser(HttpServletRequest request,HttpServletResponse response, ModelMap model){
	    
	    List<String> excelError = new ArrayList<String>();
        MultipartHttpServletRequest multipartRequest = null;
        String gid = request.getParameter("gid");
        model.put("gid", gid);
        try {
            multipartRequest = (MultipartHttpServletRequest) request;
        } catch (Exception e) {
            return "/base/admin/usergroup/excelload";
        }
        CommonsMultipartFile file = (CommonsMultipartFile) multipartRequest
                .getFile("file");

        if (!file.getOriginalFilename().endsWith(".xls")) {
            excelError.add("上传文件类型错误,文件类型必须为xls格式！");
        } else {
            String path = null;
            try {
                // 保存文件
                path = String.format("%s%s%s%s",request.getRealPath("/"),Constants.IMPORT_USER_FILE_PATH, System.currentTimeMillis(), file.getOriginalFilename());
                FileUtils.copyInputStreamToFile(file.getInputStream(),new File(path));
                // 读取execl文件
                POIFSFileSystem fs = new POIFSFileSystem(file.getInputStream());
                HSSFWorkbook wb = new HSSFWorkbook(fs);
                HSSFSheet sheet = wb.getSheetAt(0);
                
                ImportUserGroupHelper  importHelper = new ImportUserGroupHelper(LoginSessionHelper.getCurrentDomain(request),gid,userService,groupRelationService);
                importHelper.loadExcel(sheet);
                importHelper.process();
                
                
                excelError =  importHelper.getErrors();         
            
            } catch (IOException e) {
                excelError.add("导入用户信息出错！");
            }finally{
                if(StringUtils.isNotBlank(path)){
                    FileUtils.deleteQuietly(new File(path));
                }
            }
        }
        model.put("errorlist", excelError);
        if (excelError == null || excelError.size() <= 0) {
            model.put("isok", true);
        }
      
        return "/base/admin/usergroup/excelload";
	    
	}
	
	

}
