package com.longtime.app.base.service;


import java.util.List;
import com.longtime.app.base.model.Account;
import com.longtime.app.base.model.User;
import com.longtime.common.service.BaseService;

public interface AccountService extends BaseService<Account, Long>{
	public boolean deleteAccunt(String uid);//根据uid删除Accunt表
	
	public List<Account> selectAccount(String uid);//根据uid查询Accunt表
	
	/**
	 * 根据账号、密码、域查找账号信息
	 * @param account 账号
	 * @return
	 */
	public Account getAccount(String account);

	/**
	 * 根据账号名称，uid查询Account表
	 * @param account
	 * @param id
	 * @return
	 */
	public Account getByAccountAndUid(String account, String id);

	/**
	 * 获取remaindperiod天内未访问系统的用户ID列表
	 * @param remaindperiod 未访问系统的天数
	 * @param domain 域
	 * @return
	 */
	public List<String> getRecentlyNoAccessUsers(int remaindperiod, String domain);

	public void delAccount(String account, short type);

	public void updateAccount(User user, String oldEmail, String oldMobile);
	
	
	/**
	 * 获取用户原始密码（非加密）
	 */
	public String getAccountPwd(String uid);
	
	
	/**
	 * @param entity
	 * @param pass 明文密码
	 */
	void doAddOrUpdateAccount(User entity, String pass);

}
