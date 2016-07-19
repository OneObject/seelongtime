/**
 * project : portal-demo
 * user created : songsp
 * date created : 2012-9-28 - 下午5:15:35
 */
package com.longtime.demo.service.impl;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.longtime.common.RepositoryUnexpectedException;
import com.longtime.common.operation.HibernateOperation;
import com.longtime.common.service.BaseService4HImpl;
import com.longtime.demo.dao.UserDAO;
import com.longtime.demo.model.DemoOrg;
import com.longtime.demo.model.DemoUser;
import com.longtime.demo.service.UserService;

/**
 * @since 2012-9-28
 * @author songsp
 */
@Service
public class UserServiceImpl extends BaseService4HImpl<DemoUser, Long> implements UserService {

	@Autowired
	private UserDAO userDAO;

	@Override
	public UserDAO getDAO(){
		return this.userDAO;
	}

	/*@Override
	public boolean save(User entity) {
		return super.save(entity);
	}*/
	
	public DemoUser listBySelf(){
		return getDAO().execute(new HibernateOperation<DemoUser>(){

			@Override
			public DemoUser execute(Session session) throws RepositoryUnexpectedException {
				String queryString = "select * from t_user_1  where id=1";
				SQLQuery query= session.createSQLQuery(queryString).addEntity(DemoUser.class);
				
				
				
				DemoUser user  =  (DemoUser)query.uniqueResult();
				System.err.println(user.getId());
				return user;
			}
			
		});
	}
	
	public void doTranstation(){
		
		
		DemoUser user = new DemoUser();
		
		user.setName("test"+System.currentTimeMillis());
		
		this.insert(user);
		
		
		user = new DemoUser();
		user.setName("test");
		DemoOrg org = new DemoOrg();
		org.setId(1L);
		user.setOrg(org);
		
		this.insert(user);
		
		
	}

	
}
