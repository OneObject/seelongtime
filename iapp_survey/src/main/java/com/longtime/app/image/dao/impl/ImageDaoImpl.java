package com.longtime.app.image.dao.impl;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.longtime.app.image.dao.ImageDao;

@Repository("imageDao")
public class ImageDaoImpl implements ImageDao {

	@Resource(name = "ixin_jdbcTemplate")
	private JdbcTemplate jdbcTemplate;

	@Override
	public boolean save(String fileName, String realName, String suffix, long createtime) {
		String sql = "insert into image_upload_record (id, realname, suffix, createtime) values(?, ?, ?, ?)";
		Object[] params = new Object[] { fileName, realName, suffix, createtime };
		int n = this.jdbcTemplate.update(sql, params);
		return n == 1;
	}

	public Map<String, Object> fingById(String id) {
		String sql = "select iur.* from image_upload_record iur where iur.id = ?";
		String sqlCount = "select count(*) from image_upload_record iur where iur.id = ?";
		Object[] params = new Object[] { id };
		int n = this.jdbcTemplate.queryForInt(sqlCount, params);
		if (n > 0) {
			Map<String, Object> map = this.jdbcTemplate.queryForMap(sql, params);
			return map;
		}
		return null;
	}

}