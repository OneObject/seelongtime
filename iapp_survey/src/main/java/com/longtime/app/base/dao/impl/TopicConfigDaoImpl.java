package com.longtime.app.base.dao.impl;

import org.springframework.stereotype.Repository;

import com.longtime.app.base.dao.TopicConfigDao;
import com.longtime.app.base.model.TopicConfig;
import com.longtime.common.dao.BaseDAOImpl;

@Repository("topicConfigDao")
public class TopicConfigDaoImpl extends BaseDAOImpl<TopicConfig,String> implements TopicConfigDao {

}
