package com.longtime.ajy.mweb.service;


public interface CheckBindStatusService {
  void addCache(String uid,String sid);
  
  boolean checkSid(String sid);
  
  void remove(String uid,String sid);

  void addCache(String uid, String sid, int expire_seconds);
  
}
