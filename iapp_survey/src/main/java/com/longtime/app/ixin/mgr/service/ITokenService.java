package com.longtime.app.ixin.mgr.service;

import java.util.List;

import com.longtime.app.ixin.mgr.model.TokenInfo;

public interface ITokenService {
	public TokenInfo getTokenInfoByDomainToken(String domain_token);

	public TokenInfo doQueryOrInsertToken(String domain);

	public void updateTokenInfoByDomain(String appId, String appSecret,
			String domain);

	public String getBasePath();

	public TokenInfo queryByDomain(String domain);

	public TokenInfo getTokenInfoByDomain(String domain);

	public void updateTokenInfo(String name, String pass, String type,
			String authentication, String domain);

	public void updateTokenInfo(String username, String password, String domain);

	public List<TokenInfo> getAll();

	//public String getAccessToken(String domain);

	public List<TokenInfo> getTokenInfoByType(String type);

	/**
	 * 添加账号绑定信息
	 * @param type 账号类型
	 * @param encodename 加密后的用户名
	 * @param encodepassword 加密后的秘密
	 * @param authentication 是否高级认证
	 * @param appId appid
	 * @param appSecret appsecret
	 * @param agentid 应用id（企业号所使用）
	 * @param oauth 是否支持oauth协议
	 * @param domain 域
	 */
	public boolean updateTokenInfo(String type, String encodename, String encodepassword, 
			String authentication, String appId, String appSecret, String agentid, boolean oauth, String domain);

	boolean updateTokenInfo(String type,
			String encodename,
			String encodepassword,
			String authentication,
			String appId,
			String appSecret,
			String agentid,
			boolean oauth,
			String domain,
			String AESkey);
}
