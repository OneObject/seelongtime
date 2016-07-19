package com.longtime.app.ixin.mgr.rank.service.impl;

import com.longtime.app.ixin.mgr.rank.dao.IUserTotalCreditDAO;
import com.longtime.app.ixin.mgr.rank.model.UserTotalCreditEntityVO;
import com.longtime.app.ixin.mgr.rank.service.IUserTotalCreditService;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;


@Service("usertotalcreditService")
public class UserTotalCreditServiceImp implements IUserTotalCreditService {
	
	@Resource(name = "userToalCreditDAO")
	private IUserTotalCreditDAO userToalCreditDAO;
	

	public IUserTotalCreditDAO getUserToalCreditDAO() {
		return userToalCreditDAO;
	}
	public void setUserToalCreditDAO(IUserTotalCreditDAO userToalCreditDAO) {
		this.userToalCreditDAO = userToalCreditDAO;
	}

	@Override
	public List<UserTotalCreditEntityVO> getCreditEntityRanking(String domain,int pageSize) {
		// TODO Auto-generated method stub
		return this.userToalCreditDAO.getCreditEntityRanking(domain, pageSize);
	}

}
