package com.longtime.app.ixin.mgr.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.math.NumberUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.longtime.app.ixin.mgr.dao.MessageRecordDao;
import com.longtime.app.ixin.mgr.model.MessageRecordVO;
import com.longtime.common.utils.Page;

@Repository("messageRecordDao")
public class MessageRecordDaoImpl implements MessageRecordDao {

	private static final Logger logger = LoggerFactory
			.getLogger(MessageRecordDaoImpl.class);
	@Resource(name = "ixin_jdbcTemplate")
	private JdbcTemplate jdbcTemplate;

	@Override
	public void save(String id, String fids, String currentUserId,
			long currentTimeMillis, String domain,int status) {
		String sql = "insert into ixin_message_send_record(id,sendUid,fids,sendTime,domain,status,contenttype) values (?,?,?,?,?,?,?)";
		Object[] params = new Object[] { id, currentUserId, fids,
				currentTimeMillis, domain,status ,0};
		try {
			jdbcTemplate.update(sql, params);
		} catch (DataAccessException ex) {
			logger.error("add send record  fail!because: " + ex);
		}

	}
	
	@Override
	public void save(String id, String content, String contentType,
			String currentUserId, long currentTimeMillis, String domain,
			int status,String remark) {
		
		String sql = "insert into ixin_message_send_record(id,sendUid,";
		String field = "fids";
		if("1".equals(contentType)){
			field = "content";
		}
		sql = String.format("%s%s%s", sql,field,",sendTime,domain,status,contenttype,remark) values (?,?,?,?,?,?,?,?)");
		Object[] params = new Object[] { id, currentUserId, content,
				currentTimeMillis, domain,status ,NumberUtils.toInt(contentType),remark};
		try {
			jdbcTemplate.update(sql, params);
		} catch (DataAccessException ex) {
			logger.error("add send record fail!because: " + ex);
		}
	}

	@Override
	public List<MessageRecordVO> list(String domain,Page page) {
			String sql = "select * from ixin_message_send_record where domain=? order by sendTime desc limit ?,? ";
			List<MessageRecordVO> list = this.jdbcTemplate.query(sql, new Object[]{domain,page.getStart(),page.getPage_size()}, new RowMapper<MessageRecordVO>(){

				@Override
				public MessageRecordVO mapRow(ResultSet rs, int rowNum) throws SQLException {
					MessageRecordVO record = new MessageRecordVO();
					record.setDomain(rs.getString("domain"));
					record.setId(rs.getString("id"));
					record.setContentType(rs.getInt("contenttype"));
					record.setContent("content");
					record.setFids(rs.getString("fids"));
					record.setSendTime(rs.getLong("sendTime"));
					record.setSendUid(rs.getString("sendUid"));
					return record;
				}});
			return list;
			
		
	}
	@Override
	public int count(String domain) {
		String sql = "select count(*) from ixin_message_send_record where domain=?  ";
		return this.jdbcTemplate.queryForInt(sql,domain);
		
	}

}
