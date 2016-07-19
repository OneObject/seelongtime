package com.longtime.ajy.support;


import com.longtime.common.utils.DateUtils;

import com.longtime.common.utils.encrypt.BlowfishEncryptor;
import com.longtime.common.utils.encrypt.EncryptException;
import org.slf4j.Logger;



public class PasswordEncoder {
    
    private static Logger logger = org.slf4j.LoggerFactory.getLogger(PasswordEncoder.class);
    private static BlowfishEncryptor blowfishEncryptor = new BlowfishEncryptor();
    public static String encode(String originalPwd,String domainid){
        try {
           return blowfishEncryptor.encryptHex(domainid, originalPwd);
        } catch (EncryptException e) {
            logger.error(String.format("password encode due to fail.originalPwd=[%s] domainid=[%s]", originalPwd,domainid), e);
        }
        
        return originalPwd;
    }
    
    
    public static String decode(String encodePwd,String domainid){
        try {
            return blowfishEncryptor.decryptHex(domainid, encodePwd);
         } catch (EncryptException e) {
             logger.error(String.format("password decode due to fail.encodePwd=[%s] domainid=[%s]", encodePwd,domainid), e);
         }
         return encodePwd;
    }
    
    
    public static void main(String[] args) {
        
        String originalPwd = "longtime123";
        
        String uid = "123";
            
        String domainid = "ajy";
        
        String encode = PasswordEncoder.encode(originalPwd, domainid);
        
        
        System.out.println(encode);
        
        String decode = PasswordEncoder.decode("1e3716b6a0ce04ca", "test");
        
        System.out.println(decode);
        
        System.out.println(DateUtils.longToString(1356969600000L)); //12
        
        
        System.out.println(DateUtils.parseStringToLong("2014-01-01"));
        
    }

}
