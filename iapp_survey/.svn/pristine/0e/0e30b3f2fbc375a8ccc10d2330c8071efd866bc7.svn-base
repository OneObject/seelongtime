package com.longtime.app.base.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.lang.reflect.InvocationTargetException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.ArrayUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.google.common.collect.Maps;
import com.googlecode.genericdao.search.Filter;
import com.longtime.ajy.support.PasswordEncoder;
import com.longtime.app.base.controller.bean.ImportUserHelper;
import com.longtime.app.base.controller.vo.UserExcelVo;
import com.longtime.app.base.model.Account;
import com.longtime.app.base.model.Account.Status;
import com.longtime.app.base.model.JobLevelEntity;
import com.longtime.app.base.model.LabelRelationEntity;
import com.longtime.app.base.model.Organization;
import com.longtime.app.base.model.OrganizationVO;
import com.longtime.app.base.model.User;
import com.longtime.app.base.model.UserLinkJobLevel;
import com.longtime.app.base.model.UserVo;
import com.longtime.app.base.service.AccountService;
import com.longtime.app.base.service.CheckBindStatusService;
import com.longtime.app.base.service.JobLevelService;
import com.longtime.app.base.service.LabelEntityService;
import com.longtime.app.base.service.OrganizationService;
import com.longtime.app.base.service.TenantConfigService;
import com.longtime.app.base.service.UserLinkJobLevelService;
import com.longtime.app.base.service.UserService;
import com.longtime.app.ixin.mgr.model.IXinUser;
import com.longtime.app.ixin.mgr.service.ITokenService;
import com.longtime.app.ixin.mgr.service.IXinUserService;
import com.longtime.app.oplog.model.OpLog;
import com.longtime.app.util.Constants;
import com.longtime.app.util.ExcelOptionUtil;
import com.longtime.app.util.IdGenerator;
import com.longtime.app.util.PageUtil;
import com.longtime.common.utils.DateUtils;
import com.longtime.common.utils.HtmlUtils;
import com.longtime.common.utils.LoginSessionHelper;
import com.longtime.common.utils.Page;
import com.longtime.common.utils.QueryCondition;
import com.longtime.common.utils.QueryFilter;
import com.longtime.common.utils.ResultSet;
import com.longtime.common.utils.Sort;
import com.longtime.common.web.utils.SortCss;
import com.myctu.platform.utils.BeanUtils;
import com.myctu.platform.utils.NumberUtils;

@Controller
@RequestMapping("/base/admin/user/")
public class UserController {

	@Resource
	private UserService userService;
	@Resource
	private AccountService accountService;
	@Resource
	private IXinUserService iXinUserService;
	@Resource
	private OrganizationService organizationService;
    @Resource
    private CheckBindStatusService checkBindStatusService;
    @Resource
    private UserLinkJobLevelService userLinkJobLevelService;
    
    @Resource(name = "labelEntityService")
	private LabelEntityService labelEntityService;
    
    @Resource(name = "tenantConfigService")
    private TenantConfigService tenantConfigService;
    
    @Resource
    private JobLevelService jobLevelService;
    @Resource(name = "tokenService")
	private ITokenService tokenService;
    
	private static final Logger logger = LoggerFactory
			.getLogger(UserController.class);

	/**
	 * 获得组织下级节点
	 * 
	 * @param 父节点id
	 * @param model
	 * @return
	 * @throws InvocationTargetException
	 * @throws IllegalAccessException
	 */
	@RequestMapping("getChildOrg")
	@ResponseBody
	public List<OrganizationVO> getChildOrg(HttpServletRequest req)
			throws IllegalAccessException, InvocationTargetException {

		String id = req.getParameter("id");
		String domain = LoginSessionHelper.getCurrentDomain(req);
		@SuppressWarnings("unchecked")
		List<Organization> orgList = organizationService.getNextOrg(id, domain);
		List<OrganizationVO> list = new ArrayList<OrganizationVO>();
		for (Organization organization : orgList) {
			OrganizationVO vo = new OrganizationVO();
			BeanUtils.copyProperties(vo, organization);
			list.add(vo);
		}
		return list;
	}

	/**
	 * 管理
	 * 
	 * @param req
	 * @param model
	 * @return
	 */
	@RequestMapping("usermanage")
	public String usermanage(HttpServletRequest req, ModelMap model) {

	    String domain = LoginSessionHelper.getCurrentDomain(req);
		@SuppressWarnings("unchecked")
		List<Organization> orgList = organizationService.getNextOrg(null, domain);
		String rootId = getRootId(req);
		Organization root = (Organization) organizationService.getRoot(rootId);
		if (root == null) {
			logger.info("init org'root in usermanager.");
			organizationService.initTree(rootId, req);
			root = (Organization) organizationService.getRoot(rootId);
		}
		model.put("genderMap", User.GENDER_MAP);
		model.put("certTypeMap", User.CERTIFICATE_TYPE_MAP);

		model.put("rootId", root.getId());
		model.put("orgList", orgList);
		
		// 是否企业号
//        TokenInfo tokenInfo = tokenService.doQueryOrInsertToken(domain);
        
        boolean isQY  = false;
//        if(tokenInfo!=null){
//            isQY = tokenInfo.isWXQY() && tokenInfo.isOauth();
//        }
        
//        TenantConfig tenantConfig = this.tenantConfigService.getByDomain(domain);
        
        boolean syncToWx = false;
        boolean syncFromWx = false;
//        if(tenantConfig != null){
//            syncToWx = tenantConfig.isIsautosyn();
//            syncFromWx = tenantConfig.isSyncfromwx();
//        }
        model.put("isQYSync", syncToWx || syncFromWx );
        model.put("isQY", isQY);
        

		return "base/admin/user/usermanage";
	}

	@RequestMapping("loadindex")
	public String loadindex(HttpServletRequest request) {
		return "/base/admin/user/excelLoad";
	}
	
	@RequestMapping("loadindex2")
	public String loadindex2(HttpServletRequest request) {
		return "/base/admin/user/excelLoad2";
	}
	
	@RequestMapping(value="batchuser",method={RequestMethod.POST})
	public String importUser(HttpServletRequest request,HttpServletResponse response, ModelMap model){
	    
	    List<String> excelError = new ArrayList<String>();
        MultipartHttpServletRequest multipartRequest = null;
        try {
            multipartRequest = (MultipartHttpServletRequest) request;
        } catch (Exception e) {
            return "/base/admin/user/excelLoad";
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
                
                ImportUserHelper  importUserHelper = new ImportUserHelper(LoginSessionHelper.getCurrentDomain(request), LoginSessionHelper.getCurrentUserId(request), userService, organizationService, jobLevelService, accountService, userLinkJobLevelService,labelEntityService);
                importUserHelper.loadExcel(sheet);
                importUserHelper.process();
                
                
                excelError =  importUserHelper.getErrors();         
            
            } catch (IOException e) {
                logger.error("import user due to error,the message is %s", e);
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
        return "/base/admin/user/excelLoad";
	    
	}
	
	@RequestMapping(value="batchuser2",method={RequestMethod.POST})
	public String batchUser2(HttpServletRequest request,HttpServletResponse response, ModelMap model){
	    
	    List<String> excelError = new ArrayList<String>();
        MultipartHttpServletRequest multipartRequest = null;
        try {
            multipartRequest = (MultipartHttpServletRequest) request;
        } catch (Exception e) {
            return "/base/admin/user/excelLoad2";
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
                
                String domain = LoginSessionHelper.getCurrentDomain(request);
                String rootId = String.format("domain_%s", domain);
                List<Organization> allOrgs = this.organizationService.getAlltree(domain);
                Map<String, Map<String, String>> orgMap = Maps.newHashMap();
                assembleOrgMap(rootId, allOrgs,orgMap);
                ImportUserHelper  importUserHelper = new ImportUserHelper(domain, LoginSessionHelper.getCurrentUserId(request), userService, organizationService, jobLevelService, accountService, userLinkJobLevelService,labelEntityService);
                importUserHelper.setOrgMap(orgMap);
                importUserHelper.setIsOrgTree(1);
                importUserHelper.loadExcel(sheet);
                importUserHelper.process();
                
                excelError =  importUserHelper.getErrors();         
            
            } catch (IOException e) {
                logger.error("import user due to error,the message is %s", e);
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
        return "/base/admin/user/excelLoad2";
	    
	}
	
	
	public void assembleOrgMap(String parentId,List<Organization> allOrgs, Map<String, Map<String, String>> orgMap) {
		if(CollectionUtils.isEmpty(allOrgs)){
			return;
		}
		
		Map<String, String> levelMap = Maps.newHashMap();
		for(Organization org : allOrgs){
			if(parentId.equals(org.getParentId())){
				levelMap.put(org.getName(), org.getId());
				if(!org.isLeaf()){
					assembleOrgMap(org.getId(), allOrgs,orgMap);
				}
			}
		}
		orgMap.put(parentId, levelMap);
	}
	

	/**
	 * 批量导入数据
	 * 
	 * @param response
	 * @param model
	 * @return
	 */
	//@RequestMapping(value = "batchuser")
	public String batchuser(HttpServletRequest request,
			HttpServletResponse response, ModelMap model) {
		List<String> excelError = new ArrayList<String>();
		MultipartHttpServletRequest multipartRequest = null;
		try {
			multipartRequest = (MultipartHttpServletRequest) request;
		} catch (Exception e) {
			return "/base/admin/user/excelLoad";
		}
		CommonsMultipartFile file = (CommonsMultipartFile) multipartRequest
				.getFile("file");

		if (!file.getOriginalFilename().endsWith(".xls")) {
			excelError.add("上传文件类型错误,文件类型必须为xls格式！");
		} else {
			try {
				// 保存文件
				@SuppressWarnings("deprecation")
				String path = String.format("%s%s%s%s",
						request.getRealPath("/"),
						Constants.IMPORT_USER_FILE_PATH,
						System.currentTimeMillis(), file.getOriginalFilename());
				FileUtils.copyInputStreamToFile(file.getInputStream(),
						new File(path));
				// 读取execl文件
				POIFSFileSystem fs = new POIFSFileSystem(file.getInputStream());
				HSSFWorkbook wb = new HSSFWorkbook(fs);
				HSSFSheet sheet = wb.getSheetAt(0);
				excelError = readExcel(sheet, request, file);
			} catch (IOException e) {
				logger.error("import user due to error,the message is %s", e);
				excelError.add("导入用户信息出错！");
			}
		}
		model.put("errorlist", excelError);
		if (excelError != null && excelError.size() <= 0) {
			model.put("isok", true);
		}
		return "/base/admin/user/excelLoad";
	}

	public List<String> readExcel(HSSFSheet sheet, HttpServletRequest request,
			CommonsMultipartFile file) {
		List<String> errorList = new ArrayList<String>();
		List<UserExcelVo> list = new ArrayList<UserExcelVo>();
		// 得到domain
		String domain = LoginSessionHelper.getCurrentDomain(request);

		// 解决用户删除模板中的第一行导致excel读取出错
		HSSFRow row1 = sheet.getRow(0);
		if (row1 != null && row1.getCell(1).getCellType() != 3) {
			errorList.add("请不要删除模板中的第一行");
			return errorList;
		}
		
		//判断导入的记录数是否大于5000
		if(sheet.getLastRowNum() > 5001){
			errorList.add("导入记录数不能大于5000");
			return errorList;
		} 
	
		// 记录已检查过的部门
		Map<String, String> map = new HashMap<String, String>();
        
		// 对excel进行处理
		for (int i = 2; i <= sheet.getLastRowNum(); i++) {
			HSSFRow row = sheet.getRow(i);
			if (row == null) {
				continue;
			}
			UserExcelVo userExcelVo = getExcelList(i, row,domain);

			list.add(userExcelVo);
			
			

			// 验证部门
			if (StringUtils.isBlank(userExcelVo.getDepartment())) {
				errorList.add(String.format("第%s行部门不能为空", i + 1));
				continue;
			} else {
				// 验证部门在数据库中是否存在
				if (map.containsKey(userExcelVo.getDepartment())) {
					continue;
				}
				Organization organization = organizationService
						.getOrganization(domain, userExcelVo.getDepartment());
				if (organization == null) {
					errorList.add(String.format("第%s行部门不存在，部门名称为%s", i + 1,
							userExcelVo.getDepartment()));
					continue;
				} else {
					map.put(userExcelVo.getDepartment(),
							userExcelVo.getDepartment());
				}
			}
			
			//验证职级
			if(StringUtils.isNotBlank(userExcelVo.getJoblevel())){
				if(map.containsKey(userExcelVo.getJoblevel())){
					continue;
				}
				
				QueryCondition queryCondition=new QueryCondition();
				queryCondition.addFilterEqual("domain",domain);
				queryCondition.addFilterEqual("name",userExcelVo.getJoblevel());
				queryCondition.addFilterEqual("isdel",0);
				
				ResultSet<JobLevelEntity> rs=this.jobLevelService.list(queryCondition);
				
				if(rs!=null && rs.getItems()!=null && rs.getItems().size()>0){
					map.put(userExcelVo.getJoblevel(),userExcelVo.getJoblevel());
				}else {
					errorList.add(String.format("第%s行职级不存在，职级名称为%s",i+1,userExcelVo.getJoblevel()));
					continue;
				}
			}

			if (errorList.size() > 0) {
				return errorList;
			}
		}

		// 清空map中的值
		map.clear();

		List<UserExcelVo> userExcelVos = new ArrayList<UserExcelVo>();

		// 验证其他项
		for (int j = 2; j <= sheet.getLastRowNum(); j++) {

			UserExcelVo userExcelVo = list.get(j - 2);

			// 验证姓名
			if (StringUtils.isBlank(userExcelVo.getName())) {
				errorList.add(String.format("第%s行姓名不能为空", j + 1));
				continue;
			}

			// 验证用户名不能同时为空和是否有空格
			if (StringUtils.isBlank(userExcelVo.getUsername())) {
				errorList.add(String.format("第%s行用户名为空", j + 1));
				continue;
			} else {
				Pattern p = Pattern.compile("[^0-9A-Za-z@\\-_.]+|[\u4e00-\u9fa5]+|\\s+");
				Matcher m = p.matcher(userExcelVo.getUsername());
				if(m.find()){
					errorList.add(String.format("第%s行用户名包含空格,特殊符号或者中文", j + 1));
					continue;
				} else {
					if( userExcelVo.getUsername().toCharArray().length > 32) {
						errorList.add(String.format("第%s行用户名长度超过32个字符", j + 1));
						continue;
					}
				}
			}

			// ResultSet<User> rs=null;

			// 验证手机
			if (StringUtils.isNotBlank(userExcelVo.getMobile())) {
				// 判断在excel中是否存在
				if (map.containsKey("phone_" + userExcelVo.getMobile())) {
					errorList.add(String.format("第%s行手机号码，手机号为%s在excel中重复",
							j + 1, userExcelVo.getMobile()));
					continue;
				}

				map.put("phone_" + userExcelVo.getMobile(),
						userExcelVo.getMobile());

				Map<String, String> map4 = new HashMap<String, String>(1);
				map4.put("mobile", userExcelVo.getMobile());

				boolean b = this.userService
						.queryUserNameAndEmailAndMobileIsRepeat(null, domain,
								map4);
				if (b) {
					errorList.add(String.format("第%s行手机号码在数据库中已存在，手机号码为%s",
							j + 1, userExcelVo.getMobile()));
					continue;
				}

			}

			// 验证邮箱
			if (StringUtils.isNotBlank(userExcelVo.getEmail())) {

				if (map.containsKey("email_" + userExcelVo.getEmail())) {
					errorList.add(String.format("第%s行邮箱，邮箱为%s在excel中重复", j + 1,
							userExcelVo.getEmail()));
					continue;
				}
				map.put("email_" + userExcelVo.getEmail(),
						userExcelVo.getEmail());

				Map<String, String> map3 = new HashMap<String, String>(1);
				map3.put("email", userExcelVo.getEmail());

				boolean b = this.userService
						.queryUserNameAndEmailAndMobileIsRepeat(null, domain,
								map3);
				if (b) {
					errorList.add(String.format("第%s行邮箱在数据库中已存在，邮箱为%s", j + 1,
							userExcelVo.getEmail()));
					continue;
				}

			}

			// 验证用户名唯一性
			if (StringUtils.isNotBlank(userExcelVo.getUsername())) {

				if (map.containsKey("username_" + userExcelVo.getUsername())) {
					errorList.add(String.format("第%s行用户名，用户名为%s在excel中重复",
							j + 1, userExcelVo.getUsername()));
					continue;
				}

				map.put("username_" + userExcelVo.getUsername(),
						userExcelVo.getUsername());

				Map<String, String> map2 = new HashMap<String, String>(1);
				map2.put("username", userExcelVo.getUsername());

				boolean b = this.userService
						.queryUserNameAndEmailAndMobileIsRepeat(null, domain,
								map2);

				if (b) {
					errorList.add(String.format("第%s行用户名在数据库中已存在，用户名为%s",
							j + 1, userExcelVo.getUsername()));
					continue;
				}
			} else {
				errorList.add(String.format("第%s行用户名不能为空", j + 1));
				continue;
			}

			if (StringUtils.isBlank(userExcelVo.getPass())) {
				// 设置默认密码
				userExcelVo.setPass(defalut_pwd);
			}
			
			

			userExcelVos.add(userExcelVo);

		}

		// 格式上面没有错误
		if (errorList.size() <= 0) {
			doinsert(userExcelVos, domain, request);
		}

		return errorList;

	}

	/**
	 * 得到excel中的数据
	 * 
	 * @return
	 */
	public UserExcelVo getExcelList(int i, HSSFRow row,String domain) {
		// 姓名
		String name = null;
		// 用户名
		String username = null;
		// 手机
		String mobile = null;
		// 邮箱
		String email = null;
		// 密码
		String pass = null;
		// 部门
		String department = null;
		//职级
		String joblevel=null;
		//性别
		String genderStr = null;
		//昵称
		String nickname = null;
		//有效期（开始）
		String effictivestartStr = null;
		//有效期（截止）
		String effictiveendStr = null;
		//生日
		String birthday = null;
		
		
		DecimalFormat df = new DecimalFormat("0");

		// 姓名处理
		if (row.getCell(0) == null) {
			name = "";
		} else {
			// 如果是数字
			if (row.getCell(0).getCellType() == 0) {
				Double doubleValue = row.getCell(0).getNumericCellValue();
				name = df.format(doubleValue);
			} else {
				name = row.getCell(0).getStringCellValue().trim();
			}
		}
		// 用户名处理
		if (row.getCell(1) == null) {
			username = "";
		} else {
			if (row.getCell(1).getCellType() == 0) {
				Double doubleValue = row.getCell(1).getNumericCellValue();
				username = df.format(doubleValue);
			} else {
				username = row.getCell(1).getStringCellValue().trim();
			}
		}

		// 手机处理
		if (row.getCell(2) == null) {
			mobile = "";
		} else {
			if (row.getCell(2).getCellType() == 0) {
				double dvalue = row.getCell(2).getNumericCellValue();
				mobile = df.format(dvalue);
			} else {
				mobile = row.getCell(2).getStringCellValue().trim();
			}
		}
		// 邮箱处理
		if (row.getCell(3) == null) {
			email = "";
		} else {
			if (row.getCell(3).getCellType() == 0) {
				email = String.valueOf(row.getCell(3).getNumericCellValue());
			} else {
				email = row.getCell(3).getStringCellValue().trim();
			}
		}
		// 密码处理
		if (row.getCell(4) == null) {
			pass = "";
		} else {
			if (row.getCell(4).getCellType() == 0) {
				double dvalue = row.getCell(4).getNumericCellValue();
				pass = df.format(dvalue);
			} else {
				pass = row.getCell(4).getStringCellValue().trim();
			}
		}
		// 部门处理
		if (row.getCell(5) == null) {
			department = "";
		} else {
			if (row.getCell(5).getCellType() == 0) {
				department = String.valueOf(row.getCell(5)
						.getNumericCellValue());
			} else {
				department = row.getCell(5).getStringCellValue().trim();
			}
		}
		
		//职级处理
		if(row.getCell(6)==null){
			String joblevelid="joblevel_"+domain;
			
			JobLevelEntity jobLevelEntity=this.jobLevelService.get(joblevelid);
			
			joblevel=jobLevelEntity.getName();
		}else {
			if(row.getCell(6).getCellType()==0){
				joblevel=String.valueOf(row.getCell(6).getNumericCellValue());
			}else {
				joblevel=row.getCell(6).getStringCellValue().trim();
			}
		}
		
		effictivestartStr = ExcelOptionUtil.getCellStringValue(row.getCell(7));
		effictiveendStr = ExcelOptionUtil.getCellStringValue(row.getCell(8));
		genderStr = ExcelOptionUtil.getCellStringValue(row.getCell(9));
		nickname = ExcelOptionUtil.getCellStringValue(row.getCell(10));
		birthday = ExcelOptionUtil.getCellStringValue(row.getCell(11));

		logger.debug("username=[{}] genderstr=[{}]",username,genderStr);
		UserExcelVo userExcelVo = new UserExcelVo();
		userExcelVo.setDepartment(department);
		userExcelVo.setEmail(email);
		userExcelVo.setMobile(mobile);
		userExcelVo.setName(name);
		userExcelVo.setPass(pass);
		userExcelVo.setUsername(username);
		userExcelVo.setJoblevel(joblevel);
		userExcelVo.setNickName(nickname);
		
		if(StringUtils.isBlank(genderStr)){
			userExcelVo.setGender(User.GENDER_OTHER);
		} else {
		    int gender = ( genderStr.equals("男") ||  User.GENDER_MALE == NumberUtils.toInt(genderStr, User.GENDER_OTHER) )? User.GENDER_MALE :  (( genderStr.equals("女") || User.GENDER_FEMAIL==NumberUtils.toInt(genderStr, User.GENDER_OTHER) )? User.GENDER_FEMAIL: User.GENDER_OTHER);
			userExcelVo.setGender(gender);
		}
		
		if(StringUtils.isBlank(effictivestartStr)){
			userExcelVo.setEffictivestart(null);
		} else {
			userExcelVo.setEffictivestart(DateUtils.parseDateStringToLong(effictivestartStr));
		}
		
		if(StringUtils.isBlank(effictiveendStr)){
			userExcelVo.setEffictiveend(null);
		} else {
			userExcelVo.setEffictiveend(DateUtils.parseDateStringToLong(effictiveendStr));
		}
		
		if (StringUtils.isBlank(birthday)) {
			userExcelVo.setBirthday(null);
		} else {
			userExcelVo.setBirthday(DateUtils.parseDateStringToLong(birthday));
		}
		return userExcelVo;
	}

	public void doinsert(List<UserExcelVo> list, String domain,
			HttpServletRequest request) {

		for (UserExcelVo userExcelVo : list) {
			User user = new User();
			user.setId(IdGenerator.nextId32().toString());
			user.setName(userExcelVo.getName());
			
			user.setMobile(userExcelVo.getMobile());
			user.setEmail(userExcelVo.getEmail().toLowerCase());
			user.setUsername(userExcelVo.getUsername());
			user.setDomain(domain);
			user.setCreateTime(System.currentTimeMillis());
			user.setOrganization(organizationService.getOrganization(domain,
					userExcelVo.getDepartment()));
			
			user.setGender(userExcelVo.getGender());
			
			
			
			user.setNickName(userExcelVo.getNickName());
			user.setEffictivestart(userExcelVo.getEffictivestart());
			user.setEffictiveend(userExcelVo.getEffictiveend());
			if (userExcelVo.getBirthday() != null) {
				user.setBirthday(userExcelVo.getBirthday());
			}
			
			// 保存信息
			String id = userService.insert(user);
			
			//用户信息同步
//			OpLogServiceWrapper.addUser(id, 0, domain);
			
			addAccount(user, userExcelVo.getPass(), request);
			
			//关联职级
			QueryCondition queryCondition=new QueryCondition();
			queryCondition.addFilterEqual("domain",domain);
			queryCondition.addFilterEqual("name",userExcelVo.getJoblevel());
			queryCondition.addFilterEqual("isdel",0);
			
			ResultSet<JobLevelEntity> rs=this.jobLevelService.list(queryCondition);
			UserLinkJobLevel userLinkJobLevel=new UserLinkJobLevel();
			if(rs!=null && rs.getItems()!=null && rs.getItems().size()>0){
				JobLevelEntity jobLevelEntity=rs.getItems().get(0);
				userLinkJobLevel.setJoblevelid(jobLevelEntity.getId());
				userLinkJobLevel.setUserid(user.getId());
				this.userLinkJobLevelService.insert(userLinkJobLevel);
			}
		}
	}

	private String getRootId(HttpServletRequest req) {
		return String.format("domain_%s",
				LoginSessionHelper.getCurrentDomain(req));
	}

	/**
	 * 查询
	 * 
	 * @param req
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "list", method = RequestMethod.POST)
	public String list(HttpServletRequest req, ModelMap model) {
		String domain = LoginSessionHelper.getCurrentDomain(req);
		String searchContent = HtmlUtils.getAvailableString(req,
				"searchContent");
		String orgId = req.getParameter("orgId");
		String gender = req.getParameter("gender");
		String orderField = req.getParameter("orderField");
		String orderDirection = req.getParameter("orderDirection");
		String banding = req.getParameter("banding");
		String attentionstatus = req.getParameter("attentionstatus");
		QueryCondition query = new QueryCondition();
		String rootid = "domain_" + LoginSessionHelper.getCurrentDomain(req);
		List<String> childOrgIds = new ArrayList<String>();
		Page page = PageUtil.getPage(req);
		if (StringUtils.isNotBlank(orgId)) {
			if (rootid.equals(orgId)) {

			} else {
				Organization org = organizationService.get(orgId);

				if(null!=org){

					query.addFilter(QueryFilter.custom(" {organization.id} in (select org.id from Organization org where org.leftWeight BETWEEN ?1 AND ?2 AND  org.domain = ?3 )",org.getLeftWeight(),org.getRightWeight(),org.getDomain()));
				}

				//childOrgIds = organizationService.getChildOrgIds(orgId, req);
				//query.addFilter("organization.id", childOrgIds, Filter.OP_IN);
			}
			// query.addFilterEqual("organization.id", orgId);
		}
		//有限制绑定条件的时候特殊查询
	   if (StringUtils.isNotBlank(banding)&&!"-1".equals(banding)) {
					if (StringUtils.isBlank(searchContent)) {
						searchContent = "";
					}
					if (StringUtils.isBlank(orderField)
							&& StringUtils.isBlank(orderDirection)) {
						  orderField = "createTime";
						  orderDirection = "desc";
						  model.put("orderField", "createTime");
						  model.put("orderDirection", SortCss.DESC);
					}
					
					ResultSet<UserVo> rs = userService.queryListByAllParams(domain, searchContent, childOrgIds, gender, orderField, orderDirection, banding,attentionstatus, page);
					
					model.put("pager", rs.getPage());
					model.put("orderField", orderField);
					model.put("orderDirection", orderDirection);
					model.put("genderMap", User.GENDER_MAP);
					model.put("certTypeMap", User.CERTIFICATE_TYPE_MAP);
					model.put("list", rs.getItems());
					return "base/admin/user/list";
		}
	   

	   if (StringUtils.isNotBlank(attentionstatus)&&!"-100".equals(attentionstatus)) {
           
	       query.addFilterEqual("attentionstatus", attentionstatus);
       }
	   
		if (StringUtils.isNotBlank(gender)) {
			query.addFilterEqual("gender", gender);
		}
		List<Filter> fList = new ArrayList<Filter>();
		if (StringUtils.isNotBlank(searchContent)) {
			fList.add(new Filter("username", "%" + searchContent + "%",
					Filter.OP_LIKE));
			fList.add(new Filter("name", "%" + searchContent + "%",
					Filter.OP_LIKE));
			fList.add(new Filter("nickName", "%" + searchContent + "%",
					Filter.OP_LIKE));
			fList.add(new Filter("email", "%" + searchContent + "%",
					Filter.OP_LIKE));
			fList.add(new Filter("mobile", "%" + searchContent + "%",
					Filter.OP_LIKE));
			fList.add(new Filter("phone", "%" + searchContent + "%",
					Filter.OP_LIKE));
			fList.add(new Filter("certificateCode", "%" + searchContent + "%",
					Filter.OP_LIKE));
			// fList.add(new Filter("organization.name", "%"+searchContent+"%",
			// Filter.OP_LIKE));
			// Long timeStart = DateUtils.parseStringToLong(searchContent);
			// query.addFilter("birthday", timeStart,
			// QueryFilter.OP_GREATER_OR_EQUAL);
			// Long timeEnd = DateUtils.parseStringToLong(searchContent);
			// query.addFilter("birthday", timeEnd,
			// QueryFilter.OP_LESS_OR_EQUAL);
			for (int key : User.CERTIFICATE_TYPE_MAP.keySet()) {
				if (User.CERTIFICATE_TYPE_MAP.get(key).equals(searchContent)) {
					fList.add(new Filter("certificateType", key,
							Filter.OP_EQUAL));
				}
			}
		}
		query.addFilter("", fList, Filter.OP_OR);
		query.addFilterEqual("isDel", User.ISDEL_NO);
		query.addFilterEqual("domain", LoginSessionHelper.getCurrentDomain(req));
		query.addFilterEqual("usertype", User.USER_TYPE_COMMON);
		if (StringUtils.isNotBlank(orderField)
				&& StringUtils.isNotBlank(orderDirection)) {
			model.put("orderField", orderField);
			model.put("orderDirection", orderDirection);
			if (orderDirection.equals(SortCss.ASC)) {
				query.addSort(new Sort(orderField, Sort.ORDER_ASC));
			} else {
				query.addSort(new Sort(orderField, Sort.ORDER_DES));
			}
		} else {
			query.addSort(new Sort("createTime", Sort.ORDER_DES));
			model.put("orderField", "createTime");
			model.put("orderDirection", SortCss.DESC);
		}

		ResultSet<User> res = userService.list(query, page);

		if (res == null) {
			model.put("page", page);
		} 
		else {
			// 以下代码是对用户是否绑定进行的查询
			List<User> users = res.getItems();
//
			List<UserVo> userVos = new ArrayList<UserVo>();
			for (int i = 0; i < users.size(); i++) {
				UserVo uvo = new UserVo();
				String baseid = users.get(i).getId();
				try {
					org.apache.commons.beanutils.BeanUtils.copyProperties(uvo,
						users.get(i));
				} catch (Exception e) {
					logger.error("UserVo copy User Exception", e);
				}
//				IXinUser iXinUser = iXinUserService.getIxinUserByBaseId(baseid,
//						domain);
//				uvo.setiXinUser(iXinUser);
//				
				List<UserLinkJobLevel> userLinkJobLevels=this.userLinkJobLevelService.getlists(baseid);
				if(userLinkJobLevels!=null && userLinkJobLevels.size()>0){
					String joblevelId=userLinkJobLevels.get(0).getJoblevelid();
					JobLevelEntity jobLevelEntity=this.jobLevelService.get(joblevelId);
					uvo.setJobLevelEntity(jobLevelEntity);
				}
				userVos.add(uvo);
//
			}
	
			model.put("genderMap", User.GENDER_MAP);
			model.put("certTypeMap", User.CERTIFICATE_TYPE_MAP);
			model.put("list", userVos);
			model.put("pager", res.getPage());
		}

		return "base/admin/user/list";
	}

	/**
	 * to添加
	 * 
	 * @param req
	 * @param model
	 * @return
	 */
	@RequestMapping("adduser")
	public String toAdd(HttpServletRequest req, ModelMap model) {
		model.put("genderMap", User.GENDER_MAP);
		model.put("certTypeMap", User.CERTIFICATE_TYPE_MAP);
		model.put("nowtime", DateUtils.getCurrentTime());
		model.put("rootId", getRootId(req));
		model.put("domain", LoginSessionHelper.getCurrentDomain(req));
		return "base/admin/user/adduser";
	}
	

	
//	/**
//	 * 添加临时用户
//	 * 
//	 * @param req
//	 * @param model
//	 * @return
//	 */
//	@RequestMapping(value = "doaddcasualuser", method = RequestMethod.POST)
//	@ResponseBody
//	public ModelMap addcasualuser(HttpServletRequest req, ModelMap model) {
//		String domain = LoginSessionHelper.getCurrentDomain(req);
//		String orgId = getRootId(req);
//		
//		userService.addCasulUser(domain,orgId);
//		
//		model.put("flag", true);
//		model.put("message", "添加成功!");
//	
//		return model;
//	}

	/**
	 * 添加
	 * 
	 * @param req
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "doadd", method = RequestMethod.POST)
	@ResponseBody
	public ModelMap add(HttpServletRequest request, ModelMap model) {
		String name = HtmlUtils.getAvailableString(request, "name");
		String password = HtmlUtils.getAvailableString(request, "password");
		String userName = HtmlUtils.getAvailableString(request, "userName");
		String nickName = HtmlUtils.getAvailableString(request, "nickName");
		String orgId = request.getParameter("orgId");
		String jobLevelId=request.getParameter("jobLevelId");
		String email = StringUtils.trimToEmpty(request.getParameter("email"));
		String gender = request.getParameter("gender");
		String birthday = request.getParameter("birthday");
		String type = request.getParameter("type");
		String mobile = StringUtils.trimToEmpty(request.getParameter("mobile"));
		String phone = request.getParameter("phone");
		String certificateType = request.getParameter("certificateType");
		String certificateCode = request.getParameter("certificateCode");
		String domain = LoginSessionHelper.getCurrentDomain(request);
		String effictivestart = request.getParameter("effictivestart");
		String effictiveend = request.getParameter("effictiveend");
		String labels = request.getParameter("labels");
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("username", userName);
		map.put("email", email);
		map.put("mobile", mobile);
		boolean flag = userService.queryUserNameAndEmailAndMobileIsRepeat(null,
				domain, map);
		if (!flag) {
			User entity = new User();
			entity.setId(IdGenerator.nextId32().toString());
			entity.setDomain(domain);
			entity.setUsername(userName);
			entity.setEmail(email.toLowerCase());
			if (StringUtils.isNotBlank(name)) {
				entity.setName(name);
			}
			if (StringUtils.isNotBlank(nickName)) {
				entity.setNickName(nickName);
			}
			if (StringUtils.isNotBlank(mobile)) {
				entity.setMobile(StringUtils.trimToNull(mobile));
			}
			if (StringUtils.isNotBlank(phone)) {
				entity.setPhone(phone);
			}
			if (StringUtils.isNotBlank(gender)) {
				entity.setGender(Integer.parseInt(gender));
			}
			if (StringUtils.isNotBlank(birthday)) {
				entity.setBirthday(DateUtils.parseStringToLong(birthday));
			}
			if (StringUtils.isNotBlank(type)) {
				entity.setType(Integer.parseInt(type));
			}
			if (StringUtils.isNotBlank(certificateType)) {
				entity.setCertificateType(Integer.parseInt(certificateType));
			}
			if (StringUtils.isNotBlank(certificateCode)) {
				entity.setCertificateCode(certificateCode);
			}
			if(StringUtils.isNotBlank(effictivestart)){
				entity.setEffictivestart(DateUtils.parseStringToLong(effictivestart));
			} else {
				entity.setEffictivestart(null);
			}
			if(StringUtils.isNotBlank(effictiveend)){
				entity.setEffictiveend(DateUtils.parseStringToLong(effictiveend));
			} else {
				entity.setEffictiveend(null);
			}
			entity.setLabels(labels);
			entity.setCreateTime(System.currentTimeMillis());

			Organization org = organizationService.get(orgId);
			entity.setOrganization(org);

			String id = userService.insert(entity);
			
//			OpLogServiceWrapper.addUser(id, 0, domain);
			
			//添加关联关系
			UserLinkJobLevel userLinkJobLevel=new UserLinkJobLevel();
			userLinkJobLevel.setJoblevelid(jobLevelId);
			userLinkJobLevel.setUserid(entity.getId());
			this.userLinkJobLevelService.insert(userLinkJobLevel);

			addAccount(entity, password, request);
			
			labelEntityService.doAdd(entity.getLabels(),entity.getId(),LabelRelationEntity.RTYPE_USER,entity);

			model.put("flag", true);
			model.put("message", "添加成功！");
		} else {
			model.put("flag", false);
			model.put("message", "添加失败！");
		}
		return model;
	}

	public static final String defalut_pwd = Account.DEFAULT_PWD;

	// 添加帐号信息
	private void addAccount(User entity, String pass, HttpServletRequest req) {
		if (null == entity) {
			throw new IllegalArgumentException(
					"create user'accoount due to error,the entity must not be null!");
		}

		String domain = entity.getDomain();
		String creator = LoginSessionHelper.getCurrentUserId(req);
		String mobile = entity.getMobile();
		String email = entity.getEmail();
		String username = entity.getUsername();

		String pwd_encode = PasswordEncoder
				.encode(pass, String.valueOf(domain));

		if (StringUtils.isNotBlank(mobile)) {
			Account account = new Account();
			account.setAccount(mobile.toLowerCase());
			account.setType(Account.Type.phone.getCode());
			account.setDomainid(domain);
			account.setPwd(pwd_encode);
			account.setStatus(Status.normal.getCode());
			account.setUid(entity.getId());
			account.setCreator(creator);
			account.setCreatetime(System.currentTimeMillis());
			accountService.insert(account);
		}

		if (StringUtils.isNotBlank(email)) {
			Account account = new Account();
			account.setAccount(email.toLowerCase());
			account.setType(Account.Type.email.getCode());
			account.setDomainid(domain);
			account.setPwd(pwd_encode);
			account.setStatus(Status.normal.getCode());
			account.setUid(entity.getId());
			account.setCreator(creator);
			account.setCreatetime(System.currentTimeMillis());
			accountService.insert(account);
		}

		if (StringUtils.isNotBlank(username)
				&& !username.equalsIgnoreCase(email)) {
			Account account = new Account();
			account.setAccount(username.toLowerCase());
			account.setType(Account.Type.username.getCode());
			account.setDomainid(domain);
			account.setPwd(pwd_encode);
			account.setStatus(Status.normal.getCode());
			account.setUid(entity.getId());
			account.setCreator(creator);
			account.setCreatetime(System.currentTimeMillis());
			accountService.insert(account);

		}
	}

	/**
	 * to更新
	 * 
	 * @param req
	 * @param model
	 * @return
	 */
	@RequestMapping("updateuser")
	public String toupdate(HttpServletRequest req, ModelMap model) {

		String id = req.getParameter("id");
		if (StringUtils.isBlank(id)) {
			return "redirect:/base/admin/user/usermanage.xhtml";
		}

		User entity = userService.get(id);
		if (null == entity) {
			return "redirect:/base/admin/user/usermanage.xhtml";
		}
		
		String domain = entity.getDomain();
		String mobile = entity.getMobile();
		String email = entity.getEmail();
		String username = entity.getUsername();
		Account account = null;
		if (StringUtils.isNotBlank(mobile)) { 
			account = accountService.getByAccountAndUid(mobile, id);
		}else if (StringUtils.isNotBlank(email)) { 
			account = accountService.getByAccountAndUid(email, id);
		} else	if (StringUtils.isNotBlank(username) ) { 
			account = accountService.getByAccountAndUid(username, id);
		}
		if(account != null){
			String pwd_encode = PasswordEncoder
					.decode(account.getPwd(), String.valueOf(domain));

			model.put("password", pwd_encode);
		}
		
        //得到职级和用户的关联关系
		List<UserLinkJobLevel> userLinkJobLevels=this.userLinkJobLevelService.getlists(id);
		
		if(userLinkJobLevels!=null && userLinkJobLevels.size()>0){
			String joblevelId=userLinkJobLevels.get(0).getJoblevelid();
			JobLevelEntity jobLevelEntity=this.jobLevelService.get(joblevelId);
			model.put("jobLevelEntity", jobLevelEntity);
		}
		model.put("entity", entity);
		model.put("genderMap", User.GENDER_MAP);
		model.put("certTypeMap", User.CERTIFICATE_TYPE_MAP);
		model.put("domain", LoginSessionHelper.getCurrentDomain(req));
		
		return "base/admin/user/updateuser";
	}

	/**
	 * 更新
	 * 
	 * @param req
	 * @param model
	 * @return
	 */
	@RequestMapping("doupdate")
	@ResponseBody
	public ModelMap update(HttpServletRequest req, ModelMap model) {
		String id = req.getParameter("id");

		if (StringUtils.isBlank(id)) {
			model.put("flag", false);
			model.put("message", "修改失败！");

			return model;
		}

		// String username = HtmlUtils.getAvailableString(req, "email");
		String name = HtmlUtils.getAvailableString(req, "name");
		String userName = HtmlUtils.getAvailableString(req, "userName");
		String nickName = HtmlUtils.getAvailableString(req, "nickName");
		String orgId = req.getParameter("orgId");
		String email = req.getParameter("email");
		String gender = req.getParameter("gender");
		String birthday = req.getParameter("birthday");
		String type = req.getParameter("type");
		String mobile = req.getParameter("mobile");
		String phone = req.getParameter("phone");
		String jobLevelId=req.getParameter("jobLevelId");
		String certificateType = req.getParameter("certificateType");
		String certificateCode = req.getParameter("certificateCode");
		String effictivestart = req.getParameter("effictivestart");
		String effictiveend = req.getParameter("effictiveend");
		String labels = req.getParameter("labels");
		
		
		//for ennapp
		String area = req.getParameter("area");
		String category = req.getParameter("category");
		

		Map<String, String> map = new HashMap<String, String>();
		map.put("username", userName);
		map.put("email", email);
		map.put("mobile", mobile);
		String domain = LoginSessionHelper.getCurrentDomain(req);
		boolean flag = userService.queryUserNameAndEmailAndMobileIsRepeat(id,
				domain, map);
		if (!flag) {
			User entity = userService.get(id);
			if (null == entity) {
				model.put("flag", false);
				model.put("message", "修改失败！");
				return model;
			}
			if (StringUtils.isNotBlank(userName)) {
				entity.setUsername(userName);
			}
//			if (StringUtils.isNotBlank(email)) {
//				// entity.setUsername(email.toLowerCase());
//			}
			if (email!=null) {
				entity.setEmail(email.toLowerCase());
			}

			if (StringUtils.isNotBlank(name)) {
				entity.setName(name);
			}
			if (StringUtils.isNotBlank(nickName)) {
				entity.setNickName(nickName);
			}
//			if (StringUtils.isNotBlank(mobile)) {
//			}
			if (email!=null) {
				entity.setMobile(StringUtils.trimToNull(mobile));
			}
			if (StringUtils.isNotBlank(phone)) {
				entity.setPhone(phone);
			}
			if (StringUtils.isNotBlank(gender)) {
				entity.setGender(Integer.parseInt(gender));
			}
			if (StringUtils.isNotBlank(birthday)) {
				entity.setBirthday(DateUtils.parseStringToLong(birthday));
			}
			if (StringUtils.isNotBlank(type)) {
				entity.setType(Integer.parseInt(type));
			}
			if (StringUtils.isNotBlank(certificateType)) {
				entity.setCertificateType(Integer.parseInt(certificateType));
			}
			if (StringUtils.isNotBlank(certificateCode)) {
				entity.setCertificateCode(certificateCode);
			}
			if(StringUtils.isNotBlank(effictivestart)){
				entity.setEffictivestart(DateUtils.parseStringToLong(effictivestart));
			} else {
				entity.setEffictivestart(null);
			}
			if(StringUtils.isNotBlank(effictiveend)){
				entity.setEffictiveend(DateUtils.parseStringToLong(effictiveend));
			} else {
				entity.setEffictiveend(null);
			}
			
			
			if(StringUtils.isNotBlank(area)){
			    entity.setArea(area);
			}else{
			    entity.setArea(null);
			}
			if(StringUtils.isNotBlank(category)){
			    
			    //角色由 学员 或指导人 变为其他， 需要删除辅导关系
			    String oldCategory = entity.getCategory();
//			    if(!category.equals(oldCategory) &&  ( "0".equals(oldCategory)  ||  "1".equals(oldCategory)) ){
//			        coachUserService.deleteCoachReleation(domain, id);
//			    }
			    
			    entity.setCategory(category);
			}
			
			boolean isSync = false;
			if(entity.getSynchronousstatus() == 1){
				isSync = true;
				entity.setSynchronousstatus(0);
				entity.setSynctype(OpLog.ACTION_UPDATE);
			}else if(entity.getSynchronousstatus()==-1){
			    isSync = true;
                entity.setSynchronousstatus(0);
			}

			Organization org = organizationService.get(orgId);
			entity.setOrganization(org);
			
			entity.setLabels(labels);
			
			entity.setUpdatetime(System.currentTimeMillis());
			
			userService.update(entity);
			
			labelEntityService.doAdd(entity.getLabels(),entity.getId(),LabelRelationEntity.RTYPE_USER,entity);
			
//			if(isSync){
//				OpLogServiceWrapper.addUser(id, 2, domain);
//			}
			
			List<UserLinkJobLevel> userLinkJobLevels=this.userLinkJobLevelService.getlists(entity.getId());
			if(userLinkJobLevels!=null && userLinkJobLevels.size()>0){
				UserLinkJobLevel userLinkJobLevel=userLinkJobLevels.get(0);
				userLinkJobLevel.setJoblevelid(jobLevelId);
				this.userLinkJobLevelService.update(userLinkJobLevel);
			}else{
				//添加关联关系
				UserLinkJobLevel userLinkJobLevel=new UserLinkJobLevel();
				userLinkJobLevel.setJoblevelid(jobLevelId);
				userLinkJobLevel.setUserid(entity.getId());
				this.userLinkJobLevelService.insert(userLinkJobLevel);
			}
			String password = req.getParameter("password");
			updateAccunt(entity, password,LoginSessionHelper.getCurrentUserId(req),LoginSessionHelper.getCurrentDomain(req));
			model.put("flag", true);
			model.put("message", "修改成功！");
		} else {
			model.put("flag", false);
			model.put("message", "修改失败！");
			return model;
		}
		return model;
	}

	// 修改User关联的Accunt表
	public void updateAccunt(User entity, String password,String uid,String domain) {    
		String pwd_encode = PasswordEncoder
				.encode(password, String.valueOf(domain));

		List<Account> accounts = accountService.selectAccount(entity.getId());
		if (CollectionUtils.isEmpty(accounts)) {
			throw new RuntimeException(String.format(
					"the user which id=[%s] not has an account!",
					entity.getId()));
		}
		
		Map<Integer,Account> map = new  HashMap<Integer, Account>();
		for (Account account : accounts) {
			if (account.getType() == Account.Type.email.getCode()) {
				map.put(0,account);
			}else if(account.getType() == Account.Type.phone.getCode()){
				map.put(1, account);
			}else{
				map.put(2, account);
			}
			
		}
		String mobile = entity.getMobile();
		String email = entity.getEmail();
		for(int i = 0 ; i < 3 ;i++){
			boolean isChange = false;
			if(map.get(i)==null){
				if (StringUtils.isNotBlank(mobile)&&i==1) {
					Account account = new Account();
					account.setAccount(mobile.toLowerCase());
					account.setType(Account.Type.phone.getCode());
					account.setDomainid(domain);
					account.setPwd(pwd_encode);
					account.setStatus(Status.normal.getCode());
					account.setUid(entity.getId());
					account.setCreator(uid);
					account.setCreatetime(System.currentTimeMillis());
					accountService.insert(account);
				}

				if (StringUtils.isNotBlank(email)&&i==0) {
					Account account = new Account();
					account.setAccount(email.toLowerCase());
					account.setType(Account.Type.email.getCode());
					account.setDomainid(domain);
					account.setPwd(pwd_encode);
					account.setStatus(Status.normal.getCode());
					account.setUid(entity.getId());
					account.setCreator(uid);
					account.setCreatetime(System.currentTimeMillis());
					accountService.insert(account);
				}
			}else{
				if (map.get(i).getType() == Account.Type.email.getCode()
						&& !map.get(i).getAccount()
								.equalsIgnoreCase(entity.getEmail())) {
					map.get(i).setAccount(entity.getEmail().toLowerCase());
					isChange = true;
				}

				if (map.get(i).getType() == Account.Type.phone.getCode()
						&& !map.get(i).getAccount().equalsIgnoreCase(
								entity.getMobile())) {
					map.get(i).setAccount(entity.getMobile());
					isChange = true;
				}

				if (map.get(i).getType() == Account.Type.username.getCode()
						&& !map.get(i).getAccount().equalsIgnoreCase(
								entity.getUsername())) {
					map.get(i).setAccount(entity.getUsername());
					isChange = true;
				}
				if(!pwd_encode.equals(map.get(i).getPwd())){
					map.get(i).setPwd(pwd_encode);
					isChange = true;
				}

				if (isChange) {
					map.get(i).setUpdater(uid);
					map.get(i).setUpdatetime(System.currentTimeMillis());
					if (StringUtils.isBlank(map.get(i).getAccount())) {
						this.accountService.delete(map.get(i));
					}else{
						this.accountService.update(map.get(i));
					}
				}
			}
		}
	
//		for (Account account : accounts) {
//			boolean isChange = false;
//			if (account.getType() == Account.Type.email.getCode()
//					&& !account.getAccount()
//							.equalsIgnoreCase(entity.getEmail())) {
//				account.setAccount(entity.getEmail().toLowerCase());
//				isChange = true;
//			}
//
//			if (account.getType() == Account.Type.phone.getCode()
//					&& !account.getAccount().equalsIgnoreCase(
//							entity.getMobile())) {
//				account.setAccount(entity.getMobile());
//				isChange = true;
//			}
//
//			if (account.getType() == Account.Type.username.getCode()
//					&& !account.getAccount().equalsIgnoreCase(
//							entity.getUsername())) {
//				account.setAccount(entity.getUsername());
//				isChange = true;
//			}
//			if(!pwd_encode.equals(account.getPwd())){
//				account.setPwd(pwd_encode);
//				isChange = true;
//			}
//
//			if (isChange) {
//				account.setUpdater(LoginSessionHelper.getCurrentUserId(req));
//				account.setUpdatetime(System.currentTimeMillis());
//				this.accountService.update(account);
//			}
//		}
	}

	/**
	 * 删除
	 * @param req
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "delete", method = RequestMethod.POST)
	@ResponseBody
	public ModelMap delete(HttpServletRequest req, ModelMap model) {
		String[] ids = req.getParameterValues("ids");
		String domain = LoginSessionHelper.getCurrentDomain(req);
		
		model.put("flag", false);

		if (ArrayUtils.isEmpty(ids)) {
			model.put("message", "删除失败，传入的记录id格式不正确！");
			return model;
		}
		for (String id : ids) {
			User user = userService.get(id);
			if(user!=null)
			{
				
				if(user.getSynchronousstatus() == 0){
					//user.setSynchronousstatus(-2);
				    user.setSynctype(OpLog.ACTION_DEL);
				} else if(user.getSynchronousstatus() == 1){
					user.setSynchronousstatus(0);
					user.setSynctype(OpLog.ACTION_DEL);
				} else if(user.getSynchronousstatus()==-1){
				    user.setSynchronousstatus(0);
                    user.setSynctype(OpLog.ACTION_DEL);
				}
				user.setIsDel(User.ISDEL_YES);
				user.setUpdatetime(System.currentTimeMillis());
				userService.update(user);
				
				//用户信息同步
//				OpLogServiceWrapper.addUser(id, 1, domain);
				
//				IXinUser iXinUser = this.iXinUserService
//						.getIxinUserByBaseId(id, domain);
//				if (iXinUser != null ) {
//				   this.iXinUserService.deleteByid(iXinUser.getId());
//				}
				// 清空redis缓存
				checkBindStatusService.remove(id);
			}
		}
		model.put("flag", true);
		delAccount(req);
		return model;
	}

	// 删除user关联的Accunt表  以及关联的职级
	private void delAccount(HttpServletRequest req) {
		String[] ids = req.getParameterValues("ids");
		for (String id : ids) {
			accountService.deleteAccunt(id);
			List<UserLinkJobLevel> list = userLinkJobLevelService.getlists(id);
			if (list!=null&&list.size()>0)
			{
				for (Iterator<UserLinkJobLevel> iterator = list.iterator();iterator.hasNext();)
				{
					userLinkJobLevelService.delete(iterator.next());
				}
			}
		}
	}
	
	/**
	 * 详情
	 * 
	 * @param req
	 * @param model
	 * @return
	 */
	@RequestMapping("userdetail")
	public String detail(HttpServletRequest req, ModelMap model) {
		String id = req.getParameter("id");
		if (StringUtils.isBlank(id)) {
			return "redirect:/base/admin/user/usermanage.xhtml";
		}

		User entity = userService.get(id);
		if (null == entity) {
			return "redirect:/base/admin/user/usermanage.xhtml";
		}

		model.put("entity", entity);
		
		List<UserLinkJobLevel> userLinkJobLevels=this.userLinkJobLevelService.getlists(id);
		if(userLinkJobLevels!=null && userLinkJobLevels.size()>0){
			JobLevelEntity jobLevelEntity=this.jobLevelService.get(userLinkJobLevels.get(0).getJoblevelid());
			model.put("jobLevelEntity",jobLevelEntity);
		}
		
		model.put("genderMap", User.GENDER_MAP);
		model.put("certTypeMap", User.CERTIFICATE_TYPE_MAP);
		return "base/admin/user/userdetail";
	}

	@RequestMapping(value = "uniqueValidate", method = RequestMethod.POST)
	@ResponseBody
	public boolean uniqueValidate(HttpServletRequest req, ModelMap model) {
		String username = req.getParameter("username");
		String uid = req.getParameter("uid");
		Map<String, String> map = new HashMap<String, String>();
		map.put("username", username);
		String domain = LoginSessionHelper.getCurrentDomain(req);
		boolean flag = userService.queryUserNameAndEmailAndMobileIsRepeat(uid, domain, map);
		return flag;
	}
	
	@RequestMapping(value = "uniqueValidate2", method = RequestMethod.POST)
	@ResponseBody
	public ModelMap uniqueValidate2(HttpServletRequest req, ModelMap model) {
		String username = req.getParameter("username");
		String uid = req.getParameter("uid");
		Map<String, String> map = new HashMap<String, String>();
		map.put("username", username);
		String domain = LoginSessionHelper.getCurrentDomain(req);
		String type = null;
		//查询用的的用户名、邮箱、手机是否重复
		if (userService.queryUserNameAndEmailAndMobileIsRepeat(uid, domain, map)) {
			type = "1";
		}
		//验证用户名是否包含中文汉字,空格，特殊字符
		Pattern p = Pattern.compile("[^0-9A-Za-z@\\-_.]+|[\u4e00-\u9fa5]+|\\s+");
		Matcher m = p.matcher(username);
		if (m.find()) {
			type = "2";
		}
		//验证用户名是否超过63个英文字符
		if( username.toCharArray().length > 32) {
			type = "3";
		}
		model.put("type", type);
		return model;
	}

	@RequestMapping(value = "cancelbind", method = RequestMethod.POST)
	@ResponseBody
	public boolean cancelBind(HttpServletRequest request) {
		String domain = LoginSessionHelper.getCurrentDomain(request);
		String id = request.getParameter("id");
		if (StringUtils.isBlank("id")) {
			return false;
		}

		User user = this.userService.get(id);
		if (user == null) {
			return false;
		}
		user.setIsbind(0);
		this.userService.update(user);
		
		IXinUser iXinUser = this.iXinUserService.getIxinUserByBaseId(id, domain);
		if (iXinUser == null ) {
			return false;
		}
		iXinUser.setBase_id(null);
		iXinUserService.saveOrUpdate(iXinUser);
		// 清空redis缓存
		checkBindStatusService.remove(id);
		return true;
	}
	
	
		//导出活动报名的记录信息
		@SuppressWarnings("deprecation")
		@RequestMapping(value="exportuser",method=RequestMethod.POST)
		@ResponseBody
		public ModelMap exportuser(HttpServletRequest req,ModelMap model){
				
			
			
			String domain = LoginSessionHelper.getCurrentDomain(req);
			String searchContent = HtmlUtils.getAvailableString(req,
					"searchContent");
			String orgId = req.getParameter("orgId");
			String gender = req.getParameter("gender");
			String orderField = req.getParameter("orderField");
			String orderDirection = req.getParameter("orderDirection");
			String banding = req.getParameter("banding");
			String attentionstatus = req.getParameter("attentionstatus");
			QueryCondition query = new QueryCondition();
			String rootid = "domain_" + LoginSessionHelper.getCurrentDomain(req);
			List<String> childOrgIds = new ArrayList<String>();
			Page page = PageUtil.getPage(req);
			if (StringUtils.isNotBlank(orgId)) {
				if (rootid.equals(orgId)) {

				} else {
					childOrgIds = organizationService.getChildOrgIds(
							orgId, req);
					query.addFilter("organization.id", childOrgIds, Filter.OP_IN);
				}
				// query.addFilterEqual("organization.id", orgId);
			}
			//有限制绑定条件的时候特殊查询
		   if (StringUtils.isNotBlank(banding)&&!"-1".equals(banding)) {
						if (StringUtils.isBlank(searchContent)) {
							searchContent = "";
						}
						if (StringUtils.isBlank(orderField)
								&& StringUtils.isBlank(orderDirection)) {
							  orderField = "createTime";
							  orderDirection = "desc";
						}
		   }
					//	ResultSet<UserVo> rs = userService.queryListByAllParams(domain, searchContent, childOrgIds, gender, orderField, orderDirection, banding,attentionstatus, page);
						List<UserVo> list = this.userService.ListByAllParams(domain, searchContent, childOrgIds, gender, orderField, orderDirection, banding, attentionstatus);
		   
			//正文
			//得到组织好的所有数据
			//List<UserVo> list = this.getAllSysUser(req);
			if (CollectionUtils.isEmpty(list)){
				model.put("message", "暂时没有用户信息！");
				model.put("flag",false);
				return model;
			}
			
//			TokenInfo tokenInfo = this.tokenService.getTokenInfoByDomain(LoginSessionHelper.getCurrentDomain(req));
//			boolean isWxQy = tokenInfo.isWXQY();
			//得到总行数
			int CountColumnNum = list.size();
				 
			UserVo record = null;
		    // 创建Excel文档
		    HSSFWorkbook hwb = new HSSFWorkbook();
		        
		    // sheet 对应一个工作页
		    HSSFSheet sheet = hwb.createSheet("用户基本信息表");
		    HSSFRow firstrow = sheet.createRow(0); // 下标为0的行开始\
		    HSSFCellStyle style = ExcelOptionUtil.getBaseStyle(hwb);
		        
		    HSSFCell[] firstcell = new HSSFCell[9];
		    String[] names = new String[9];
		    names[0] = "用户名";
		    names[1] = "姓名";
		    names[2] = "邮箱";
		    names[3] = "手机";
		    names[4] = "部门";
		    names[5] = "性别";
		    names[6] = "绑定状态";
//		    if(isWxQy){
//		    	 names[7] = "关注状态";
//				 names[8] = "同步状态";
//		    } else {
		    	 names[7] = "";
				 names[8] = "";
//		    }
		   
	        for (int j = 0; j < 9; j++) {
	            firstcell[j] = firstrow.createCell(j);
	            firstcell[j].setCellValue(new HSSFRichTextString(names[j]));
	            firstcell[j].setCellStyle(style);
	        }
		        
		        
	        for (int i = 0; i < CountColumnNum; i++) {
	            // 创建一行
	            HSSFRow row = sheet.createRow(i + 1);
	            // 得到要插入的每一条记录
	            record = list.get(i);
                HSSFCell username = row.createCell(0);
                username.setCellValue(record.getUsername());
                username.setCellStyle(style);
                
                HSSFCell uname = row.createCell(1);
                uname.setCellValue(record.getName());
                uname.setCellStyle(style);
                
                HSSFCell email = row.createCell(2);
                email.setCellValue(record.getEmail());
                email.setCellStyle(style);
                
                HSSFCell mobile = row.createCell(3);
                mobile.setCellValue(record.getMobile());
                mobile.setCellStyle(style);;
                
                HSSFCell orgname = row.createCell(4);
                orgname.setCellValue(record.getOrganization().getName());
                orgname.setCellStyle(style);
                
                HSSFCell ex_gender = row.createCell(5);
                if (record.getGender()==1){
                	ex_gender.setCellValue("男"); 
                }else{
                	ex_gender.setCellValue("女"); 
                }
                ex_gender.setCellStyle(style);

                HSSFCell isBinding = row.createCell(6);
                if (record.getIsbind()==1){
                	isBinding.setCellValue("已绑定");
                }else{
                	isBinding.setCellValue("未绑定");
                }
                isBinding.setCellStyle(style);
                
                HSSFCell attentStatusCell = row.createCell(7);
                HSSFCell syncStatusCell = row.createCell(8);
                String attentStatus = "";
                String syncStatus = "";
//                if(isWxQy){
//                    if (record.getAttentionstatus()==0){
//                    	attentStatus = "未邀请";
//                    }else if (record.getAttentionstatus()==1){
//                    	attentStatus = "已邀请";
//                    }else if (record.getAttentionstatus()==2){
//                    	attentStatus = "已关注";
//                    }else if (record.getAttentionstatus()==3){
//                    	attentStatus = "取消关注";
//                    }else if (record.getAttentionstatus()==4){
//                    	attentStatus = "未关注";
//                    }else if (record.getAttentionstatus()==-2){
//                    	attentStatus = "已冻结";
//                    }
//                    
//                    //0:未同步  1:已同步 -1 失败 －2无需同步 －4 企业号内已不存在
//                    if (record.getSynchronousstatus()==0 && record.getSynctype() == 0){
//                    	syncStatus = "新增未同步";
//                    }else if (record.getSynchronousstatus()==0 && record.getSynctype() == 2){
//                    	syncStatus = "修改未同步";
//                    }else if (record.getSynchronousstatus()==1){
//                    	syncStatus = "已同步";
//                    }else if (record.getSynchronousstatus()==-1){
//                    	syncStatus = "同步失败";
//                    }else if (record.getSynchronousstatus()==-2 || record.getSynchronousstatus()==-4){
//                    	syncStatus = "无需同步";
//                    }
//                }
                attentStatusCell.setCellValue(attentStatus);
                attentStatusCell.setCellStyle(style);
                syncStatusCell.setCellValue(syncStatus);
                syncStatusCell.setCellStyle(style);
	        }
	        //如果文件目录不存在则创建
	        File file = new File(req.getRealPath("/")+Constants.EXPORT_RECORD);
	        if (!file.exists()){
	        	file.mkdirs();
	        }
			//得到要创建的文件的在项目中的绝对地址
	        String relativepath = String.format("%s%s%s.xls",Constants.EXPORT_RECORD,"用户信息表",System.currentTimeMillis());
			String path1 = String.format("%s%s",req.getRealPath("/"),relativepath);
	        // 创建文件输出流，准备输出电子表格
			OutputStream out = null;
			try {
				out = new FileOutputStream(path1);
				hwb.write(out);
			} catch (Exception e) {
				logger.error("export userinfo due to error,the message is %s",e);
				model.put("message", "用户信息导出失败！");
				model.put("flag",false);
				return model;
			} finally{
				try {
					out.close();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					logger.error("OutputStream No normally closed,the message is %s",e);
					model.put("message", "用户信息导出失败！");
					model.put("flag",false);
					return model;
				}
			}
			model.put("message", "用户信息导出成功！");
			model.put("flag", true);
			model.put("userexcelpath",relativepath);
	        return model;
		   
		}
	
	/**
	 * 获取绑定和未绑定的所有数据,进行数据组织
	 * @param req
	 * @return
	 */
	public List<UserVo> getAllUser(HttpServletRequest req){
		String domain = LoginSessionHelper.getCurrentDomain(req);
		if (StringUtils.isBlank(domain)){
			return null;
		}
		List<UserVo> userVos = new ArrayList<UserVo>();
		//获取所有已绑定用户信息
		List<UserVo> bindingUserVos = userService.queryUserByBinding(domain, User.ISDEL_NO);
		//获取所有未绑定用户信息
		List<UserVo> noBindingUserVos = userService.queryUserByNotBinding(domain,User.ISDEL_NO);
		
		//先放入已绑用户再放入未绑定用户
		if (CollectionUtils.isNotEmpty(bindingUserVos)){
			for (int i = 0; i < bindingUserVos.size(); i++) {
				userVos.add(bindingUserVos.get(i));
			}
		}
		if (CollectionUtils.isNotEmpty(noBindingUserVos)){
			for (int i = 0; i < noBindingUserVos.size(); i++) {
				userVos.add(noBindingUserVos.get(i));
			}
		}
		
		if (CollectionUtils.isEmpty(userVos)){
			return null;
		}
		return userVos;
	}
	
	/**
	 * 得到非临时用户
	 */
	private List<UserVo> getAllSysUser(HttpServletRequest req){
		String domain = LoginSessionHelper.getCurrentDomain(req);
		if (StringUtils.isBlank(domain)){
			return null;
		}
		List<UserVo> userVos = new ArrayList<UserVo>();
		//获取所有已绑定用户信息
		List<UserVo> bindingUserVos = userService.queryUserByBinding(domain, User.ISDEL_NO);
		//获取所有未绑定用户信息
		List<UserVo> noBindingUserVos = userService.queryUserByNotBinding(domain,User.ISDEL_NO);
		
		//先放入已绑用户再放入未绑定用户
		if (CollectionUtils.isNotEmpty(bindingUserVos)){
			for (int i = 0; i < bindingUserVos.size(); i++) {
				if(bindingUserVos.get(i).getUsertype()==User.USER_TYPE_COMMON){
					userVos.add(bindingUserVos.get(i));
				}
			}
		}
		if (CollectionUtils.isNotEmpty(noBindingUserVos)){
			for (int i = 0; i < noBindingUserVos.size(); i++) {
				if(noBindingUserVos.get(i).getUsertype()==User.USER_TYPE_COMMON){
					userVos.add(noBindingUserVos.get(i));
				}
			}
		}
		
		if (CollectionUtils.isEmpty(userVos)){
			return null;
		}
		return userVos;
	}
	
	
    /**
     * 禁用账号
     * @param request
     * @return
     */
	@RequestMapping(value="forbidaccount",method=RequestMethod.POST)
	@ResponseBody
	public boolean forbidaccount(HttpServletRequest request){
		
		String uid=request.getParameter("uid");
		String domain=LoginSessionHelper.getCurrentDomain(request);
		
		if(StringUtils.isBlank(uid))
		{
			return false;
		}		
		
		Map<String,Object> params=new HashMap<String, Object>();
		
		params.put("uid",uid);
		params.put("domainid",domain);
		
		//得到账号列表
		List<Account> accounts=this.accountService.list(params);
		//将账号设置成不可用状态
		if(accounts!=null && accounts.size()>0){
			for(Account account:accounts){
				account.setStatus(Account.Status.disable.getCode());
				this.accountService.update(account);
			}
		}
		
		User user=this.userService.get(uid);
		user.setEnable(User.ENABLE_NO);
		boolean isSync = false;
		if(user.getSynchronousstatus() == 1){
			isSync = true;
			user.setSynchronousstatus(0);
			user.setSynctype(OpLog.ACTION_UPDATE);
		}
		this.userService.update(user);
		
		//清空redis缓存中 sid和uid的对应关系
		this.checkBindStatusService.remove(uid);

		//同步到企业号中去

//		if(isSync){
//			OpLogServiceWrapper.addUser(uid, 3, domain);
//		}
		return true;
	}
	
	@RequestMapping(value="enableaccount",method=RequestMethod.POST)
	@ResponseBody
	public boolean enableaccount(HttpServletRequest request){
		
		String uid=request.getParameter("uid");
		String domain=LoginSessionHelper.getCurrentDomain(request);
		
		if(StringUtils.isBlank(uid))
		{
			return false;
		}		
		
		Map<String,Object> params=new HashMap<String, Object>();
		
		params.put("uid",uid);
		params.put("domainid",domain);
		
		//得到账号列表
		List<Account> accounts=this.accountService.list(params);
		//将账号设置成不可用状态
		if(accounts!=null && accounts.size()>0){
			for(Account account:accounts){
				account.setStatus(Account.Status.normal.getCode());
				this.accountService.update(account);
			}
		}
		
		User user=this.userService.get(uid);
		boolean isSync = false;
		if(user.getSynchronousstatus() == 1){
			isSync = true;
			user.setSynchronousstatus(0);
			user.setSynctype(OpLog.ACTION_UPDATE);
		}
		user.setEnable(User.ENABLE_YES);
		this.userService.update(user);
		
//		if(isSync){
//			OpLogServiceWrapper.addUser(uid, 2, domain);
//		}
		
		return true;
	}
	
	/**
	 * 邀请关注
	 * @param req
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "attend", method = RequestMethod.POST)
	@ResponseBody
	public ModelMap attend(HttpServletRequest req, ModelMap model) {
		String[] ids = req.getParameterValues("ids");
		String domain = LoginSessionHelper.getCurrentDomain(req);
		
		model.put("flag", false);
		
		for (String id : ids) {
			User user = userService.get(id);
			if(user!=null)
			{
				//去除已经关注的用户
				if (user.getAttentionstatus()!= 2 || user.getAttentionstatus()!=1) {
					user.setAttentionstatus(1);
					userService.update(user);
					
					//用户信息同步
//					OpLogServiceWrapper.addUser(id, OpLog.ACTION_INVITE, domain);
				}
				
			
			}
		}
		model.put("flag", true);
		return model;
	}
	
}
