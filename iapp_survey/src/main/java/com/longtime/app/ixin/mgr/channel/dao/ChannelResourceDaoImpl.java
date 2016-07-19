package com.longtime.app.ixin.mgr.channel.dao;

import com.google.common.collect.Lists;
import com.longtime.app.ixin.mgr.channel.model.ChannelResourceEntity;
import com.longtime.app.ixin.mgr.channel.model.ResourceVO;
import com.longtime.app.util.IdGenerator;
import org.apache.commons.lang3.StringUtils;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;


@Repository("channelResourceDao")
public class ChannelResourceDaoImpl implements ChannelResourceDao
{
	@Resource
	private JdbcTemplate jdbcTemplate;
	
	

	@Override
	public int deleteByChannelid(String channelid) {
		String sql2="select count(*) as num from ixin_channel_resource where channelid=?";
		int result=this.jdbcTemplate.queryForInt(sql2,channelid);
		if(result<=0){
			return 1;
		}
		String sql="delete from ixin_channel_resource where channelid=?";
		return this.jdbcTemplate.update(sql,channelid);
	}
	
	@Override
	public int deleteByresourceid(String resourceid) {
		String sql2="select count(*) as num from ixin_channel_resource where resourceid=?";
		int result=this.jdbcTemplate.queryForInt(sql2,resourceid);
		if(result<=0){
			return 1;
		}
		String sql="delete from ixin_channel_resource where resourceid=?";
		return this.jdbcTemplate.update(sql,resourceid);
	}
	
	@Override
	public List<ChannelResourceEntity> getChannelResourceEntities(int restype,String channelid,int currentpage, int pagesize,String weight,String searchContent) {
		
		List<Object> list=Lists.newArrayList();
		
		StringBuilder sb=new StringBuilder("select * from ixin_channel_resource where 1=1 ");
		if(restype==ChannelResourceEntity.ALL_RESTYPE){
			
		}else{
			sb.append(" and restype=?");
			list.add(restype);
		}
		
		sb.append(" and channelid=?");
		list.add(channelid);
		
		if (StringUtils.isNotBlank(searchContent)) {
			sb.append(" and resname like ? ");
			list.add(String.format("%%%s%%", searchContent));
		}
		
		if(StringUtils.isNotBlank(weight)){
			sb.append(" order by ? desc ");
			list.add(weight);
		}
		sb.append(" limit ?,?");
        list.add((currentpage-1)*pagesize);
        list.add(pagesize);
      return  this.jdbcTemplate.query(sb.toString(),list.toArray(),new RowMapper<ChannelResourceEntity>() {

			@Override
			public ChannelResourceEntity mapRow(ResultSet rs, int rowNum) throws SQLException {
				
				ChannelResourceEntity channelResourceEntity=new ChannelResourceEntity();
				
				channelResourceEntity.setId(rs.getString("id"));
				channelResourceEntity.setChannelid(rs.getString("channelid"));
				channelResourceEntity.setRescover(rs.getString("rescover"));
				channelResourceEntity.setResname(rs.getString("resname"));
				channelResourceEntity.setResourceid(rs.getString("resourceid"));
				channelResourceEntity.setRestype(rs.getInt("restype"));
				channelResourceEntity.setWeight(rs.getLong("weight"));
				return channelResourceEntity;
			}
		});
	}

	@Override
	public int deleteById(String id) {
		String sql="delete from ixin_channel_resource where id=?";
		return this.jdbcTemplate.update(sql,id);
	}

	@Override
	public ChannelResourceEntity getChannelResourceEntity(String id) {
		String sql="select * from ixin_channel_resource where id=?";
		List<ChannelResourceEntity> list=this.jdbcTemplate.queryForList(sql,ChannelResourceEntity.class,id);
		if(list!=null && list.size()>0){
			return list.get(0);
		}
		return null;
	}

	@Override
	public int batchinsert(String channelid, String[] resourceids,String[] titles,String[] covers,int restype) {
		
		String sql="insert into ixin_channel_resource(id,channelid,resourceid,restype,rescover,resname,weight,timestamp)values(?,?,?,?,?,?,?,?)";
		
		List<Object[]> list=Lists.newArrayList();
		
		for(int i=0;i<resourceids.length;i++){
			Object[] objects=new Object[8];
			objects[0]=IdGenerator.nextId32();
			objects[1]=channelid;
			objects[2]=resourceids[i];
			objects[3]=restype;
			objects[4]=covers[i];
			objects[5]=titles[i];
			objects[6]=System.currentTimeMillis();
			objects[7]=objects[6];
			list.add(objects);
		}
		int[] nums=this.jdbcTemplate.batchUpdate(sql,list);
		return nums.length;
	}


	@Override
	public int gettotal(String channelid, int restype,String searchContent) {
		
        List<Object> list=Lists.newArrayList();
		
		StringBuilder sb=new StringBuilder("select count(*) as num  from ixin_channel_resource where 1=1 ");
		if(restype==ChannelResourceEntity.ALL_RESTYPE){
			
		}else{
			sb.append(" and restype=?");
			list.add(restype);
		}
		
		sb.append(" and channelid=?");
		list.add(channelid);
		
		if (StringUtils.isNotBlank(searchContent)) {
			sb.append(" and resname like ? ");
			list.add(String.format("%%%s%%", searchContent));
		}
		
		return this.jdbcTemplate.queryForInt(sb.toString(),list.toArray());
	}


	@Override
	public List<ChannelResourceEntity> getlist(String resourceid, int restype) {
		
		String sql="select * from ixin_channel_resource where resourceid=? and restype=?";
		
		
		return this.jdbcTemplate.query(sql,new Object[]{resourceid,restype},new RowMapper<ChannelResourceEntity>() {

			@Override
			public ChannelResourceEntity mapRow(ResultSet rs, int rowNum) throws SQLException {
                ChannelResourceEntity channelResourceEntity=new ChannelResourceEntity();
				
				channelResourceEntity.setId(rs.getString("id"));
				channelResourceEntity.setChannelid(rs.getString("channelid"));
				channelResourceEntity.setRescover(rs.getString("rescover"));
				channelResourceEntity.setResname(rs.getString("resname"));
				channelResourceEntity.setResourceid(rs.getString("resourceid"));
				channelResourceEntity.setRestype(rs.getInt("restype"));
				channelResourceEntity.setWeight(rs.getLong("weight"));
				return channelResourceEntity;
			}
		});
	}
	@Override
	public List<ChannelResourceEntity> getlist(String channelid) {
		
		String sql="select * from ixin_channel_resource where channelid = ? order by weight desc";
		
		List<ChannelResourceEntity> list = this.jdbcTemplate.query(sql,new Object[]{channelid},new RowMapper<ChannelResourceEntity>() {
			@Override
			public ChannelResourceEntity mapRow(ResultSet rs, int arg1)throws SQLException {
				ChannelResourceEntity entity = new ChannelResourceEntity();
				entity.setId(rs.getString("id"));
				entity.setChannelid(rs.getString("channelid"));
				entity.setRescover(rs.getString("rescover"));
				entity.setResname(rs.getString("resname"));
				entity.setResourceid(rs.getString("resourceid"));
				entity.setRestype(rs.getInt("restype"));
				entity.setWeight(rs.getLong("weight"));
				return entity;
			}
		
		});
		
		return list;
	}


	@Override
	public int update(ChannelResourceEntity channelResourceEntity) {
		
		String sql="update ixin_channel_resource set rescover=?,resname=? where id=?";
		
		return this.jdbcTemplate.update(sql,channelResourceEntity.getRescover(),channelResourceEntity.getResname(),channelResourceEntity.getId());
	}


	@Override
	public boolean batchUpdate(List<ResourceVO> list) {
		String sql = "update ixin_channel_resource set weight=? where id=?";
		List<Object[]> args = Lists.newArrayList();
		for (ResourceVO entity : list) {
			Object[] arg = new Object[2];
			arg[0] = entity.getWeightStr();
			arg[1] = entity.getId();
			args.add(arg);
		}
		int[] num = this.jdbcTemplate.batchUpdate(sql, args);
		if (num.length == list.size()) {
			return true;
		}
		return false;
	}


	
	
}
