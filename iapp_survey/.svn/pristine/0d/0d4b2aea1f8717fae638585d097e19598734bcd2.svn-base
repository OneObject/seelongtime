package com.longtime.app.admin.template.service;

import java.util.List;


import com.longtime.app.admin.template.model.DomainTemplate;
import com.longtime.app.admin.template.model.SingleTemplate;
import com.longtime.app.admin.template.model.Template;
import com.longtime.app.admin.template.model.TemplateVO;

public interface TemplateService {

	TemplateVO getTemplate(String domain, String mid);
	
	DomainTemplate getDomainTemplate(String domain, String mid);

	List<TemplateVO> listAllModule(String domain);
	
	List<Template> listTemplateByMid(String mid,String domain);
	
	void deleteDomainTemplate(String domain,String mid);

	boolean addDomainTemplate(DomainTemplate dtemplate);
	
	Template getSingleTemplate(String sid);

	boolean setSingleTemplate(String domain, String showType, String id);
}
