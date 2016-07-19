package com.longtime.common.filter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.longtime.app.base.controller.vo.PermissionShort;
import com.longtime.app.base.service.RolePerUnionService;
import com.longtime.app.base.util.URLPatternUtils;
import com.longtime.common.utils.LoginSessionHelper;


public class PermissionFilter implements Filter{
    Logger logger = LoggerFactory.getLogger(PermissionFilter.class);
    
    private static final String REDIRECT_URL = "/base/admin/permission/permission_failed.xhtml";
    private static List<String> PASS_URL = new ArrayList<String>();
    static{
        PASS_URL.add("/iapp/base/admin/login.xhtml");
        PASS_URL.add("/iapp/base/admin/dologin.xhtml");
        PASS_URL.add("/iapp/base/admin/logout.xhtml");
        PASS_URL.add("/iapp/base/admin/permission/permission_failed.xhtml");
    }
    
    private RolePerUnionService rolePerUnionService ;
    
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("~~~~~~~~~~~~init");
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain) throws IOException, ServletException {
        
        HttpServletRequest req = (HttpServletRequest)request;
        HttpServletResponse resp = (HttpServletResponse)response;
        
        /**
         * 不需要权限验证
         */
        if(PASS_URL.contains(req.getRequestURI())){
            chain.doFilter(request, response);
            return ;
        }
        
        List<PermissionShort> globalPerShortList = LoginSessionHelper.getGlobalAcl(req);
        List<String> userAclList = (List<String>) LoginSessionHelper.getCurrentUserAcl(req);
        
        /**
         * 系统权限树为空，用户权限为空，跳转到权限验证失败页面
         */
        if(null==globalPerShortList || null==userAclList){
            resp.sendRedirect(req.getContextPath() + REDIRECT_URL);
            return ;
        }
        
        for (int i=0; i<globalPerShortList.size(); i++) {
            PermissionShort per = globalPerShortList.get(i);
            /**
             * 请求地址不需要权限验证
             */
            if(!URLPatternUtils.pattern(per.getUrl(), req.getRequestURL().toString())){
                chain.doFilter(request, response);
                return ;
            }
            /**
             * 请求地址需要权限验证
             */
            if(URLPatternUtils.pattern(per.getUrl(), req.getRequestURL().toString())){
                /**
                 * 权限验证通过
                 */
                if(userAclList.contains(per.getSourceId())){
                    chain.doFilter(request, response);
                    return ;
                } 
                /**
                 * 权限验证不通过
                 */
                else{
                    resp.sendRedirect(req.getContextPath() + REDIRECT_URL);
                    return ;
                }
            }
        }
        
        /**
         * 应该不会走到这一步
         */
        chain.doFilter(request, response);
        return ;
    }

    @Override
    public void destroy() {
        System.out.println("~~~~~~~~~~~~destroy");
    }
    
    public static void main(String[] args) {
        List<String> requestUrls = new ArrayList<String>();
        requestUrls.add("/admin/user/login.xhtml");
        requestUrls.add("logout.xhtml");
        
        List<String> userUrls = new ArrayList<String>();
        userUrls.add("/admin/user/*");
        userUrls.add("/admin/user/add.*");
        
//        Pattern parentPattern = Pattern.compile(".*/\\*$");
//        Pattern listPattern = Pattern.compile("/list.\\*$");
//        Pattern addPattern = Pattern.compile("/add.\\*$");
//        Pattern updatePattern = Pattern.compile("/update.\\*$");
//        Pattern deletePattern = Pattern.compile("/delete.\\*$");
        
        
        Pattern p = Pattern.compile("/admin/user/add.*");
        Matcher m = p.matcher("/admin/user/add.xhtml");
        boolean result = m.find();
        
       System.out.println(result);
    }
}


//for (int i=0; i<globalPerShortList.size(); i++) {
//  PermissionShort per = globalPerShortList.get(i);
//  if(URLPatternUtils.pattern(per.getUrl(), req.getRequestURL().toString())){
//      if(userAclList.contains(per.getSourceId())){
//          chain.doFilter(request, response);
//          return ;
//      }
//  }else if(i == globalPerShortList.size()-1){
//      resp.sendRedirect(req.getContextPath() + REDIRECT_URL);
//      return ;
//  }
//}




