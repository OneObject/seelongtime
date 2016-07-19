package com.longtime.common.web.utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyTagSupport;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;


public class CheckAclTag extends BodyTagSupport  {
    /**
     * serialVersionUID
     */
    private static final long serialVersionUID = -1040021108939152108L;

    private final static Log log = LogFactory.getLog(CheckAclTag.class);

    /** 如果权限失败是不显示，还是跳转到提示页面 默认为false */
    private boolean forward = false;
    //超级管理员可见
    private boolean adminctl = false;

    private String resourceId = null;

    public int doStartTag() throws JspException {
        // log.debug("in CheckACLTag. id=" + resourceId);
    	
        HttpServletRequest request = (HttpServletRequest) pageContext.getRequest();
        
        boolean access = AclHelper.isAccess(request,resourceId,adminctl);
        if (!access) {
            if (forward) { //需要跳转
                throw new JspException("Access denied");
            }
            return SKIP_BODY;
        }
        return EVAL_BODY_INCLUDE;
    }

    public int doAfterBody() throws JspException {
        return SKIP_BODY;
    }

    public int doEndTag() throws JspException {
        return EVAL_PAGE;
    }

    /**
     * @jsp.attribute required="false" rtexprvalue="true"
     * @return Returns the forward.
     */
    public boolean isForward() {
        return forward;
    }

    /**
     * @param forward The forward to set.
     */
    public void setForward(boolean forward) {
        this.forward = forward;
    }

    public Log getLog() {
        return log;
    }

    public String getResourceId() {
        return resourceId;
    }

    public void setResourceId(String resourceId) {
        this.resourceId = resourceId;
    }

	public boolean isAdminctl() {
		return adminctl;
	}

	public void setAdminctl(boolean adminctl) {
		this.adminctl = adminctl;
	}

    

}
