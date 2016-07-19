package com.longtime.ajy.student.service;

import java.util.List;

import com.longtime.ajy.model.Authorize;
import com.longtime.common.service.IService;


public interface AuthorizeService extends IService<Authorize,String>{

	/**
	 * 查找某个用户的某种授权资源
	 * @param uid
	 * @return
	 */
	List<Authorize> listByUidAndRcategory(String uid,int rcategory);
    
	List<Authorize> listByUidAndRcategory2(String uid,int rcategory);

	List<String> listRidByUidAndRcategory(String uid, int category,String domain);
}
