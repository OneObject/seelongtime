package com.longtime.common.web.utils;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyTagSupport;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;


public class StudyInfoTag extends BodyTagSupport{
	
	private static final long serialVersionUID = 1L;

	private final static Log log = LogFactory.getLog(StudyInfoTag.class);

    private String var="";//实体变量
	private String rid="";//课程id
	private String uid="";//用户id
	private Boolean hasexam = false;

	public Boolean getHasexam() {
		return hasexam;
	}

	public void setHasexam(Boolean hasexam) {
		this.hasexam = hasexam;
	}

	public String getVar() {
		return var;
	}

	public void setVar(String var) {
		this.var = var;
	}

	public String getRid() {
		return rid;
	}

	public void setRid(String rid) {
		this.rid = rid;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}
	

	public int doStartTag() throws JspException {
		
		var = "".equals(var.trim())?"item":var;
		//初始设为null
		 pageContext.setAttribute(var, null);
		 
//		 HttpServletRequest request = (HttpServletRequest) pageContext.getRequest();
//		 System.err.println(request.getAttribute("rid"));
//		 System.err.println(request.getAttribute("uid"));
		 
		 if(!"".equals(rid.trim())&& !"".equals(uid.trim()) ){
			 
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



}
