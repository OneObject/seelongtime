package com.longtime.ajy.api.vo;

import com.longtime.ajy.model.Feed;

public class FeedVo extends Feed{
	
	private static final long serialVersionUID = 1L;

	private String corver;// 用户头像地址

	private String formatTime;// 格式化之后的创建时间

	public String getCorver()
	{
		return corver;
	}

	public void setCorver(String corver)
	{
		this.corver = corver;
	}

	public String getFormatTime()
	{
		return formatTime;
	}

	public void setFormatTime(String formatTime)
	{
		this.formatTime = formatTime;
	}

}
