package com.longtime.ajy.mweb.service.impl;

import org.apache.commons.lang3.StringUtils;

import com.longtime.ajy.mweb.MwebHelper;
import com.longtime.ajy.mweb.model.Task;
import com.longtime.ajy.mweb.model.TaskUser;
import com.longtime.common.model.search.Search;
import java.util.ArrayList;
import java.util.List;
import com.longtime.ajy.mweb.model.TokenInfo;
import com.longtime.ajy.mweb.service.TokenInfoService;
import com.longtime.common.dao.Repository;
import com.longtime.common.service.BaseServiceImpl;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;

@Service("tokenInfoService")
public class TokenInfoServiceImpl extends BaseServiceImpl<TokenInfo, String> implements TokenInfoService {

    @Resource(name = "tokenInfoRepository")
    private Repository<TokenInfo, String> tokenInfoRepository;

    
	@Override
	public Repository<TokenInfo, String> getRepository() {
		return tokenInfoRepository;
	}


	@Override
	public TokenInfo getByDomain(String domain) {
		if(StringUtils.isBlank(domain)){
			return null;
		}
		Search search = new Search();
		search.addEqualFilter("domain", domain);
		List<TokenInfo> list = this.tokenInfoRepository.list(search);
		
		return (null==list ||  list.isEmpty())? null:list.get(0);
	}


}
