package com.longtime.app.base.controller;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.longtime.ajy.support.PasswordEncoder;
import com.longtime.app.base.model.Account;
import com.longtime.app.base.model.JobLevelEntity;
import com.longtime.app.base.model.Organization;
import com.longtime.app.base.model.Tenant;
import com.longtime.app.base.model.User;
import com.longtime.app.base.service.AccountService;
import com.longtime.app.base.service.JobLevelService;
import com.longtime.app.base.service.OrganizationService;
import com.longtime.app.base.service.TenantService;
import com.longtime.app.base.service.UserService;
import com.longtime.app.ixin.mgr.fodder.service.FodderService;
import com.longtime.app.util.IdGenerator;
import com.longtime.app.util.PageUtil;
import com.longtime.common.utils.LoginSessionHelper;
import com.longtime.common.utils.Page;
import com.longtime.common.utils.QueryCondition;
import com.longtime.common.utils.ResultSet;
import com.longtime.common.utils.Sort;
import com.longtime.common.web.utils.SortCss;

@Controller
@RequestMapping("/base/admin/tenant/")
public class TenantController {
	private static final Logger logger = LoggerFactory.getLogger(OrganizationController.class);

	@Resource
	private OrganizationService organizationService;
	
    @Resource
    private UserService userService;
    @Resource
    private AccountService accountService;
   
    @Resource(name = "tenantService")
    private TenantService tenantService;
    
    @Resource(name="fodderService")
	private FodderService fodderService;
    
    @Resource
	private JobLevelService jobLevelService;
    
    /**
     * 商户列表外部框架
     */
    @RequestMapping("tenants")
    public String usermanage(HttpServletRequest req, ModelMap model) {
        return "base/admin/tenant/tenant";
    }
    
    /**
     *商户列表内容
     */
    @RequestMapping(value="list", method=RequestMethod.POST)
    public String list(HttpServletRequest req, ModelMap model) {
        QueryCondition query = new QueryCondition();
        query.addFilterEqual("isDel", User.ISDEL_NO);
        query.addSort(new Sort("createTime", Sort.ORDER_DES));
        model.put("orderField", "createTime");
        model.put("orderDirection", SortCss.DESC);
        
        Page page = PageUtil.getPage(req);
        ResultSet<Tenant> rs = tenantService.list(query, page);
        
        if(rs == null){
            model.put("page", page);
            return "base/admin/tenant/list";
        }
        
        model.put("list", rs.getItems());
        model.put("pager", rs.getPage());
        
        return "base/admin/tenant/list";
    }
    
    /**
     * 商户列表外部框架
     */
    @RequestMapping("toadd")
    public String toAdd(HttpServletRequest req, ModelMap model) {
    	model.put("result", fodderService.getRequiredParams());
        return "base/admin/tenant/add";
    }
    
    /**
     * 商户列表外部框架
     */
    @RequestMapping("add")
    public String add(HttpServletRequest req, ModelMap model) {
    	String id = req.getParameter("id");
    	String name = req.getParameter("name");
    	String account = req.getParameter("account");
    	String pwd = req.getParameter("pwd");
    	String logo = req.getParameter("coverPath");
    	
    	if(StringUtils.isBlank(pwd)){
    		pwd = Account.DEFAULT_PWD;
    	}
    	
    	if(StringUtils.isBlank(id)){
    		throw new IllegalArgumentException("the tenant'id must not be null!");
    	}
    	
    	id = StringUtils.trim(id).toLowerCase();
    	
    	
    	String encodePassword = PasswordEncoder.encode(pwd, id);
    	
    	Tenant tenant = new Tenant();
    	tenant.setId(id);
    	tenant.setName(name);
    	tenant.setAdminAccount(account);
    	tenant.setAdminPwd(encodePassword);
    	tenant.setCreateTime(System.currentTimeMillis());
    	if(StringUtils.isNotBlank(logo)){
    		tenant.setLogo(logo);
    	}
    	this.tenantService.insert(tenant);
    	
    	addUser(req,id,name,account,encodePassword);
    	
    	//初始化职级树
    	initTree(id);
    	
    	return "redirect:tenants.xhtml";
    }
    
    private void addUser(HttpServletRequest req,String domain,String name, String account, String encodePassword) {
		User user = new User();
		user.setId(IdGenerator.nextId32().toString());
		user.setUsername(account);
		user.setName(name);
		user.setDomain(domain);
		user.setType(User.TYPE_FOUNDER);
		//默认为管理员指定组织
		String rootId = getRootId(domain);
		Organization organization = organizationService.getRoot(rootId);
	    if(null == organization){
	    	logger.info(String.format("init tenant[domianid=%s]'s root node!", LoginSessionHelper.getCurrentDomain(req)));
	        this.organizationService.initTree(rootId, domain);
	        organization = organizationService.getRoot(rootId);
	    }
		user.setOrganization(organization);
		
	    String uid = this.userService.insert(user);
		
	    Account entity = new Account();
		entity.setAccount(account);
		entity.setPwd(encodePassword);
		entity.setUid(uid);
		entity.setDomainid(domain);
		entity.setType(Account.Type.other.getCode());
		entity.setCreator(LoginSessionHelper.getCurrentUserId(req));
		entity.setCreatetime(System.currentTimeMillis());
		this.accountService.insert(entity);
	}

	/**
     * 商户列表外部框架
     */
    @RequestMapping("toupdate")
    public String toUpdate(HttpServletRequest req, ModelMap model) {
    	String id = req.getParameter("id");
    	Tenant tenant = this.tenantService.get(id);
    	model.put("tenant", tenant);
    	model.put("result", fodderService.getRequiredParams());
        return "base/admin/tenant/update";
    }
    
    /**
     * 商户列表外部框架
     */
    @RequestMapping("update")
    public String update(HttpServletRequest req, ModelMap model) {
    	String id = req.getParameter("id");
    	String name = req.getParameter("name");
    	String logo = req.getParameter("coverPath");
    	Tenant tenant = this.tenantService.get(id);
    	boolean isChange = false;
    	if(StringUtils.isNotBlank(name) && !name.equals(tenant.getName())){
    		tenant.setName(name);
    		isChange = true;
    	}
    	if(StringUtils.isNotBlank(logo) && !logo.equals(tenant.getLogo())){
    		tenant.setLogo(logo);
    		isChange = true;
    	}
    	if(isChange){
    		this.tenantService.update(tenant);
    	}
    	
    	return "redirect:tenants.xhtml";
    }
    
    
    private String getRootId(String domain) {
		return String.format("domain_%s", domain);
	}
    
    private void initTree(String domain){
    	String rootId = getJobLevelRootId(domain);
		JobLevelEntity jobLevelEntity=this.jobLevelService.getRoot(rootId);
		if(jobLevelEntity==null){
			this.jobLevelService.initTree(rootId, domain);
			jobLevelEntity=this.jobLevelService.getRoot(rootId);
		}
    	
    };
    
    public static String getJobLevelRootId(String domain) {
		return String.format("joblevel_%s", domain);
	}
}

