package com.longtime.app.base.dao;

import java.util.Collection;
import java.util.List;
import java.util.Map;

import com.longtime.app.base.model.Organization;
import com.longtime.app.base.model.User;
import com.longtime.app.base.model.UserVo;
import com.longtime.common.dao.BaseDAO;
import com.longtime.common.utils.Page;
import com.longtime.common.utils.ResultSet;

public interface UserDao extends BaseDAO<User, String>{
	/**
	 * 查询用的的用户名、邮箱、手机是否重复
	 * @param uid
	 * @param domain
	 * @param map
	 * @return
	 */
	public boolean queryUserNameAndEmailAndMobileIsRepeat(String uid,String domain,Map<String,String> map);
	
	
	/**
     * 获取值在username，email mobile中匹配的uids
     * @param domain
     * @param property
     * @param value
     * @return
     */
    List<String>  queryUidsValueInUNameOrEmailOrMobile(String domain,String value);
    
	/**
	 * 查询绑定的用户
	 * @param domain
	 * @param isDel
	 * @return
	 */
	public List<UserVo> queryUserByBinding(String domain,int isDel);
	
	
	/**
	 * 查询未绑定的用户
	 * @param domain
	 * @param isDel
	 * @return
	 */
	public List<UserVo> queryUserByNotBinding(String domain,int isDel);
	/**
	 * 用户管理用户列表查询
	 * @param domain 
	 * @param searchContent 搜索条件
	 * @param OrgIds 用户部门ID
	 * @param gender 性别
	 * @param orderField 排序字段
	 * @param orderDirection 排序条件
	 * @param isBanding 是否banding
	 * @return  用户列表
	 */
	public ResultSet<UserVo> queryListByAllParams(String domain,String searchContent,List<String> OrgIds,String gender,String orderField,String orderDirection,String isBanding,String attentionstatus,Page page);

	
	public List<UserVo> ListByAllParams(String domain,String searchContent,List<String> OrgIds,String gender,String orderField,String orderDirection,String isBanding,String attentionstatus);

	/**
	 * 根据用户名查询用户
	 * @param username
	 * @param domain
	 * @return
	 */
	public User findByUsername(String username, String domain);

	public List<String> getByOids(Collection<String> oids);

	public List<User> listByDomain(String domain);

	public void updateSyncronousstaus(List<String> uids, String domain);
	
	public long getSex(String domain, Organization org,boolean isSubOrg, int i);

	public Map<String, Long> getDimissionRate(long startime, long endtime, String domain, Organization orgObj,
			boolean isSubOrg);

	public long getAgeDistribution(boolean isSubOrg, Organization orgObj,
			int startagenum, int endagenum, String domain);


	public long countAll(String domain);


	public long countUserinOrg(Organization organization, String domain, Boolean flag);
	
	public long countUserbycategory(int category,String domain);

}
