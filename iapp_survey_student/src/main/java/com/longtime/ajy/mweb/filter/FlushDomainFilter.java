package com.longtime.ajy.mweb.filter;


import com.longtime.ajy.mweb.MwebHelper;
import com.longtime.ajy.support.HttpServletHelper;
import com.longtime.common.utils.HtmlUtils;
import com.longtime.common.web.filter.BaseFilter;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class FlushDomainFilter extends BaseFilter {

    private static Logger       logger                  = LoggerFactory.getLogger(FlushDomainFilter.class);

    private static final String FLUSH_DOMAIN_KEY        = "fdomain";

    public static final String  M_FDOMAIN_REDIRECT_PAGE = "/WEB-INF/views/m/redirect.jsp";

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        super.init(filterConfig);
    }

    @Override
    public void doFilterHandle(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
                                                                                                           throws IOException,
                                                                                                           ServletException {

        String fdomain = request.getParameter(FLUSH_DOMAIN_KEY);

        if (StringUtils.isBlank(fdomain)) {

            chain.doFilter(request, response);
            return;
        }
        
        fdomain = MwebHelper.escapeDomain(fdomain);

        String currentDomain = MwebHelper.getCurrentDomain();


        if(isForbidden(fdomain)){

            response.sendRedirect(String.format("%s%s", request.getContextPath(), "/m/error/forbidden.xhtml"));

            return ;
        }

        if (fdomain.equals(currentDomain)) {
            chain.doFilter(request, response);
            return;
        }

        logger.debug("currentdomain=[{}]  fdomain=[{}]. do flush session", currentDomain, fdomain);
        // 刷新
        MwebHelper.flushCurrentDomain(request, response, fdomain);
        
        if(StringUtils.isBlank(currentDomain)){
            chain.doFilter(request, response);
            return;
        }
        toRedirect(request, response, fdomain);
    }

    private void toRedirect(HttpServletRequest request, HttpServletResponse response, String domain)
                                                                                                    throws ServletException,
                                                                                                    IOException {
        String callback = HttpServletHelper.getCurrentUrl(request);

        // 去除 fdomain参数
        /*
        String url = request.getRequestURL().toString();
        String queryString = request.getQueryString();
        queryString = HttpServletHelper.removeParamQueryString(queryString, "fdomain");
        queryString = StringUtils.trimToNull(queryString);
        String callback = Joiner.on("?").skipNulls().join(url, queryString); // eg. http://xxx:xx/iapp/study/me.do?a=b
		*/
         
        request.setAttribute("callback", callback);
        request.setAttribute("domain", domain);
        request.getRequestDispatcher(M_FDOMAIN_REDIRECT_PAGE).forward(request, response);
    }

    @Override
    public void destroy() {

    }


    private  boolean isForbidden(String currentDomain){

        return "fujixerox".equals(currentDomain);
    }
    
    public static void main(String[] args) {
		System.out.println(HtmlUtils.html2Text("afAf<Script>alert(1);</script>"));
		System.out.println(HtmlUtils.html2Text("AJY"));
		
		System.out.println(MwebHelper.escapeDomain("ajy"));
		System.out.println(MwebHelper.escapeDomain("afAf<Script>alert(1);</script>"));
		System.out.println(MwebHelper.escapeDomain(".../afaf/../fafaf"));
		System.out.println(MwebHelper.escapeDomain("AJY121242_1212-12"));
		System.out.println(MwebHelper.escapeDomain("enn-AJY_1"));
		System.out.println(MwebHelper.escapeDomain("123"));
    }
    
    
    
}
