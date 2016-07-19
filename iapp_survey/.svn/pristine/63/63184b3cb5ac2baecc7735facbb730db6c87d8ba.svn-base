package com.longtime.app.base.controller.bean;

import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.lang3.ArrayUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;

import com.google.common.base.Splitter;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.longtime.app.base.controller.UserController;
import com.longtime.app.base.controller.vo.UserExcelVo;
import com.longtime.app.base.model.JobLevelEntity;
import com.longtime.app.base.model.LabelRelationEntity;
import com.longtime.app.base.model.Organization;
import com.longtime.app.base.model.User;
import com.longtime.app.base.model.UserLinkJobLevel;
import com.longtime.app.base.service.AccountService;
import com.longtime.app.base.service.JobLevelService;
import com.longtime.app.base.service.LabelEntityService;
import com.longtime.app.base.service.OrganizationService;
import com.longtime.app.base.service.UserLinkJobLevelService;
import com.longtime.app.base.service.UserService;
import com.longtime.app.oplog.model.OpLog;
import com.longtime.app.util.ExcelOptionUtil;
import com.longtime.app.util.IdGenerator;
import com.longtime.common.utils.DateUtils;
import com.myctu.platform.utils.NumberUtils;

public class ImportUserHelper {

    static class Context {

        List<String>      errors;
        List<UserExcelVo> items;

        public Context addError(String error) {
            this.errors.add(error);
            return this;
        }

        public Context addItem(UserExcelVo item) {
            this.items.add(item);
            return this;
        }

        public boolean hasError() {
            return !this.errors.isEmpty();
        }
    }

    private UserService             userService;
    private OrganizationService     organizationService;
    private JobLevelService         jobLevelService;
    private AccountService          accountService;
    private UserLinkJobLevelService userLinkJobLevelService;
    private LabelEntityService labelEntityService;
    private Context                 context;
    private String                  domain;
    private String                  operatorUid;            // 操作者id
    private int isOrgTree = 0;
    private Map<String, Map<String, String>> orgMap;
    

    public ImportUserHelper(String domain, String operator, UserService userService,
                            OrganizationService organizationService, JobLevelService jobLevelService,
                            AccountService accountService, UserLinkJobLevelService userLinkJobLevelService,
                            LabelEntityService labelEntityService){
        context = new Context();
        context.errors = Lists.newArrayList();
        context.items = Lists.newArrayList();
        this.domain = domain;
        this.userService = userService;
        this.organizationService = organizationService;
        this.jobLevelService = jobLevelService;
        this.accountService = accountService;
        this.userLinkJobLevelService = userLinkJobLevelService;
        this.operatorUid = operator;
        this.labelEntityService = labelEntityService;
    }

    private void addError(String error) {
        this.context.addError(error);
    }

    public boolean hasError() {
        return this.context.hasError();
    }
    public List<String> getErrors(){
        return this.context.errors;
    }

    public void loadExcel(HSSFSheet sheet) {

        // 解决用户删除模板中的第一行导致excel读取出错
        HSSFRow row1 = sheet.getRow(0);
        if (row1 != null && row1.getCell(1).getCellType() != 3) {
            addError("请不要删除模板中的第一行");
        }

        // 判断导入的记录数是否大于5000
        if (sheet.getLastRowNum() > 5001) {
            addError("导入记录数不能大于5000");
        }

        // 记录已检查过的部门

        // 对excel进行处理
        for (int i = 2; i <= sheet.getLastRowNum(); i++) {
            HSSFRow row = sheet.getRow(i);
            if (row == null) {
                continue;
            }
            UserExcelVo userExcelVo = parseExcelItem(i, row, domain);
            context.addItem(userExcelVo);
        }
    }

    public void process() {
        validate();
        if (hasError()) {
            return ;
        }

        // 新增到数据库
        doDBProccess(this.context.items);
    }

    static Pattern              p_username = Pattern.compile("[^0-9A-Za-z@\\-_.]+|[\u4e00-\u9fa5]+|\\s+");

    private Map<String, String> tmp_data   = Maps.newHashMap();

    private void validateItem(UserExcelVo item) {
        int rowNumber = item.getIndex() + 1;
        if (StringUtils.isBlank(item.getUsername())) {
            addError(String.format("第%s行用户名不能为空", rowNumber));
        }
        /*
        if (StringUtils.isBlank(item.getDepartment())) {
            addError(String.format("第%s行姓名不能为空", rowNumber));
        }
        */
        if (StringUtils.isNotBlank(item.getUsername())) {

            Matcher m = p_username.matcher(item.getUsername());
            if (m.find()) {
                addError(String.format("第%s行用户名[ %s ]包含空格,特殊符号或者中文", rowNumber,item.getUsername()));
            }
            if (item.getUsername().toCharArray().length > 32) {
                addError(String.format("第%s行用户名[ %s ]长度超过32个字符", rowNumber,item.getUsername()));
            }
        }

        // 是否有重复
        // 1.用户名
        this.checkUserNameUniqlo(item);
        // 2.邮箱
        this.checkEmail(item);
        // 3.手机
        this.checkMobile(item);
        // 4.部门
        this.checkOrg(item);
        // 5.职级
        this.checkJobLevel(item);
    }

    private void checkUserNameUniqlo(UserExcelVo item) {
        String userName = item.getUsername();
        if (StringUtils.isBlank(userName)) {
            return;
        }
        // 1. 检查excel表格中是否唯一
        if (tmp_data.containsKey(String.format("u_%s", userName))) {
            this.addError(String.format("第%s行用户名错误，用户名[ %s ]在excel中重复", item.getIndex() + 1, userName));
            return;
        } else {
            tmp_data.put(String.format("u_%s", userName), "1");
        }

        // 2. 检查数据库
        List<String> uids = userService.queryUidsValueInUNameOrEmailOrMobile(domain, userName);

        if (uids.size() > 1) {
            addError(String.format("第%s行用户名[ %s ]在系统中已经存在", item.getIndex() + 1, userName));
        }

        if (uids.size() == 1) {
            item.setId(uids.get(0)); // 设置当前用户id，后面将修改数据库中该用户的信息
        }
    }

    private void checkEmail(UserExcelVo item) {
        String email = item.getEmail();

        if (StringUtils.isBlank(email)) {
            return;
        }
        // 1. 检查excel表格中是否唯一
        if (tmp_data.containsKey(String.format("e_%s", email))) {
            this.addError(String.format("第%s行邮箱[ %s ]在excel中重复", item.getIndex() + 1, email));
            return;
        } else {
            tmp_data.put(String.format("e_%s", email), "1");
        }

        // 2.检查数据库中
        Map<String, String> param = new HashMap<String, String>(1);
        param.put("email", email);

        boolean b = this.userService.queryUserNameAndEmailAndMobileIsRepeat(item.getId(), domain, param);
        if (b) {
            addError(String.format("第%s行邮箱[ %s ]在数据库中已存在", item.getIndex() + 1, email));
        }

    }

    private void checkMobile(UserExcelVo item) {
        String mobile = item.getMobile();

        if (StringUtils.isBlank(mobile)) {
            return;
        }
        // 1. 检查excel表格中是否唯一
        if (tmp_data.containsKey(String.format("m_%s", mobile))) {
            this.addError(String.format("第%s行手机号码[ %s ]在excel中重复", item.getIndex() + 1, mobile));
            return;
        } else {
            tmp_data.put(String.format("m_%s", mobile), "1");
        }

        // 2.检查数据库中
        Map<String, String> param = new HashMap<String, String>(1);
        param.put("mobile", mobile);

        boolean b = this.userService.queryUserNameAndEmailAndMobileIsRepeat(item.getId(), domain, param);
        if (b) {
            addError(String.format("第%s行手机号码[ %s ]在数据库中已存在", item.getIndex() + 1, mobile));
        }

    }

    private void checkOrg(UserExcelVo item) {

        String orgName = item.getDepartment();

        if (StringUtils.isBlank(orgName)) {
            return;
        }

        if (tmp_data.containsKey(String.format("org_%s", orgName))) {// 前面已经检查过

            item.setOid(tmp_data.get(String.format("org_%s", orgName)));
            return;
        }

        if(this.isOrgTree == 0){
        	Organization organization = organizationService.getOrganization(domain, orgName);
            if (organization == null) {
                addError(String.format("第%s行部门[ %s ]在系统中不存在.", item.getIndex() + 1, orgName));
            } else {
                item.setOid(organization.getId());
                tmp_data.put(String.format("org_%s", orgName), organization.getId());
            }
        } else {
        	
        	String oid = getOidByName(orgName,item);
        	if(StringUtils.isNotBlank(oid)){
        		item.setOid(oid);
        	}
        }
    }

    private String getOidByName(String orgName,UserExcelVo item) {
		String[] names = Splitter.on("/").omitEmptyStrings().splitToList(orgName).toArray(new String[0]);
		if(ArrayUtils.isEmpty(names)){
			return null;
		}
		String oid = "";
		String parentId = String.format("domain_%s", this.domain);
		
		for(String name : names){
			Map<String, String> map = this.orgMap.get(parentId);
			if(map != null){
				parentId = map.get(name);
				oid = parentId;
				if(StringUtils.isBlank(parentId)){
					addError(String.format("第%s行部门[ %s ]中的[ %s ]在系统中不存在.", item.getIndex() + 1, orgName,name));
				}
			} else {
				addError(String.format("第%s行部门[ %s ]中的[ %s ]的父节点在系统中不存在子节点.", item.getIndex() + 1, orgName,name));
			}
		}
		return oid;
	}

	private void checkJobLevel(UserExcelVo item) {
        String jobLevel = item.getJoblevel();

        if (StringUtils.isBlank(jobLevel)) {
            return;
        }

        if (tmp_data.containsKey(String.format("jl_%s", jobLevel))) {// 前面已经检查过

            item.setJobLevelId(tmp_data.get(String.format("jl_%s", jobLevel)));
            return;
        }

        JobLevelEntity jobLevelEntity = jobLevelService.getByName(jobLevel,domain);
        if (jobLevelEntity == null) {
            addError(String.format("第%s行职级[ %s ]在系统中不存在.", item.getIndex() + 1, jobLevel));
        } else {
            item.setJobLevelId(jobLevelEntity.getId());
            tmp_data.put(String.format("jl_%s", jobLevel), jobLevelEntity.getId());
        }

    }

    private void validate() {
        for (UserExcelVo item : this.context.items) {
            validateItem(item);
        }
    }

    private UserExcelVo parseExcelItem(int i, HSSFRow row, String domain) {
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
        // 职级
        String joblevel = null;
        // 性别
        String genderStr = null;
        // 昵称
        String nickname = null;
        // 有效期（开始）
        String effictivestartStr = null;
        // 有效期（截止）
        String effictiveendStr = null;
        // 生日
        String birthday = null;
        //标签
        String labels = null;
        

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
                department = String.valueOf(row.getCell(5).getNumericCellValue());
            } else {
                department = row.getCell(5).getStringCellValue().trim();
            }
        }

        // 职级处理
        if (row.getCell(6) == null) {
            joblevel = "";
        } else {
            if (row.getCell(6).getCellType() == 0) {
                joblevel = String.valueOf(row.getCell(6).getNumericCellValue());
            } else {
                joblevel = row.getCell(6).getStringCellValue().trim();
            }
        }

        effictivestartStr = ExcelOptionUtil.getCellStringValue(row.getCell(7));
        effictiveendStr = ExcelOptionUtil.getCellStringValue(row.getCell(8));
        genderStr = ExcelOptionUtil.getCellStringValue(row.getCell(9));
        nickname = ExcelOptionUtil.getCellStringValue(row.getCell(10));
        birthday = ExcelOptionUtil.getCellStringValue(row.getCell(11));
        labels = ExcelOptionUtil.getCellStringValue(row.getCell(12));
        

        UserExcelVo userExcelVo = new UserExcelVo();
        userExcelVo.setDepartment(department);
        userExcelVo.setEmail(email.toLowerCase());
        userExcelVo.setMobile(mobile);
        userExcelVo.setName(name);
        userExcelVo.setPass(pass);
        userExcelVo.setUsername(username);
        userExcelVo.setJoblevel(joblevel);
        userExcelVo.setNickName(nickname);

        if (StringUtils.isBlank(genderStr)) {
            userExcelVo.setGender(User.GENDER_OTHER);
        } else {
            int gender = (genderStr.equals("男") || User.GENDER_MALE == NumberUtils.toInt(genderStr, User.GENDER_OTHER)) ? User.GENDER_MALE : ((genderStr.equals("女") || User.GENDER_FEMAIL == NumberUtils.toInt(genderStr,
                                                                                                                                                                                                                User.GENDER_OTHER)) ? User.GENDER_FEMAIL : User.GENDER_OTHER);
            userExcelVo.setGender(gender);
        }

        if (StringUtils.isBlank(effictivestartStr)) {
            userExcelVo.setEffictivestart(null);
        } else {
            userExcelVo.setEffictivestart(DateUtils.parseDateStringToLong(effictivestartStr));
        }

        if (StringUtils.isBlank(effictiveendStr)) {
            userExcelVo.setEffictiveend(null);
        } else {
            userExcelVo.setEffictiveend(DateUtils.parseDateStringToLong(effictiveendStr));
        }

        if (StringUtils.isBlank(birthday)) {
            userExcelVo.setBirthday(null);
        } else {
            long birthdayL = DateUtils.parseDateStringToLong(birthday);
            if(birthdayL!=Long.MIN_VALUE){
                userExcelVo.setBirthday(birthdayL);
            }else{
                addError(String.format("第%s行生日格式错误[ %s ]", i+ 1, birthday));
            }
        }
        
        userExcelVo.setLabels(labels);

        userExcelVo.setIndex(i);
        return userExcelVo;
    }

    private void doDBProccess(List<UserExcelVo> list) {

        for (UserExcelVo item : list) {

            String uid = null;
            if (StringUtils.isNotBlank(item.getId())) {//修改
                uid = doUpdateDB(item);
            }
            
            if(StringUtils.isBlank(uid)){ //新增
                this.doInsertDB(item);
            }
                

        }

    }
    
    
    private String doUpdateDB(UserExcelVo userExcelVo){
        
        User user = this.userService.get(userExcelVo.getId());
        
        if(user==null){
            return null;
        }
        
        
        if(StringUtils.isNotBlank(userExcelVo.getUsername())){
            user.setUsername(userExcelVo.getUsername());
        }
        
        if(StringUtils.isNotBlank(userExcelVo.getName())){
            user.setName(userExcelVo.getName());
        }
        
        if(StringUtils.isNotBlank(userExcelVo.getMobile())){
            user.setMobile(userExcelVo.getMobile());
        }
        
        if(StringUtils.isNotBlank(userExcelVo.getEmail())){
            user.setEmail(userExcelVo.getEmail());
        }
        
        if(StringUtils.isNotBlank(userExcelVo.getNickName())){
            user.setNickName(userExcelVo.getNickName());
        }
        if(userExcelVo.getBirthday()!=null && userExcelVo.getBirthday()>0){
            user.setBirthday(userExcelVo.getBirthday());
        }
        if(userExcelVo.getEffictivestart()!=null && userExcelVo.getEffictivestart()>0){
            user.setEffictivestart(userExcelVo.getEffictivestart());
        }
        
        if(userExcelVo.getEffictiveend()!=null && userExcelVo.getEffictiveend()>0){
            user.setEffictiveend(userExcelVo.getEffictiveend());
        }
        user.setGender(userExcelVo.getGender());
        if(StringUtils.isNotBlank(userExcelVo.getLabels())){
        		user.setLabels(userExcelVo.getLabels());
        }
        
        //部门
        String oid = userExcelVo.getOid();
        if(StringUtils.isNotBlank(oid)){
            if(!oid.equals(user.getOrganization().getId())){
                Organization org = organizationService.get(oid);
                user.setOrganization(org);
            }
        }
        
        //职级
        String jobLevelId = userExcelVo.getJobLevelId();
        if(StringUtils.isNotBlank(jobLevelId)){
            List<UserLinkJobLevel> userLinkJobLevels=this.userLinkJobLevelService.getlists(user.getId());
            if(userLinkJobLevels!=null && userLinkJobLevels.size()>0){
                UserLinkJobLevel userLinkJobLevel=userLinkJobLevels.get(0);
                userLinkJobLevel.setJoblevelid(jobLevelId);
                this.userLinkJobLevelService.update(userLinkJobLevel);
            }else{
                //添加关联关系
                UserLinkJobLevel userLinkJobLevel=new UserLinkJobLevel();
                userLinkJobLevel.setJoblevelid(jobLevelId);
                userLinkJobLevel.setUserid(user.getId());
                this.userLinkJobLevelService.insert(userLinkJobLevel);
            }
        }
        
        // 账号
        String pwd = userExcelVo.getPass();
        if(StringUtils.isBlank(pwd)){
            pwd = accountService.getAccountPwd(user.getId());
        }
        accountService.doAddOrUpdateAccount(user, pwd);
        
        if(user.getSynchronousstatus() == 1){
            user.setSynchronousstatus(0);;
            user.setSynctype(OpLog.ACTION_UPDATE);
        }
        
        user.setUpdater(operatorUid);
        user.setUpdatetime(System.currentTimeMillis());
        
        userService.update(user);
        
//        if(isSync){
//            OpLogServiceWrapper.addUser(user.getId(), 2, domain);
//        }
        	labelEntityService.doAdd(user.getLabels(), user.getId(),LabelRelationEntity.RTYPE_USER, user);
        
        return user.getId();
        
        
    }

    private String doInsertDB(UserExcelVo userExcelVo) {

        User user = new User();
        user.setId(IdGenerator.nextId32().toString());
        user.setName(userExcelVo.getName());
        user.setMobile(userExcelVo.getMobile());
        user.setEmail(userExcelVo.getEmail().toLowerCase());
        user.setUsername(userExcelVo.getUsername());
        user.setDomain(domain);
        user.setCreateTime(System.currentTimeMillis());
        user.setCreator(operatorUid);
        
        String oid = userExcelVo.getOid();
        if (StringUtils.isBlank(oid)) {
            oid = String.format("domain_%s", domain);
        }
        Organization org = new Organization();
        org.setId(oid);
        user.setOrganization(org);
        user.setGender(userExcelVo.getGender());
        user.setNickName(userExcelVo.getNickName());
        user.setEffictivestart(userExcelVo.getEffictivestart());
        user.setEffictiveend(userExcelVo.getEffictiveend());
        if (userExcelVo.getBirthday() != null) {
            user.setBirthday(userExcelVo.getBirthday());
        }
        user.setLabels(userExcelVo.getLabels());
        
        // 保存信息
       userService.insert(user);

        // 用户信息同步
//        OpLogServiceWrapper.addUser(id, 0, domain);

        accountService.doAddOrUpdateAccount(user,
                                            StringUtils.isBlank(userExcelVo.getPass()) ? UserController.defalut_pwd : userExcelVo.getPass());

        // 关联职级
        if (StringUtils.isNotBlank(userExcelVo.getJobLevelId())) {
            UserLinkJobLevel userLinkJobLevel = new UserLinkJobLevel();
            userLinkJobLevel.setJoblevelid(userExcelVo.getJobLevelId());
            userLinkJobLevel.setUserid(user.getId());
            this.userLinkJobLevelService.insert(userLinkJobLevel);

        }
        
        labelEntityService.doAdd(user.getLabels(),user.getId(),LabelRelationEntity.RTYPE_USER, user);
        return user.getId();
    }

	public Map<String, Map<String, String>> getOrgMap() {
		return orgMap;
	}

	public void setOrgMap(Map<String, Map<String, String>> orgMap) {
		this.orgMap = orgMap;
	}

	public int getIsOrgTree() {
		return isOrgTree;
	}

	public void setIsOrgTree(int isOrgTree) {
		this.isOrgTree = isOrgTree;
	}
	
}
