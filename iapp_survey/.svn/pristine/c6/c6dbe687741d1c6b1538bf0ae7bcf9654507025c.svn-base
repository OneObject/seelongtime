package com.longtime.app.ixin.mgr.fodder.dao.impl;

import com.google.common.collect.Lists;
import com.longtime.app.ixin.mgr.fodder.dao.FodderDao;
import com.longtime.app.ixin.mgr.fodder.model.ColumnEntity;
import com.longtime.app.ixin.mgr.fodder.model.FodderDraftEntity;
import com.longtime.app.ixin.mgr.fodder.model.FodderEntity;
import com.longtime.app.ixin.mgr.fodder.model.SourceFileEntity;
import com.longtime.app.ixin.mgr.fodder.vo.FodderVO;
import com.longtime.app.ixin.mgr.utils.Constants;
import com.longtime.app.ixin.protocol.ItemArticle;
import com.longtime.app.util.HTMLUtils;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.web.util.HtmlUtils;

import javax.annotation.Resource;
import java.beans.PropertyDescriptor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Repository("fodderDao")
public class FodderDaoImpl implements FodderDao{
	@Resource(name = "ixin_jdbcTemplate")
	private JdbcTemplate jdbcTemplate;

	@Override
	public void saveSourceFile(SourceFileEntity file) throws Exception{
		String sql = "insert into ixin_sourcefile values (?,?,?,?,?,?,?)";
		Field[] fields =file.getClass().getDeclaredFields();
		Object[] objs = new Object[fields.length];
		int index = 0;
		for (Field field : fields) {
			objs[index++] = BeanUtils.getProperty(file, field.getName());
		}
		jdbcTemplate.update(sql,objs);
	}

	@Override
	public void delSourceFile(String id) {
		String sql = "update ixin_sourcefile set del=1 where id=?";
		jdbcTemplate.update(sql,id);
	}
	
	@Override
	public void saveOrUpdateFodderDraft(FodderVO vo,boolean isSave) throws Exception{
		if(isSave){//保存
			//先删除原来的数据，就是根据baseId删除
			String sql = "delete from ixin_fodderdraft where baseId=?";
			FodderEntity entity = new FodderEntity();
			Field[] fields = entity.getClass().getDeclaredFields();
			StringBuilder mBuilder = new StringBuilder("insert into ixin_fodderdraft (");
			StringBuilder mValues = new StringBuilder(" value (");
			List<Object> list = new ArrayList<Object>();
			for (Field field : fields) {
				mBuilder.append(field.getName()+",");
				mValues.append("?,");
				list.add(BeanUtils.getProperty(vo, field.getName()));
			}
			mValues.append("?)");
			mBuilder.append("baseId)").append(mValues);
			list.add(BeanUtils.getProperty(vo, "baseId"));
			jdbcTemplate.update(sql,list.get(list.size()-1));
			jdbcTemplate.update(mBuilder.toString(),list.toArray(new Object[list.size()]));
		}else{//修改
			StringBuilder mBuilder = new StringBuilder("update ixin_fodderdraft set ");
			FodderEntity entity = new FodderEntity();
			Field[] fields = entity.getClass().getDeclaredFields();
			List<Object> list = new ArrayList<Object>();
			for (Field field : fields) {
				//下列字段将不在更新语句中出现
				if(field.getName().equals("id") || field.getName().equals("createUid") || field.getName().equals("createTime") || field.getName().equals("domain")){
					continue;
				}
				mBuilder.append(" ").append(field.getName()).append("=?,");
				list.add(BeanUtils.getProperty(vo, field.getName()));
			}
			mBuilder.append("baseId=? where id=?");
			list.add(BeanUtils.getProperty(vo, "baseId"));
			list.add(BeanUtils.getProperty(vo, "id"));
			jdbcTemplate.update(mBuilder.toString(),list.toArray());
		}
	}

	@Override
	public boolean checkExist(String baseId) {
		String sql = "select count(id) c from ixin_fodder where id=?";
		List<Integer> list = jdbcTemplate.query(sql, new Object[]{baseId},new RowMapper<Integer>(){
			public Integer mapRow(ResultSet rs, int rowNum) throws SQLException {
				return rs.getInt("c");
			}
		});
		if(list != null && list.size() > 0 && list.get(0) > 0){
			return true;
		}
		return false;
	}

	@Override
	public void delFodderDraft(String id) {
		String sql = "delete from ixin_fodderdraft where id=?";
		jdbcTemplate.update(sql,id);
	}

	@Override
	public void updateFodder(FodderVO vo) throws Exception{
		StringBuilder mBuilder = new StringBuilder("update ixin_fodder set ");
		FodderEntity entity = new FodderEntity();
		Field[] fields = entity.getClass().getDeclaredFields();
		List<Object> list = new ArrayList<Object>();
		for (Field field : fields) {
			//下列字段将不在更新语句中出现
			if(field.getName().equals("id") || field.getName().equals("createUid") || field.getName().equals("createTime") || field.getName().equals("domain")){
				continue;
			}
			list.add(BeanUtils.getProperty(vo, field.getName()));
			mBuilder.append(field.getName()).append("=?,");
		}
		list.add(BeanUtils.getProperty(vo, "baseId"));
		String sql = mBuilder.substring(0, mBuilder.lastIndexOf(","))+ " where id=?";
		jdbcTemplate.update(sql,list.toArray());
	}

	@Override
	public void saveFodder(FodderVO vo) throws Exception{
		StringBuilder mBuilder = new StringBuilder("insert into ixin_fodder (");
		StringBuilder mValues = new StringBuilder(" value (");
		FodderEntity entity = new FodderEntity();
		Field[] fields = entity.getClass().getDeclaredFields();
		List<Object> list = new ArrayList<Object>();
		for (Field field : fields) {
			if(field.getName().equals("id")){
				continue;
			}
			list.add(BeanUtils.getProperty(vo, field.getName()));
			mBuilder.append(field.getName()).append(",");
			mValues.append("?,");
		}
		list.add(BeanUtils.getProperty(vo, "baseId"));
		String sql = mBuilder.append(" id) ").append(mValues).append("?)").toString();
		
		jdbcTemplate.update(sql,list.toArray());
	}

	@Override
	public int getFodderTotalSize(String domain) {
		String sql = "select count(id) c from ixin_fodder where domain=? and del=0";
		List<Integer> list = jdbcTemplate.query(sql, new Object[]{domain},new RowMapper<Integer>(){
			public Integer mapRow(ResultSet rs, int rowNum) throws SQLException {
				return rs.getInt("c");
			}
		});
		if(list != null && list.size() > 0){
			return list.get(0);
		}
		return 0;
	}

	@Override
	public List<FodderVO> getFodderByPage(int pageSize, int currPage,
			String domain, String qiniuImageBasePath, String coverSuffix) {
		String sql = "select fodder.*,visitnum from ixin_fodder fodder LEFT JOIN (select rid,sum(value) as visitnum from report_visit_statistics where model='fodder_detail_pv' and domain=? GROUP BY rid)  t ON fodder.id=t.rid where fodder.domain=? and fodder.del=0 order by fodder.modifyTime desc limit ?,? ";
		return jdbcTemplate.query(sql, new Object[]{domain,domain,(currPage-1)*pageSize,pageSize},new RowMapper<FodderVO>(){
			public FodderVO mapRow(ResultSet rs, int rowNum)
					throws SQLException {
				FodderVO vo = new FodderVO();
				Field[] fields = FodderEntity.class.getDeclaredFields();
				try{
					for (Field field : fields) {
						BeanUtils.setProperty(vo, field.getName(), rs.getString(field.getName()));
					}
					vo.setVisitnum(rs.getLong("visitnum"));
				}catch(Exception e){
					e.printStackTrace();
				}
				return vo;
			}
		});
	}
	@Override
	public FodderVO getFodderVOById(String id) {
		String sql = "select # from ixin_fodder where id=? and del=0";
		Field[] fields = FodderEntity.class.getDeclaredFields();
		StringBuilder builder = new StringBuilder();
		final List<String> colums = new ArrayList<String>();
		for (Field field : fields) {
			builder.append(field.getName()).append(",");
			colums.add(field.getName());
		}
		sql = sql.replace("#", builder.substring(0, builder.length()-1));
		
		List<FodderVO> list = jdbcTemplate.query(sql, new Object[]{id},new RowMapper<FodderVO>(){
			@Override
			public FodderVO mapRow(ResultSet rs, int rowNum)
					throws SQLException {
				FodderVO vo = new FodderVO();
				try{
					for (String colum : colums) {
						BeanUtils.setProperty(vo, colum, rs.getString(colum));
					}
				}catch(Exception e){
					e.printStackTrace();
				}
				return vo;
			}
		});
		if(list!=null && list.size()>0){
			return list.get(0);
		}
		return null;
	}

	@Override
	public void del(String id) {
		String sql = "update ixin_fodder set del=1 where id=?";
		jdbcTemplate.update(sql,id);
	}

	
	@Override
	public int getFodderDraffTotalSize(String domain) {
		String sql = "select count(*) c from ixin_fodderdraft where domain=?";
		List<Integer> list = jdbcTemplate.query(sql, new Object[]{domain},new RowMapper<Integer>(){
			@Override
			public Integer mapRow(ResultSet rs, int rowNum) throws SQLException {
				return rs.getInt("c");
			}
		});
		if(list != null && list.size()>0){
			return list.get(0);
		}
		return 0;
	}

	@Override
	public List<FodderVO> getFodderDraffByPage(int pageSize, int currPage,
			String domain) {
		String sql = "select # from ixin_fodderdraft where domain=? order by modifyTime desc limit ?,? ";
		StringBuilder builder = new StringBuilder();
		final List<String> colums = new ArrayList<String>();
		Class<?> clazz = FodderDraftEntity.class;
		while(clazz != Object.class){
			Field[] fields = clazz.getDeclaredFields();
			for (Field field : fields) {
				builder.append(field.getName()).append(",");
				colums.add(field.getName());
			}
			clazz = clazz.getSuperclass();
		}
		sql = sql.replace("#", builder.substring(0, builder.length()-1));
		
		return jdbcTemplate.query(sql, new Object[]{domain,(currPage-1)*pageSize,pageSize},new RowMapper<FodderVO>(){
			@Override
			public FodderVO mapRow(ResultSet rs, int rowNum)
					throws SQLException {
				FodderVO vo = new FodderVO();
				try{
					for (String colum : colums) {
						BeanUtils.setProperty(vo, colum, rs.getString(colum));
					}
				}catch(Exception e){
					e.printStackTrace();
				}
				return vo;
			}
		});
	}

	@Override
	public FodderVO getFodderVOByDraffId(String id) {
		String sql = "select # from ixin_fodderdraft where id=?";
		StringBuilder builder = new StringBuilder();
		final List<String> colums = new ArrayList<String>();
		Class<?> clazz = FodderDraftEntity.class;
		while(clazz != Object.class){
			Field[] fields = clazz.getDeclaredFields();
			for (Field field : fields) {
				builder.append(field.getName()).append(",");
				colums.add(field.getName());
			}
			clazz = clazz.getSuperclass();
		}
		sql = sql.replace("#", builder.substring(0, builder.length()-1));
		List<FodderVO> list = jdbcTemplate.query(sql, new Object[]{id},new RowMapper<FodderVO>(){
			@Override
			public FodderVO mapRow(ResultSet rs, int rowNum)
					throws SQLException {
				FodderVO vo = new FodderVO();
				try{
					for (String colum : colums) {
						BeanUtils.setProperty(vo, colum, rs.getString(colum));
					}
				}catch(Exception e){
					e.printStackTrace();
				}
				return vo;
			}
		});
		if(list !=null && list.size()>0){
			return list.get(0);
		}
		return null;
	}

	@Override
	public void saveColumnInfo(String columnType, String fodderId, String domain) {
		//反射效率太低了
		ColumnEntity entity = new ColumnEntity();
		String sql = "insert into ixin_columninfo (id,fodderId,columnType,domain,saveTime,del) value (?,?,?,?,?,?)";
		jdbcTemplate.update(sql,UUID.randomUUID().toString().replace("-", ""),fodderId,columnType,domain,entity.getSaveTime(),entity.getDel());
	}
	
	@Override
	public ItemArticle getItemArticleById(String id, final String qiniuImageBasePath,
			final String coverSuffix, final String fodderBasePath) {
		String sql = "select * from ixin_fodder where id=? and del = 0";
		List<ItemArticle> list = jdbcTemplate.query(sql, new Object[]{id},new RowMapper<ItemArticle>(){
			@Override
			public ItemArticle mapRow(ResultSet rs, int rowNum)
					throws SQLException {
				ItemArticle item = new ItemArticle();
				item.setId(rs.getString("id"));
				item.setDescription(StringUtils.isBlank(rs.getString("summary"))?HTMLUtils.html2Text(HtmlUtils.htmlUnescape(rs.getString("content"))):rs.getString("summary"));
				item.setPicUrl(String.format("%s%s%s", qiniuImageBasePath,rs.getString("coverPath"),coverSuffix));
				
				// update by songsp 如果素材设置了gotourl参数，消息详情跳转到该地址
				String gotoUrl = rs.getString("gotoUrl");
				if(StringUtils.isNotBlank(gotoUrl)){
					item.setUrl(gotoUrl);
				}else{
					item.setUrl(String.format("%s%s%s%s%s", fodderBasePath,"id=",rs.getString("id"),"&fdomain=",rs.getString("domain")));
				}
				item.setTitle(rs.getString("title"));
				return item;
			}
		});
		if(list!=null && list.size()>0){
			return list.get(0);
		}
		return null;
	}
	
	@Override
	public String queryAttRespByDomain(String currentDomain) {
		String sql = "select attId from ixin_att_resp where domain=?";
		List<String> list = jdbcTemplate.query(sql, new Object[]{currentDomain},new RowMapper<String>(){
			@Override
			public String mapRow(ResultSet rs, int rowNum) throws SQLException {
				
				return rs.getString(1);
			}
		});
		if(list!=null && list.size()>0){
			return list.get(0);
		}
		return null;
	}

	@Override
	public void saveAttResp(String content, String type, String currentDomain,
			String attId) {
		String sql = "insert into ixin_att_resp (attId,attType,attContent,domain,del)value (?,?,?,?,?)";
		jdbcTemplate.update(sql,attId,type,content,currentDomain,0);
	}

	@Override
	public void updateAttResp(String content, String type,
			String currentDomain, String attId) {
		String sql = "update ixin_att_resp set attType=?,attContent=? where attId=?";
		jdbcTemplate.update(sql,type,content,attId);
	}

	@Override
	public FodderVO getFodderVOResp(String currentDomain) {
		String sql = "select * from ixin_att_resp where domain=?";
		List<FodderVO> list = jdbcTemplate.query(sql, new Object[]{currentDomain},new RowMapper<FodderVO>(){
			@Override
			public FodderVO mapRow(ResultSet rs, int rowNum)
					throws SQLException {
				FodderVO vo = new FodderVO();
				vo.setExt1(rs.getString("attId"));
				vo.setExtType(rs.getString("attType"));
				vo.setContent(rs.getString("attContent"));
				vo.setDomain(rs.getString("domain"));
				
				return vo;
			}
		});
		if(list!=null && list.size()>0){
			return list.get(0);
		}
		return null;
	}

	@Override
	public void delAttResp(String attId) {
		String sql = "delete from ixin_att_resp where attId=?";
		jdbcTemplate.update(sql,attId);
	}

	public static void main(String[] args) throws Exception{
		long startTime = System.currentTimeMillis();
		ColumnEntity entity = new ColumnEntity();
		entity.setId(UUID.randomUUID().toString().replace("-", ""));
		entity.setDomain("jay");
		entity.setFodderId("111");
		entity.setColumnType("ixinstudy");
		Field[] fields = entity.getClass().getDeclaredFields();
		StringBuilder mBuilder = new StringBuilder("insert into ixin_columninfo (");
		StringBuilder valuesBuilder = new StringBuilder(" value (");
		List<Object> list = new ArrayList<Object>();
		PropertyDescriptor descriptor = null;
		Method m = null;
		for (Field field : fields) {
			mBuilder.append(field.getName()).append(',');
			valuesBuilder.append('?').append(',');
			
			descriptor = new PropertyDescriptor(field.getName(),entity.getClass());
			m = descriptor.getReadMethod();
			
			list.add(/*BeanUtils.getProperty(entity, field.getName())*/m.invoke(entity));
			
		}
		mBuilder.replace(mBuilder.length()-1, mBuilder.length(), ")");
		valuesBuilder.replace(valuesBuilder.length()-1, valuesBuilder.length(), ")");
		mBuilder.append(valuesBuilder);
		
		System.out.println(mBuilder);
		System.out.println(list);
		System.out.println(System.currentTimeMillis()-startTime);
	}

	@Override
	public int getFodderTotalSize(String domain, String param) {
		
		StringBuilder sb=new StringBuilder("select count(*) as num from ixin_fodder where 1=1");
		List<Object> list=Lists.newArrayList();
		sb.append(" and domain=?");
		list.add(domain);
		sb.append(" and del=?");
		list.add(Constants.NO_DEL);
		if(StringUtils.isNotBlank(param)){
			//解析数据
			sb.append(" and title like ? ");
			list.add('%'+param+'%');
		}
		
		return this.jdbcTemplate.queryForInt(sb.toString(),list.toArray());
	}

	@Override
	public List<FodderEntity> fodderList(int pagesize, int currentpage,
			String domain, String param) {
		StringBuilder sb=new StringBuilder("select * from ixin_fodder where 1=1");
		List<Object> list=Lists.newArrayList();
		
		if(StringUtils.isNotBlank(param)){
			sb.append( " and title like ?");
			list.add("%"+param+"%");
		}
		sb.append(" and domain=?");
		sb.append(" and del=?");
		list.add(domain);
		list.add(Constants.NO_DEL);
		
		//sb.append(" order by createTime desc");
		sb.append(" order by modifyTime desc");

		sb.append(" limit ?,?");
		list.add((currentpage-1)*pagesize);
		list.add(pagesize);
		
		return this.jdbcTemplate.query(sb.toString(),list.toArray(),new RowMapper<FodderEntity>() {
			@Override
			public FodderEntity mapRow(ResultSet rs, int rowNum) throws SQLException {
				FodderEntity fodderEntity=new FodderEntity();
				fodderEntity.setCoverPath(rs.getString("coverPath"));
				fodderEntity.setCreateTime(rs.getLong("createTime"));
				fodderEntity.setDomain(rs.getString("domain"));
				fodderEntity.setId(rs.getString("id"));
				fodderEntity.setSummary(rs.getString("summary"));
				fodderEntity.setTitle(rs.getString("title"));
				return fodderEntity;
			}
		});
	}

	@Override
	public List<FodderEntity> list(String[] ids) {
		StringBuilder sb= new StringBuilder("select * from ixin_fodder where 1=1 ");
		for(int i = 0 ;i<ids.length;i++){
			if (i==0) {
				sb.append(" and id in (?");
			}else{
				sb.append(",?");
			}
			if (i+1==ids.length) {
				sb.append(")");
			}
		}
		List<FodderEntity> list = this.jdbcTemplate.query(sb.toString(),ids,new RowMapper<FodderEntity>() {
			@Override
			public FodderEntity mapRow(ResultSet rs, int rowNum) throws SQLException {
				FodderEntity fodderEntity=new FodderEntity();
				fodderEntity.setCoverPath(rs.getString("coverPath"));
				fodderEntity.setCreateTime(rs.getLong("createTime"));
				fodderEntity.setDomain(rs.getString("domain"));
				fodderEntity.setId(rs.getString("id"));
				fodderEntity.setSummary(rs.getString("summary"));
				fodderEntity.setTitle(rs.getString("title"));
				return fodderEntity;
			}
		});
		return list;
	}

	@Override
	public int getTitalSizeWithSearch(String domain, String searchcontent) {
		String sql = "select count(id) c from ixin_fodder where domain=? and del=0 and title like ?";
		List<Integer> list = jdbcTemplate.query(sql, new Object[]{domain,"%"+searchcontent+"%"},new RowMapper<Integer>(){
			public Integer mapRow(ResultSet rs, int rowNum) throws SQLException {
				return rs.getInt("c");
			}
		});
		if(list != null && list.size() > 0){
			return list.get(0);
		}
		return 0;
	}

	@Override
	public List<FodderVO> getFodderByPageWithSerch(int pageSize, int currPage,
			String domain,String searchcontent) {
		String sql = "select fodder.*,visitnum from ixin_fodder fodder LEFT JOIN (select rid,sum(value) as visitnum from report_visit_statistics where model='fodder_detail_pv' and domain=? GROUP BY rid)  t ON fodder.id=t.rid where fodder.domain=? and fodder.del=0 and title like ? order by fodder.modifyTime desc limit ?,? ";
		return jdbcTemplate.query(sql, new Object[]{domain,domain,"%"+searchcontent+"%",(currPage-1)*pageSize,pageSize},new RowMapper<FodderVO>(){
			public FodderVO mapRow(ResultSet rs, int rowNum)
					throws SQLException {
				FodderVO vo = new FodderVO();
				Field[] fields = FodderEntity.class.getDeclaredFields();
				try{
					for (Field field : fields) {
						BeanUtils.setProperty(vo, field.getName(), rs.getString(field.getName()));
					}
					vo.setVisitnum(rs.getLong("visitnum"));
				}catch(Exception e){
					e.printStackTrace();
				}
				return vo;
			}
		});
	}
}
