package com.longtime.app.ixin.utils;

import com.longtime.app.base.model.TenantConfig;
import com.longtime.app.base.service.TenantConfigService;
import com.longtime.app.ixin.protocol.ReplyMessage;
import com.longtime.app.ixin.protocol.ReplyMessageText;
import com.longtime.common.spring.SpringContextUtil;

public class DefaultMessageUtil {

	public static ReplyMessage getDefaultMessage(String domain) {
		TenantConfigService tenantConfigService = (TenantConfigService) SpringContextUtil
				.getBean("tenantConfigService");
		TenantConfig tenantConfig = tenantConfigService.getByDomain(domain);

		ReplyMessageText replyMessage = new ReplyMessageText();
		replyMessage.setMsgType(ReplyMessage.REPLY_MESSAGE_TEXT);
		if (tenantConfig == null || !tenantConfig.isIsreply()) {// tenantConfig不存在，或者没有设置回复
			replyMessage.setContent("");
		} else {
			replyMessage.setContent(tenantConfig.getReplycontent());
		}
		return replyMessage;
	}

}
