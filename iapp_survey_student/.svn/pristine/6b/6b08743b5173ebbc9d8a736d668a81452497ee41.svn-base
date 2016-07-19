package com.longtime.ajy.api.protocol;

import java.io.Serializable;


public class MessageHeader implements Serializable{

    private static final long serialVersionUID = -2641757986016934294L;
    private int code = CODE.success.code;
    private String msg;
    public MessageHeader(){
        
    }
    public MessageHeader(int code, String msg){
        this.code = code;
        this.msg = msg;
    }
    public static MessageHeader  success(){
        return new MessageHeader(CODE.success.code, null);
    }
    public static MessageHeader  fail(){
        return new MessageHeader(CODE.fail.code, null);
    }
    public static MessageHeader  fail(String msg){
        return new MessageHeader(CODE.fail.code, msg);
    }
    
    public int getCode() {
        return code;
    }
    
    public void setCode(int code) {
        this.code = code;
    }
    
    public String getMsg() {
        return msg;
    }
    
    public void setMsg(String msg) {
        this.msg = msg;
    }

    @Override
    public String toString() {
        return String.format("MessageHeader [code=%s, msg=%s]", code, msg);
    }
    
    
    public static enum CODE{
        success(100),
        fail(99);
        public int code;
        CODE(int code){
            this.code = code;
        }
        
        
    }
    
}
