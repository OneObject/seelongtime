/**
 * project : iapp
 * user created : yangwk
 * date created : 2013-9-16 - 下午3:00:44
 */
package com.longtime.app.authorize.service;

import java.util.List;

import com.longtime.app.authorize.model.AuthorizeModel;

/**
 * @since 2013-9-16
 * @author yangwk
 * 
 */
public interface AuthorizeService {

	/**
	 * 添加授权记录
	 * @param sid
	 * @param params
	 * @param type
	 * @param category 
	 */
	void addAuth(String sid, String params, String type, String category);

	/**
	 * 查询资源授权信息
	 * @param sid
	 * @param type
	 * @param category 
	 * @param rname 
	 */
	List<AuthorizeModel> listAuth(String sid, int type, int category, String rname);

	/**
	 * 删除授权信息
	 * @param ids
	 */
	void delByIds(String ids);

}
