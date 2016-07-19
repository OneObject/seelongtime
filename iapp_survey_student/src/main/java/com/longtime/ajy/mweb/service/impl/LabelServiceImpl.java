package com.longtime.ajy.mweb.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import com.google.common.collect.Lists;
import com.longtime.ajy.model.LabelEntity;
import com.longtime.ajy.model.LabelRelationEntity;
import com.longtime.ajy.mweb.repository.SpecialRepository;
import com.longtime.ajy.mweb.service.LabelService;
import com.longtime.common.dao.IdGenerator;
import com.longtime.common.dao.Repository;
import com.longtime.common.model.search.Filter;
import com.longtime.common.model.search.Search;
import com.longtime.common.service.BaseServiceImpl;

@Service("labelService")
public class LabelServiceImpl extends BaseServiceImpl<LabelEntity, String>  implements LabelService{
    
	@Resource(name = "labelRepository")
	private Repository<LabelEntity,String> labelRepository;
	
	@Resource(name = "labelRelationRepository")
	private Repository<LabelRelationEntity,String> labelRelationRepository;
	
	@Resource
	private SpecialRepository specialRepository;
	
	@Override
	public Repository<LabelEntity, String> getRepository() {
		return this.labelRepository;
	}

	@Override
	public void doSave(String labels, String rid, int rtype, String domain, String creator) {
		specialRepository.deleteLabelRelationByRidAndDomain(rid,domain);
		
		if(StringUtils.isBlank(labels)){
			return;
		}
		labels = labels.replace("，", ",");
		final String procssedLabels = labels;
					
		String[] labelArr = procssedLabels.split(",");
		for (String label : labelArr) {
			if(StringUtils.isBlank(label)){
				continue;
			}
			label = StringUtils.trim(label);
			
			LabelRelationEntity relationEntity = new LabelRelationEntity();
			relationEntity.setId(IdGenerator.uuid32());
			relationEntity.setLabel(label);;
			relationEntity.setRid(rid);
			relationEntity.setRtype(rtype);
			relationEntity.setDomain(domain);
			relationEntity.setCreator(creator);
			labelRelationRepository.insert(relationEntity);
			
			Search search = Search.newInstance();
			search.addEqualFilter("title", label);
			search.addEqualFilter("domain", domain);
			long count = labelRepository.count(search);
			if(count>0){
				continue;
			}
			
			LabelEntity labelEntity = new LabelEntity();
			labelEntity.setId(IdGenerator.uuid32());
			labelEntity.setTitle(label);
			labelEntity.setDomain(domain);
			labelEntity.setCreator(creator);
			labelRepository.insert(labelEntity);
		}
	}
	
	@Override
	public List<String> getRids(String labels,int rtype,String domainId) {
		if(StringUtils.isBlank(labels)){
			return Lists.newArrayList();
		}
		labels = labels.replace("，", ",");
		String procssedLabels = labels;
					
		String[] labelArr = procssedLabels.split(",");
		
		List<String> labelList = Lists.newArrayList();
		for (String label : labelArr) {
			if(StringUtils.isNotBlank(label)){
				labelList.add(label);
			}
		}
		
		if(CollectionUtils.isEmpty(labelList)){
			return Lists.newArrayList();
		}
		
		Search search = Search.newInstance();
		search.addEqualFilter("rtype", rtype);
		search.addFilter(Filter.in("label", labelList));
		search.addEqualFilter("domain", domainId);
		List<LabelRelationEntity> list = labelRelationRepository.list(search);
		List<String> rids = new ArrayList<String>(list.size());
		for(LabelRelationEntity entity : list){
			if(!rids.contains(entity.getRid())){
				rids.add(entity.getRid());
			}
		}
		return rids;
	}
	
	@Override
	public boolean isFromLabel(String labels, String id, String domain) {
		if(StringUtils.isBlank(labels)){
			return false;
		}
		labels = labels.replace("，", ",");
		String procssedLabels = labels;
					
		String[] labelArr = procssedLabels.split(",");
		
		List<String> labelList = Lists.newArrayList();
		for (String label : labelArr) {
			if(StringUtils.isNotBlank(label)){
				labelList.add(label);
			}
		}
		
		if(CollectionUtils.isEmpty(labelList)){
			return false;
		}
		
		Search search = Search.newInstance();
		search.addEqualFilter("rid", id);
		search.addEqualFilter("rtype", LabelRelationEntity.RTYPE_SURVEY);
		search.addFilter(Filter.in("label", labelList));
		search.addEqualFilter("domain", domain);
		long count = labelRelationRepository.count(search);
		return count>0;
	}
}
