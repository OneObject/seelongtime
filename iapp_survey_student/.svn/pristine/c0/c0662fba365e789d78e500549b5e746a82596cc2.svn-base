package com.longtime.ajy.support;


import org.apache.commons.lang3.StringUtils;

import com.longtime.ajy.model.Template;
import com.longtime.ajy.model.vo.TemplateVO;
import com.longtime.ajy.student.service.TemplateService;

public class TemplateHelper {
	
	private static TemplateService templateService;

	/**
	 * 获取栏目内容的模板
	 * @param channelId 栏目id
	 * @param domain  域 
	 * @param moduleId 模块id
	 * @return
	 */
	public static String getView(String channelId,String domain,String moduleId){
		if(templateService == null){
			templateService = (TemplateService) SpringContextUtil.getBean("templateService");
		}
		if(StringUtils.isNotBlank(channelId)){
    		Template tem = templateService.getsingleTemplate(channelId);
    		if (tem!=null) {
    			return tem.getView_path();
    		}
		}
		TemplateVO template = templateService.getTemplate(domain,moduleId);
		if(template == null){
			return null;
		}
		return template.getView_path();
	}
	
	/**
	 * 获取某个功能点的模板页面
	 * @param moduleId 功能点id
	 * @param domain  域
	 * @return
	 */
	public static String getView(String moduleId,String domain){
        return getView(null, domain, moduleId);
    }
	
}
