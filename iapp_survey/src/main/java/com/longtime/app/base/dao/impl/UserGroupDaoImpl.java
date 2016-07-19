package com.longtime.app.base.dao.impl;

import org.springframework.stereotype.Repository;

import com.longtime.app.base.dao.UserGroupDao;
import com.longtime.app.base.model.BaseGroup;
import com.longtime.common.dao.BaseDAOImpl;
@Repository(value="userGroupDao")
public class UserGroupDaoImpl extends BaseDAOImpl<BaseGroup,String>  implements UserGroupDao{

}
