package com.longtime.app.ixin.mgr.dao;

import java.util.Map;

import com.longtime.app.ixin.mgr.model.DocumentEntity;
import com.longtime.common.utils.Page;
import com.longtime.common.utils.ResultSet;

public interface DocumentDao
{
	boolean save(DocumentEntity documentEntity);
	boolean deleteById(String id);
	boolean update(DocumentEntity documentEntity);
	DocumentEntity queryByid(String id);
	ResultSet<DocumentEntity> queryByPage(String domain,Page page);
	void changeStatus(String id, int status,int failnum);
	int querycount(String domain);
	ResultSet<DocumentEntity> queryByName(String domain,Page page,String name);
	
	/**
	 * 查询当前域下转码成功的文档
	 * @param obj
	 * @return
	 */
	public ResultSet<DocumentEntity> queryConvertSuccesslist(String domain,Page page);
}
