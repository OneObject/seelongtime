/* Copyright © 2010 www.myctu.cn. All rights reserved. */
/**
 * project : resource-proxy
 * user created : pippo
 * date created : 2013-1-3 - 下午12:11:47
 */
package com.longtime.ajy.support;

/**
 * @since 2013-1-3
 * @author pippo
 */
public class NotFoundException extends Exception {

    private static final long serialVersionUID = 7610563951470366832L;

    public NotFoundException(){
        super();
    }

    public NotFoundException(String message){
        super(message);
    }

    public NotFoundException(String message, Throwable cause){
        super(message, cause);
    }

    public NotFoundException(Throwable cause){
        super(cause);
    }

}
