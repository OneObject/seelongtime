package com.longtime.app.base.service.impl;

import java.util.HashMap;

import com.longtime.common.utils.LoginSessionHelper;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import com.google.common.collect.Maps;
import com.longtime.ajy.support.PasswordEncoder;
import com.longtime.app.base.dao.AccountDao;
import com.longtime.app.base.model.Account;
import com.longtime.app.base.model.User;
import com.longtime.app.base.model.Account.Status;
import com.longtime.app.base.model.Account.Type;
import com.longtime.app.base.service.AccountService;
import com.longtime.common.dao.BaseDAO;
import com.longtime.common.service.BaseService4HImpl;

@Service("accountService")
public class AccountServiceImpl extends BaseService4HImpl<Account, Long> implements AccountService{
    
    @Resource
    private AccountDao accountDao;
    
    @Override
    public BaseDAO<Account, Long> getDAO() {
        return accountDao;
    }
    public boolean deleteAccunt(String uid) {      
        String hql="delete from Account ac where ac.uid=?";
        this.accountDao.execute(hql, new Object[]{uid});
        return true;
    }
    public List<Account> selectAccount(String uid) {
    	String hql="from Account ac where ac.uid=?";    	
		return this.accountDao.list(hql, uid);
	}
	@Override
	public Account getAccount(String account) {
		String hql = "from Account where account=?";
		List<Account> list = this.accountDao.list(hql, new Object[]{account});
		if(CollectionUtils.isEmpty(list)){
			return null;
		}
		return list.get(0);
	}
	@Override
	public Account getByAccountAndUid(String account, String id) {
		String hql="from Account ac where ac.account=? and ac.uid=?";    	
		List<Account> list = this.accountDao.list(hql, new Object[]{account, id});
		if(CollectionUtils.isEmpty(list)){
			return null;
		}
		return list.get(0);
	}
	
	@Override
	public List<String> getRecentlyNoAccessUsers(int remaindperiod,String domain) {
		return this.accountDao.getRecentlyNoAccessUsers(remaindperiod,domain);
	}
	
	@Override
	public void delAccount(String uid, short type) {
		String hql = "delete from Account where uid=? and type=? ";
		this.accountDao.execute(hql, uid,type);
	}
	
	@Override
	public void updateAccount(User user, String oldEmail, String oldMobile) {
		Map<String, Object> params = Maps.newHashMap();
		params.put("uid", user.getId());
		List<Account> accounts = this.accountDao.list(params);
		
		short status = Status.normal.getCode();
		if(user.getEnable() == 0){
			status = Status.disable.getCode();
		}
		
		//更新用户名对应的登录账号
		Account usernameAccount = getAccountByType(accounts,Type.username.getCode());
		String password  = "";
		if(usernameAccount == null){
			password = PasswordEncoder.encode(Account.DEFAULT_PWD, user.getDomain());
			addAccount(user,Type.username.getCode(),password);
		} else if(usernameAccount.getStatus() != status){
			password = usernameAccount.getPwd();
			usernameAccount.setStatus(status);
			this.accountDao.update(usernameAccount);
		}
		
		//更新邮箱对应的登录账号
		Account emailAccount = getAccountByType(accounts,Type.email.getCode());
		if(StringUtils.isBlank(user.getEmail())){
			if(emailAccount != null){
				this.accountDao.delete(emailAccount);
			}
		} else {
			if(emailAccount == null){
				addAccount(user,Type.email.getCode(),password);
			} else if (emailAccount != null && !user.getEmail().equals(emailAccount.getAccount())){
				emailAccount.setAccount(user.getEmail().toLowerCase());
				emailAccount.setStatus(status);
				this.accountDao.update(emailAccount);
			}
		}
		
		//更新手机对应的登录账号
		Account mobileAccount = getAccountByType(accounts,Type.phone.getCode());
		if(StringUtils.isBlank(user.getMobile())){
			if(mobileAccount != null){
				this.accountDao.delete(mobileAccount);
			}
		} else {
			if(mobileAccount == null){
				addAccount(user,Type.phone.getCode(),password);
			} else if (mobileAccount != null && !user.getMobile().equals(mobileAccount.getAccount())){
				mobileAccount.setAccount(user.getMobile().toLowerCase());
				mobileAccount.setStatus(status);
				this.accountDao.update(mobileAccount);
			}
		}
	}
	
	private Account getAccountByType(List<Account> accounts, short type) {
		if(CollectionUtils.isEmpty(accounts)){
			return null;
		}
		for(Account account : accounts){
			if(account.getType() == type){
				return account;
			}
		}
		return null;
	}
	
	private void addAccount(User user, short type,String password) {
		Account account = new Account();
		if(type == Type.email.getCode()){
			account.setAccount(user.getEmail().toLowerCase());
		} else if(type == Type.phone.getCode()){
			account.setAccount(user.getMobile());
		} else if(type == Type.username.getCode()){
			account.setAccount(user.getUsername().toLowerCase());
		}
		account.setType(type);
		account.setDomainid(user.getDomain());
		account.setPwd(password);
		if(user.getEnable() == 0){
			account.setStatus(Status.disable.getCode());
		} else {
			account.setStatus(Status.normal.getCode());
		}
		
		account.setUid(user.getId());
		account.setCreatetime(System.currentTimeMillis());
		accountDao.insert(account);
	}
	
	
	/**
     * 获取用户原始密码（非加密）
     */
	@Override
	public String getAccountPwd(String uid){
        List<Account> list = selectAccount(uid);
        if(null==list || list.isEmpty()){
            return StringUtils.EMPTY;
        }
        Account tmp  = list.get(0);
        String encodePwd = tmp.getPwd();
        String domain = tmp.getDomainid();
        return  PasswordEncoder.decode(encodePwd, domain);
    }
	
	
	
	private String formatAccountName(String account){
	    return StringUtils.isBlank(account)?StringUtils.EMPTY:account.toLowerCase().trim();
	}
	
	@Override
	public void doAddOrUpdateAccount(User entity, String pass) {
        if (null == entity) {
            throw new IllegalArgumentException(
                    "create user'accoount due to error,the entity must not be null!");
        }
        
        String uid = entity.getId();
        List<Account> accounts = selectAccount(uid);

        Map<Integer,Account> map = new  HashMap<Integer, Account>();
        for (Account account : accounts) {
           map.put(new Integer(account.getType()), account);
        }
        
       
        String domain = entity.getDomain();
        String creator = entity.getCreator();
        String mobile = entity.getMobile();
        mobile = formatAccountName(mobile);
        String email = entity.getEmail();
        email = formatAccountName(email);
        String username = entity.getUsername();
        username = formatAccountName(username);

        String pwd_encode = PasswordEncoder.encode(pass, String.valueOf(domain));
        
        // username
        Account account =  map.get(new Integer(Account.Type.username.getCode()));
        doProccessAccount(account, username, Account.Type.username, pwd_encode, uid, domain);
        
        // email
        account =  map.get(new Integer(Account.Type.email.getCode()));
        doProccessAccount(account, email, Account.Type.email, pwd_encode, uid, domain);
        
        // mobile
        account =  map.get(new Integer(Account.Type.phone.getCode()));
        doProccessAccount(account, mobile, Account.Type.phone, pwd_encode, uid, domain);
        
    }
	
	
	private void doProccessAccount(Account account,String accountName,Type type,String encode_pwd,String uid,String domain){
	    
	    if(null==account){//新增
            
            if(StringUtils.isNotBlank(accountName)){
                account = new Account();
                account.setAccount(accountName.toLowerCase());
                account.setType(type.getCode());
                account.setDomainid(domain);
                account.setPwd(encode_pwd);
                account.setStatus(Status.normal.getCode());
                account.setUid(uid);
                account.setCreatetime(System.currentTimeMillis());
                insert(account); 
            }
        }else{
            if(StringUtils.isBlank(accountName)){ //删除
                this.deleteById(account.getId());
            }else{
                boolean isChange = false;
                if(!accountName.equalsIgnoreCase(account.getAccount())){
                    isChange = true;
                    account.setAccount(accountName);
                }
                if(!encode_pwd.equals(account.getAccount())){
                    account.setPwd(encode_pwd);
                    isChange = true;
                }
                
                if(isChange){
                    this.update(account);
                }
                
            }
        }
	    
	}


}
