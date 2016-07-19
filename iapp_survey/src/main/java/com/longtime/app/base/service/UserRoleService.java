package com.longtime.app.base.service;

import java.util.List;

import com.longtime.app.base.model.UserRole;
import com.longtime.common.service.BaseService;

public interface UserRoleService extends BaseService<UserRole, String> {
	public List<String> listRoleIdByUserId(String userId);

	/**
	 * 获得角色下所有用户id列表
	 * @param roleId
	 * @return
	 */
    public List<String> getUserIds(String roleId);
}
