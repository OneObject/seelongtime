package com.longtime.app.ixin.mgr.service;

import java.util.List;

import com.longtime.app.ixin.mgr.fodder.vo.FodderVO;
import com.longtime.app.ixin.mgr.model.AutoResponseRule;
import com.longtime.app.ixin.vo.AutoResponseRuleVO;
import com.longtime.app.ixin.vo.MatterVO;

public interface AutoResponseRuleService {
    
	public void addAutoResponseRule(AutoResponseRule entity);
	
	public void updateAutoResponseRule(AutoResponseRule entity);
	
	public List<AutoResponseRuleVO> getAutoResponseRuleVOList(String currentDomain, int pageNO, int pageSize);
	
	public int getAutoResponseRuleCount(String domain);
	
	public AutoResponseRule getAutoResponseRuleById(String id);

    public List<MatterVO> queryMatterVOByIds(String domain, String matterIds, int pageNO, int pageSize);

    public List<AutoResponseRule> getAutoResponseRuleList(String currentDomain, int pageNO, int pageSize);

    public List<FodderVO> getFodderByIds(String matterIds);
    
    public List<String> findAllSkey(String domain);
    
    public List<String> getOtherSkey(String domain,String id);
	
}
