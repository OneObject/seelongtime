package com.longtime.ajy.api.protocol;

import java.io.Serializable;


public class MessagePacket implements Serializable{
    
    private static final long serialVersionUID = -3375850163636689873L;

    private MessageHeader header ;
    
    private Object   body;
    
    public MessagePacket(){}
    
    public MessagePacket(MessageHeader header ,Object body){
        this.header = header;
        this.body = body;
    }
    
    public static MessagePacket  newSuccess(Object body){
        MessagePacket packet = new MessagePacket(MessageHeader.success(),body); 
        return packet;
    }
    
    public static MessagePacket  newFail(String message){
        MessagePacket packet = new MessagePacket(MessageHeader.fail(message),null); 
        return packet;
    }
    
    public static MessagePacket  newFail(){
        MessagePacket packet = new MessagePacket(MessageHeader.fail(),null); 
        return packet;
    }
    
    public MessageHeader getHeader() {
        return header;
    }

    public void setHeader(MessageHeader header) {
        this.header = header;
    }
    public Object getBody() {
        return body;
    }
    
    public void setBody(Object body) {
        this.body = body;
    }
    

}
