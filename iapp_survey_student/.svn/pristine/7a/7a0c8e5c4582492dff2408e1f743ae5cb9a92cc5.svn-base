package com.longtime.ajy.student.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.longtime.ajy.model.Tenant;
import com.longtime.ajy.student.service.TenantService;
import com.longtime.common.dao.Repository;
import com.longtime.common.service.BaseServiceImpl;

@Service("tenantService")
public class TenantServiceImpl extends BaseServiceImpl<Tenant, String> implements TenantService {
    
    @Resource(name="tenantRepository")
    private Repository<Tenant, String> tenantRepository;
    @Override
    public Repository<Tenant, String> getRepository() {
        return this.tenantRepository;
    }
}
