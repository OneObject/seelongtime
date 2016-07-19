/* Copyright © 2010 www.myctu.cn. All rights reserved. */
package com.longtime.app.util;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;

/**
 * 云视频用到，确定跳转的页面
 * @author Administrator
 *
 */
public class PageSelector {

	public String getResultView(HttpServletRequest request) {

		if (isMobileDevice(request)) {
			return Constant.IVIDEO_PLAYER_HTML5;
		}
		return Constant.IVIDEO_PLAYER_FLASH;
	}

	private static boolean isOpenPCDebug = true; //是否开启pc端调试

	public static boolean isMobileDevice(HttpServletRequest request) {
		if (isOpenPCDebug) { // 开启调试的话，在querystring中添加mobile=1 即可进入到移动登录页，方便pc端调试
			if (StringUtils.isNotBlank(request.getParameter("mobile"))) {
				return true;
			}
		}
		if (request == null) {
			return false;
		}
		String userAgent = request.getHeader("User-Agent");
		String httpAccept = request.getHeader("Accept");
		if (StringUtils.isBlank(userAgent) && StringUtils.isBlank(httpAccept)) {
			return false;
		}
		UAgentInfo detector = new UAgentInfo(userAgent, httpAccept);
		return detector.isMobilePhone || detector.isTierTablet || detector.isTierIphone;
	}
}
