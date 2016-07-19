package com.longtime.app.oplog.listener;

import com.longtime.app.ixin.mgr.model.TokenInfo;
import com.longtime.app.ixin.mgr.service.ITokenService;
import com.longtime.app.oplog.model.OpLog;
import com.myctu.platform.gateway.agent.queue.Consumer;
import com.myctu.platform.gateway.agent.queue.QueueException;

public class OpLogRedisQueueconsumer  implements Consumer<OpLogOperationEvent> {
	
	private OpLogHandle opLogHandle;
	
	private ITokenService tokenService;
	
	public Class<OpLogOperationEvent> getEventType() {
		return OpLogOperationEvent.class;
	}

	@Override
	public void onEvent(OpLogOperationEvent event) throws QueueException {
		//处理消息
		if(null==event){
			return ;
		}
		TokenInfo tokenInfo = this.tokenService.getTokenInfoByDomain(event.getDomain());
		if(!isQYWeixin(tokenInfo)){
			return;
		}
		OpLog opLog = new OpLog();
		opLog.setSid(event.getSid());
		opLog.setType(event.getType());
		opLog.setAction(event.getAction());
		opLog.setDomain(event.getDomain());
		opLog.setCreatetime(System.currentTimeMillis());
		
		opLogHandle.process(opLog);
		
	}

	private boolean isQYWeixin(TokenInfo tokenInfo) {
		if(tokenInfo != null && "3".equals(tokenInfo.getType())){
			return true;
		}
		return false;
	}

	

	public void setOpLogHandle(OpLogHandle opLogHandle) {
		this.opLogHandle = opLogHandle;
	}

	public void setTokenService(ITokenService tokenService) {
		this.tokenService = tokenService;
	}
	
}
