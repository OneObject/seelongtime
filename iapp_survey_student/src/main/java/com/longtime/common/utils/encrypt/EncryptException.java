package com.longtime.common.utils.encrypt;

public class EncryptException extends Exception {

    /**
     * serialVersionUID
     */
    private static final long serialVersionUID = -6882730788130956899L;

    /**
     *
     */
    public EncryptException(){
        // TODO Auto-generated constructor stub
    }

    /**
     * @param message
     */
    public EncryptException(String message){
        super(message);
        // TODO Auto-generated constructor stub
    }

    /**
     * @param cause
     */
    public EncryptException(Throwable cause){
        super(cause);
        // TODO Auto-generated constructor stub
    }

    /**
     * @param message
     * @param cause
     */
    public EncryptException(String message, Throwable cause){
        super(message, cause);
        // TODO Auto-generated constructor stub
    }

}
