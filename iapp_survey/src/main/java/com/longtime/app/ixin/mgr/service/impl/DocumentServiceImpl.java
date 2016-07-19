package com.longtime.app.ixin.mgr.service.impl;


import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.longtime.app.ixin.mgr.dao.DocumentDao;
import com.longtime.app.ixin.mgr.model.DocumentEntity;
import com.longtime.app.ixin.mgr.service.DocumentService;
import com.longtime.common.utils.Page;
import com.longtime.common.utils.ResultSet;

@Service("documentService")
public class DocumentServiceImpl implements DocumentService
{
	@Resource
	private DocumentDao documentDao;
	
	
	@Override
	public boolean save(DocumentEntity documentEntity)
	{
		try
		{
			documentDao.save(documentEntity);
		} catch (Exception e)
		{
			return false;
		}
		return true;
	}

	@Override
	public boolean deleteById(String id)
	{
		try
		{
			documentDao.deleteById(id);
		} catch (Exception e)
		{
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public boolean update(DocumentEntity documentEntity)
	{
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public DocumentEntity queryByid(String id){
	
		return documentDao.queryByid(id);
	}

	@Override
	public ResultSet<DocumentEntity> queryByPage(String domain,Page page)
	{
		ResultSet<DocumentEntity> list = documentDao.queryByPage(domain, page);
		return list;
	}

	@Override
	public ResultSet<DocumentEntity> queryByName(String domain, String name,
			Page page)
	{
		ResultSet<DocumentEntity> rSet = documentDao.queryByName(domain, page, name);
		return rSet;
	}

	@Override
	public void changeStatus(String id, int status, int failnum)
	{
		documentDao.changeStatus(id, status, failnum);
	}

	@Override
	public ResultSet<DocumentEntity> queryConvertSuccesslist(String domain,Page page) {
		return documentDao.queryConvertSuccesslist(domain, page);
	}

}
