package com.longtime.ajy.student.filter.handler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.longtime.ajy.mweb.MwebHelper;


public class ExpirationCheckHandler implements FilterOperationHandler {
    private static Logger logger = LoggerFactory.getLogger(ExpirationCheckHandler.class);

    @Override
    public boolean handle(HttpServletRequest request, HttpServletResponse response) throws ServletException {

        boolean isExpired = MwebHelper.isExpired(request);

        if (!isExpired) {
            if (logger.isTraceEnabled()) {
                logger.trace("LOGIN FILTER_RECEIPT attribute was present and acceptable - passing  request through filter..");
            }
            return true;
        }
        return false;
    }
    

}
