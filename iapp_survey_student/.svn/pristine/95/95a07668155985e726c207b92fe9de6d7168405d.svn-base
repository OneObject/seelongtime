package com.longtime.ajy.student.service.impl;

import com.longtime.ajy.model.TenantConfig;
import com.longtime.ajy.student.service.TenantConfigService;
import com.longtime.common.dao.Repository;
import com.longtime.common.service.BaseServiceImpl;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;

@Service("tenantConfigService")
public class TenantConfigServiceImpl extends BaseServiceImpl<TenantConfig, String> implements TenantConfigService {
    
    @Resource(name="tenantConfigRepository")
    private Repository<TenantConfig, String> tenantConfigRepository;
    @Override
    public Repository<TenantConfig, String> getRepository() {
        return this.tenantConfigRepository;
    }
}
