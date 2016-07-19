package com.longtime.app.base.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.math.NumberUtils;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.google.common.base.Splitter;
import com.longtime.app.base.controller.vo.OrgImportHelper;
import com.longtime.app.base.controller.vo.OrgImportHelper.TreeNode;
import com.longtime.app.base.controller.vo.OrganizationVo;
import com.longtime.app.base.model.OrgImportVo;
import com.longtime.app.base.model.Organization;
import com.longtime.app.base.model.User;
import com.longtime.app.base.service.OrganizationService;
import com.longtime.app.base.service.UserService;
import com.longtime.app.ixin.mgr.service.ITokenService;
import com.longtime.app.oplog.model.OpLog;
import com.longtime.app.util.Constants;
import com.longtime.common.utils.LoginSessionHelper;

import net.sf.json.JSONArray;

/**
 * 
 * @author guowei
 * 
 */

@Controller
@RequestMapping("/base/admin/organization")
public class OrganizationController {
	private static final Logger logger = LoggerFactory.getLogger(OrganizationController.class);

	@Resource
	private UserService userService;

	@Resource
	private OrganizationService organizationService;
	  @Resource(name = "tokenService")
		private ITokenService tokenService;

	  @RequestMapping("/organization")
		public String tree(HttpServletRequest request, ModelMap model) {
		
			String id = request.getParameter("id");
			String rootId = getRootId(request);
			Organization organization = organizationService.getRoot(rootId);
			if (null == organization) {
				logger.info(String.format("init tenant[domianid=%s]'s root node!",
						LoginSessionHelper.getCurrentDomain(request)));
				this.organizationService.initTree(rootId, request);
				organization = organizationService.getRoot(rootId);
			}

			List<OrganizationVo> list = new ArrayList<OrganizationVo>();
			organizationService.getlistToJson1(list, id, request);
			
//			TokenInfo tokenInfo = tokenService.getTokenInfoByDomain(LoginSessionHelper.getCurrentDomain(request));
			boolean isWXQY = false;
//			if(tokenInfo != null){
//				isWXQY=tokenInfo.isWXQY();
//				if(isWXQY){
//					for (OrganizationVo organizationVo : list) {
//						organizationVo.setShowSyncIcon(true);
//					}
//				}
//			}
			
			JSONArray array = JSONArray.fromObject(list);
			model.put("tree", array.toString());
			model.put("isWXQY", isWXQY);
			return "base/admin/organization";
		}

	@RequestMapping("/orgloadindex")
	public String orgloadindex(HttpServletRequest request) {
		return "/base/admin/excelOrgLoad";
	}

	@RequestMapping("/orgloadindex2")
	public String orgloadindex2(HttpServletRequest request) {
		return "/base/admin/excelOrgLoad2";
	}
	
	
	/**
	 * 批量导入数据
	 * 
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "batchorg")
	public String batchorg(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		List<String> excelError = new ArrayList<String>();
		MultipartHttpServletRequest multipartRequest = null;
		try {
			multipartRequest = (MultipartHttpServletRequest) request;
		} catch (Exception e) {
			return "/base/admin/excelOrgLoad";
		}
		CommonsMultipartFile file = (CommonsMultipartFile) multipartRequest.getFile("file");

		if (!file.getOriginalFilename().endsWith(".xls")) {
			excelError.add("上传文件类型错误,文件类型必须为xls格式！");
		} else {
			try {
				// 保存文件
				@SuppressWarnings("deprecation")
				String path = String.format("%s%s%s%s", request.getRealPath("/"), Constants.IMPORT_ORG_FILE_PATH,
						System.currentTimeMillis(), file.getOriginalFilename());
				FileUtils.copyInputStreamToFile(file.getInputStream(), new File(path));
				// 读取execl文件
				POIFSFileSystem fs = new POIFSFileSystem(file.getInputStream());
				HSSFWorkbook wb = new HSSFWorkbook(fs);
				HSSFSheet sheet = wb.getSheetAt(0);
				excelError = readExcel(sheet, request, file);
			} catch (Exception e) {
				logger.error("import org due to error,the message is %s", e);
				excelError.add("导入部门信息出错！");
			}
		}
		model.put("errorlist", excelError);
		if (excelError.size() > 0) {
			model.put("success", "false");
		} else {
			model.put("success", "true");
		}
		return "/base/admin/excelOrgLoad";
	}
	
	public List<String> readExcel(HSSFSheet sheet, HttpServletRequest request, CommonsMultipartFile file) {
		List<String> errorList = new ArrayList<String>();
		// 得到domain
		String domain = LoginSessionHelper.getCurrentDomain(request);
		if (StringUtils.isBlank(domain)) {
			errorList.add("域不能为空");
			return errorList;
		}
		List<OrgImportVo> list = new ArrayList<OrgImportVo>();
		boolean exist = false;
		for (int i = 2; i <= sheet.getLastRowNum(); i++) {
			HSSFRow row = sheet.getRow(i);
			if (row == null) {
				continue;
			}
			String orgname = null;
			String parentname = null;

			if (row.getCell(0) == null) {
				orgname = "";
			} else {
				orgname = row.getCell(0).getStringCellValue();
			}
			if (row.getCell(1) == null) {
				parentname = "";
			} else {
				parentname = row.getCell(1).getStringCellValue();
			}

			if (StringUtils.isBlank(orgname)) {
				errorList.add(String.format("第%s行部门名称不能为空", i + 1));
				continue;
			} else if (orgname.toCharArray().length > 32) {
				errorList.add(String.format("第%s行部门名称长度超过32个字符", i + 1));
				continue;
			}

			OrgImportVo orgImportVo = new OrgImportVo();
			orgImportVo.setOrgname(orgname);
			orgImportVo.setParentname(parentname);
			list.add(orgImportVo);
		}

		if (errorList.size() > 0 || list.size() <= 0) {
			return errorList;
		}

		// 判断上级部门是否存在
		for (int i = 0; i < list.size(); i++) {
			// 判断部门是否存在
			Organization organization = organizationService.getOrganization(domain, list.get(i).getOrgname());
			if (organization != null) {
				errorList.add(String.format("第%s行部门已存在", i + 3));
				continue;
			}
			if (StringUtils.isBlank(list.get(i).getParentname())) {
				continue;
			}

			// 判断数据库中是否存在
			Organization organization2 = organizationService.getOrganization(domain, list.get(i).getParentname());
			// 不存在
			if (organization2 == null) {
				// 查询列表
				for (int j = 0; j < list.size(); j++) {

					if (list.get(i).getParentname().equals(list.get(j).getOrgname())) {
						exist = true;
						break;
					}
				}
				if (exist == false) {
					errorList.add(String.format("第%s行上级部门不存在", i + 3));
				}
			} else {
				list.get(i).setParentid(organization2.getId());
			}
		}
		if (errorList.size() > 0) {

		} else {
			// 将数据保存到数据库
			errorList = doinsert(list, domain, errorList);
		}
		return errorList;
	}

	/**
	 * 保存excel信息
	 * 
	 * @param list
	 * @param domain
	 */
	public List<String> doinsert(List<OrgImportVo> list, String domain, List<String> errorList) {
		// excel第一条上级部门在数据库中不存在
		if (StringUtils.isNotBlank(list.get(0).getParentname())) {
			if (StringUtils.isBlank(list.get(0).getParentid())) {
				errorList.add(String.format("第3行上级部门不存在"));
				return errorList;
			}
		}
		for (int i = 0; i < list.size(); i++) {
			Organization organization = new Organization();
			organization.setDomain(domain);
			organization.setName(list.get(i).getOrgname());

			if (StringUtils.isBlank(list.get(i).getParentname())) {
				list.get(i).setParentid("domain_" + domain);
			} else {
				if (StringUtils.isBlank(list.get(i).getParentid())) {
					Organization organization2 = organizationService.getOrganization(domain, list.get(i)
							.getParentname());
					if (organization2 != null) {
						list.get(i).setParentid(organization2.getId());
					}
				}

			}
			organization.setParentId(list.get(i).getParentid());
			// 保存数据
			String id  = organizationService.insert(organization, organization.getParentId());
			//组织信息同步
//			OpLogServiceWrapper.addOrg(id,0, domain);
		}
		return errorList;
	}
	
	

	/**
	 * 批量导入组织数据（全路径的方式）
	 * 
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "batchorg2")
	public String batchorg2(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		List<String> excelError = new ArrayList<String>();
		MultipartHttpServletRequest multipartRequest = null;
		try {
			multipartRequest = (MultipartHttpServletRequest) request;
		} catch (Exception e) {
			return "/base/admin/excelOrgLoad2";
		}
		CommonsMultipartFile file = (CommonsMultipartFile) multipartRequest.getFile("file");
		
		if (!file.getOriginalFilename().endsWith(".xls")) {
			excelError.add("上传文件类型错误,文件类型必须为xls格式！");
		} else {
			try {
				// 保存文件
				@SuppressWarnings("deprecation")
				String path = String.format("%s%s%s%s", request.getRealPath("/"), Constants.IMPORT_ORG_FILE_PATH, System.currentTimeMillis(), file.getOriginalFilename());
				FileUtils.copyInputStreamToFile(file.getInputStream(), new File(path));
				// 读取execl文件
				POIFSFileSystem fs = new POIFSFileSystem(file.getInputStream());
				HSSFWorkbook wb = new HSSFWorkbook(fs);
				HSSFSheet sheet = wb.getSheetAt(0);
				excelError = readExcel2(sheet, request, file);
			} catch (Exception e) {
				logger.error("import org due to error,the message is %s", e);
				excelError.add("导入部门信息出错！");
			}
		}
		model.put("errorlist", excelError);
		if (excelError.size() > 0) {
			model.put("success", "false");
		} else {
			model.put("success", "true");
		}
		return "/base/admin/excelOrgLoad2";
	}

	public List<String> readExcel2(HSSFSheet sheet, HttpServletRequest request, CommonsMultipartFile file) {
		List<String> errorList = new ArrayList<String>();
		// 得到domain
		String domain = LoginSessionHelper.getCurrentDomain(request);
		if (StringUtils.isBlank(domain)) {
			errorList.add("域不能为空");
			return errorList;
		}
		
		OrgImportHelper h = new OrgImportHelper(domain);
		
		for (int i = 2; i <= sheet.getLastRowNum(); i++) {
			HSSFRow row = sheet.getRow(i);
			if (row == null) {
				continue;
			}
			String orgname = null;
			String releationId = null;
			
			if (row.getCell(0) == null) {
				orgname = "";
			} else {
				orgname = row.getCell(0).getStringCellValue();
			}
			if (row.getCell(1) != null){
				releationId = row.getCell(1).getStringCellValue();
			}

			if (StringUtils.isBlank(orgname)) {
				errorList.add(String.format("第%s行全路径部门名称不能为空", i + 1));
				continue;
			}
			
			String[] names =  Splitter.on("/").omitEmptyStrings().splitToList(orgname).toArray(new String[0]);
			for (String name : names) {
				if (name.toCharArray().length > 32) {
					errorList.add(String.format("第%s行全路径中有部门名称长度超过32个字符", i + 1));
					break;
				}
			}
			
			
//			else if (orgname.toCharArray().length > 32) {
//				errorList.add(String.format("第%s行部门名称长度超过32个字符", i + 1));
//				continue;
//			}
			
			h.addNode(orgname, releationId);
		}
		
		if (errorList.size() > 0 || h.getRoot().getChildrens().size() <= 0) {
			return errorList;
		}
		
		TreeNode n = h.getRoot();
		
		insertDB(domain,n.getId(),n.getChildrens());
		return errorList;
	}


	private void insertDB(String domain,String parentid, List<TreeNode> childrens) {
		if(CollectionUtils.isEmpty(childrens)){
			return;
		}
		
		for (TreeNode node : childrens) {
			Organization organization = organizationService.getOrganization(domain,node.getName(),parentid);
			if (organization == null) {
				Organization o = new Organization();
				o.setDomain(domain);
				if(StringUtils.isNotBlank(node.getReleationId()) && NumberUtils.isNumber(node.getReleationId())){
					o.setCpid(NumberUtils.toInt(node.getReleationId()));
				}
				o.setName(node.getName());
				String id = this.organizationService.insert(o, parentid);
				node.setId(id);
				//组织信息同步
//				OpLogServiceWrapper.addOrg(id,OpLog.ACTION_ADD, domain);
			}else {
				if(StringUtils.isNotBlank(node.getReleationId()) && NumberUtils.isNumber(node.getReleationId())){
					organization.setCpid(NumberUtils.toInt(node.getReleationId()));
					this.organizationService.update(organization);
				}
				node.setId(organization.getId());
			}
			
			insertDB(domain,node.getId(), node.getChildrens());
		}		
	}

	@RequestMapping("/insert")
	@ResponseBody
	public ModelMap insert(HttpServletRequest request, ModelMap model) {

		String name = request.getParameter("name");
		String remark = request.getParameter("remark");

		String domain = LoginSessionHelper.getCurrentDomain(request);
		Organization node = new Organization();
		node.setName(name);
		node.setRemark(remark);
		node.setDomain(domain);

		String parentId = request.getParameter("parentId");

		Organization parent = organizationService.get(parentId);

		List<Organization> list = organizationService.getNextOrg(parentId, domain);

		for (Organization organization : list) {
			if (organization.getName().equals(name)) {
				model.put("flag", false);
				model.put("message", "添加失败！同级下组织名不能重复！");
				return model;
			}
		}

		logger.debug("inser new node:[{}]", node);
		organizationService.insert(node, parentId);
		//组织信息同步
//		OpLogServiceWrapper.addOrg(id,0, LoginSessionHelper.getCurrentDomain(request));

		// new OrganizationInfo(1, node);

		model.put("id", node.getId());
		model.put("flag", true);
		model.put("message", "添加成功 ！");
		return model;
		// return
		// "redirect:/base/admin/course/coursecategory/coursecategory.xhtml?id="+parentId;
	}

	@RequestMapping("/delete")
	@ResponseBody
	public ModelMap delete(HttpServletRequest request, ModelMap model) {

		String code = "1";

		// String orgId = request.getParameter("treeId");

		// 要删除的id
		String orgId = request.getParameter("delete_id");


		// 父节点id
		String parentId = request.getParameter("delete_parentId");

		// 判断是否有子节点
		Organization organization = organizationService.get(orgId);
		organization.setIsdel(1);

		if (!organization.isLeaf() || organization.isSystemType()) {
			model.put("flag", false);
			model.put("message", "该节点类型为父节点或系统节点，不能删除！");
			model.put("id", orgId);
			return model;
		}
		// 判断该组织是否有用户
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("organization", organization);
		params.put("usertype", User.USER_TYPE_COMMON);
		params.put("isDel", User.ISDEL_NO);
		params.put("domain", LoginSessionHelper.getCurrentDomain(request));
		List<User> list = this.userService.list(params);
		if (CollectionUtils.isNotEmpty(list)) {
			model.put("flag", false);
			model.put("message", "该组织有用户，不能删除！");
			model.put("id", orgId);
			return model;
		}

		
		
		organizationService.remove(orgId);
		//组织信息同步
//		OpLogServiceWrapper.addOrg(orgId,1, LoginSessionHelper.getCurrentDomain(request));
		
		model.put("flag", true);
		model.put("message", "删除成功！");
		model.put("id", parentId);
		return model;
		// return "redirect:/base/admin/organization.xhtml?id="+parentId;
	}

	@RequestMapping("/update")
	@ResponseBody
	public ModelMap update(HttpServletRequest request, ModelMap model) {
		String orgId = request.getParameter("update_parentId");
		String name = request.getParameter("name");
		String remark = request.getParameter("remark");

		String domain = LoginSessionHelper.getCurrentDomain(request);
		Organization organization = organizationService.get(orgId);
		List<Organization> list = organizationService.getNextOrg(organization.getParentId(), domain);
		for (Organization org : list) {
			if (org.getName().equals(name) && !org.getId().equals(orgId)) {
				model.put("flag", false);
				model.put("message", "修改失败！同级下组织名不能重复！");
				return model;
			}
		}

		// if (organization.isSystemType()) {
		// model.put("flag", false);
		// model.put("message", "该节点类型为系统节点，不能修改！");
		// model.put("id", orgId);
		// return model;
		// }

		organization.setName(name);
		organization.setRemark(remark);
		
		boolean isSync = false;
		if(organization.getSynchronousstatus() == 1){
			isSync = true;
			organization.setSynchronousstatus(0);
			organization.setSynctype(OpLog.ACTION_UPDATE);
		}

		organizationService.update(organization);
		
//		if(isSync){
//			//组织信息同步
//			OpLogServiceWrapper.addOrg(orgId,2, LoginSessionHelper.getCurrentDomain(request));
//		}
		
		model.put("flag", true);
		model.put("message", "修改成功！");
		model.put("id", orgId);
		return model;
		// return "redirect:/base/admin/organization.xhtml?id="+orgId;
	}

	@RequestMapping("/org_detail")
	@ResponseBody
	public Organization detail(HttpServletRequest request, ModelMap model) {

		String orgId = request.getParameter("treeId");
		if (orgId == null) {
			orgId = getRootId(request);
		}
		Organization organization = organizationService.get(orgId);

		organization.setLeaf(organization.isLeaf());

		// model.put("organization", organization);
		// model.put("method", "detail");
		organization.setChildren(null);
		return organization;
	}

	@RequestMapping("/getorgs")
	@ResponseBody
	public JSONArray getOrgs(HttpServletRequest request, ModelMap model) {

		String id = request.getParameter("treeId");
		String type = request.getParameter("type");
		String[] orgs;
		List list = new ArrayList();
		if (type.equals("1")) {// 单选
			organizationService.getlistToJson1(list, id, request);
		} else {
			orgs = id.split(",");
			System.out.println("orgs.length" + orgs.length);
			if (id == null || id == "") {
				orgs = new String[] { getRootId(request) };
			}
			organizationService.getlistToJson1(list, orgs, request);
		}
		JSONArray array = JSONArray.fromObject(list);

		model.put("tree", array.toString());

		return array;

	}

	private String getRootId(HttpServletRequest req) {
		return String.format("domain_%s", LoginSessionHelper.getCurrentDomain(req));
	}

	@RequestMapping("/falushweight")
	@ResponseBody
	public String flushAll(HttpServletRequest request, ModelMap model) {
		String rootId = request.getParameter("rootid");
		String domain = request.getParameter("domain");
		Organization root = null;
		if (StringUtils.isNotBlank(rootId)) {
			root = this.organizationService.get(rootId);
		}
		List<Organization> orgs = new ArrayList<Organization>();
		value = 1;
		if (root != null) {
			if (root.getDomain().equals(domain)) {
				flushAll(root, domain, orgs);
				if (logger.isDebugEnabled()) {
					for (Organization org : orgs) {
						logger.debug(org.getLeftWeight() + " : " + org.getName() + " : " + org.getId() + " : "
								+ org.getDomain() + "  : " + org.getRightWeight());
					}
				}
				if (CollectionUtils.isNotEmpty(orgs)) {
					for(Organization org : orgs){
						this.organizationService.update(org);
					}
				}
				return "success";
			}
			return "domain is not exsist";
		}
		return "rootid is not exsist";
	}

	private static int value = 1;

	private void flushAll(Organization node, String domain, List<Organization> orgs) {
		node.setChildren(null);
		node.setLeftWeight(value++);// 设置左值
		orgs.add(node);

		// 处理子节点
		List<Organization> nextnode = this.organizationService.getNextOrg(node.getId(), domain);
		if (CollectionUtils.isNotEmpty(nextnode)) {
			for (Organization cnode : nextnode) {
				flushAll(cnode, domain, orgs);
			}
		}
		node.setRightWeight(value++);// 设置右值
	}
}
