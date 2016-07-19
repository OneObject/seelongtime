/* Copyright © 2010 www.myctu.cn. All rights reserved. */
/**
 * project : service-gateway-agent
 * user created : pippo
 * date created : 2012-1-28 - 上午11:16:30
 */
package com.myctu.platform.gateway.agent;

import com.myctu.platform.protocol.exception.ProcessRuntimeException;

/**
 * @since 2012-1-28
 * @author pippo
 */
public class GatewayAgentRuntimeException extends ProcessRuntimeException implements GatewayAgentErrorCode {

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = -6364704969734273997L;

	public GatewayAgentRuntimeException(int code, String message, Throwable cause) {
		super(code, message, cause);
	}

	public GatewayAgentRuntimeException(int code, String message) {
		super(code, message);
	}

	public GatewayAgentRuntimeException(int code, Throwable cause) {
		super(code, cause);
	}

	public GatewayAgentRuntimeException(String message, Throwable cause) {
		super(message, cause);
	}

	public GatewayAgentRuntimeException(String message) {
		super(message);
	}

	public GatewayAgentRuntimeException(Throwable cause) {
		super(cause);
	}

}
