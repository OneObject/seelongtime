package com.longtime.app.ixin.mgr.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.UUID;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.ArrayUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.util.HtmlUtils;

import com.google.common.collect.Lists;
import com.longtime.app.ixin.mgr.dao.AutoResponseRuleDao;
import com.longtime.app.ixin.mgr.fodder.vo.FodderVO;
import com.longtime.app.ixin.mgr.model.AutoResponseRule;
import com.longtime.app.ixin.mgr.service.AutoResponseRuleService;
import com.longtime.app.ixin.vo.AutoResponseRuleVO;
import com.longtime.app.ixin.vo.MatterVO;
import com.longtime.app.util.HTMLUtils;

@Service("autoResponseRuleService")
public class AutoResponseRuleServiceImpl implements AutoResponseRuleService {
	private Map<String, Map<String,AutoResponseRule>> domainRuleMap = new HashMap<String, Map<String,AutoResponseRule>>();

	
	@Resource
    private AutoResponseRuleDao autoResponseRuleDao;
    
    
	public Map<String, Map<String, AutoResponseRule>> getDomainRuleMap() {
		return domainRuleMap;
	}

	public void setDomainRuleMap(Map<String, Map<String, AutoResponseRule>> domainRuleMap) {
		this.domainRuleMap = domainRuleMap;
	}

	@PostConstruct
	private void init(){
		
	}
    
private void getRuleMapFromDB(){
		
		List<AutoResponseRule> list = this.autoResponseRuleDao.getAll();
		domainRuleMap = new HashMap<String, Map<String,AutoResponseRule>>();
		if(CollectionUtils.isEmpty(list)){
			return;
		}
		for(AutoResponseRule r : list){
			addInMap(r);
		}
	}
private void getRuleMapFromDB(String id){
	
	List<AutoResponseRule> list = this.autoResponseRuleDao.getAll();
//	for (int i = 0; i < list.size(); i++) {
//		if(list.get(i).getId().equals(id)){
//			list.remove(i);
//		}
//	}
	domainRuleMap = new HashMap<String, Map<String,AutoResponseRule>>();
	if(CollectionUtils.isEmpty(list)){
		return;
	}
	for(AutoResponseRule r : list){
		
		if(!r.getId().equals(id)){
			addInMap(r);
		}
	}
}

	private void addInMap(AutoResponseRule rule) {
			Map<String, AutoResponseRule> map = domainRuleMap.get(rule.getDomain());
			if(map == null){
				map = new HashMap<String, AutoResponseRule>();
			}
		
			map.put(rule.getKeywords(), rule);
			domainRuleMap.put(rule.getDomain(), map);

	}

    
    @Override
    public List<String> findAllSkey(String domain) {
    	getRuleMapFromDB();
    	List<String> list = new ArrayList<String>();

		Map<String, AutoResponseRule> map = domainRuleMap.get(domain);
		if(map == null || map.isEmpty()){
			return Lists.newArrayList();
		}
		for (Entry<String, AutoResponseRule> entry : map.entrySet()) {
			String[] k = entry.getKey().split(",");
			for (String s : k) {
				list.add(s);
			}
			
		}
		return list;
    }
    @Override
    public List<String> getOtherSkey(String domain, String id) {
    	getRuleMapFromDB(id);
    	List<String> list = new ArrayList<String>();

		Map<String, AutoResponseRule> map = domainRuleMap.get(domain);
		if(map == null || map.isEmpty()){
			return Lists.newArrayList();
		}
		for (Entry<String, AutoResponseRule> entry : map.entrySet()) {
			String[] k = entry.getKey().split(",");
			for (String s : k) {
				list.add(s);
			}
			
		}
		return list;
    }

	@Override
    public void addAutoResponseRule(AutoResponseRule entity) {
        String id = UUID.randomUUID().toString().replaceAll("-", "");
        entity.setId(id);
        autoResponseRuleDao.saveAutoResponseRule(entity);
    }

    @Override
    public void updateAutoResponseRule(AutoResponseRule entity) {
        autoResponseRuleDao.updateAutoResponseRule(entity);
    }

    @Override
    public List<AutoResponseRuleVO> getAutoResponseRuleVOList(String currentDomain, int pageNO, int pageSize) {
        return autoResponseRuleDao.queryAutoResponseRuleVOByPage(currentDomain, pageNO, pageSize);
    }

    @Override
    public int getAutoResponseRuleCount(String domain) {
        return autoResponseRuleDao.getAutoResponseRuleTotalSize(domain);
    }

    @Override
    public AutoResponseRule getAutoResponseRuleById(String id) {
        return autoResponseRuleDao.getById(id);
    }

    @Override
    public List<MatterVO> queryMatterVOByIds(String domain, String matterIds, int pageNO, int pageSize) {
        return autoResponseRuleDao.queryMatterVOByIds(domain, matterIds, pageNO, pageSize, qiniuImageBasePath, coverSuffix);
    }

    @Value("${com.longtime.ixin.COVER_SUFFIX}")
    private String coverSuffix;
    @Value("${com.longtime.ixin.IMAGE_BASE_PATH}")
    private String qiniuImageBasePath;

    @Override
    public List<AutoResponseRule> getAutoResponseRuleList(
            String currentDomain, int pageNO, int pageSize) {
        return autoResponseRuleDao.queryAutoResponseRuleByPage(currentDomain, pageNO, pageSize);
    }

    @Override
    public List<FodderVO> getFodderByIds(String matterIds) {
//      List<FodderVO> list = autoResponseRuleDao.getFodderByIds(matterIds);
    	List<FodderVO> list = null;
    	String[] ids = matterIds.split(",");
        if(ArrayUtils.isNotEmpty(ids)){
        	list = new ArrayList<FodderVO>(ids.length);
	        for (String id : ids) {
	        	FodderVO vo = this.autoResponseRuleDao.getFodderById(id);
	        	if(vo != null){
	        		vo.setContent(HTMLUtils.html2Text(HtmlUtils.htmlUnescape(vo.getContent())));
	        		vo.setCoverPath(String.format("%s%s%s", qiniuImageBasePath,vo.getCoverPath(),coverSuffix));
	        		list.add(vo);
	        	}
			}
        } 
        return list;
    }


}
