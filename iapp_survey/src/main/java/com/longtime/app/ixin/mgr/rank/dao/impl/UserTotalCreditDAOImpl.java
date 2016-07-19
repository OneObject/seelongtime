package com.longtime.app.ixin.mgr.rank.dao.impl;

import com.longtime.app.ixin.mgr.rank.dao.IUserTotalCreditDAO;
import com.longtime.app.ixin.mgr.rank.model.UserTotalCreditEntityVO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedRowMapper;
import org.springframework.stereotype.Repository;

@Repository("userToalCreditDAO")
public class UserTotalCreditDAOImpl implements IUserTotalCreditDAO {
	@Resource(name = "ixin_jdbcTemplate")
	private JdbcTemplate jdbcTemplate;

	/**
	 * 查看积分排行
	 * @return
	 */
	@Override
	public List<UserTotalCreditEntityVO> getCreditEntityRanking(String domain,int pageSize) {
		String sql = "select ibu.username,ibu.name,uct.uid,uct.credit,uct.experience,uct.ext1,uct.ext2,uct.updatetime  from user_credit_total as uct,iapp_base_user as ibu where uct.uid = ibu.id and ibu.domain=? and ibu.isdel='0' and ibu.usertype='0' order by uct.credit desc limit 0,?";
		List<UserTotalCreditEntityVO> userTotalCreditEntities = jdbcTemplate.query(sql,new UserTotalCreditEntityRowMapper(),domain,pageSize);
		if (!userTotalCreditEntities.isEmpty() && userTotalCreditEntities != null){
			return userTotalCreditEntities;
		}
		return null;
	}
	
	
	private class UserTotalCreditEntityRowMapper implements ParameterizedRowMapper<UserTotalCreditEntityVO> {

		@Override
		public UserTotalCreditEntityVO mapRow(ResultSet rs, int rowNum) throws SQLException {
			UserTotalCreditEntityVO userTotalCreditEntity = new UserTotalCreditEntityVO();
			String username = rs.getString("username");
			String name = rs.getString("name");
			String uid = rs.getString("uid");
			long credit = rs.getLong("credit");
			long experience = rs.getLong("experience");
			long ext1 = rs.getLong("ext1");
			long ext2 = rs.getLong("ext2");
			long updatetime = rs.getLong("updatetime");
			
			if(StringUtils.isNotBlank(name)){
				username = name;
			}
			userTotalCreditEntity.setUsername(username);
			userTotalCreditEntity.setUid(uid);
			userTotalCreditEntity.setCredit(credit);
			userTotalCreditEntity.setExperience(experience);
			userTotalCreditEntity.setExt1(ext1);
			userTotalCreditEntity.setExt2(ext2);
			userTotalCreditEntity.setUpdatetime(updatetime);
			
			return userTotalCreditEntity;
		}
		
	}

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
}
