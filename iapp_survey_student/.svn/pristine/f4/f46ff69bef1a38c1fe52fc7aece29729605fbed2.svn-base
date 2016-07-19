package com.longtime.ajy.student.service.impl;

import org.apache.commons.collections.CollectionUtils;

import com.longtime.ajy.model.Tenant;
import com.longtime.ajy.model.User;
import com.longtime.ajy.mweb.repository.SpecialRepository;
import com.longtime.ajy.student.service.UserService;
import com.longtime.common.dao.IdGenerator;
import com.longtime.common.dao.Repository;
import com.longtime.common.model.search.Filter;
import com.longtime.common.model.search.Search;
import com.longtime.common.service.BaseServiceImpl;
import com.telecom.ctu.platform.common.cache.CacheService;
import java.util.List;
import java.util.Map;
import java.util.Random;
import javax.annotation.Resource;
import org.apache.commons.collections.MapUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

@Service("userService")
public class UserServiceImpl extends BaseServiceImpl<User, String> implements
		UserService {

	private static Logger logger = LoggerFactory
			.getLogger(UserServiceImpl.class);

	private static final String USER_NAME_DEFAULT = "Visitor";

	@Resource(name = "userRepository")
	private Repository<User, String> userRepository;

	@Resource(name = "tenantRepository")
	private Repository<Tenant, String> tenantRepository;

	@Resource(name = "specialRepository")
	private SpecialRepository specialRepository;
	
	
	@Resource(name = "lt.cacheService")
	private    CacheService                 cacheService;


	@Override
	public Repository<User, String> getRepository() {
		return this.userRepository;
	}

	/*
	 * @Override public void setCurrentDomain(HttpServletRequest request) {
	 * LoginSession loginSession = ReceiptHelper.getLoginSession(request);
	 * if(loginSession == null ){ return; } String uid = loginSession.getUid();
	 * User user = this.userRepository.findOne(uid);
	 * SessionHelper.putCurrentUser(request, user); }
	 */

	/*
	 * @Override public void flushLoginSessionInfo(HttpServletRequest
	 * request,String uid){
	 * logger.debug("load user and domain info from db.uid=[{}]", uid); User
	 * user = this.findOne(uid); if(null!=user){
	 * SessionHelper.putCurrentUser(request, user); Tenant tenant =
	 * tenantRepository.findOne(user.getDomain());
	 * SessionHelper.putCurrentTenant(request,tenant); } }
	 */

	@Override
	public boolean checkUsernameIsExist(String username) {
		if (StringUtils.isBlank(username)) {
			return true;
		}
		username = username.toLowerCase();
		Search search = Search.newInstance();
		search.addFilter(Filter.Joiner.or(Filter.equal("email", username),
				Filter.equal("mobile", username)));
		search.addEqualFilter("isdel", User.ISDEL_NO);
		long count = this.userRepository.count(search);
		return count > 0;
	}

	@Override
	public boolean checkUsernameIsExistByMobile(String mobile, String domain) {
		if (StringUtils.isBlank(mobile)) {
			return true;
		}
		mobile = mobile.toLowerCase();
		Search search = Search.newInstance();
		search.addFilter(Filter.equal("mobile", mobile));
		search.addFilter(Filter.equal("domain", domain));
		search.addEqualFilter("isdel", User.ISDEL_NO);
		long count = this.userRepository.count(search);
		return count > 0;
	}

	@Override
	public boolean checkUsernameIsExistByUsername(String username, String domain) {
		if (StringUtils.isBlank(username)) {
			return true;
		}
		username = username.toLowerCase();
		Search search = Search.newInstance();
		search.addFilter(Filter.equal("username", username));
		search.addFilter(Filter.equal("domain", domain));
		search.addEqualFilter("isdel", User.ISDEL_NO);
		long count = this.userRepository.count(search);
		return count > 0;
	}

	@Override
	public String getJobLevel(String uid) {

		return this.specialRepository.getJobLevel(uid);
	}

	@Override
	public User addCasulUser(String domain) {
		// String orgId = String.format("domain_%s",domain);
		String userName = USER_NAME_DEFAULT + System.currentTimeMillis();
		Search search = new Search();
		search.addEqualFilter("domain", domain);
		search.addEqualFilter("username", userName);

		long flag = userRepository.count(search);
		if (flag > 0) {
			Random ran = new Random();
			ran.nextInt(1000);
			userName = userName + ran;
		}

		User entity = new User();

		entity.setId(String.format("l_%s", IdGenerator.uuid32()));
		entity.setDomain(domain);
		entity.setUsername(userName);
		entity.setOid(String.format("domain_%s", domain));
		entity.setGender(User.GENDER_OTHER);
		entity.setName(User.NAME_DEFAULT);
		entity.setBirthday(0);
		entity.setUsertype(User.USER_TYPE_UNCOMMON);

		userRepository.insert(entity);
		return entity;

	}

	@Override
	public String getOrganizationNamaByOid(String oid) {
		return specialRepository.getOrganizationNama(oid);
	}

	@Override
	public User getUserById(String uid, String domain) {
		Search search = Search.newInstance();
		search.addEqualFilter("id", uid);
		search.addEqualFilter("isdel", User.ISDEL_NO);
		if(StringUtils.isNotBlank(domain)){
		    search.addEqualFilter("domain", domain);
		}
		List<User> list = userRepository.list(search);
		if (list != null && !list.isEmpty()) {
			return list.get(0);
		}
		return null;
	}

	@Override
	public String getPasswordByUid(String uid, String domain) {
		return this.specialRepository.getPasswordByUid(uid, domain);
	}

	@Override
	public int updatePassword(String uid, String domain, String password) {
		return this.specialRepository.updatePassword(uid, domain, password);
	}

	private static String key_userinfo_prefix = "u_%s";
	private static int   expire_seconds_userinfo = 24*60*60; //24小时
    @Override
    public User getUserUseCache(String uid) {
        if(StringUtils.isBlank(uid)){
            return null;
        }
        
        String cache_key = getUserInfoCacheKey(uid);
        
	    User user = cacheService.get(cache_key);
        
	    if(null==user){
	        user = this.getUserById(uid,null);
	        
	        if(null!=user){
	            cacheService.put(cache_key, expire_seconds_userinfo, user);  
	        }
	    }
        
        return user;
    }
    
    private String  getUserInfoCacheKey(String uid){
        return String.format(key_userinfo_prefix, uid);
    }

    
  //根据自定义用户属性查询用户
   @Override
   public User getUser(Map<String,String> custom,String domain){
       if(MapUtils.isEmpty(custom)){
           return null;
       }
       Search search = Search.newInstance();
       
       for (String key : custom.keySet()) {
           search.addEqualFilter(key, custom.get(key));
       }
        
       search.addEqualFilter("isdel", User.ISDEL_NO);
       if(StringUtils.isNotBlank(domain)){
           search.addEqualFilter("domain", domain);
       }
       List<User> list = userRepository.list(search);
       if (list != null && !list.isEmpty()) {
           return list.get(0);
       }
       return null;
   }

@Override
public void updateBindStatus(String uid, String domain,int bind) {
	this.specialRepository.updateBindStatus(uid, domain,bind);
	
}

@Override
public long questionAdopt(String domain,String uid) {
	long adopt = 0;
	long askcount = this.specialRepository.countListMyAnswer(domain, uid);
	long bestcount = this.specialRepository.countBestAnswer(domain, uid);
	if (askcount != 0) {
		adopt = bestcount*100/askcount;
	}
	return adopt;
}
	
public User getUserByUserName(String userName,String domain){
    
    if(StringUtils.isBlank(userName) || StringUtils.isBlank(domain)){
        return null;
    }
    
    Search search = Search.newInstance();
    search.addEqualFilter("username",StringUtils.trimToEmpty(userName));
    search.addEqualFilter("domain",StringUtils.trimToEmpty(domain));
    search.addEqualFilter("isdel", User.ISDEL_NO);
    List<User> list = this.userRepository.list(search);
    
    return CollectionUtils.isEmpty(list)?null:list.get(0);
}
}
