package com.longtime.ajy.student.service;

import com.longtime.ajy.model.Account;
import com.longtime.common.service.IService;

import java.util.List;


public interface AccountService extends IService<Account,Long>{
    
    Account getAccount(String account,String domain);
    
    List<Account> getAccountByid(String uid);
    
    void updatePass(Account account);
    
    void updateLoginNum(Long id);
    
    void updateLoginNum(String uid,Account.Type type);
    
    
    /**
     *  0：正常 1: 户不存在 2：邮箱没设置  99：参数错误  100：未知错误
     * @param account
     * @param domain
     * @return
     */
    int findPassword(String account,String domain);

    
    /**
     * 更新用户最后访问时间
     * @param uid
     * @param lastAccessTime
     */
	void updateLastLoginTime(String uid, long lastLoginTime);


    boolean deleteAccunt(String uid);//根据uid删除Accunt表



}
