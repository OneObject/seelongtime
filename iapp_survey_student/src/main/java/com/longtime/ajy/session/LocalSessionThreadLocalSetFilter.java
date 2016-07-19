package com.longtime.ajy.session;

import com.longtime.ajy.support.HttpServletHelper;
import com.longtime.ajy.support.SubDomainHelper;
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

public class LocalSessionThreadLocalSetFilter extends BaseFilter {

    private static Logger logger = LoggerFactory.getLogger(LocalSessionThreadLocalSetFilter.class);

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        super.init(filterConfig);
    }

    @Override
    public void doFilterHandle(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
            throws IOException,
            ServletException {

        //logger.debug("in  LocalSessionThreadLocalSetFilter");
        if (logger.isDebugEnabled()) {
            logger.debug("request url=[{}]",HttpServletHelper.getCurrentUrl(request));

//            Cookie[] cookies = request.getCookies();
//            if (null != cookies) {
//                for (Cookie cookie : cookies) {
//                    logger.debug("cookie:{}={}", cookie.getName(), cookie.getValue());
//                }
//            }
        }
        try{
            ReceiptHelper  receiptHelper  = new ReceiptHelper(request,response);
            LocalSession ls = receiptHelper.retrieve();

            String subDomain = SubDomainHelper.getSubDomain();
            if(StringUtils.isNotBlank(subDomain)){

                if(!subDomain.equals(ls.getDomain())){
                    SessionHelper.flushDomain(request, response, subDomain);
                }
            }

            //logger.debug("load localsession to ThreadLocal. data=[{}]", ls);
            chain.doFilter(request, response);

            //logger.debug("out  LocalSessionThreadLocalSetFilter");
        }catch(Exception e){
        		logger.error("",e);
        		throw e;
        }finally{
            ReceiptHelper.clearThread();
        }
    }

    @Override
    public void destroy() {
        super.destroy();
        ReceiptHelper.clearThread();
    }



}
