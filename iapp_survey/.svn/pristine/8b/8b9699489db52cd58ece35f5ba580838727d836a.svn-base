package com.longtime.app.base.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.longtime.app.base.controller.vo.PermissionShort;
import com.longtime.app.base.model.User;
import com.longtime.app.base.service.RolePerUnionService;
import com.longtime.app.base.service.UserRoleService;
import com.longtime.app.base.service.UserService;
import com.longtime.common.utils.LoginSessionHelper;
import com.longtime.common.utils.QueryCondition;
import com.longtime.common.utils.ResultSet;

@Controller
@RequestMapping("/base/admin/")
public class BaseLoginController {
    @Resource
    private UserService userService;
    @Resource
    private RolePerUnionService rolePerUnionService ;
    @Resource
    private UserRoleService userRoleService;
    
    /**
     * 用户登录
     * @param 父节点id
     * @param model
     * @return
     * @throws Exception 
     */
    @RequestMapping("dologin")
    @ResponseBody
    public ModelMap doLogin(HttpServletRequest req, ModelMap model) throws Exception {
        
        String username = StringUtils.trimToNull(req.getParameter("username"));
        String password = StringUtils.trimToNull(req.getParameter("password"));
        
        if(StringUtils.isBlank(username) || StringUtils.isBlank(password)){
            model.put("message", "用户名与密码不正确！");
            model.put("flag", false);
            return model;
        }
        
        QueryCondition query = new QueryCondition();
        query.addFilterEqual("username", username);
        query.addFilterEqual("isDel", User.ISDEL_NO);
        ResultSet<User> ret = userService.list(query);
        
        if(null==ret || null==ret.getItems() || 0==ret.getItems().size()){
            model.put("message", "用户名与密码不正确！");
            model.put("flag", false);
            return model;
        }
        if(1<ret.getItems().size()){
            throw new Exception("存在相同用户名的用户！");
        }
        
        User u = ret.getItems().get(0);
        
        HttpSession session = req.getSession();
        
        LoginSessionHelper.putCurrentUser(req, u);
        LoginSessionHelper.putCurrentUserRole(req, userRoleService.listRoleIdByUserId(u.getId()));
        
        List<PermissionShort> globalAclList = new ArrayList<PermissionShort>();
        if(null == LoginSessionHelper.getGlobalAcl(req)){
            globalAclList = rolePerUnionService.getGlobalPermissions(req);
            LoginSessionHelper.putGlobalAcl(req, globalAclList);
        } else{
            globalAclList = LoginSessionHelper.getGlobalAcl(req);
        }
        
        List<String> userAclList = new ArrayList<String>();
        if(null == session.getAttribute(LoginSessionHelper.USER_PERMISSION_SHORT_MAP)){
            userAclList = rolePerUnionService.getUserAcl(LoginSessionHelper.getCurrentUserId(req));
            LoginSessionHelper.putCurrentUserAcl(req, userAclList);
        } else{
            userAclList = (List<String>) LoginSessionHelper.getCurrentUserAcl(req);
        }

        model.put("message", "登录成功！");
        model.put("flag", true);
        return model;
    }
    
    /**
     * 用户注销
     * @param 父节点id
     * @param model
     * @return
     * @throws Exception 
     */
    @RequestMapping("logout")
    public String logout(HttpServletRequest req, HttpServletResponse rep, ModelMap model) throws Exception {
        req.getSession().invalidate();
        return "redirect:/base/admin/login.xhtml";
    }
}

