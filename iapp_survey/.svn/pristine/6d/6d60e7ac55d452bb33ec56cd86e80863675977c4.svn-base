package com.longtime.app.ixin.mgr.dao;

import java.util.List;

import com.longtime.app.ixin.mgr.fodder.vo.FodderVO;
import com.longtime.app.ixin.mgr.model.AutoResponseRule;
import com.longtime.app.ixin.vo.AutoResponseRuleVO;
import com.longtime.app.ixin.vo.MatterVO;

/**
 * 素材
 * @author Administrator
 *
 */
public interface AutoResponseRuleDao {

	/**
	 * 
	 * @param entity
	 * @param sourceBaseId
	 */
	void saveAutoResponseRule(AutoResponseRule entity);

	void updateAutoResponseRule(AutoResponseRule entity);

	int getAutoResponseRuleTotalSize(String currentDomain);
	
	List<AutoResponseRule> getAll();

	List<AutoResponseRuleVO> queryAutoResponseRuleVOByPage(String currentDomain, int pageNO, int pageSize);

    AutoResponseRule getById(String id);

    List<MatterVO> queryMatterVOByIds(String domain, String matterIds, int pageNO, int pageSize, final String qiniuImageBasePath,final String coverSuffix);

    List<AutoResponseRule> queryAutoResponseRuleByPage(String currentDomain, int pageNO, int pageSize);

    List<FodderVO> getFodderByIds(String matterIds);
    
    /**
     * 根据素材id获取素材对象
     * @param fodderId
     * @return
     */
    FodderVO getFodderById(String fodderId);
}
