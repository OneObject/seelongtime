package com.longtime.app.admin.template.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;

import com.google.common.base.Joiner;
import com.google.common.collect.Lists;
import com.longtime.app.admin.template.dao.TemplateDao;
import com.longtime.app.admin.template.model.DomainTemplate;
import com.longtime.app.admin.template.model.SingleTemplate;
import com.longtime.app.admin.template.model.StyleTemplate;
import com.longtime.app.admin.template.model.Template;
import com.longtime.app.admin.template.model.TemplateVO;
import com.longtime.app.util.IdGenerator;

@Component("templateDao")
public class TemplateDaoImpl implements TemplateDao{

	@Resource(name = "ixin_jdbcTemplate")
	private JdbcTemplate jdbcTemplate;

	@Override
	public List<DomainTemplate> getDomainTemplates(String domain,String mid) {
		String sql = "select * from base_domain_template where mid=? and domain=? and isdel=0";
		List<DomainTemplate> list = this.jdbcTemplate.query(sql, new Object[]{mid,domain}, new RowMapper<DomainTemplate>() {

			@Override
			public DomainTemplate mapRow(ResultSet rs, int rowNum) throws SQLException {
				DomainTemplate entity = new DomainTemplate();
				entity.setId(rs.getString("id"));
				entity.setDomain(rs.getString("domain"));
				entity.setMid(rs.getString("mid"));
				entity.setSid(rs.getString("sid"));
				entity.setTid(rs.getString("tid"));
				return entity;
			}
			
		});
		return list;
	}

	@Override
	public List<StyleTemplate> getStyleTemplates(List<String> sids) {
		if(CollectionUtils.isEmpty(sids)){
			return Lists.newArrayList();
		}
		String sql = "select * from base_style_template where sid in (?)";
		String param = Joiner.on(",").appendTo(new StringBuilder(), sids).toString();
		List<StyleTemplate> list = this.jdbcTemplate.query(sql, new Object[]{param}, new RowMapper<StyleTemplate>() {

			@Override
			public StyleTemplate mapRow(ResultSet rs, int rowNum) throws SQLException {
				StyleTemplate entity = new StyleTemplate();
				entity.setId(rs.getString("id"));
				entity.setTid(rs.getString("tid"));
				entity.setSid(rs.getString("sid"));
				return entity;
			}
			
		});
		return list;
	}

	@Override
	public Template loadById(String tid) {
		String sql = "select * from base_template where id=? and isdel=0";
		List<Template> list = this.jdbcTemplate.query(sql, new Object[]{tid}, new RowMapper<Template>() {

			@Override
			public Template mapRow(ResultSet rs, int rowNum) throws SQLException {
				Template entity = new Template();
				entity.setId(rs.getString("id"));
				entity.setMid(rs.getString("mid"));
				entity.setName(rs.getString("name"));
				entity.setCover(rs.getString("cover"));
				entity.setIs_default(rs.getBoolean("is_default"));
				entity.setType(rs.getInt("type"));
				entity.setView_path(rs.getString("view_path"));
				entity.setRemark(rs.getString("remark"));
				return entity;
			}
			
		});
		if(CollectionUtils.isEmpty(list)){
			return null;
		}
		return list.get(0);
	}

	@Override
	public List<TemplateVO> listAllModule(String domain) {
		String sql = "select a.name modulename,c.* from (base_module a LEFT JOIN base_domain_template b ON a.id=b.mid " +
					 "and b.domain=? and b.isdel=0),base_template c  where (b.tid=c.id) or (b.tid IS null and c.is_default=0 " +
					 "and a.id=c.mid and (c.domain=? or c.domain='' or c.domain is null ))";
		List<TemplateVO> list = this.jdbcTemplate.query(sql,new Object[]{domain,domain}, new RowMapper<TemplateVO>() {

			@Override
			public TemplateVO mapRow(ResultSet rs, int rowNum) throws SQLException {
				TemplateVO entity = new TemplateVO();
				entity.setId(rs.getString("id"));
				entity.setMid(rs.getString("mid"));
				entity.setName(rs.getString("name"));
				entity.setCover(rs.getString("cover"));
				entity.setIs_default(rs.getBoolean("is_default"));
				entity.setType(rs.getInt("type"));
				entity.setView_path(rs.getString("view_path"));
				entity.setRemark(rs.getString("remark"));
				entity.setModuleName(rs.getString("modulename"));
				entity.setDomain(rs.getString("domain"));
				return entity;
			}
			
		});
		if(CollectionUtils.isEmpty(list)){
			return null;
		}
		return list;
		
	}

	@Override
	public List<Template> listTemplateByMid(String mid,String domain) {
		String sql = "select * from base_template where mid=? and isdel=0 and (domain=? or domain is null or domain='')";
		List<Template> list = this.jdbcTemplate.query(sql, new Object[]{mid,domain}, new RowMapper<Template>() {

			@Override
			public Template mapRow(ResultSet rs, int rowNum) throws SQLException {
				Template entity = new Template();
				entity.setId(rs.getString("id"));
				entity.setMid(rs.getString("mid"));
				entity.setName(rs.getString("name"));
				entity.setCover(rs.getString("cover"));
				entity.setIs_default(rs.getBoolean("is_default"));
				entity.setType(rs.getInt("type"));
				entity.setView_path(rs.getString("view_path"));
				entity.setRemark(rs.getString("remark"));
				entity.setDomain(rs.getString("domain"));
				return entity;
			}
			
		});
		if(CollectionUtils.isEmpty(list)){
			return null;
		}
		return list;
	}

	@Override
	public void deleteDomainTemplate(String domain, String mid) {
		String sql = "delete from base_domain_template  where domain=? and mid=? ";
		 this.jdbcTemplate.update(sql,domain,mid);
		
	}

	@Override
	public boolean addDomainTemplate(DomainTemplate dtemplate) {
		String sql = "insert into base_domain_template values(?,?,?,?,?,?)";
		int num = this.jdbcTemplate.update(sql,IdGenerator.nextId32(),dtemplate.getDomain(),dtemplate.getIsdel(),dtemplate.getMid(),dtemplate.getSid(),dtemplate.getTid());
		if (num==1) {
			return true;
		}else{
			return false;
		}
	}
	
	
	@Override
	public TemplateVO getTemplate(String domain,String mid) {
		String sql = "select a.name modulename,c.* from (base_module a LEFT JOIN base_domain_template b ON a.id=b.mid and b.domain=? and b.isdel=0),base_template c  where ((b.tid=c.id) or (b.tid IS null and c.is_default=0 and a.id=c.mid)) and a.id=?";
		
		List<TemplateVO> list = this.jdbcTemplate.query(sql,new Object[]{domain,mid}, new RowMapper<TemplateVO>() {

			@Override
			public TemplateVO mapRow(ResultSet rs, int rowNum) throws SQLException {
				TemplateVO entity = new TemplateVO();
				entity.setId(rs.getString("id"));
				entity.setMid(rs.getString("mid"));
				entity.setName(rs.getString("name"));
				entity.setCover(rs.getString("cover"));
				entity.setIs_default(rs.getBoolean("is_default"));
				entity.setType(rs.getInt("type"));
				entity.setView_path(rs.getString("view_path"));
				entity.setRemark(rs.getString("remark"));
				entity.setModuleName(rs.getString("modulename"));
				
				return entity;
			}
			
		});
		if(CollectionUtils.isEmpty(list)){
			return null;
		}
		return list.get(0);
		
	}

	@Override
	public Template getSingleTemplate(String sid) {
	String sql = "select b.* from base_single_template a ,base_template b where a.tid=b.id and a.sid=? ";
		
		List<Template> list = this.jdbcTemplate.query(sql,new Object[]{sid}, new RowMapper<Template>() {
			
		@Override
		public Template mapRow(ResultSet rs, int rowNum) throws SQLException {
			Template entity = new Template();
			entity.setId(rs.getString("id"));
			entity.setMid(rs.getString("mid"));
			entity.setName(rs.getString("name"));
			entity.setCover(rs.getString("cover"));
			entity.setIs_default(rs.getBoolean("is_default"));
			entity.setType(rs.getInt("type"));
			entity.setView_path(rs.getString("view_path"));
			entity.setRemark(rs.getString("remark"));
			entity.setDomain(rs.getString("domain"));
			return entity;
		}
	});
	if(CollectionUtils.isEmpty(list)){
		return null;
	}
	return list.get(0);
	}

	@Override
	public boolean saveSingleTemplate(String domain, String showType, String id) {
		String sql = "insert into  base_single_template values(?,?,?,? )";
		try {
			
			this.jdbcTemplate.update(sql,IdGenerator.nextId32(),showType,id,domain);
		} catch (DataAccessException e) {
			return false;
		}
		return true;
	}

	@Override
	public boolean deleteSingleTemplate(String id) {
		String sql = "delete from base_single_template  where  sid=? ";
		try {
			
			this.jdbcTemplate.update(sql,id);
		} catch (DataAccessException e) {
			return false;
		}
		return true;
	}
	
}
