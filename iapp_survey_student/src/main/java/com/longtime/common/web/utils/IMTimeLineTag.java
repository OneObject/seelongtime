package com.longtime.common.web.utils;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyTagSupport;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.longtime.common.utils.DateUtils;

public class IMTimeLineTag extends BodyTagSupport  {

    /**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 5330349900284851002L;

	private final static Log log = LogFactory.getLog(IMTimeLineTag.class);

    private long timestamp = 0;
    

    public int doStartTag() throws JspException {

        //HttpServletRequest request = (HttpServletRequest) pageContext.getRequest();
        
        if(timestamp<1){
        	return SKIP_BODY;
        }
        
        // 获取timestamp的日期字符串
        String timestamp_day = DateUtils.longToString(timestamp, "yyyy-MM-dd");
        
        // 判断是否显示了timestamp时间
        if(null!=pageContext.getAttribute(String.format("tag_imtimeline_%s",timestamp_day))){
        	return SKIP_BODY;
        }
        
        long now = System.currentTimeMillis();
        // 当前日期
        String now_day= DateUtils.longToString(now, "yyyy-MM-dd");
        
        if(!now_day.equals(timestamp_day)){
        	pageContext.setAttribute(String.format("tag_imtimeline_%s",timestamp_day),true);
        	return EVAL_BODY_INCLUDE;
        }
        
        
        return SKIP_BODY;
    }

    public int doAfterBody() throws JspException {
        return SKIP_BODY;
    }

    public int doEndTag() throws JspException {
        return EVAL_PAGE;
    }



    public Log getLog() {
        return log;
    }

	public long getTimestamp() {
		return timestamp;
	}

	public void setTimestamp(long timestamp) {
		this.timestamp = timestamp;
	}

	
}