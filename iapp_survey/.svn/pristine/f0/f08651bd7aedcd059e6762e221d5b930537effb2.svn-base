package com.longtime.app.ixin.mgr.dao.impl;

import java.lang.reflect.Field;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.ArrayUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.web.util.HtmlUtils;

import com.longtime.app.ixin.mgr.dao.AutoResponseRuleDao;
import com.longtime.app.ixin.mgr.fodder.model.FodderEntity;
import com.longtime.app.ixin.mgr.fodder.vo.FodderVO;
import com.longtime.app.ixin.mgr.model.AutoResponseRule;
import com.longtime.app.ixin.protocol.Rule;
import com.longtime.app.ixin.vo.AutoResponseRuleVO;
import com.longtime.app.ixin.vo.MatterVO;
import com.longtime.app.ixin.vo.MatterVO.MatterInfoVO;
import com.longtime.common.utils.LoginSessionHelper;

@Repository("autoResponseRuleDao")
public class AutoResponseRuleDaoImpl implements AutoResponseRuleDao{
    
	private static final Logger logger = LoggerFactory.getLogger(AutoResponseRuleDaoImpl.class);
	
	@Resource(name = "ixin_jdbcTemplate")
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public void saveAutoResponseRule(AutoResponseRule entity) {
		String sql = "insert into ixin_auto_response_rule values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        logger.debug("sql~~~:"+sql);
		int ret = jdbcTemplate.update(
				sql,
				entity.getId(),
				entity.getDomain(),
				entity.getName(),
				entity.getKeywords(),
				entity.getResponseAll(),
				entity.getMatterIds(),
				entity.getIsdel(),
				entity.getCreater(),
				System.currentTimeMillis(),
				null,
				null,
				entity.getMatchAll(),
				entity.getContent(),
				entity.getType()
				);
        logger.debug("effect row count:"+ret);
	}
	
	@Override
	public void updateAutoResponseRule(AutoResponseRule entity) {
		String sql = "update ixin_auto_response_rule set name=?, keywords=?, matter_ids=?, response_all=?, isdel=?, updater=?, update_time=?, match_all=?, content=?, type=? where id=?";
        logger.debug("sql~~~:"+sql);
		int ret = jdbcTemplate.update(sql,
                entity.getName(),
                entity.getKeywords(),
                entity.getMatterIds(),
                entity.getResponseAll(),
                entity.getIsdel(),
                entity.getUpdater(),
                System.currentTimeMillis(),
                entity.getMatchAll(),
                entity.getContent(),
                entity.getType(),
                entity.getId());
		logger.debug("effect row count:"+ret);
	}
	
	@Override
	public int getAutoResponseRuleTotalSize(String currentDomain) {
		String sql = "select count(id) as total from ixin_auto_response_rule where isdel=? and domain=?";
        logger.debug("sql~~~:"+sql);
		List<Integer> list = jdbcTemplate.query(sql, new Object[]{AutoResponseRule.IS_DEL_NO, currentDomain},new RowMapper<Integer>(){
			public Integer mapRow(ResultSet rs, int rowNum) throws SQLException {
				return rs.getInt("total");
			}
		});
		if(list!= null && list.size()>0){
	        logger.debug("total count:"+list.get(0));
			return list.get(0);
		}
        logger.debug("total count:"+list.get(0));
		return 0;
	}
	
	@Override
	public List<AutoResponseRule> getAll() {
		String sql = "select domain,keywords,id  from ixin_auto_response_rule where isdel=0";
		List<AutoResponseRule> list = jdbcTemplate.query(sql, new RowMapper<AutoResponseRule>(){
			public AutoResponseRule mapRow(ResultSet rs, int rowNum) throws SQLException {
				AutoResponseRule rule = new AutoResponseRule();
				rule.setDomain(rs.getString(1));
				rule.setKeywords(rs.getString(2));
				rule.setId(rs.getString(3));
				return rule;
			}
		});
		return list;
	}
	@Override
	public List<AutoResponseRule> queryAutoResponseRuleByPage(String currentDomain, int pageNO, int pageSize) {
	    String sql = "SELECT " +
	    "rule.id," +
	    "rule.domain, " +
	    "rule.name, " +
	    "rule.keywords, " +
	    "rule.matter_ids as matterIds, " +
	    "rule.response_all as responseAll, " +
	    "rule.creater, " +
	    "rule.create_time as createTime, " +
	    "rule.updater, " +
	    "rule.update_time as updateTime, " +
	    "rule.match_all as matchAll, " +
	    "rule.type, " + 
	    "rule.content " +
	    " FROM" +
	    " `ixin_auto_response_rule` rule" +
	    " where" +
	    " rule.domain=? and isdel=? order by rule.create_time desc limit ?,?";
	    logger.debug("sql~~~:"+sql);
	    
	    return jdbcTemplate.query(sql, new Object[]{currentDomain, AutoResponseRule.IS_DEL_NO, (pageNO-1)*pageSize, pageSize}, new RowMapper<AutoResponseRule>(){
	        public AutoResponseRule mapRow(ResultSet rs, int rowNum) throws SQLException {
	            AutoResponseRule vo = new AutoResponseRule();
	            vo.setId(rs.getString("id"));
	            vo.setDomain(rs.getString("domain"));
	            vo.setName(rs.getString("name"));
	            vo.setKeywords(rs.getString("keywords"));
	            vo.setMatterIds(rs.getString("matterIds"));
	            vo.setCreater(rs.getString("creater"));
	            vo.setCreateTime(rs.getLong("createTime"));
	            vo.setUpdater(rs.getString("updater"));
	            vo.setUpdateTime(rs.getLong("updateTime"));
	            vo.setMatchAll(rs.getInt("matchAll"));
	            vo.setResponseAll(rs.getInt("responseAll"));
	            vo.setType(rs.getString("type"));
	            vo.setContent(rs.getString("content"));
	            
	            return vo;
	        }
	        
	    });
	}
	
	@Override
	public List<AutoResponseRuleVO> queryAutoResponseRuleVOByPage(String currentDomain, int pageNO, int pageSize) {
		String sql = "SELECT " +
				"rule.id," +
				"rule.domain, " +
				"rule.name, " +
				"rule.keywords, " +
				"rule.matter_ids as matterIds, " +
				"rule.response_all as responseAll, " +
				"rule.creater, " +
				"rule.create_time as createTime, " +
				"rule.updater, " +
				"rule.update_time as updateTime, " +
		        "rule.match_all as matchAll, " +
				"rule.type, " +
		        "rule.content " + 
				" FROM" +
				" `ixin_auto_response_rule` rule" +
				" where" +
				" rule.domain=? and isdel=? order by rule.create_time desc limit ?,?";
        logger.debug("sql~~~:"+sql);
		
		return jdbcTemplate.query(sql, new Object[]{currentDomain, AutoResponseRule.IS_DEL_NO, (pageNO-1)*pageSize, pageSize}, new RowMapper<AutoResponseRuleVO>(){
			public AutoResponseRuleVO mapRow(ResultSet rs, int rowNum) throws SQLException {
				AutoResponseRuleVO vo = new AutoResponseRuleVO();
				vo.setId(rs.getString("id"));
				vo.setDomain(rs.getString("domain"));
				vo.setName(rs.getString("name"));
				String keywords = rs.getString("keywords");
				if(StringUtils.isNotBlank(keywords)){
				    String[] temp = keywords.split(",");
				    if(ArrayUtils.isNotEmpty(temp)){
				        vo.setKeywords(Arrays.asList(temp));
				    }
				}
				vo.setResponseAll(rs.getInt("responseAll"));
                String matterIds = rs.getString("matterIds");
				if(StringUtils.isNotBlank(matterIds)){
                    String[] temp = matterIds.split(",");
				    if(ArrayUtils.isNotEmpty(temp)){
				        vo.setKeywords(Arrays.asList(temp));
				    }
				}
				vo.setCreater(rs.getString("creater"));
				vo.setCreateTime(rs.getLong("createTime"));
				vo.setUpdater(rs.getString("updater"));
				vo.setUpdateTime(rs.getLong("updateTime"));
                vo.setMatchAll(rs.getInt("matchAll"));
                vo.setType(rs.getString("type"));
                vo.setContent(rs.getString("content"));
				
				return vo;
			}
			
		});
	}

    @Override
    public AutoResponseRule getById(String id) {
        String sql = "SELECT " +
        "rule.id," +
        "rule.domain, " +
        "rule.name, " +
        "rule.keywords, " +
        "rule.matter_ids as matterIds, " +
        "rule.response_all as responseAll, " +
        "rule.isdel, " +
        "rule.creater, " +
        "rule.create_time as createTime, " +
        "rule.updater, " +
        "rule.update_time as updateTime, " +
        "rule.match_all as matchAll, " +
        "rule.type, " + 
        "rule.content " +
        " FROM" +
        " `ixin_auto_response_rule` rule" +
        " where" +
        " rule.id= ? ";
        logger.debug("sql~~~:"+sql);
        
        List<AutoResponseRule> list = jdbcTemplate.query(sql, new Object[]{id }, new RowMapper<AutoResponseRule>(){
            public AutoResponseRule mapRow(ResultSet rs, int rowNum) throws SQLException {
                AutoResponseRule entity = new AutoResponseRule();
                entity.setId(rs.getString("id"));
                entity.setDomain(rs.getString("domain"));
                entity.setName(rs.getString("name"));
                entity.setKeywords(rs.getString("keywords"));
                entity.setResponseAll(rs.getInt("responseAll"));
                entity.setMatterIds(rs.getString("matterIds"));
                entity.setIsdel(rs.getInt("isdel"));
                entity.setCreater(rs.getString("creater"));
                entity.setCreateTime(rs.getLong("createTime"));
                entity.setUpdater(rs.getString("updater"));
                entity.setUpdateTime(rs.getLong("updateTime"));
                entity.setType(rs.getString("type"));
                entity.setContent(rs.getString("content"));
                entity.setMatchAll(rs.getInt("matchAll"));
                return entity;
            }
        });
        if(CollectionUtils.isNotEmpty(list)){
            return list.get(0);
        }
        return null;
    }

    @Override
    public List<MatterVO> queryMatterVOByIds(String domain, String matterIds, int pageNO, int pageSize, final String qiniuImageBasePath,final String coverSuffix) {
        String sql = "select temp.*,file.file_path from (SELECT base.id as sourceBaseId,base.modify_time,info.id as infoId,info.title,info.author,info.file_id,info.base_id as baseId,info.cover_show,info.o_desc as summary,info.content,info.o_link as link,info.goto_type as gotoType,info.goto_url as gotoUrl FROM `ixin_matter_official` base left join ixin_matterinfo info on base.id=info.source_base_id where base.domain=? and base.id in ? and del=0 order by base.modify_time desc limit ?,?) as temp LEFT JOIN ixin_fileinfo as file on temp.file_id = file.id";
        
        //TODO 参数不一定正确matterIds
        return jdbcTemplate.query(sql,new Object[]{domain, matterIds, (pageNO-1)*pageSize,pageSize}, new RowMapper<MatterVO>(){
            public MatterVO mapRow(ResultSet rs, int rowNum)
                    throws SQLException {
                MatterVO vo = new MatterVO();
                vo.setId(rs.getString("baseId"));
                vo.setSourceBaseId(rs.getString("sourceBaseId"));
                vo.setModifyTime(rs.getLong("modify_time"));
                List<MatterInfoVO> matterInfos = new ArrayList<MatterInfoVO>();
                MatterInfoVO m = new MatterInfoVO();
                m.setId(rs.getString("infoId"));
                m.setTitle(rs.getString("title"));
                m.setAuthor(rs.getString("author"));
                m.setFileId(rs.getString("file_id"));
                m.setCoverPath(qiniuImageBasePath+rs.getString("file_path")+coverSuffix);
                m.setDesc(rs.getString("summary"));
                m.setCoverShowInText(rs.getInt("cover_show"));
                m.setContent(HtmlUtils.htmlUnescape(rs.getString("content")));
                m.setOriginalLink(rs.getString("link"));
                m.setGotoType(rs.getInt("gotoType"));
                m.setGotoUrl(rs.getString("gotoUrl"));
                matterInfos.add(m);
                vo.setMatterInfos(matterInfos);
                return vo;
            }
            
        });
    }

    @Override
    public List<FodderVO> getFodderByIds(String matterIds) {
        List<FodderVO> ret = new ArrayList<FodderVO>();
        if(StringUtils.isBlank(matterIds)){
            return ret;
        }
        String[] ids = matterIds.split(",");
        if(ArrayUtils.isEmpty(ids)){
            return ret;
        }
        String idstr = "";
        for (String s : ids) {
            idstr += "'"+s+"',";
        }
        if(idstr.endsWith(",")){
            idstr = idstr.substring(0, idstr.length()-1);
        }
        List<String> idss = Arrays.asList(ids);
        
        //TODO in查询怎么传参？
        String sql = "select * from ixin_fodder where id in ("+idstr+") and del=0 order by modifyTime desc";
//        sql = sql.replace("#", idstr);
        logger.debug(sql);
        
        return jdbcTemplate.query(sql,/* new Object[]{ids },*/new RowMapper<FodderVO>(){
            public FodderVO mapRow(ResultSet rs, int rowNum) throws SQLException {
                FodderVO vo = new FodderVO();
                Field[] fields = FodderEntity.class.getDeclaredFields();
                try{
                    for (Field field : fields) {
                        BeanUtils.setProperty(vo, field.getName(), rs.getString(field.getName()));
                    }
                }catch(Exception e){
                    e.printStackTrace();
                }
                return vo;
            }
        });
    }
    
    public FodderVO getFodderById(String fodderId){
    	String sql = "select * from ixin_fodder where id=? and del = 0";
    	List<FodderVO> list = jdbcTemplate.query(sql, new Object[]{fodderId },new RowMapper<FodderVO>(){
              public FodderVO mapRow(ResultSet rs, int rowNum) throws SQLException {
                  FodderVO vo = new FodderVO();
                  Field[] fields = FodderEntity.class.getDeclaredFields();
                  try{
                      for (Field field : fields) {
                          BeanUtils.setProperty(vo, field.getName(), rs.getString(field.getName()));
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

}
