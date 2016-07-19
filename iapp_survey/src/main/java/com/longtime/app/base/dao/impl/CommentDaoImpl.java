package com.longtime.app.base.dao.impl;

import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import com.longtime.app.base.dao.CommentDao;
import com.longtime.app.base.model.Comment;
import com.longtime.common.dao.BaseDAOImpl;

@Repository("commentDao")
public class CommentDaoImpl extends  BaseDAOImpl<Comment, Long> implements CommentDao{

	@Resource(name = "ixin_jdbcTemplate")
	private JdbcTemplate jdbcTemplate;
	
	@Resource(name = "apps.namedParameterJdbcTemplate")
	private NamedParameterJdbcTemplate nJdbcTemplate;
	
	
}
