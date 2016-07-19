package com.longtime.app.base.service.impl;

import javax.annotation.Resource;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import com.longtime.app.base.service.CheckBindStatusService;
import com.telecom.ctu.platform.common.cache.CacheService;

@Service
public class CheckBindStatusServiceImpl implements CheckBindStatusService {

	private final static String prefix_sid_key = "sid_%s";

	private final static String prefix_uid_sid_key = "usid_%s";

	@Resource(name = "lt.cacheService")
	CacheService cacheService;

	@Override
	public void remove(String uid) {

		String key = getUidSidKey(uid);
		String sidStr = cacheService.get(key);
		// 根据uid得到sid
		if (StringUtils.isNotBlank(sidStr)) {
			String[] sids = sidStr.split(",");
			if (sids != null && sids.length > 0) {
				for (String sid : sids) {
					if (StringUtils.isBlank(sid)) {
						continue;
					}
					this.cacheService.remove(getSidKey(sid));
				}
			}
			this.cacheService.remove(key);
		}
	}

	private String getUidSidKey(String uid) {
		return String.format(prefix_uid_sid_key, uid);
	}

	private String getSidKey(String sid) {
		return String.format(prefix_sid_key, sid);
	}
}
