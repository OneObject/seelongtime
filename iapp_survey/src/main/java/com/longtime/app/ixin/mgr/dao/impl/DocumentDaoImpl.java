package com.longtime.app.ixin.mgr.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.longtime.app.ixin.mgr.dao.DocumentDao;
import com.longtime.app.ixin.mgr.model.DocumentEntity;
import com.longtime.common.utils.Page;

@Repository("documentDao")
public class DocumentDaoImpl implements DocumentDao
{
	@Resource(name="ixin_jdbcTemplate")
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public boolean save(DocumentEntity documentEntity)
	{
		String sql = "insert into base_document(id,name,originalname,status,path,domain,createtime,creator,updatetime,updater,isdel,size) values (?,?,?,?,?,?,?,?,?,?,?,?)";
		Object[] params = {documentEntity.getId(),
						   documentEntity.getName(),
						   documentEntity.getOriginalname(),
						   documentEntity.getStatus(),
						   documentEntity.getPath(),
						   documentEntity.getDomain(),
						   documentEntity.getCreatetime(),
						   documentEntity.getCreator(),
						   documentEntity.getUpdatetime(),
						   documentEntity.getUpdater(),
						   documentEntity.getIsdel(),
						   documentEntity.getSize()};
		try
		{
			jdbcTemplate.update(sql, params);
		} catch (Exception e)
		{
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public boolean deleteById(String id)
	{
		String sql = "update base_document set isdel = 1 where id=? ";
		try
		{
			jdbcTemplate.update(sql,id);
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
		String sql = "update base_document set status=?,failmsg=?,failnum=?,pagenum=? where id=?";
		try
		{
			jdbcTemplate.update(sql, documentEntity.getStatus(),documentEntity.getFailmsg(),documentEntity.getFailnum(),documentEntity.getPagenum(),documentEntity.getId());
		} catch (Exception e)
		{
			e.printStackTrace();
			return true;
		}
		return true;
	}

	@Override
	public DocumentEntity queryByid(String id)
	{
		String sql = "select * from base_document where id = ?";
		List<DocumentEntity> list = jdbcTemplate.query(sql,new Object[]{id},new DocumentRowMapper());
		if (list!=null&&!list.isEmpty())
		{
			return list.get(0);
		}
		return null;
	}

	@Override
	public com.longtime.common.utils.ResultSet<DocumentEntity> queryByPage(String domain, Page page)
	{
		String sql = "select * from base_document where domain=? and isdel=0 order by createtime desc limit ?,?";
		Object[] params = {domain,page.getStart(),page.getPage_size()};
		List<DocumentEntity> list = jdbcTemplate.query(sql,params,new DocumentRowMapper());
		Long count;
		try {
			String sqls = "select count(id) as num  from base_document where domain=? and isdel=0";
			count = jdbcTemplate.queryForLong(sqls, domain);
		} catch (DataAccessException e) {
			count = 0L;
		}
		int total_size = Integer.valueOf(count.toString());
		com.longtime.common.utils.ResultSet<DocumentEntity> rs = new com.longtime.common.utils.ResultSet<DocumentEntity>(
				list,page.getPage_size(), page.getCurrent_page(), total_size);

		return rs;
	}
	
	
	@Override
	public void changeStatus(String id, int status,int failnum)
	{
		String sql = "update base_document set status=?,failnum = ? where id=?  ";
		jdbcTemplate.update(sql,status,failnum,id); 
	}
	@Override
	public int querycount(String domain)
	{
		String sql = "select count(id) as num  from base_document where domain=? and isdel=0";
		jdbcTemplate.queryForInt(sql,domain);
		return 0;
	}	
	
	private class DocumentRowMapper implements RowMapper<DocumentEntity>
	{
		@Override
		public DocumentEntity mapRow(ResultSet rs, int rowNum)
				throws SQLException
		{
			// TODO 将查询结果转化为java类
			DocumentEntity documentEntity = new DocumentEntity();
			documentEntity.setId(rs.getString("id"));
			documentEntity.setName(rs.getString("name"));
			documentEntity.setOriginalname(rs.getString("originalname"));
			documentEntity.setStatus(rs.getInt("status"));
			documentEntity.setPath(rs.getString("path"));
			documentEntity.setFailmsg(rs.getString("failmsg"));
			documentEntity.setFailnum(rs.getInt("failnum"));
			documentEntity.setPagenum(rs.getInt("pagenum"));
			documentEntity.setDomain(rs.getString("domain"));
			documentEntity.setCreatetime(rs.getLong("createtime"));
			documentEntity.setCreator(rs.getString("creator"));
			documentEntity.setUpdatetime(rs.getLong("updatetime"));
			documentEntity.setUpdater(rs.getString("updater"));
			documentEntity.setIsdel(rs.getInt("isdel"));
			return documentEntity;
		}
	}

	@Override
	public com.longtime.common.utils.ResultSet<DocumentEntity> queryByName(
			String domain, Page page, String name)
	{
		String sql = "select * from base_document where domain=? and isdel=0 and originalname like ? order by createtime desc limit ?,?";
		Object[] params = {domain,"%"+name+"%",page.getStart(),page.getPage_size()};
		List<DocumentEntity> list = jdbcTemplate.query(sql,params,new DocumentRowMapper());
		Long count;
		try {
			String sqls = "select count(id) as num from base_document where domain=? and isdel=0 and originalname like ? ";
			count = jdbcTemplate.queryForLong(sqls, domain,"%"+name+"%");
		} catch (DataAccessException e) {
			count = 0L;
		}
		int total_size = Integer.valueOf(count.toString());
		com.longtime.common.utils.ResultSet<DocumentEntity> rs = new com.longtime.common.utils.ResultSet<DocumentEntity>(
				list,page.getPage_size(), page.getCurrent_page(), total_size);

		return rs;
	}

	@Override
	public com.longtime.common.utils.ResultSet<DocumentEntity> queryConvertSuccesslist(String domain,Page page) {
		String sql = "select * from base_document where domain=? and isdel=0 and status=? order by createtime desc limit ?,?";
		Object[] params = {domain,DocumentEntity.STATUS_CONVERT_SUCCESS,page.getStart(),page.getPage_size()};
		List<DocumentEntity> list = jdbcTemplate.query(sql,params,new DocumentRowMapper());
		Long count;
		try {
			String sqls = "select count(id) as num from base_document where domain=? and isdel=0 and status=?";
			count = jdbcTemplate.queryForLong(sqls, domain,DocumentEntity.STATUS_CONVERT_SUCCESS);
		} catch (DataAccessException e) {
			count = 0L;
		}
		int total_size = Integer.valueOf(count.toString());
		page.setTotal_size(total_size);
		com.longtime.common.utils.ResultSet<DocumentEntity> rs = new com.longtime.common.utils.ResultSet<DocumentEntity>(
				list,page.getPage_size(), page.getCurrent_page(), total_size);

		return rs;
	}
	
}
