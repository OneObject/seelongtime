package com.longtime.common.web.utils;

import com.longtime.common.utils.DateUtils;
import java.io.IOException;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class LongTimeTagUtils extends SimpleTagSupport{
	private long currentTime = System.currentTimeMillis();
	private String format;
	
	public long getCurrentTime() {
		return currentTime;
	}

	public void setCurrentTime(long currentTime) {
		this.currentTime = currentTime;
	}

	public String getFormat() {
		return format;
	}

	public void setFormat(String format) {
		this.format = format;
	}

	@Override
	public void doTag() throws JspException, IOException {
		if(currentTime<=0){
			return;
		}
		JspWriter out = getJspContext().getOut();
		out.write(DateUtils.longToString(currentTime, format));
	}
	
	
}
