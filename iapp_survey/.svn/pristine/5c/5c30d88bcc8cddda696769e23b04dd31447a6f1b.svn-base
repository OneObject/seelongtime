package com.longtime.app.ixin.mgr.dao;

import java.util.List;

import com.longtime.app.ixin.mgr.model.TokenInfo;

public interface ITokenDao {
	public TokenInfo getTokenInfoByDomainToken(String domain_token);

	public TokenInfo queryByDomain(String domain);

	public void insert(TokenInfo tokenInfo);

	public void updateTokenInfoByDomain(String appId, String appSecret,
			String domain);

	public TokenInfo getTokenInfoByDomain(String domain);

	public void updateTokenInfo(String name, String pass, String type,
			String authentication, String domain);

	public void updateTokenInfo(String username, String password, String domain);

	public List<TokenInfo> getAll();

	public List<TokenInfo> getTokenInfoByType(String type);

	/**
	 * 保存账号绑定信息
	 * @param type 账号类型
	 * @param encodename 加密后的用户名
	 * @param encodepassword 加密后的秘密
	 * @param authentication 是否高级认证
	 * @param appId appid
	 * @param appSecret appsecret
	 * @param agentid 应用id（企业号所使用）
	 * @param oauth 是否支持oauth协议
	 * @param domain 域
	 * @return
	 */
	public boolean updateTokenInfo(String encodename, String encodepassword, String type, String authentication,
			String appId, String appSecret, String agentid, boolean oauth, String domain);

	boolean updateTokenInfo(String encodename,
			String encodepassword,
			String type,
			String authentication,
			String appId,
			String appSecret,
			String agentid,
			boolean oauth,
			String domain,
			String AESkey);

}
