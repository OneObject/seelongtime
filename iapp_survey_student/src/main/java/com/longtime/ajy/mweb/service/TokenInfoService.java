package com.longtime.ajy.mweb.service;


import com.longtime.ajy.mweb.model.TokenInfo;
import com.longtime.common.service.IService;


public interface TokenInfoService extends IService<TokenInfo,String>{
	
	
	TokenInfo getByDomain(String domain);

}
