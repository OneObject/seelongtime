package com.longtime.app.credit.service;

import java.util.List;

import com.longtime.app.base.model.UserCreditVO;
import com.longtime.common.utils.Page;

public interface UserCreditService {

	long count(String searchContent, String domain);

	List<UserCreditVO> list(Page page, String searchContent, String domain);

}
