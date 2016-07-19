package com.longtime.app.credit.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.longtime.app.base.model.UserCreditVO;
import com.longtime.app.credit.dao.UserCreditDao;
import com.longtime.app.credit.service.UserCreditService;
import com.longtime.common.utils.Page;

@Service("userCreditService")
public class UserCreditServiceImpl implements UserCreditService{

	@Resource(name = "userCreditDao")
	private UserCreditDao userCreditDao;
	
	@Override
	public long count(String searchContent, String domain) {
		return this.userCreditDao.count(searchContent,domain);
	}

	@Override
	public List<UserCreditVO> list(Page page, String searchContent,
			String domain) {
		return this.userCreditDao.list(page,searchContent,domain);
	}

}
