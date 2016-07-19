package com.longtime.app.base.dao;

import com.longtime.app.base.model.LabelEntity;
import com.longtime.common.dao.BaseDAO;

public interface LabelEntityDao extends BaseDAO<LabelEntity,String>{

	/**
	 * 根据标题查询标签
	 * @author yangwenkui
	 * @time 2016年6月13日 下午8:50:54
	 * @param title
	 * @param domain 
	 * @return
	 */
	LabelEntity getByTitle(String title, String domain);

}
