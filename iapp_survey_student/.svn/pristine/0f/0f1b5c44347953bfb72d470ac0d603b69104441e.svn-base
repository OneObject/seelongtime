package com.longtime.ajy.support.service;

import com.telecom.ctu.platform.common.monitor.OperationStatisticsMBean;
import com.telecom.ctu.platform.common.monitor.OperationStatisticsMBeanFactory;
import org.apache.commons.lang3.StringUtils;
import org.aspectj.lang.ProceedingJoinPoint;

/**
 * MethodOperationStatisticAspect
 * O
 *
 * @author songsp
 * @since 2015/11/17 22:32
 */
public class MethodOperationStatisticAspect {

    private OperationStatisticsMBean operation_monitor;

    public MethodOperationStatisticAspect(String name){
        operation_monitor = OperationStatisticsMBeanFactory.get(name);
    }


    //private static OperationStatisticsMBean operation_monitor = OperationStatisticsMBeanFactory.get("student.mongo.operation");

    public Object around(ProceedingJoinPoint point) throws Throwable {

        String tag = String.format("%s.%s", point.getSignature().getDeclaringTypeName(), point.getSignature().getName());
        operation_monitor.onStart(tag, StringUtils.EMPTY);
        try {
            Object object = point.proceed();
            operation_monitor.onComplete(tag, StringUtils.EMPTY);
            return object;
        } catch (Throwable e) {
            operation_monitor.onError(tag, StringUtils.EMPTY, new Exception(e));
            throw e;
        }
    }

}
