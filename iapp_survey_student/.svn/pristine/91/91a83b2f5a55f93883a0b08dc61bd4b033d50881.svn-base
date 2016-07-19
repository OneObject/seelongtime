package com.longtime.ajy.student.service.impl;



import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.longtime.ajy.model.Template;
import com.longtime.ajy.model.vo.TemplateVO;
import com.longtime.ajy.mweb.repository.SpecialRepository;
import com.longtime.ajy.student.service.TemplateService;
import com.longtime.common.dao.Repository;
import com.longtime.common.service.BaseServiceImpl;


@Service("templateService")
public class TemplateServiceImpl extends BaseServiceImpl<Template, String> implements TemplateService{
	
	@Resource(name="specialRepository")
	private SpecialRepository specialRepository;
	
	@Resource(name="templateRepository")
    private Repository<Template, String> templateRepository;


	@Override
	public Repository<Template, String> getRepository() {
		return this.templateRepository;
	}


	@Override
	public TemplateVO getTemplate(String domain, String mid) {
		return this.specialRepository.getTemplate(domain, mid);
	}
	
	@Override
	public Template getsingleTemplate(String id) {
		return this.specialRepository.getSingleTemplate(id);
	}
	
}
