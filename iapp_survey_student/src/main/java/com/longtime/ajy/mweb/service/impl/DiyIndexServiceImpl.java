package com.longtime.ajy.mweb.service.impl;



import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.longtime.ajy.model.IndexEntityVO;
import com.longtime.ajy.model.IndexModuleEntity;
import com.longtime.ajy.mweb.repository.SpecialRepository;
import com.longtime.ajy.mweb.service.DiyIndexService;

@Service("diyIndexService")
public class DiyIndexServiceImpl implements DiyIndexService {
	
	 private Logger logger = LoggerFactory.getLogger(DiyIndexServiceImpl.class);
     
	 @Resource
	 SpecialRepository specialRepository;

	@Override
	public IndexEntityVO findById(String id) {
		IndexEntityVO vo = this.specialRepository.getIndexEntityById(id);
		if (vo==null) {
			
			return null;
		}
		List<IndexModuleEntity> list = this.specialRepository.getIndexModuleByIndexId(id);
		vo.setModels(list);
	
		return vo;
	}
	 
	 
	 
	 
}
