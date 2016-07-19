package com.longtime.app.ixin.mgr.service.impl;

import java.util.List;
import java.util.Random;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.commons.lang3.RandomStringUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.longtime.app.ixin.api.WeiXinAPIHelper;
import com.longtime.app.ixin.mgr.dao.ITokenDao;
import com.longtime.app.ixin.mgr.model.TokenInfo;
import com.longtime.app.ixin.mgr.service.ITokenService;
import com.telecom.ctu.platform.common.cache.CacheService;

@Service("tokenService")
public class TokenServiceImpl implements ITokenService {

	@Resource(name = "tokenDao")
	private ITokenDao tokenDao;
	
	@Resource(name = "lt.cacheService")
	private CacheService cacheService;

	@Value("${com.longtime.ixin.TOKEN_BASE_PATH}")
	private String baseUrl;

	@Override
	public TokenInfo getTokenInfoByDomainToken(String domain_token) {
		return tokenDao.getTokenInfoByDomainToken(domain_token);
	}

	public TokenInfo queryByDomain(String domain) {
		return tokenDao.queryByDomain(domain);
	}

	@Override
	public TokenInfo doQueryOrInsertToken(String domain) {
		TokenInfo tokenInfo = tokenDao.queryByDomain(domain);
		if (tokenInfo != null && tokenInfo.getDomain_token() != null) {
			return tokenInfo;
		}
		String domain_token = UUID.randomUUID().toString().replaceAll("-", "");
		String token = getRandString(6);
		String aeskey = RandomStringUtils.randomAlphanumeric(43);//生成43位由字母与数字组合而成的AESkey
		tokenInfo = new TokenInfo();
		tokenInfo.setDomain(domain);
		tokenInfo.setDomain_token(domain_token);
		tokenInfo.setToken(token);
		tokenInfo.setIsEnabled(1);
		tokenInfo.setType("");
		tokenInfo.setAuthentication("");
		tokenInfo.setAeskey(aeskey);
		tokenDao.insert(tokenInfo);
		return tokenInfo;
	}

	/**
	 * 产生随机字符串，长度由参数指定。
	 * 
	 * @param length
	 *            产生的字符串的长度
	 * @return 已产生的字符串
	 */
	private String getRandString(int length) {
		String charList = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
		String rev = "";
		Random random = new Random();
		for (int i = 0; i < length; i++) {
			rev += charList.charAt(Math.abs(random.nextInt())
					% charList.length());
		}
		return rev;
	}

	@Override
	public void updateTokenInfoByDomain(String appId, String appSecret,
			String domain) {
		tokenDao.updateTokenInfoByDomain(appId, appSecret, domain);
	}

	@Override
	public String getBasePath() {
		// TODO Auto-generated method stub
		return baseUrl;
	}

	@Override
	public TokenInfo getTokenInfoByDomain(String domain) {
		return tokenDao.getTokenInfoByDomain(domain);
	}

	@Override
	public void updateTokenInfo(String name, String pass, String type,
			String authentication, String domain) {
		tokenDao.updateTokenInfo(name, pass, type, authentication, domain);
	}

	@Override
	public void updateTokenInfo(String username, String password, String domain) {
		tokenDao.updateTokenInfo(username, password, domain);
	}

	@Override
	public List<TokenInfo> getAll() {
		return  tokenDao.getAll();
	}

	//@Override
//	public String getAccessToken(String domain) {
//		String accessToken = cacheService.get(getAccessTokenCacheKey(domain));
//		if(null == accessToken){
//			TokenInfo tokenInfo = getTokenInfoByDomain(domain);
//			if(tokenInfo == null){
//				cacheService.put(getAccessTokenCacheKey(domain), 7000, "");
//				return "";
//			}
//			if(StringUtils.isNotBlank(tokenInfo.getAppId()) && StringUtils.isNotBlank(tokenInfo.getAppSecret())){
//				accessToken = WeiXinAPIHelper.getAccessToken(tokenInfo.getAppId(), tokenInfo.getAppSecret());
//				if(StringUtils.isBlank(accessToken)){
//					accessToken = "";
//				}
//				cacheService.put(getAccessTokenCacheKey(domain), 7000, accessToken);
//				return accessToken;
//			}
//			cacheService.put(getAccessTokenCacheKey(domain), 7000, "");
//		}
//		return accessToken;
//	}
	
	private String getAccessTokenCacheKey(String domain) {
		return String.format("act_%s", domain);
	}
	
	@Override
	public List<TokenInfo> getTokenInfoByType(String type) {
		return this.tokenDao.getTokenInfoByType(type);
	}

	@Override
	public boolean updateTokenInfo(String type, String encodename, String encodepassword, String authentication,
			String appId, String appSecret, String agentid,boolean oauth, String domain) {
		if(!"3".equals(type)){
			agentid = null;
		}
		return tokenDao.updateTokenInfo(encodename, encodepassword, type, authentication,appId, appSecret, agentid,oauth, domain);
	} 
	@Override
	public boolean updateTokenInfo(String type, String encodename, String encodepassword, String authentication,
			String appId, String appSecret, String agentid,boolean oauth, String domain,String AESkey) {
		if(!"3".equals(type)){
			agentid = null;
		}
		return tokenDao.updateTokenInfo(encodename, encodepassword, type, authentication,appId, appSecret, agentid,oauth, domain,AESkey);
	} 
}
