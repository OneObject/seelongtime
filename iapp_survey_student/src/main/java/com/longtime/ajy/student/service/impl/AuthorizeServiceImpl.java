package com.longtime.ajy.student.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import com.google.common.collect.Lists;
import com.longtime.ajy.model.Authorize;
import com.longtime.ajy.model.User;
import com.longtime.ajy.mweb.repository.NSpecialRepository;
import com.longtime.ajy.mweb.repository.SpecialRepository;
import com.longtime.ajy.session.SessionHelper;
import com.longtime.ajy.student.service.AuthorizeService;
import com.longtime.ajy.student.service.UserService;
import com.longtime.common.dao.Repository;
import com.longtime.common.model.search.Search;
import com.longtime.common.service.BaseServiceImpl;

@Service("authorizeService")
public class AuthorizeServiceImpl extends BaseServiceImpl<Authorize, String> implements AuthorizeService {
    
    @Resource(name="authorizeRepository")
    private Repository<Authorize, String> authorizeRepository;
    
    @Resource
    private SpecialRepository specialRepository;
    
    @Resource(name = "nSpecialRepository")
    private NSpecialRepository nSpecialRepository;
    
    @Resource
    private UserService userService;
    
    @Override
    public Repository<Authorize, String> getRepository() {
        return this.authorizeRepository;
    }
    
	@Override
	public List<Authorize> listByUidAndRcategory(String uid,int rcategory) {
		Search search = Search.newInstance();
		search.addEqualFilter("uid", uid);
		search.addEqualFilter("rcategory", rcategory);
		List<Authorize> list = this.authorizeRepository.list(search);
		if(CollectionUtils.isEmpty(list)){
			return Lists.newArrayList();
		}
		return list;
	}
	
	/* 使用用户组*/
	@Override
	public List<Authorize> listByUidAndRcategory2(String uid,int rcategory) {
		User user=this.userService.findOne(uid);
		if(user==null){
			return Lists.newArrayList();
		}
		
		return this.specialRepository.listExamAuthorizes(rcategory,SessionHelper.getCurrentDomain(),user);
		
	}
	
	@Override
	public List<String> listRidByUidAndRcategory(String uid,int category,String domain) {
		User user = this.userService.findOne(uid);
		List<String> list = this.nSpecialRepository.getUserAuthResourceIds(user, domain,category);
		return list;
	}
	
	

}
