package com.longtime.app.base.service;

import java.util.List;
import java.util.Set;

import com.longtime.app.base.model.Authorize;
import com.longtime.common.service.BaseService;

public interface AuthorizeService extends BaseService<Authorize, String>{

    /**
     * 获得授权对象id列表
     * @param rcategory
     * @param rid
     * @param scategory
     * @return
     */
    List<String> getSids(int rcategory, String rid, int scategory);
    
    /**
     * 批量删除授权对象
     * @param rcategory
     * @param rid
     * @param scategory
     * @return
     */
    boolean deleteGroup(int rcategory, String rid, int scategory);

	/**
     * 验证权限
     * @param rid 被授权资源ID
     * @param uid 授权对象的ID
     * @param rcategory 被授权对象类型 1 考试，2课程
     * @param domain 域
     */
	boolean checkAuth(String rid, String uid, int rcategory,String domain);

	/**
	 * 获取资源授权的所有用户ID
	 * @param rid 资源ID
	 * @param domain 域
	 * @return
	 */
	Set<String> listAuthUids(String rid, String domain);
}
