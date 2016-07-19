

package com.longtime.app.base.service.impl;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.stereotype.Service;

import com.google.common.collect.Lists;
import com.longtime.app.base.dao.UserDao;
import com.longtime.app.base.model.Organization;
import com.longtime.app.base.model.User;
import com.longtime.app.base.model.UserVo;
import com.longtime.app.base.service.OrganizationService;
import com.longtime.app.base.service.UserService;
import com.longtime.common.dao.BaseDAO;
import com.longtime.common.service.BaseService4HImpl;
import com.longtime.common.utils.Page;
import com.longtime.common.utils.ResultSet;
import com.telecom.ctu.platform.common.cache.CacheService;

@Service("userService")
public class UserServiceImpl extends BaseService4HImpl<User, String> implements UserService{
    
	private static final String USER_NAME_DEFAULT = "Visitor";
	
    @Resource
    private UserDao userDao;
    
    @Resource
    private OrganizationService OrganizationService;
    
    @Resource(name="lt.cacheService")
    private CacheService cacheService;
    
    @Override
    public BaseDAO<User, String> getDAO() {
        return userDao;
    }
    /**
     * 查询用的的用户名、邮箱、手机是否重复
     */
	@Override
	public boolean queryUserNameAndEmailAndMobileIsRepeat(String uid, String domain, Map<String, String> map){
		boolean flag = userDao.queryUserNameAndEmailAndMobileIsRepeat(uid,domain, map);
		return flag;
	}
	@Override
	public List<UserVo> queryUserByBinding(String domain, int isDel) {
		return userDao.queryUserByBinding(domain, isDel);
	}
	@Override
	public List<UserVo> queryUserByNotBinding(String domain, int isDel) {
		return userDao.queryUserByNotBinding(domain, isDel);
	}
	@Override
	public void addCasulUser(String domain,String orgId) {
		String userName = USER_NAME_DEFAULT+System.currentTimeMillis();
		Map<String, String> map = new HashMap<String, String>();
		map.put("username", userName);
		boolean flag = userDao.queryUserNameAndEmailAndMobileIsRepeat(null,domain, map);
		if(flag){
			Random ran = new Random();
			ran.nextInt(1000);
			userName = userName+ran;
		}
		Organization o = new Organization();
		o.setId(orgId);
		
		User entity = new User();
		
		entity.setDomain(domain);
		entity.setUsername(userName);
		entity.setOrganization(o);
		entity.setGender(User.GENDER_MALE);
		entity.setName(User.NAME_DEFAULT);
		entity.setBirthday(System.currentTimeMillis());
		entity.setCreateTime(System.currentTimeMillis());
		entity.setUsertype(User.USER_TYPE_UNCOMMON);
		
		userDao.insert(entity);
		
	}
	@Override
	public void update(User entity) {
		super.update(entity);
		
		// 清空缓存
		cacheService.remove(getUserInfoCacheKey(entity.getId()));
	}
	private static String key_userinfo_prefix = "u_%s";
	private String  getUserInfoCacheKey(String uid){
	   return String.format(key_userinfo_prefix, uid);
	}
	@Override
	public ResultSet<UserVo> queryListByAllParams(String domain,
			String searchContent, List<String> OrgIds, String gender,
			String orderField, String orderDirection, String isBanding,String attentionstatus,
			Page page) {
		ResultSet<UserVo> rs = userDao.queryListByAllParams(domain, searchContent, OrgIds, gender, orderField, orderDirection, isBanding, attentionstatus, page);
		return rs;
	}
	
	@Override
	public List<UserVo> ListByAllParams(String domain,
			String searchContent, List<String> OrgIds, String gender,
			String orderField, String orderDirection, String isBanding,String attentionstatus) {
		List<UserVo> list = userDao.ListByAllParams(domain, searchContent, OrgIds, gender, orderField, orderDirection, isBanding, attentionstatus);
		return list;
	}
	@Override
	public User findByUsername(String username, String domain) {
		
		return this.userDao.findByUsername(username,domain);
	}

	@Override
	public List<String> getByOids(Collection<String> oids) {
		if(CollectionUtils.isEmpty(oids)){
			return Lists.newArrayList();
		}
		return this.userDao.getByOids(oids);
	}
	
	@Override
	public List<User> listByDomain(String domain) {
		return this.userDao.listByDomain(domain);
	}
	
	@Override
	public void updateSyncronousstaus(List<String> uids, String domain) {
		this.userDao.updateSyncronousstaus(uids,domain);
	}
	
	@Override
	public long getSex(String domain, String orgId,boolean isSubOrg, int i){
		
		Organization orgObj = this.OrganizationService.getRoot(orgId);
		
		if(orgObj==null){
			return 0L;
		}
		
		return userDao.getSex(domain, orgObj, isSubOrg, i);
		
	}
	@Override
	public Map<String, Long> getDimissionRate(long startime, long endtime,String domain, String orgId,
			boolean isSubOrg) {
		
		Organization orgObj = this.OrganizationService.getRoot(orgId);
		
		if(orgObj==null){
			return null;
		}
		
		return userDao.getDimissionRate(startime,endtime,domain,orgObj,isSubOrg);
	}
	@Override
	public long getAgeDistribution(boolean isSubOrg, String orgId,int startagenum,int endagenum, String domain) {
		
		Organization orgObj = this.OrganizationService.getRoot(orgId);
		
		if(orgObj==null){
			return 0L;
		}
		
		return userDao.getAgeDistribution(isSubOrg,orgObj,startagenum,endagenum,domain);
	}
	
	

    /**
     * 获取值在username，email mobile中匹配的uids
     * @param domain
     * @param property
     * @param value
     * @return
     */
    @Override
    public List<String>  queryUidsValueInUNameOrEmailOrMobile(String domain,String value){
        return this.userDao.queryUidsValueInUNameOrEmailOrMobile(domain, value);
    }
	
	@Override
	public long countAll(String domain) {
		return this.userDao.countAll(domain);
	}
	
	@Override
	public long countUserbycategory(int category,String domain){
		return this.userDao.countUserbycategory(category, domain);
	}	
	
}
