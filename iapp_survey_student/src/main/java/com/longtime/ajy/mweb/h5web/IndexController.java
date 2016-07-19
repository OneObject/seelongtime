package com.longtime.ajy.mweb.h5web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.longtime.ajy.model.User;
import com.longtime.ajy.mweb.MwebHelper;
import com.longtime.ajy.session.SessionHelper;
import com.longtime.ajy.student.service.AccountService;
import com.longtime.common.web.KaptchaExtServlet.CaptchaValidator;

@Controller(value="h5indexController")
@RequestMapping(value="/m/h5")
public class IndexController {
    
    @Resource(name="accountService")
    private AccountService accountService;
    
	@RequestMapping(value="/index")
	public String index(HttpServletRequest request,ModelMap modelMap)
	{
		String domain = MwebHelper.getCurrentDomain();
		String uid = MwebHelper.getCurrentUid();
		User user = SessionHelper.getCurrentUser(request);
		
		modelMap.put("domain", domain);
		modelMap.put("uid", uid);
		modelMap.put("user", user);
		String temp ="";//TemplateHelper.getView("m.h5.index", domain);
		return StringUtils.isBlank(temp)?"/m/h5/index":temp;
	}
	
	
	
	/**
     * 找回密码页面
     * 
     * @return
     */
    @RequestMapping("findpwd")
    public String findPassword() {
        return "/m/h5/findpwd";
    }
    
    
    
    @RequestMapping(value = "findpwd", method = RequestMethod.POST)
    @ResponseBody
    public int doFindPassword(HttpServletRequest request) {
        String domain = MwebHelper.getCurrentDomain();
        String account = request.getParameter("account");
        String captach = request.getParameter("captcha");
        boolean validate = CaptchaValidator.validate(captach, request);
        if(!validate){
            return 101;//参数错误
        }
        
        return accountService.findPassword(account, domain);
    }

}
