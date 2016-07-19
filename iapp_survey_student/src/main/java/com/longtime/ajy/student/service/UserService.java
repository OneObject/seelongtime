package com.longtime.ajy.student.service;


import com.longtime.ajy.model.User;
import com.longtime.common.service.IService;
import java.util.Map;


public interface UserService extends IService<User,String>{

	//void setCurrentDomain(HttpServletRequest request);
	
	//void flushLoginSessionInfo(HttpServletRequest request,String uid);
	
	boolean checkUsernameIsExist(String username);

	boolean checkUsernameIsExistByUsername(String username, String string);

	boolean checkUsernameIsExistByMobile(String mobile, String string);
	
	String getJobLevel(String uid);

	User addCasulUser(String domain);
	
	User getUserById(String uid,String domain);
	
	String getOrganizationNamaByOid(String oid);
	
	String getPasswordByUid(String uid,String domain);
	
	int updatePassword(String uid,String domain,String password);
	
	
	User  getUserUseCache(String uid);
	
	//根据自定义用户属性查询用户
	User getUser(Map<String,String> custom,String domain);

	void updateBindStatus(String uid, String domain,int bind);
	
	long questionAdopt(String domain,String uid);
	
	User getUserByUserName(String userName,String domain);
	
}
