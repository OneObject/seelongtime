package com.longtime.ajy.support;

public class AppException extends Exception{

	/**
	 * 
	 */
	private static final long serialVersionUID = 7799321508477318503L;
	
	public AppException(){
        super();
    }
	// msgcode 对应 message-info.properties 中的key
    public AppException(String msgcode){
        super(msgcode);
    }

    public AppException(String msgcode, Throwable cause){
        super(msgcode, cause);
    }

    public AppException(Throwable cause){
        super(cause);
    }

}
