package com.longtime.app.ixin.mgr.channel.monitor;

import java.util.Enumeration;
import java.util.Vector;

import org.springframework.stereotype.Service;


/**
 * 事件源对象
 * @author fangxinyuan
 *
 */
@Service
public class ListenerSource {
	
	private Vector<Object> vector=new Vector<Object>();
    
	ListenerSource(){
		
	}
	/**
	 * 注册监听者
	 * @param monitorService
	 */
	public void addListener(Listener listener){
		vector.addElement(listener);
	}
	
	public void removeListener(Listener listener){
	   vector.removeElement(listener);
	}
	
	 public void notifyEvent(ListenEventVo listenEventVo,int restype) {//通知所有的监听器     
        Enumeration<Object> enumeration = vector.elements();  
         while(enumeration.hasMoreElements()) {
             Listener listener=(Listener) enumeration.nextElement();
        	 listener.handleEvent(new ListenerEvent(this),listenEventVo,restype);
         }     
  }  
	
	
	
}
