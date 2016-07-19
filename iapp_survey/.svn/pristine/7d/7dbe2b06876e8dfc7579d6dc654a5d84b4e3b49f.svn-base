package com.longtime.app.base.controller;

import java.io.File;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.common.collect.Maps;
import com.kin.weixin.Weixin;
import com.longtime.app.base.model.TenantConfig;
import com.longtime.app.base.model.TenantConfig.Setting;
import com.longtime.app.base.service.TenantConfigService;
import com.longtime.app.base.util.Constant;
import com.longtime.app.config.Constants;
import com.longtime.app.ixin.mgr.model.TokenInfo;
import com.longtime.app.ixin.mgr.service.ITokenService;
import com.longtime.common.utils.LoginSessionHelper;
@Controller
@RequestMapping("/mgr/guide/")
public class GuideController {
	
	private static final Logger  logger = LoggerFactory.getLogger(GuideController.class);
	
	@Resource
	private  ITokenService  tokenService;
	
	@Resource
	private TenantConfigService tenantConfigService;
	
	@RequestMapping("autobind")
	public String autobindView(HttpServletRequest request,ModelMap  model){
		// 获取商户微信绑定信息
		String domain = LoginSessionHelper.getCurrentDomain(request);
		TokenInfo tokenInfo = tokenService.doQueryOrInsertToken(domain);
		model.put("tokenInfo",tokenInfo);
		return "mgr/guide/autobind";
	}
	
	/**
	 * 绑定时点击跳过按钮时的所走的方法
	 * @param request
	 * @return
	 */
	@RequestMapping("autobind_skip")
	public String autobindSkip(HttpServletRequest request){
		String uid = LoginSessionHelper.getCurrentUserId(request);
		// 获取商户微信绑定信息
		String domain = LoginSessionHelper.getCurrentDomain(request);
		TenantConfig config = tenantConfigService.doGetOrInsert(domain);
		if(null!=config){
			Setting setting = config.getSettingObj();
			if(setting==null){
				setting = new Setting();
			}
			setting.skipBind();
			config.setSettingObj(setting);
			tenantConfigService.update(config);
		}
		return String.format("redirect:%s", IXinAdminLoginController.index_url);
	}
	
	
	@RequestMapping(value="wx_account_check",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> checkWXAccount(HttpServletRequest request){
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		Map<String,Object> result = Maps.newHashMap();
		if(StringUtils.isBlank(username) || StringUtils.isBlank(password)){
			result.put("code", 1);
			result.put("msg", "账号密码为空");
			return  result;
		}
		Weixin wx = new Weixin(username, password);
		boolean bool = wx.login();
		
		if(bool){
			result.put("code", 200);
			result.put("msg", "验证成功");
			return result;
		}
		int errorcode = wx.getLoginErrCode();
		String errormsg = wx.getLoginErrMsg();
		result.put("code", errorcode);
		result.put("msg", errormsg);
		return result;
	}
	
	
	/**
	 * 按照绑定步骤进行的操作的方法
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="autobind",method=RequestMethod.POST)
	@ResponseBody
	public String doAutobindV(HttpServletRequest request,ModelMap  model) throws Exception{
		String uid = LoginSessionHelper.getCurrentUserId(request);
		// 获取商户微信绑定信息
		String domain = LoginSessionHelper.getCurrentDomain(request);
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		Weixin wx = new Weixin(username, password);
		wx.login();
		//打开开发者模式
		boolean flag = wx.openDevModle();
		TokenInfo tokeninfo = tokenService.doQueryOrInsertToken(domain);
		String token = tokeninfo.getToken();
		String baseurl = tokenService.getBasePath();
		String domain_token = tokeninfo.getDomain_token();
		String url = baseurl+domain_token+".xhtml";
		flag = wx.setDevUrl(url, token);
		if (flag){
			
			
			//抓取二维码图片并保存
			try{
				String qrcodePath = Constants.QRCODE_PATH_EXTRACT;
				qrcodePath = String.format("%s%s", request.getSession().getServletContext().getRealPath("/"),qrcodePath);
				File dir = new File(qrcodePath);
				if (!dir.exists()){
					dir.mkdirs();
				}
				String filename = username+".jpg";
				wx.downLoadQrcode(qrcodePath, filename);
			
			}catch(Exception e){
				logger.error(String.format("fetching weixin qrcode due to fail. weixin_username=%s",username), e);
			}
			
			
			String[] str = wx.getAppIdAndSecret();
			//如果密钥不为空
			if (str != null && str.length==2){
				
				//更新tokeninfo中的 appid、appsecret、name、pass
				tokenService.updateTokenInfoByDomain(str[0], str[1], domain);
				tokenService.updateTokenInfo(username,password, domain);
				//通过domain获取商户信息
				TenantConfig config = tenantConfigService.doGetOrInsert(domain);
				//如果商户信息不为空则更新setting状态为已经绑定
				if(null!=config){
					Setting setting = config.getSettingObj();
					if(setting==null){
						setting = new Setting();
					}
					setting.finishBind();
					config.setSettingObj(setting);
					tenantConfigService.update(config);
					return "success";
				}
			}
		}
		return "fail";
	}

}
