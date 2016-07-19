package com.longtime.app.base.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.longtime.app.base.dao.ModuleConfigDao;
import com.longtime.app.base.model.ModuleConfig;
import com.longtime.common.dao.BaseDAOImpl;
@Repository("moduleConfigDao")
public class ModuleConfigDaoImpl extends BaseDAOImpl<ModuleConfig, String> implements ModuleConfigDao {
	@Override
	public List<ModuleConfig> getByDomain(String domain) {
		// TODO Auto-generated method stub
		List<ModuleConfig> mclist = this.list("from ModuleConfig as m where m.domain=?",new Object[]{domain});
		return mclist;
	}

	@Override
	public ModuleConfig getByDomainAndId(String domain, String id) {
		List<ModuleConfig> mclist = this.list("from ModuleConfig as m where m.domain=? and m.moduleid=?",new Object[]{domain,id});
		if (mclist.size() == 0){
			return null;
		}
		return mclist.get(0);
	}

	@Override
	public int updateModuleConfigIsopen(String domain, String moduleid, boolean isopen) {
		int result = super.execute("update ModuleConfig as m set m.isopen=? where m.domain=? and m.moduleid=?", new Object[]{isopen,domain,moduleid});
		return result;
	}
	
}
