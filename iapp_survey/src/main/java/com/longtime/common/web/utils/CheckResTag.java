package com.longtime.common.web.utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyTagSupport;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;



public class CheckResTag extends BodyTagSupport  {
    /**
     * serialVersionUID
     */
    private static final long serialVersionUID = -1040021108939152108L;

    private final static Log log = LogFactory.getLog(CheckResTag.class);

    private boolean ctl = false;
    
    //未实现
    private boolean onoff = false;
    
    private String resourceId;

    public int doStartTag() throws JspException {

        HttpServletRequest request = (HttpServletRequest) pageContext.getRequest();
        if (ctl) {
            boolean access = AclHelper.checkMenuAclByResourceId(resourceId, request);
            if(!access){
            	return SKIP_BODY;
            }
        }
        return EVAL_BODY_INCLUDE;
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

	public boolean isCtl() {
		return ctl;
	}

	public void setCtl(boolean ctl) {
		this.ctl = ctl;
	}

	public boolean isOnoff() {
		return onoff;
	}

	public void setOnoff(boolean onoff) {
		this.onoff = onoff;
	}

	public String getResourceId() {
		return resourceId;
	}

	public void setResourceId(String resourceId) {
		this.resourceId = resourceId;
	}


}
