package com.longtime.app.base.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.collections.MapUtils;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Service;

import com.longtime.app.base.dao.UserRoleDao;
import com.longtime.app.base.model.UserRole;
import com.longtime.app.base.service.UserRoleService;
import com.longtime.common.dao.BaseDAO;
import com.longtime.common.service.BaseService4HImpl;

@Service("userRoleService")
public class UserRoleServiceImpl extends BaseService4HImpl<UserRole, String> implements UserRoleService{

	@Resource
	private UserRoleDao userRoleDao;
    @Resource
    private NamedParameterJdbcTemplate jdbcTemplate;
	
	@Override
	public BaseDAO<UserRole, String> getDAO() {
		return userRoleDao;
	}

	@Override
	public List<String> listRoleIdByUserId(String userId) {
        List<UserRole> list = userRoleDao.listRoleIdByUserId(userId);
		
		List<String> roleIds = new ArrayList<String>();
		
		for(UserRole role : list){
			roleIds.add(role.getRoleId().getId());
		}
		
		return roleIds;
	}

    @SuppressWarnings("unchecked")
    @Override
    public List<String> getUserIds(String roleId) {
        StringBuffer sb = new StringBuffer("select ur.user_id from iapp_base_userrole ur where ur.role_id = '" + roleId +"'");
        
        return jdbcTemplate.queryForList(sb.toString(), MapUtils.EMPTY_MAP , String.class);
    }

}
