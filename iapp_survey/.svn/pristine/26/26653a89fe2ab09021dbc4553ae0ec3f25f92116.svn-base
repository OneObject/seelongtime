package com.longtime.app.ixin.mgr.channel.dao;

import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import org.springframework.stereotype.Repository;
import com.longtime.app.ixin.mgr.channel.model.ChannelEntity;

@Repository(value = "channelDao")
public class ChannelDaoImpl implements ChannelDao {

	@Resource
	private JdbcTemplate jdbcTemplate;

	@Override
	public List<ChannelEntity> getChannelList(String domain, int currentpage,
			int pagesize) {

		String sql = "select * from ixin_channel where domain=?  order by createtime desc limit ?,?";

		List<ChannelEntity> list = this.jdbcTemplate.query(sql, new Object[] {
				domain, (currentpage - 1) * pagesize, pagesize },
				new RowMapper<ChannelEntity>() {
					@Override
					public ChannelEntity mapRow(ResultSet rs, int rowNum)
							throws SQLException {

						ChannelEntity channelEntity = new ChannelEntity();
						channelEntity.setId(rs.getString("id"));
						channelEntity.setCreatetime(rs.getLong("createtime"));
						channelEntity.setCreator(rs.getString("creator"));
						channelEntity.setTitle(rs.getString("title"));
						channelEntity.setRemark(rs.getString("remark"));
						channelEntity.setCover(rs.getString("cover"));
						channelEntity.setDomain(rs.getString("domain"));
						return channelEntity;
					}
				});
		return list;
	}

	@Override
	public int save(ChannelEntity entity) {
		String sql = "insert into ixin_channel (id,title,remark,cover,creator,createtime,domain,style) values(?,?,?,?,?,?,?,?)";
		int result = this.jdbcTemplate.update(
				sql,
				new Object[] { entity.getId(), entity.getTitle(),
						entity.getRemark(), entity.getCover(),
						entity.getCreator(), entity.getCreatetime(),
						entity.getDomain(), entity.getStyle() });
		return result;
	}

	@Override
	public int delete(String id) {
		String sql = "delete from ixin_channel where id = ?";
		return this.jdbcTemplate.update(sql, new Object[] { id });
	}

	@Override
	public int getTotalNum(String domain) {

		String sql = "select count(*)as num  from ixin_channel where domain=?";

		return this.jdbcTemplate.queryForInt(sql, domain);
	}

	@Override
	public ChannelEntity getChannelEntity(String id) {

		String sql = "select * from ixin_channel where id=?";

		List<ChannelEntity> list = this.jdbcTemplate.query(sql,
				new Object[] { id }, new RowMapper<ChannelEntity>() {

					@Override
					public ChannelEntity mapRow(ResultSet rs, int rowNum)
							throws SQLException {

						ChannelEntity channelEntity = new ChannelEntity();

						channelEntity.setId(rs.getString("id"));
						channelEntity.setCover(rs.getString("cover"));
						channelEntity.setCreatetime(rs.getLong("createtime"));
						channelEntity.setCreator(rs.getString("creator"));
						channelEntity.setDomain(rs.getString("domain"));
						channelEntity.setRemark(rs.getString("remark"));
						channelEntity.setTitle(rs.getString("title"));
						channelEntity.setUpdatetime(rs.getLong("updatetime"));
						channelEntity.setUpdator(rs.getString("updator"));
						channelEntity.setStyle(rs.getInt("style"));
						return channelEntity;
					}
				});

		if (list != null && list.size() > 0) {
			return list.get(0);
		}

		return new ChannelEntity();
	}

	@Override
	public void update(ChannelEntity channelEntity) {
		String sql = "update ixin_channel set title=? ,remark=?,cover=?, style=?,updatetime=? where id=?";
		this.jdbcTemplate.update(sql, channelEntity.getTitle(),
				channelEntity.getRemark(), channelEntity.getCover(),
				channelEntity.getStyle(), System.currentTimeMillis(),
				channelEntity.getId());
	}

}
