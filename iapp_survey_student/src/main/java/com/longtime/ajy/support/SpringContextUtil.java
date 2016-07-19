package com.longtime.ajy.support;

import java.util.Locale;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

/**
 * @since 2012-12-5
 * @author songsp
 * 
 */
public class SpringContextUtil implements ApplicationContextAware  {
    private static ApplicationContext context;
    
    @SuppressWarnings("static-access")
    @Override
    public void setApplicationContext(ApplicationContext contex)
            throws BeansException {
        this.context=contex;
    }
    public static Object getBean(String beanName){
        return context.getBean(beanName);
    }
    
    public static <T> T getBean(String name, Class<T> requiredType) {
    	return context.getBean(name, requiredType);
    }
    
    public static <T> T getBean(Class<T> requiredType){
        return  context.getBean(requiredType);
    }
     
    public static String getMessage(String key){
        return context.getMessage(key, null, Locale.getDefault());
    }
 
    public static ApplicationContext  getApplicationContext(){
    	return context;
    }
}
