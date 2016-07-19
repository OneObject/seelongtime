package com.longtime.app.ixin.mgr.channel.monitor;

import java.util.EventObject;
/**
 * 事件类
 * @author fangxinyuan
 *
 */
public class ListenerEvent extends EventObject {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7412146284905810208L;
	
	public ListenerEvent(Object source) {
		super(source);
	}
	
}
