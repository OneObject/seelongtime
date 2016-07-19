package com.longtime.app.admin.template.dao;

import java.util.List;

import com.longtime.app.admin.template.model.DomainTemplate;
import com.longtime.app.admin.template.model.SingleTemplate;
import com.longtime.app.admin.template.model.StyleTemplate;
import com.longtime.app.admin.template.model.Template;
import com.longtime.app.admin.template.model.TemplateVO;

public interface TemplateDao {
	
	TemplateVO getTemplate(String domain,String mid);

	List<DomainTemplate> getDomainTemplates(String domain, String mid);

	List<StyleTemplate> getStyleTemplates(List<String> sids);

	Template loadById(String tid);

	List<TemplateVO> listAllModule(String domain);

	List<Template> listTemplateByMid(String mid,String domain);

	void deleteDomainTemplate(String domain, String mid);

	boolean addDomainTemplate(DomainTemplate dtemplate);

	Template getSingleTemplate(String sid);

	boolean saveSingleTemplate(String domain, String showType, String id);

	boolean deleteSingleTemplate(String id);
}
