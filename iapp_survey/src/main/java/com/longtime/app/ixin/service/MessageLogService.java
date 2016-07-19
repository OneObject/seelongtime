package com.longtime.app.ixin.service;

import com.longtime.app.ixin.protocol.MessageLog;

public interface MessageLogService {

	void add(MessageLog ml);

	MessageLog findById(String id, String domain);

	long getKeywordTimes(String keyword, String domain);

	long getKeywordUsers(String keyword, String domain);
	

}
