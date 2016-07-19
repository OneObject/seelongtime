package com.longtime.app.base.cookie;

import com.google.common.base.Splitter;
import com.google.common.collect.Lists;
import java.io.IOException;
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

public abstract class BaseFilter implements Filter {

    @SuppressWarnings("unused")
    private static Logger  logger   = LoggerFactory.getLogger(BaseFilter.class);

    protected List<String> excludes = Lists.newArrayList();

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

        String temp = filterConfig.getInitParameter("excludes");
        if (temp != null) {
            Iterable<String> urls = Splitter.on(",").trimResults().split(temp);
            for (String url : urls) {
                excludes.add(url);
            }
        }
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException,
                                                                                             ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;

        if (handleExcludeURL(req, resp)) {
            chain.doFilter(request, response);
            return;
        }

        doFilterHandle(req, resp, chain);

    }

    public abstract void doFilterHandle(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
                                                                                                            throws IOException,
                                                                                                            ServletException;

    @Override
    public void destroy() {

    }

    public boolean handleExcludeURL(HttpServletRequest request, HttpServletResponse response) {

        if (excludes == null || excludes.isEmpty()) {
            return false;
        }

        String url = request.getServletPath();
        for (String pattern : excludes) {
            Pattern p = Pattern.compile("^" + pattern);
            Matcher m = p.matcher(url);
            if (m.find()) {
                return true;
            }
        }

        return false;
    }

}
