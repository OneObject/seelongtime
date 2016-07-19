package com.longtime.app.ixin.mgr.service;

import java.util.List;

import com.longtime.app.ixin.mgr.fodder.vo.FodderVO;

public interface StudyService {

	List<FodderVO> queryByPage(String domain,int currpage,String columnId);
	
	int getTotalSize(String domain,String columnId);
	
	int getPageSize();

	void delById(String id,String baseId);

	void delByFodderId(String id);
}
