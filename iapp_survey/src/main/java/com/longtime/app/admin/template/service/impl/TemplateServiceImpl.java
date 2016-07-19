package com.longtime.app.admin.template.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.stereotype.Service;

import com.longtime.app.admin.template.dao.TemplateDao;
import com.longtime.app.admin.template.model.DomainTemplate;
import com.longtime.app.admin.template.model.SingleTemplate;
import com.longtime.app.admin.template.model.Template;
import com.longtime.app.admin.template.model.TemplateVO;
import com.longtime.app.admin.template.service.TemplateService;

@Service("templateService")
public class TemplateServiceImpl implements TemplateService{

	@Resource(name = "templateDao")
	private TemplateDao templateDao;

	@Override
	public TemplateVO getTemplate(String domain, String mid) {
		
		return templateDao.getTemplate(domain, mid);
	}

	@Override
	public List<TemplateVO> listAllModule(String domain) {
		List<TemplateVO> list =  templateDao.listAllModule(domain);
		return list;
	}

	@Override
	public List<Template> listTemplateByMid(String mid,String domain) {
		List<Template> list = templateDao.listTemplateByMid(mid,domain);
		return list;
	}

	@Override
	public void deleteDomainTemplate(String domain, String mid) {
		templateDao.deleteDomainTemplate(domain,mid);
		
	}


	@Override
	public boolean addDomainTemplate(DomainTemplate dtemplate) {
		return templateDao.addDomainTemplate(dtemplate);
	}

	@Override
	public DomainTemplate getDomainTemplate(String domain, String mid) {
		List<DomainTemplate> list = templateDao.getDomainTemplates(domain, mid);
		if (CollectionUtils.isEmpty(list)) {
			return null;
		}else {
			return list.get(0);
		}
	}

	@Override
	public Template getSingleTemplate(String sid) {
		return templateDao.getSingleTemplate(sid);
	}

	@Override
	public boolean setSingleTemplate(String domain, String showType, String id) {
		boolean success = templateDao.deleteSingleTemplate(id);
		if (!success) {
			return false;
		}
		success = templateDao.saveSingleTemplate(domain,showType, id);
		if (!success) {
			return false;
		}
		return success;
	}
	
	
}
