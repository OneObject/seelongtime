package com.longtime.app.base.controller.bean;

import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.lang3.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.springframework.util.CollectionUtils;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.longtime.app.base.controller.vo.UserGroupExcelVo;
import com.longtime.app.base.model.BaseGroupRelation;
import com.longtime.app.base.model.User;
import com.longtime.app.base.service.GroupRelationService;
import com.longtime.app.base.service.UserService;

public class ImportUserGroupHelper {

    static class Context {

        List<String>      errors;
        List<UserGroupExcelVo> items;

        public Context addError(String error) {
            this.errors.add(error);
            return this;
        }

        public Context addItem(UserGroupExcelVo item) {
            this.items.add(item);
            return this;
        }

        public boolean hasError() {
            return !this.errors.isEmpty();
        }
    }

    private GroupRelationService groupRelationService;
    private UserService userService;
    private Context                 context;
    private String                  domain;
    private String                  gid;    
    private int isOrgTree = 0;
    private Map<String, Map<String, String>> orgMap;
    

    public ImportUserGroupHelper(String domain, String gid,UserService userService,GroupRelationService groupRelationService){
        context = new Context();
        context.errors = Lists.newArrayList();
        context.items = Lists.newArrayList();
        this.domain = domain;
        this.groupRelationService = groupRelationService;
        this.userService = userService;
        this.gid = gid;
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
            UserGroupExcelVo excelVo = parseExcelItem(i, row, domain);
            context.addItem(excelVo);
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

    private void validateItem(UserGroupExcelVo item) {
        int rowNumber = item.getIndex() + 1;
        if (StringUtils.isBlank(item.getUsername())) {
            addError(String.format("第%s行用户名不能为空", rowNumber));
        }
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
    }

    private void checkUserNameUniqlo(UserGroupExcelVo item) {
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
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("domain", domain);
        params.put("username", userName);
        List<User> users = userService.list(params);
        if (CollectionUtils.isEmpty(users)) {
			
        	addError(String.format("第%s行用户名[ %s ]在系统中不存在", item.getIndex() + 1, userName));
		}else{
			
			item.setUid(users.get(0).getId()); // 设置当前用户id 
		}

    }



 


    private void validate() {
        for (UserGroupExcelVo item : this.context.items) {
            validateItem(item);
        }
    }

    private  UserGroupExcelVo parseExcelItem(int i, HSSFRow row, String domain) {
        // 用户名
        String username = null;
   
        DecimalFormat df = new DecimalFormat("0");

      
        // 用户名处理
        if (row.getCell(0) == null) {
            username = "";
        } else {
            if (row.getCell(0).getCellType() == 0) {
                Double doubleValue = row.getCell(0).getNumericCellValue();
                username = df.format(doubleValue);
            } else {
                username = row.getCell(0).getStringCellValue().trim();
            }
        }


        UserGroupExcelVo userExcelVo = new UserGroupExcelVo();
        userExcelVo.setUsername(username);
        userExcelVo.setIndex(i);
        return userExcelVo;
    }

    private void doDBProccess(List<UserGroupExcelVo> list) {

        for (UserGroupExcelVo item : list) {
        		
        	Map<String, Object> params = new HashMap<String, Object>();
        	params.put("domain",domain);
        	params.put("gid",gid);
        	params.put("type",BaseGroupRelation.USER_TYPE);
        	params.put("rid",item.getUid());
			List<BaseGroupRelation> baseGroupRelations = this.groupRelationService.list(params);
            if (CollectionUtils.isEmpty(baseGroupRelations)) {
            	this.doInsertDB(item);
			}

        }

    }
    
  

    private String doInsertDB(UserGroupExcelVo userExcelVo) {
    	BaseGroupRelation entity = new BaseGroupRelation();
    	entity.setDomain(domain);
    	entity.setGid(gid);
    	entity.setRid(userExcelVo.getUid());
    	entity.setType(BaseGroupRelation.USER_TYPE);
    	this.groupRelationService.insert(entity);
		return domain;

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
