package com.longtime.app.base.service;


import java.util.List;

import com.longtime.app.base.model.BaseGroupRelation;
import com.longtime.common.service.BaseService;

public interface GroupRelationService extends BaseService<BaseGroupRelation,String>{
    /**
     * 
     * @param gid 用户组id
     * @param domain 域
     * @param type 分类
     * @return
     */
	List<BaseGroupRelation> getGroupRelations(String gid,String domain,int type);

	void deleteByGid(String id);

	void deleteByGidAndType(String gid, int type);

	List<BaseGroupRelation> getGroupRelations(List<String> ugList, String domain);
}
