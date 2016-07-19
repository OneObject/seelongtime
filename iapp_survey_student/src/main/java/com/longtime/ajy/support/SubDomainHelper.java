package com.longtime.ajy.support;

import java.io.IOException;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.common.base.Splitter;
import com.google.common.collect.Lists;
import com.longtime.common.web.filter.BaseFilter;

public class SubDomainHelper extends BaseFilter {

    private static Logger                    logger       = LoggerFactory.getLogger(SubDomainHelper.class);
    private static final ThreadLocal<String> tl_subdomain = new InheritableThreadLocal<String>();

    public static String getSubDomain() {
        String subDomain = tl_subdomain.get();
        return StringUtils.isBlank(subDomain) ? StringUtils.EMPTY : subDomain;
    }

    
    protected List<String> subdomain_excludes = Lists.newArrayList();
    
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

       super.init(filterConfig);
       String temp = filterConfig.getInitParameter("subdomain_excludes");
       if (temp != null) {
           Iterable<String> urls = Splitter.on(",").trimResults().split(temp);
           for (String url : urls) {
               subdomain_excludes.add(url);
           }
       }
       
       
    }
    @Override
    public void doFilterHandle(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
                                                                                                           throws IOException,
                                                                                                           ServletException {

        try {
            String serverName = request.getServerName();
            Pattern pattern = Pattern.compile(_pattern);
            Matcher matcher = pattern.matcher(serverName);
            String subDomain = null;
            if (matcher.find()) {
                subDomain = matcher.group(1);
            }
            
            if (StringUtils.isNotBlank(subDomain)  && !subdomain_excludes.contains(subDomain)) {
                logger.debug("servername=[{}] subdomain=[{}]", serverName, subDomain);
                tl_subdomain.set(domainTrans(subDomain));
            }
            chain.doFilter(request, response);

        } finally {
            tl_subdomain.remove();
        }
    }

    
    private String domainTrans(String domain){
        if("MERCER".equalsIgnoreCase(domain)){
            domain= "MERCER";
        }
        return domain;
    }
    private static String _pattern = "(\\w+)\\.(\\w+\\.\\D+)";

    public static void main(String[] args) {

        String serverName = "www.localhost.com";
//        serverName = "192.168.123.1";

        logger.debug("servername=[{}]", serverName);

        Pattern pattern = Pattern.compile(_pattern);

        Matcher matcher = pattern.matcher(serverName);

        String subDomain = null;
        if (matcher.find()) {
            subDomain = matcher.group(1);
        }

        System.out.println(subDomain);
    }

}
