package com.longtime.app.mobile.service;

import java.util.List;

import com.longtime.app.mobile.model.Mobile;
import com.longtime.common.mongo.CommonService;

public interface MobileService extends CommonService<Mobile, String>{

	Mobile findCurrentVersion(String device, String version, String domainid);

	List<Mobile> list(String account, String device);

	Mobile findCurrentVersion(String device, String version);

	List<Mobile> list(String device);

}
