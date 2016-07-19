package com.longtime.app.base.dao.impl;

import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import com.longtime.app.base.dao.PraiseDao;
import com.longtime.app.base.model.Praise;
import com.longtime.common.dao.BaseDAOImpl;

@Repository("praiseDao")
public class PraiseDaoImpl extends BaseDAOImpl<Praise, String> implements PraiseDao{

	@Resource(name = "ixin_jdbcTemplate")
	private JdbcTemplate jdbcTemplate;
	
	@Resource(name = "apps.namedParameterJdbcTemplate")
	private NamedParameterJdbcTemplate nJdbcTemplate;
}
