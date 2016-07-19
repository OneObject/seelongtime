package com.longtime.app.oplog.support;

import java.util.concurrent.atomic.AtomicBoolean;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.longtime.app.oplog.listener.OpLogOperationEvent;
import com.longtime.app.oplog.model.OpLog;
import com.longtime.common.spring.SpringContextUtil;
import com.myctu.platform.gateway.agent.queue.Productor;
import com.myctu.platform.gateway.agent.queue.QueueException;

public class OpLogServiceWrapper {
	
	private static final Logger logger = LoggerFactory.getLogger(OpLogServiceWrapper.class);
	
	private static AtomicBoolean init = new AtomicBoolean(false);
	
	private static Productor opLogProductor;
	
	public static void init(){
		if(init.get()){
			return;
		}
		synchronized (init) {
			if(init.get()){
				return;
			}
			if(null == opLogProductor){
				opLogProductor = (Productor) SpringContextUtil.getBean("lt.queue.oplog.productor");
			}
			init.set(true);
		}
	}
	
	/**
	 * 添加用户、组织操作记录
	 * @param sid 用户、组织ID
	 * @param type 0用户 1组织
	 * @param action 操作0增1删2改3禁用4邀请关注
	 * @param domain 域
	 */
	public static void add(String sid, int type, int action,String domain) {
		if(!init.get()){
			init();
		}
		OpLogOperationEvent event = new OpLogOperationEvent(sid, type, action,domain);
		try {
			opLogProductor.product(event);
		} catch (QueueException e) {
			logger.error("add message push task:[{}] due to error", e);
		}
	}

	/**
	 * 添加用户操作记录
	 * @param sid 用户ID
	 * @param action 操作0增1删2改3禁用
	 * @param domain 域
	 */
	public static void addUser(String sid, int action,String domain) {
		add(sid, OpLog.TYPE_USER, action,domain);
	}

	/**
	 * 添加组织操作记录
	 * @param sid 组织ID
	 * @param action 操作0增1删2改3禁用
	 * @param domain 域
	 */
	public static void addOrg(String sid, int action,String domain) {
		add(sid, OpLog.TYPE_ORG, action,domain);
	}
}
