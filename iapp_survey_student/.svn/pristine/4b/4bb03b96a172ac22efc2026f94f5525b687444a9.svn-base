package com.longtime.ajy.student.web;

import com.longtime.ajy.session.SessionHelper;

import java.io.File;
import com.longtime.ajy.support.SubDomainHelper;
import org.apache.commons.lang3.StringUtils;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController extends BaseController{

    
    private static final String default_index_view             = "/index";
    
    private static final String             RELATIVE_PATH = "WEB-INF/views/index/";
   
    @RequestMapping({"/","index"})
    public String test(HttpServletRequest request, HttpServletResponse response,ModelMap modelMap) {
    	
        //return "/index";
        //return getIndexView(request);
    		return "redirect:/survey/index.xhtml";
    }

    
    private String getIndexView(HttpServletRequest request) {
        String domain = SubDomainHelper.getSubDomain();
        
        if(StringUtils.isBlank(domain)){
            domain = SessionHelper.getCurrentDomain();
        }
        String indexView = default_index_view;
        if(StringUtils.isNotBlank(domain)){
            domain= domain.toLowerCase();
            boolean isExist = hasDomainLogin(domain,request);
            if(isExist){
                indexView = String.format("/index/%s/index", domain);
            }else {
                indexView = default_index_view;
            }
        }
        return indexView;
    }
    
    private boolean hasDomainLogin(String domain, HttpServletRequest request) {
        String path = String.format("%s/%s%s/%s", request.getSession().getServletContext().getRealPath("/"),RELATIVE_PATH,domain,"index.jsp");
        File file = new File(path);
        return file.exists();
    }
}
