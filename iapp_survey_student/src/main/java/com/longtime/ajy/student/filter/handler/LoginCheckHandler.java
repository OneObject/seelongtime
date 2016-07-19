package com.longtime.ajy.student.filter.handler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.longtime.ajy.session.ReceiptHelper;


public class LoginCheckHandler implements FilterOperationHandler {
    private static Logger logger = LoggerFactory.getLogger(LoginCheckHandler.class);

    @Override
    public boolean handle(HttpServletRequest request, HttpServletResponse response) throws ServletException {

        ReceiptHelper receiptHelper = new ReceiptHelper(request, response);

        if (receiptHelper.isReceiptLoginAcceptable()) {
            if (logger.isTraceEnabled()) {
                logger.trace("LOGIN FILTER_RECEIPT attribute was present and acceptable - passing  request through filter..");
            }
            return true;
        }
        return false;
    }
    

}
