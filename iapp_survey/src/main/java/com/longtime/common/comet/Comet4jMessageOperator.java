package com.longtime.common.comet;

import org.apache.commons.lang3.Validate;

import org.apache.commons.lang3.StringUtils;
import java.util.List;
import org.comet4j.core.CometContext;
import org.comet4j.core.CometEngine;

public class Comet4jMessageOperator implements IMessageListener {

	public void registChannel(String channel) {
		Validate.isTrue(StringUtils.isNotBlank(channel), "channel is empty.");
		CometContext cc = CometContext.getInstance();
		synchronized (cc) {
			List<String> channels = cc.getAppModules();
			for (String tmp : channels) {
				if (tmp.equals(channel)) {
					return;
				}
			}
			cc.registChannel(channel);
		}

	}

	public void process(Message msg) {

		CometEngine engine = CometContext.getInstance().getEngine();
		engine.sendToAll(msg.getChannel(), msg.getData());

	}

	public static void main(String[] args) {
		Comet4jMessageOperator operator = new Comet4jMessageOperator();

		operator.registChannel("test");
		operator.registChannel("22");
	}

}
