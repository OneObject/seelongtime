package com.longtime.app.base.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.longtime.app.base.dao.ModuleConfigDao;
import com.longtime.app.base.model.ModuleConfig;
import com.longtime.app.base.service.ModuleConfigService;
import com.longtime.common.dao.BaseDAO;
import com.longtime.common.service.BaseService4HImpl;
@Service("moduleConfigService")
public class ModuleConfigServiceImpl extends BaseService4HImpl<ModuleConfig, String>  implements ModuleConfigService {

    @Resource
    private ModuleConfigDao moduleConfigDao;
    
    @Override
    public BaseDAO<ModuleConfig, String> getDAO() {
        return moduleConfigDao;
    }

	@Override
	public List<ModuleConfig> getByDomain(String domain) {
		return moduleConfigDao.getByDomain(domain);
	}

	@Override
	public ModuleConfig getByDomainAndId(String domain, String id) {
		return moduleConfigDao.getByDomainAndId(domain, id);
	}

	public int updateModuleConfigIsopen(String domain,String moduleid,boolean isopen){
		return moduleConfigDao.updateModuleConfigIsopen(domain, moduleid, isopen);
	}

}
