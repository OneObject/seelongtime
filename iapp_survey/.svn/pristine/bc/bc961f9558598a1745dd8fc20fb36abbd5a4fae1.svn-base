package com.longtime.app.admin.template.util;

import com.longtime.app.admin.template.model.TemplateVO;
import com.longtime.app.admin.template.service.TemplateService;
import com.longtime.common.spring.SpringContextUtil;

public class TemplateHelper {
	
	private static TemplateService templateService;

	public static String getView(String domain,String mid){
		if(templateService == null){
			templateService = SpringContextUtil.getBean(TemplateService.class);
		}
		TemplateVO template = templateService.getTemplate(domain,mid);
		if(template == null){
			return null;
		}
		return template.getView_path();
	}
	public static TemplateVO getTemplate(String domain,String mid){
		if(templateService == null){
			templateService = SpringContextUtil.getBean(TemplateService.class);
		}
		TemplateVO template = templateService.getTemplate(domain,mid);
		
		return template;
	}
}
