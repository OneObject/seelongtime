package com.longtime.app.base.service;

import java.util.Collection;
import java.util.List;
import java.util.Map;

import com.longtime.app.base.model.Organization;
import com.longtime.app.base.model.User;
import com.longtime.app.base.model.UserVo;
import com.longtime.common.service.BaseService;
import com.longtime.common.utils.Page;
import com.longtime.common.utils.ResultSet;

public interface UserService extends BaseService<User, String>{
	//查询用的的用户名、邮箱、手机是否重复
	public boolean queryUserNameAndEmailAndMobileIsRepeat(String id,String domain,Map<String,String> map);
	
	
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
	 */
	public List<UserVo> queryUserByBinding(String domain,int isDel);
	/**
	 * 查询未绑定的用户
	 * @param domain
	 * @param isDel
	 * @return
	 */
	public List<UserVo> queryUserByNotBinding(String domain,int isDel);
	public void addCasulUser(String domain, String orgId);
	
	public ResultSet<UserVo> queryListByAllParams(String domain,String searchContent,List<String> OrgIds,String gender,String orderField,String orderDirection,String isBanding,String attentionstatus,Page page);
	
	public List<UserVo> ListByAllParams(String domain,String searchContent,List<String> OrgIds,String gender,String orderField,String orderDirection,String isBanding,String attentionstatus);

	
	public User findByUsername(String username, String domain);
	public List<String> getByOids(Collection<String> oids);
	public List<User> listByDomain(String domain);
	public void updateSyncronousstaus(List<String> uids, String domain);
	public long getSex(String domain, String orgId,boolean isSubOrg, int i);
	public Map<String, Long> getDimissionRate(long startime, long endtime, String domain, String orgId,
			boolean isSubOrg);
	public long getAgeDistribution(boolean isSubOrg, String orgId,
			int startagenum, int i, String domain);


	public long countAll(String domain);
	public long countUserbycategory(int category,String domain);
}
