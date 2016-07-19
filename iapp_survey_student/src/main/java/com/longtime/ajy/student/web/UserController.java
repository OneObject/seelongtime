package com.longtime.ajy.student.web;


import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.math.NumberUtils;
import org.slf4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.longtime.ajy.model.Account;
import com.longtime.ajy.model.LabelRelationEntity;
import com.longtime.ajy.model.User;
import com.longtime.ajy.mweb.service.LabelService;
import com.longtime.ajy.session.LocalSession;
import com.longtime.ajy.session.LoginSession;
import com.longtime.ajy.session.SessionHelper;
import com.longtime.ajy.student.config.Constant;
import com.longtime.ajy.student.service.AccountService;
import com.longtime.ajy.student.service.UserService;
import com.longtime.ajy.support.PasswordEncoder;
import com.longtime.ajy.support.QiniuHelper;

@Controller
@RequestMapping("/user")
public class UserController extends BaseController {
	
	private static Logger logger = org.slf4j.LoggerFactory.getLogger(UserController.class);
	
   @Resource
   private AccountService accountService;
   
   @Resource
   private UserService userService;
   
   @Resource
   private LabelService labelService;
   
   @RequestMapping("passindex")
   public String passIndex(HttpServletRequest request){
	   return "/user/changepassword";
   }
   /**
    * 旧密码验证
    * @param request
    * @return
    */
   @RequestMapping(value="/oldpassCheck",method={RequestMethod.POST,RequestMethod.GET})
   @ResponseBody
   public boolean oldpassCheck(HttpServletRequest request){
	   String oldpass=request.getParameter("oldpass");
	   String domainid=SessionHelper.getCurrentDomain();
	   String mima=null;
	   if(StringUtils.isBlank(oldpass)){
		   return false;
	   }
	   //得到用户信息s
		List<Account> accountlist =accountService.getAccountByid(SessionHelper.getCurrentUid());
		if(accountlist!=null && accountlist.size()>0 ){
		 mima=accountlist.get(0).getPwd();
		}else{
		 return false;
		}
		if(mima.equals(PasswordEncoder.encode(oldpass, domainid))){
			return true;
		}
	   return false;
   }
  
   /**
    * 密码修改
    * @param request
    * @param modelMap
    * @return
    */
   @RequestMapping( value="changePassword",method=RequestMethod.POST)
   @ResponseBody
   public boolean changePassword(HttpServletRequest request){
	   String newpassword=request.getParameter("newpassword");
	   String oldpassword=request.getParameter("oldpassword");
	   String surenewpassword=request.getParameter("surenewpassword");
	   String domainid=SessionHelper.getCurrentDomain();
	   if(StringUtils.isBlank(newpassword) || StringUtils.isBlank(oldpassword) || StringUtils.isBlank("surenewpassword")){
		   return false;
	   }
	   
	   if(!newpassword.equals(surenewpassword)){
		   return false;
	   }
	   //得到用户信息
		List<Account> accountlist =accountService.getAccountByid(SessionHelper.getCurrentUid());
		
		if(accountlist!=null && accountlist.size()>0){
			if(PasswordEncoder.encode(oldpassword, domainid).equals(accountlist.get(0).getPwd())){
				for(Account account:accountlist){
				account.setPwd(PasswordEncoder.encode(newpassword, domainid));
			    this.accountService.updatePass(account);
				}
				}
			return true;
			}
		
	    return false; 
   }
   
   
   
   /**
    * 个人中心
    * @return
    */
   @RequestMapping(value="center")
   public String usercenter(HttpServletRequest request,ModelMap modelMap){
	   User user=userService.findOne(SessionHelper.getCurrentUid());
	   String imgpath=QiniuHelper.getImgRootPath();
	   modelMap.put("user",user);
	   modelMap.put("imgpath",imgpath);
	   return "/user/center";
   }
   
   @RequestMapping(value="avatar")
   public String beforeEditHead(HttpServletRequest request,ModelMap modelMap){
	   User user=userService.findOne(SessionHelper.getCurrentUid());
	   String token=QiniuHelper.getUpToken();
	   String imgpath=QiniuHelper.getImgRootPath();
	   modelMap.put("uptoken",token);
	   modelMap.put("imgpath",imgpath);
	   modelMap.put("user",user);
	   modelMap.put("avatar", user.getAvatar());
	   return "/user/avatar";
   } 
   
   @RequestMapping(value="avatar/{id}")
   public String viewAvatar(@PathVariable("id") String id ,HttpServletRequest request,ModelMap modelMap){
       String style = request.getParameter("style");
       User user = userService.findOne(id);
       String domain = request.getParameter("domain");
       if(null==user ||  StringUtils.isBlank(user.getAvatar())){
           if(null!=user){
               domain = user.getDomain();
           }
    	   if("ENN".equals(domain) || "enntest".equals(domain)){
    		   return "redirect:/static/img/user/enn.jpg";
    	   }
    	   
    	   if("ennapp".equals(domain)){
    	       return  "redirect:/static/m/ext/enn/img/al.png";
    	   }
           String color = request.getParameter("color");
           if(StringUtils.isNotBlank(color)){
               return "redirect:/static/img/user/avatar_"+color+".png";
           }
           
           
           return "redirect:/static/img/user/avatar.png";
       }
       return "redirect:"+Constant.IMG_SERVER_DOWNLOAD + user.getAvatar() + (StringUtils.isNotBlank(style)?"-"+style:"" );
   } 
   
   
   
   /**
    * 修改用户信息
    * @param request
    * @param modelMap
    * @return
    */
   @RequestMapping(value="edit" ,method=RequestMethod.POST)
   public String editUser(HttpServletRequest request,HttpServletResponse response,ModelMap modelMap){
   	
    User user=userService.findOne(SessionHelper.getCurrentUid());
    
    if(null!=user){
        
        String action = request.getParameter("action");
        
        if("base".equals(action)){
            String name=request.getParameter("name");
            String labels = request.getParameter("labels");
            if(StringUtils.isNotBlank(name)){
                user.setName(name);
            }
            user.setLabels(labels);
            
            labelService.doSave(labels,user.getId(),LabelRelationEntity.RTYPE_USER,user.getDomain(),user.getId());
        }
        if("avatar".equals(action)){
            String avatar=request.getParameter("avatar");
            
            CropParam param = new CropParam(request);
            if(StringUtils.isNotBlank(avatar))
            {
                //设置截图
                String avatarCrop = this.crop(user.getDomain(), user.getId(), avatar,param );
                if(StringUtils.isNotBlank(avatarCrop)){
                    avatar = avatarCrop;
                }
            }
            user.setAvatar(avatar);
        }
        user.setUpdater(user.getId());
        user.setUpdatetime(System.currentTimeMillis());
        userService.update(user);
        
        SessionHelper.flushCurrentUser(request, user);
       
        LocalSession localSession =  SessionHelper.getLoginSession();
        LoginSession loginSession = localSession.getLoginSession();
        loginSession.setUname(user.getName());
        SessionHelper.storeSession(request, response, loginSession);
    }
    return "redirect:center.xhtml";
   
   }
   
   private String crop(String domain,String uid,String avatar,CropParam param){
       if(!param.validate()){
           return avatar;
       }
       logger.debug("" + Boolean.parseBoolean(Constant.IMG_SERVER_UPLOAD_ISQINIU));
       if(Boolean.parseBoolean(Constant.IMG_SERVER_UPLOAD_ISQINIU)){
    	   //使用七牛上传
    	   String target = String.format("%s/avatar/%s-%s", domain,uid,System.currentTimeMillis());
    	   // 截取
    	   return  QiniuHelper.crop(avatar, target, param.getCropW(), param.getCropH(), param.getCropX(), param.getCropY());
       }else{
    	   Boolean flag = QiniuHelper.crop(avatar, param.getCropW(), param.getCropH(), param.getCropX(), param.getCropY());
    	   return avatar;
       }
   }
   

   static  class CropParam{
       
       int x1;
       int y1;
       int w;
       int h;
       
       int show_w;
       int show_h;
       int actual_w;
       int actual_h;
       public CropParam(HttpServletRequest request){
            x1 = NumberUtils.toInt(request.getParameter("x1"),-1);
            y1 = NumberUtils.toInt(request.getParameter("y1"),-1);
            w = NumberUtils.toInt(request.getParameter("w"),-1);
            h = NumberUtils.toInt(request.getParameter("h"),-1);
            show_w = NumberUtils.toInt(request.getParameter("show_w"),-1);
            show_h = NumberUtils.toInt(request.getParameter("show_h"),-1);
            actual_w = NumberUtils.toInt(request.getParameter("actual_w"),-1);
            actual_h = NumberUtils.toInt(request.getParameter("actual_h"),-1);
       }
       
       public boolean validate(){
           return !(-1==x1 || -1==y1 || w==-1 || h==-1 || show_w==-1 || show_h==-1 ||actual_w==-1 ||actual_h==-1 );
       }
       public int getCropX(){
           return x1 * actual_w /show_w;
       }
       
       public int getCropY(){
           return y1*actual_h/show_h;
       }
       
       public int getCropW(){
           if(-1==w) {
               return actual_w;
           }
           return w*actual_w /show_w;
       }
       
       public int getCropH(){
           if(-1==h) {
               return actual_h;
           }
           return h*actual_h/show_h;
       }
       
   }
   public static void main(String[] args) {
       
      System.out.println(PasswordEncoder.decode("dbe44683014b96d4", "9su")); 
   }
}
