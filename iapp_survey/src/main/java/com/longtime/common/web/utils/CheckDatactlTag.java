package com.longtime.common.web.utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyTagSupport;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.longtime.app.base.model.User;
import com.longtime.common.utils.LoginSessionHelper;

public class CheckDatactlTag extends BodyTagSupport {
    private static final long serialVersionUID = -1040021108939152108L;

    private final static Log log = LogFactory.getLog(CheckResTag.class);
    
    private String creatoruid;
    
    private String model ;
    private String rid;

	public int doStartTag() throws JspException{
		HttpServletRequest request = (HttpServletRequest) pageContext.getRequest();
		String uid = LoginSessionHelper.getCurrentUserId(request);
		if(creatoruid.equals(uid)){
			return EVAL_BODY_INCLUDE;
		}
		
    	User user = LoginSessionHelper.getCurrentUser(request);
    	if(user !=null && user.isSuperMgr()){
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
	public String getCreatoruid() {
		return creatoruid;
	}
	public void setCreatoruid(String creatoruid) {
		this.creatoruid = creatoruid;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public String getRid() {
		return rid;
	}
	public void setRid(String rid) {
		this.rid = rid;
	}
	

}
