package com.longtime.app.ixin.mgr.service;


import com.longtime.app.ixin.mgr.model.DocumentEntity;
import com.longtime.common.utils.Page;
import com.longtime.common.utils.ResultSet;

public interface DocumentService  {
	public boolean save(DocumentEntity documentEntit);
	public boolean deleteById(String id);
	public boolean update(DocumentEntity documentEntity);
	public DocumentEntity queryByid(String id);
	public ResultSet<DocumentEntity> queryByPage(String domain,Page page);
	public void changeStatus(String id,int status,int failnum);
	public ResultSet<DocumentEntity> queryByName(String domain,String name,Page page);
	
	/**
	 * 查询当前域下转码成功的文档
	 * @param obj
	 * @return
	 */
	public ResultSet<DocumentEntity> queryConvertSuccesslist(String domain,Page page);
}
