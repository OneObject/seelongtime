package com.longtime.app.ixin.mgr.rank.dao.impl;

import com.google.common.collect.Lists;
import com.longtime.app.ixin.mgr.rank.dao.RankDao;
import com.longtime.app.ixin.mgr.rank.model.RankEntity;
import com.longtime.app.util.IdGenerator;
import com.longtime.common.utils.LoginSessionHelper;
import com.longtime.common.utils.Page;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository(value = "rankDao")
public class RankDaoImpl implements RankDao {
	
	@Resource(name="ixin_jdbcTemplate")
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public RankEntity getById(String id) {
		String sql = "select * from ixin_rank where id=?";
		List<RankEntity> list = jdbcTemplate.query(sql, new String[]{id},new RankRowMapper());
		return (CollectionUtils.isEmpty(list))? null :list.get(0);
	}

	@Override
	public RankEntity insetOrUpdata(RankEntity rank) {
		String currentUid = LoginSessionHelper.getThreadLocalUid();
		String currentUname = LoginSessionHelper.getThreadLocalUname();
		
		boolean isInsert = false;
		if(StringUtils.isNotBlank(rank.getId())){
			RankEntity entity = this.getById(rank.getId());
			if(null==entity){
				// 新增
				isInsert = true;
			}
		}else{
			isInsert = true;
			rank.setId(IdGenerator.nextId32().toString());
		}
		if(isInsert){
			//新增
			rank.setCreator(currentUid);
			rank.setCreatorName(currentUname);
			String sql = "insert into ixin_rank(id,title,remark,domain,cover,items,model,datetype,starttime,endtime,creator,createtime,timestr,creatorName) value (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			jdbcTemplate.update(sql, rank.getId(),rank.getTitle(),rank.getRemark(),rank.getDomain(),rank.getCover(),rank.getItemStr(),rank.getModel(),rank.getDatetype(),rank.getStarttime(),rank.getEndtime(),rank.getCreator(),rank.getCreatetime(),rank.getTimestr(),rank.getCreatorName());
			
		}else{
			rank.setUpdater(currentUid);
			rank.setUpdaterName(currentUname);
			rank.setUpdatetime(System.currentTimeMillis());
			System.out.println(rank.getUpdaterName());
			// 修改
			String sql = "update ixin_rank  set title=?,remark=?,domain=?,cover=?,items=?,model=?,datetype=?,starttime=?,endtime=?,updater=?,updatetime=?,updaterName=? where id=?";
			jdbcTemplate.update(sql, rank.getTitle(),rank.getRemark(),rank.getDomain(),rank.getCover(),rank.getItemStr(),rank.getModel(),rank.getDatetype(),rank.getStarttime(),rank.getEndtime(),rank.getUpdater(),rank.getUpdatetime(),rank.getUpdaterName(),rank.getId());
		}
		return rank;
		
	}

	@Override
	public int deleteById(String id) {
		String sql = "delete from  ixin_rank where id=?";
		return jdbcTemplate.update(sql, id);
	}

	@Override
	public List<RankEntity> getList(
			String domain,Page page) {
		String sql="select * from ixin_rank where domain=? and model=0 limit ?,? ";
		List<RankEntity> list = jdbcTemplate.query(sql,new Object[]{domain,(page.getCurrent_page()-1)*page.getPage_size(),page.getPage_size()},new RankRowMapper());
		return (CollectionUtils.isEmpty(list))? null :list;
	}
	
	
	@Override
	public List<RankEntity> getList(String domain,Page page,String model) {
		String sql="select * from ixin_rank where domain=? and model= ? order by createtime desc limit ?,? ";
		List<RankEntity> list = jdbcTemplate.query(sql,new Object[]{domain,model,(page.getCurrent_page()-1)*page.getPage_size(),page.getPage_size()},new RankRowMapper());
		return (CollectionUtils.isEmpty(list))? null :list;
	}
	
	
	@Override
	public com.longtime.common.utils.ResultSet<RankEntity> getResultSet(String domain,String name,Page page){
		List<Object> param = Lists.newArrayList();
		StringBuilder sb = new StringBuilder(" from ixin_rank where domain=? ");
		
		param.add(domain);
		if(StringUtils.isNotBlank(name)){
			sb.append(" and title like ?");
			param.add(String.format("%%%s%%", StringUtils.trim(name)));
		}
		
		
		
		Long count = jdbcTemplate.queryForLong(String.format("select count(*) %s ", sb.toString()), param.toArray());
		
		page.setTotal_size(count.intValue());
		
		if(0==count){
			return com.longtime.common.utils.ResultSet.emptyResultSet();
		}
		
		
		sb.append("order by createTime desc limit ?,?");
		param.add(page.getStart());
		param.add(page.getPage_size());
		
		List<RankEntity> list =  jdbcTemplate.query(String.format("select *  %s ", sb.toString()), param.toArray(),new RankRowMapper());
		com.longtime.common.utils.ResultSet<RankEntity> rs = new com.longtime.common.utils.ResultSet<RankEntity>();
		rs.setItems(list);
		rs.setPage(page);
		return rs;
		
		
	}
	
	
	class RankRowMapper implements RowMapper<RankEntity>{

		@Override
		public RankEntity mapRow(ResultSet rs, int rowNum) throws SQLException {
			
			RankEntity rank = new RankEntity();
			rank.setId(rs.getString("id"));
			rank.setTitle(rs.getString("title"));
			rank.setRemark(rs.getString("remark"));
			rank.setDomain(rs.getString("domain"));
			rank.setCover(rs.getString("cover"));
			rank.setItemsFromString(rs.getString("items"));
			rank.setModel(rs.getInt("model"));
			rank.setDatetype(rs.getInt("datetype"));
			rank.setStarttime(rs.getLong("starttime"));
			rank.setEndtime(rs.getLong("endtime"));
			rank.setTimestr(rs.getString("timestr"));
			rank.setCreator(rs.getString("creator"));
			rank.setCreatorName(rs.getString("creatorName"));
			rank.setCreatetime(rs.getLong("createtime"));
			rank.setUpdater(rs.getString("updater"));
			rank.setUpdaterName(rs.getString("updaterName"));
			rank.setUpdatetime(rs.getLong("updatetime"));
			return rank;
		}
		
	}

	@Override
	public int getcount(String domain,String model) {
		String sql="select count(*) from ixin_rank where domain=? and model= ?";
		return jdbcTemplate.queryForInt(sql, domain,model);
	}
	


	
}
