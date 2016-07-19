package com.longtime.app.base.dao.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import com.google.common.collect.Maps;
import com.longtime.app.base.dao.FeedBackDao;
import com.longtime.app.base.model.Feed;
import com.longtime.app.base.model.FeedBack;
import com.longtime.common.dao.BaseDAOImpl;
import com.longtime.common.utils.QueryCondition;

@Repository("feedBackDao")
public class FeedBackDaoImpl extends  BaseDAOImpl<FeedBack, String> implements FeedBackDao{
	@Resource
	private NamedParameterJdbcTemplate jdbcTemplate;
	

	@Override
	public List<FeedBack> getfeedList(String domain,long start, long end) {
		
			
			
			String sql = "SELECT feed.uid AS uid,feed.name AS name,feed.createtime as createTime,feed.type as type,feed.context as context from ixin_feed_back feed  WHERE feed.domain=:domain AND feed.createtime BETWEEN :start AND :end ORDER BY feed.createTime desc ";
			Map<String, Object> paramMap = Maps.newHashMap();
			paramMap.put("domain",domain);
			paramMap.put("start",start);
			paramMap.put("end",end);
			List<FeedBack> list = this.jdbcTemplate.query(sql, paramMap, new BeanPropertyRowMapper(FeedBack.class));
		
		
		
		return list;
	
		}


	
}
