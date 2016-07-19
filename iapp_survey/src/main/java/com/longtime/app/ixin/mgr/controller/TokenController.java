package com.longtime.app.ixin.mgr.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.common.collect.Maps;
import com.kin.weixin.Weixin;
import com.longtime.ajy.support.PasswordEncoder;
import com.longtime.app.base.model.TenantConfig;
import com.longtime.app.base.service.TenantConfigService;
import com.longtime.app.config.Constants;
import com.longtime.app.ixin.mgr.model.TokenInfo;
import com.longtime.app.ixin.mgr.service.ITokenService;
import com.longtime.common.utils.LoginSessionHelper;

@Controller("tokenController")
@RequestMapping("/mgr/ixin/")
public class TokenController {
	private static final Logger logger = LoggerFactory
			.getLogger(TokenController.class);
	@Resource(name = "tokenService")
	private ITokenService tokenService;
	
	@Resource(name = "tenantConfigService")
	private TenantConfigService tenantConfigService;

	public static boolean flag = true;
	public static List<TokenInfo> olders =  new ArrayList<TokenInfo>();

	/**
	 * 账号密码加密
	 * @return
	 */
//	@RequestMapping("update_tokeninfo")
//	@ResponseBody
//	public List<TokenInfo> updateTokeninf() {
//		if (flag) {
//			List<TokenInfo> tokenInfos = tokenService.getAll(); 
//			for (TokenInfo t : tokenInfos) {
//				TokenInfo ti = new TokenInfo();
//				ti.setId(t.getId());
//				ti.setAppId(t.getAppId());
//				ti.setAppSecret(t.getAppSecret());
//				ti.setAuthentication(t.getAuthentication());
//				ti.setDomain(t.getDomain());
//				ti.setDomain_token(t.getDomain_token());
//				ti.setIsEnabled(t.getIsEnabled());
//				ti.setName(t.getName());
//				ti.setPass(t.getPass());
//				ti.setToken(t.getToken());
//				ti.setType(t.getType());
//				olders.add(ti);
//				
//				// ==========以下为账号密码加密===========
//				String name = t.getName();
//				String password = t.getPass();
//				if (StringUtils.isNotBlank(name) && StringUtils.isNotBlank(password)) {
//					name = name.trim();
//					password = password.trim();
//					System.out.println(t.getName() + ":" + t.getPass());
//					String domain = t.getDomain();
//
//					// 账号密码加密
//					String encodename = PasswordEncoder.encode(name, domain);
//					String encodepassword = PasswordEncoder.encode(password,
//							domain);
//
//					tokenService.updateTokenInfo(encodename, encodepassword,
//							domain);
//				}
//			}
//			flag = false;
//			return olders;
//		}
//		return olders; 
//	}


	/**
	 * 账号绑定页面
	 */
	@RequestMapping("token")
	public String bindTenementTokenInfo(HttpServletRequest request, HttpServletResponse response, ModelMap map) {
		String domain = LoginSessionHelper.getCurrentDomain(request);
		TokenInfo tokenInfo = tokenService.doQueryOrInsertToken(domain);
		if (StringUtils.isNotBlank(tokenInfo.getName())) {
			String decodeusername = PasswordEncoder.decode(tokenInfo.getName(), domain);
			tokenInfo.setName(decodeusername);
		}
		if(StringUtils.isNotBlank(tokenInfo.getPass())){
			String decodeuserpass = PasswordEncoder.decode(tokenInfo.getPass(),domain);
			tokenInfo.setPass(decodeuserpass);
		}
		//企业号
		String baseurl = this.tokenService.getBasePath();
		if ("3".equals(tokenInfo.getType())) {
			baseurl = baseurl.replace("/webchat/", "/qy/");
		}
		
		TenantConfig tenantConfig = this.tenantConfigService.getByDomain(domain);
		boolean syncToWx = false;
		boolean syncFromWx = false;
		if(tenantConfig != null){
			syncToWx = tenantConfig.isIsautosyn();
			syncFromWx = tenantConfig.isSyncfromwx();
		}
		
		map.put("syncToWx", syncToWx);
		map.put("syncFromWx", syncFromWx);
		map.put("tokenInfo", tokenInfo);
		map.put("baseurl",baseurl);
		return "mgr/ixin/token/token";
	}

	/**
	 * 保存账号信息
	 */
	@RequestMapping(value = "savetokeninfo", method = RequestMethod.POST)
	@ResponseBody
	public boolean saveTokeninfo(HttpServletRequest request) {
		String type = request.getParameter("type");
		String authentication = request.getParameter("authentication");
		String name = request.getParameter("name");
		String pass = request.getParameter("pass");
		String appId = request.getParameter("appId");
		String appSecret = request.getParameter("appSecret");
		String agentid = request.getParameter("agentid");
		String domain = request.getParameter("domain");
		String AESkey = request.getParameter("AESkey");
		boolean oauth = Boolean.valueOf(request.getParameter("oauth"));
		// 账号密码加密
		String encodename = PasswordEncoder.encode(name, domain);
		String encodepassword = PasswordEncoder.encode(pass, domain);
		//if (StringUtils.isBlank(AESkey)) {
			//return tokenService.updateTokenInfo(type,encodename, encodepassword, authentication,appId, appSecret, agentid,oauth, domain);
		//}else{
			return tokenService.updateTokenInfo(type,encodename, encodepassword, authentication,appId, appSecret, agentid,oauth, domain,AESkey);
		//}
	}

	@RequestMapping("mytoken")
	public String bindTenementToken(HttpServletRequest request,
			HttpServletResponse response, ModelMap map) {
		String domain = LoginSessionHelper.getCurrentDomain(request);
		TokenInfo tokenInfo = tokenService.doQueryOrInsertToken(domain);
		if(StringUtils.isNotBlank(tokenInfo.getName())){
			String decodeusername = PasswordEncoder.decode(tokenInfo.getName(),domain);
			tokenInfo.setName(decodeusername);
		}
		map.put("tokenInfo", tokenInfo);
		map.put("baseurl", tokenService.getBasePath());
		return "mgr/ixin/token/mytoken";
	}

	@RequestMapping("addcertificates")
	@ResponseBody
	public void addCertificates(HttpServletRequest request) {
		String appId = request.getParameter("appId");
		String appSecret = request.getParameter("appSecret");
		String domain = request.getParameter("domain");
		tokenService.updateTokenInfoByDomain(appId, appSecret, domain);
	}

	/**
	 * 保存公众号
	 * 
	 * @param request
	 */
	@RequestMapping("addPublicname")
	@ResponseBody
	public void addPublicname(HttpServletRequest request) {
		String name = request.getParameter("name");
		String pass = request.getParameter("pass");
		String type = request.getParameter("type");
		String authentication = request.getParameter("authentication");
		String domain = request.getParameter("domain");
		// 账号密码加密
		String encodename = PasswordEncoder.encode(name, domain);
		String encodepassword = PasswordEncoder.encode(pass, domain);

		tokenService.updateTokenInfo(encodename, encodepassword, type,
				authentication, domain);
	}

	/**
	 * 绑定公众号
	 * 
	 * @param request
	 */
	@RequestMapping("autobind")
	@ResponseBody
	public String doAutoBind(HttpServletRequest request) {
		String domain = LoginSessionHelper.getCurrentDomain(request);
		TokenInfo tokenInfo = tokenService.doQueryOrInsertToken(domain);

		if (null == tokenInfo || StringUtils.isBlank(tokenInfo.getName())
				|| StringUtils.isBlank(tokenInfo.getPass())) {
			return "-1";
		}

		String url = String.format("%s%s.xhtml", tokenService.getBasePath(),
				tokenInfo.getDomain_token());

		String token = tokenInfo.getToken();

		String username = tokenInfo.getName();
		String pwd = tokenInfo.getPass();
		// 账号密码解密
		String decodeusername = PasswordEncoder.decode(username, domain);
		String decodepassword = PasswordEncoder.decode(pwd, domain);

		try {
			Weixin wx = new Weixin(decodeusername, decodepassword);
			wx.login();
			
			boolean bool = wx.setDevUrl(url, token);
			if (!bool) {
				return "0";
			}
			
			bool = wx.openDevModle();
			if (!bool) {
				return "0";
			}
			
			try {

				String qrcodePath = getQrcodePath(request);
				File dir = new File(qrcodePath);
				if (!dir.exists()) {
					dir.mkdirs();
				}
				String filename = username + ".jpg";
				wx.downLoadQrcode(qrcodePath, filename);

			} catch (Exception e) {
				logger.error(
						String.format(
								"fetching weixin qrcode due to fail. weixin_username=%s",
								username), e);
			}

			String[] appidAndSecret = wx.getAppIdAndSecret();

			if (null != appidAndSecret && appidAndSecret.length == 2) {
				String appId = appidAndSecret[0].trim();
				String appSecret = appidAndSecret[1].trim();
				tokenService.updateTokenInfoByDomain(appId, appSecret, domain);
			}
			return "1";
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			return "0";
		}
	}

	@RequestMapping("qrcode")
	@ResponseBody
	public Map<String, String> qrcode(HttpServletRequest request) {

		String wxuname = request.getParameter("wxuname");
		if (StringUtils.isBlank(wxuname)) {
			return Collections.EMPTY_MAP;
		}

		// 检查文件是否存在
		String qrcodeFile = String.format("%s/%s.jpg", getQrcodePath(request),
				wxuname);

		File file = new File(qrcodeFile);
		if (file.exists()) {
			Map<String, String> rs = Maps.newHashMap();
			rs.put("path", qrcodeFile);
			return rs;
		}
		return Collections.EMPTY_MAP;

	}

	private String getQrcodePath(HttpServletRequest request) {
		String qrcodePath = Constants.QRCODE_PATH_EXTRACT;
		qrcodePath = String.format("%s%s", request.getSession()
				.getServletContext().getRealPath("/"), qrcodePath);
		return qrcodePath;

	}
}
