package com.longtime.app.step.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.longtime.app.step.dao.StepRelationDao;
import com.longtime.app.step.model.StepRelation;
import com.longtime.app.util.IdGenerator;

@Repository("stepRelationDao")
public class StepRelationDaoImpl implements StepRelationDao{

	private Logger logger = LoggerFactory.getLogger(StepRelationDaoImpl.class);
	
	@Resource(name="ixin_jdbcTemplate")
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public String add(StepRelation releation) {
		if(releation == null){
			return "";
		}
		if(StringUtils.isBlank(releation.getId())){
			releation.setId(IdGenerator.nextId32().toString());
		}
		String sql = "insert into iapp_step_relation(id, sid, type, domain,step) value(?,?,?,?,?)";
		Object[] params = new Object[]{releation.getId(),releation.getSid(),releation.getType(),releation.getDomain(),releation.getStep()};
		try {
			jdbcTemplate.update(sql, params);
			return releation.getId();
		} catch(DataAccessException ex) {
			logger.debug("add step relation fail!because: " + ex);
			return "";
		}
	}

	@Override
	public StepRelation findBySid(String sid, int type, String domain) {
		String sql = "select * from iapp_step_relation where sid=? and domain=? and type=? ";
		Object[] params = new Object[]{sid,domain,type};
		try {
			List<StepRelation> list = jdbcTemplate.query(sql, params, new RowMapper<StepRelation>(){

				@Override
				public StepRelation mapRow(ResultSet rs, int rowNum)
						throws SQLException {
					String id = rs.getString("id");
					String sid = rs.getString("sid");
					String domain = rs.getString("domain");
					int step = rs.getInt("step");
					int type = rs.getInt("type");
					
					StepRelation stepReleation = new StepRelation();
					stepReleation.setId(id);
					stepReleation.setSid(sid);
					stepReleation.setDomain(domain);
					stepReleation.setStep(step);
					stepReleation.setType(type);
					return stepReleation;
				}
				
			});
			if(CollectionUtils.isNotEmpty(list)){
				return list.get(0);
			}
			return null;
		} catch(DataAccessException ex) {
			logger.debug(String.format("find step relation fail,sid=%s,type=%d,domain=%s!because:%s ", sid,type,domain,ex));
			return null;
		}
	}

	@Override
	public void update(String id,int step) {
		String sql = "update iapp_step_relation set step=? where id=? ";
		Object[] params = new Object[]{step,id};
		try {
			jdbcTemplate.update(sql, params);
		} catch(DataAccessException ex) {
			logger.debug(String.format("update step relation fail where id=%s!because: %s", step,id));
		}
	}
}
