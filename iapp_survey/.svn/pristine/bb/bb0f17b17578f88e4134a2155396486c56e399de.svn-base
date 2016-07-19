package com.longtime.app.ixin.mgr.dao;

import java.util.List;

import com.longtime.app.ixin.mgr.fodder.vo.FodderVO;
import com.longtime.app.ixin.protocol.ItemArticle;

public interface StudyDao {

	List<FodderVO> queryByPage(int currpage, int pageSize, String domain,String columnId);

	int getTotalSize(String domain, String columnId);

	void delById(String id,String baseId);

	List<ItemArticle> queryItemArticleList(int itemNum,String qiniuImageBasePath,String suffix,String fodderBasePath,String domain,String columnType);

	void delByFodderId(String id);

}
