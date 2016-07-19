//package com.longtime.app.base.service.impl;
//
//import java.util.List;
//
//import javax.annotation.Resource;
//
//import org.apache.commons.collections.CollectionUtils;
//import org.springframework.stereotype.Service;
//
//import com.google.common.collect.Lists;
//import com.googlecode.genericdao.search.Search;
//import com.longtime.app.base.dao.NotifyConfigDao;
//import com.longtime.app.base.dao.TenantConfigDao;
//import com.longtime.app.base.model.NotifyConfig;
//import com.longtime.app.base.model.TenantConfig;
//import com.longtime.app.base.service.NotifyConfigService;
//import com.longtime.common.dao.BaseDAO;
//import com.longtime.common.service.BaseService4HImpl;
//import com.longtime.common.utils.ResultSet;
//import com.longtime.message.model.NotifyBody;
//import com.longtime.message.util.NotifyType;
//
//@Service("notifyConfigService")
//public class NotifyConfigServiceImpl extends BaseService4HImpl<NotifyConfig, String> implements NotifyConfigService{
//    
//    @Resource
//    private NotifyConfigDao notifyConfigDao;
//    
//    @Resource(name = "tenantConfigDao")
//	private TenantConfigDao tenantConfigDao;
//    
//    @Override
//    public BaseDAO<NotifyConfig, String> getDAO() {
//        return notifyConfigDao;
//    }
//
//    @Override
//    public boolean allowToSend(NotifyBody item) {
//    	TenantConfig tenantConfig = tenantConfigDao.getByDomain(item.getDomain());
//    	if(tenantConfig == null || !tenantConfig.isSendnotify()){
//    		return false;
//    	}
//    	
//    	NotifyConfig notifyConfig = getByType(item.getNotifyType(), item.getDomain());
//    	if(notifyConfig == null || !notifyConfig.isOpen()){
//    		return false;
//    	}
//    	return true;
//    }
//    
//    @Override
//    public List<NotifyConfig> getOpensByType(NotifyType notifyType) {
//    	Search search = new Search();
//    	search.addFilterEqual("type", notifyType.name());
//    	search.addFilterEqual("open",true);
//    	ResultSet<NotifyConfig> rs = this.notifyConfigDao.query(search);
//    	if(rs != null && CollectionUtils.isNotEmpty(rs.getItems())){
//    		return rs.getItems();
//    	}
//    	return Lists.newArrayList();
//    }
//    
//    @Override
//    public NotifyConfig getByType(NotifyType notifyType,String domain){
//    	Search search = new Search();
//    	search.addFilterEqual("type", notifyType.name());
//    	search.addFilterEqual("domain", domain);
//    	ResultSet<NotifyConfig> rs = this.notifyConfigDao.query(search);
//    	if(rs != null && CollectionUtils.isNotEmpty(rs.getItems())){
//    		return rs.getItems().get(0);
//    	}
//    	return null;
//    }
//    
//}
