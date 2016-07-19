package com.longtime.app.ixin.protal.controller;

import com.longtime.app.base.model.User;
import com.longtime.app.base.service.UserService;
import com.longtime.app.ixin.mgr.model.IXinUser;
import com.longtime.app.ixin.mgr.service.IXinUserService;
import com.longtime.app.util.IdGenerator;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 
 *
 */
@Controller
@RequestMapping("/protal/ixin/banduser/")
public class IXUserController {

	@Resource(name="iXinUserService")
	private IXinUserService iXinUserService;
	
	@Resource(name="userService")
	private  UserService userService;
	@RequestMapping("save")
	@ResponseBody
	public String save(IXinUser user){
		if(StringUtils.isBlank(user.getId())){
			user.setId(IdGenerator.nextId32().toString());
		}
		iXinUserService.saveOrUpdate(user);
		return "success";
	}
	
	@RequestMapping("getuser")
	@ResponseBody
	public IXinUser getuser(@RequestParam("id")String id){
		IXinUser ixinUser =  iXinUserService.getIxinUserByOpenId(id);
		
		if(null!=ixinUser && StringUtils.isNotBlank(ixinUser.getBase_id())){
			
			if(StringUtils.isBlank(ixinUser.getName())){
				//加载用户信息
				User user = userService.get(ixinUser.getBase_id());
				if(null!=user){
					ixinUser.setName(user.getName());
					ixinUser.setMobile(user.getMobile());
				}
			}
			
		}
		return ixinUser;
	}
	
	
	private static String HEAD_IMG_URL_DEFAULT = "/static/ixin/img/avatar.png";
	@RequestMapping("wx_avatar")
	public String getWXUserHeadImgUrl(HttpServletRequest request){
		
		String openid =  request.getParameter("openid");
		if(StringUtils.isBlank(openid)){
			return "redirect:"+ HEAD_IMG_URL_DEFAULT;
		}
		
		IXinUser iXinUser = iXinUserService.getIxinUserByOpenId(openid);
		
		if(null==iXinUser || StringUtils.isBlank(iXinUser.getHeadimgurl())){
			return "redirect:"+ HEAD_IMG_URL_DEFAULT;
		}
		return "redirect:"+iXinUser.getHeadimgurl();
		
	}
	
}
