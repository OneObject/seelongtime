package com.longtime.app.ixin.mgr.dao.impl;

import java.lang.reflect.Field;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.web.util.HtmlUtils;

import com.longtime.app.ixin.mgr.dao.StudyDao;
import com.longtime.app.ixin.mgr.fodder.model.FodderEntity;
import com.longtime.app.ixin.mgr.fodder.vo.FodderVO;
import com.longtime.app.ixin.protocol.ItemArticle;
import com.longtime.app.util.HTMLUtils;

@Repository("studyDao")
public class StudyDaoImpl implements StudyDao{
	
	@Resource(name = "ixin_jdbcTemplate")
	private JdbcTemplate jdbcTemplate;

	@Override
	public List<FodderVO> queryByPage(int currpage, int pageSize, String domain,String columnType) {
		String sql = "select fodder.*,info.id as columnId from ixin_columninfo info left join ixin_fodder fodder on info.fodderId=fodder.id where info.domain=? and columnType=? and info.del=0 order by info.saveTime desc limit ?,?";
		final Field[] fields = FodderEntity.class.getDeclaredFields();
		return jdbcTemplate.query(sql, new Object[]{domain,columnType,(currpage-1)*pageSize,pageSize},new RowMapper<FodderVO>(){
			@Override
			public FodderVO mapRow(ResultSet rs, int rowNum)
					throws SQLException {
				FodderVO vo = new FodderVO();
				try{
					for (Field field : fields) {
						BeanUtils.setProperty(vo, field.getName(), rs.getString(field.getName()));
					}
					BeanUtils.setProperty(vo, "ext", rs.getString("columnId"));
				}catch(Exception e){
					e.printStackTrace();
				}
				return vo;
			}
		});
	}

	@Override
	public int getTotalSize(String domain, String columnId) {
		String sql = "select count(*) c from ixin_columninfo where domain=? and del=0 and columnType=?";
		List<Integer> list = jdbcTemplate.query(sql, new Object[]{domain,columnId},new RowMapper<Integer>(){
			@Override
			public Integer mapRow(ResultSet rs, int rowNum) throws SQLException {

				return rs.getInt("c");
			}
		});
		if(list!=null && list.size()>0){
			return list.get(0);
		}
		return 0;
	}

	@Override
	public void delById(String id,String baseId) {
		String sql = "delete from ixin_columninfo where id=?";
		jdbcTemplate.update(sql,id);
		String sql1 = "update ixin_fodder set del=1 where id=?";
		jdbcTemplate.update(sql1,baseId);
	}

	@Override
	public List<ItemArticle> queryItemArticleList(int itemNum,final String qiniuImageBasePath,final String suffix,final String matterBasePath,String domain,String columnType) {
		
		String sql = "SELECT fodder.* FROM `ixin_columninfo` info left join ixin_fodder fodder on fodder.id=info.fodderId where info.domain=? and info.columnType=? ORDER BY info.saveTime desc limit 0,?";
		
		return jdbcTemplate.query(sql, new Object[]{domain,columnType,itemNum},new RowMapper<ItemArticle>(){
			public ItemArticle mapRow(ResultSet rs, int rowNum)
					throws SQLException {
				ItemArticle item = new ItemArticle();
				
				item.setId(rs.getString("id"));
				item.setDescription(StringUtils.isBlank(rs.getString("summary"))?StringUtils.substring(HTMLUtils.html2Text(HtmlUtils.htmlUnescape(rs.getString("content"))),0,30 ):rs.getString("summary"));
				item.setPicUrl(String.format("%s%s%s", qiniuImageBasePath,rs.getString("coverPath"),suffix));
				item.setUrl(String.format("%s%s%s", matterBasePath,"id=",rs.getString("id")));
				item.setTitle(rs.getString("title"));
				return item;
			}
		});
	}

	@Override
	public void delByFodderId(String id) {
		String sql = "delete from ixin_columninfo where fodderId=?";
		jdbcTemplate.update(sql,id);
	}
}

