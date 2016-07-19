package com.longtime.ajy.student.repository;

import javax.annotation.Resource;
import javax.sql.DataSource;

import com.longtime.ajy.model.*;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.longtime.common.dao.Repository;
import com.longtime.common.dao.mysql.SpringJdbcAutoIncIdRepositoryImpl;
import com.longtime.common.dao.mysql.SpringJdbcRepositoryImpl;

@Configuration("studentRepositoryConfig")
public class RepositoryConfig {

    @Resource(name = "app.ajy.student.dataSource")
    private DataSource dataSource;

    @Bean(name = "accountRepository")
    public Repository<Account, Long> getAccountRepository() {
        SpringJdbcAutoIncIdRepositoryImpl<Account> accountRepository = new SpringJdbcAutoIncIdRepositoryImpl<Account>(
                                                                                                                      Account.class,
                                                                                                                      dataSource,
                                                                                                                      "base_account");
        return accountRepository;
    }

    @Bean(name = "userRepository")
    public Repository<User, String> getUserRepository() {
        SpringJdbcRepositoryImpl<User, String> userRepository = new SpringJdbcRepositoryImpl<User, String>(User.class,
                                                                                                           dataSource,
                                                                                                           "iapp_base_user");
        return userRepository;
    }

    @Bean(name = "authorizeRepository")
    public Repository<Authorize, String> getAuthorizeRepository() {
        SpringJdbcRepositoryImpl<Authorize, String> authorizeRepository = new SpringJdbcRepositoryImpl<Authorize, String>(
                                                                                                                          Authorize.class,
                                                                                                                          dataSource,
                                                                                                                          "v_authorize");
        return authorizeRepository;
    }

    @Bean(name = "tenantRepository")
    public Repository<Tenant, String> getTenantRepository() {
        SpringJdbcRepositoryImpl<Tenant, String> tenantRepository = new SpringJdbcRepositoryImpl<Tenant, String>(
                                                                                                                 Tenant.class,
                                                                                                                 dataSource,
                                                                                                                 "iapp_base_tenant");
        return tenantRepository;
    }

    @Bean(name = "tenantConfigRepository")
    public Repository<TenantConfig, String> getTenantConfigRepository() {
        SpringJdbcRepositoryImpl<TenantConfig, String> tenantConfigRepository = new SpringJdbcRepositoryImpl<TenantConfig, String>(
                                                                                                                                   TenantConfig.class,
                                                                                                                                   dataSource,
                                                                                                                                   "base_tenant_config");
        return tenantConfigRepository;
    }
    
    @Bean(name = "tagRepository")
    public Repository<TagEntity, String> gettagRepository() {
    	SpringJdbcRepositoryImpl<TagEntity,String> tagRepository = new SpringJdbcRepositoryImpl<TagEntity,String>(
    			                                                                                                                  TagEntity.class,
                                                                                                                                   dataSource,
                                                                                                                                   "base_tag");
        return tagRepository;
    }
    
    @Bean(name = "questionRepository")
    public Repository<QuestionEntity, String> getquestionRepository() {
    	SpringJdbcRepositoryImpl<QuestionEntity,String> questionRepository = new SpringJdbcRepositoryImpl<QuestionEntity,String>(
    			                                                                                                           QuestionEntity.class,
                                                                                                                                   dataSource,
                                                                                                                                   "base_question");
        return questionRepository;
    }
    
    
    @Bean(name = "questionTagsRepository")
    public Repository<QuestionTags, Long> getquestionTagsRepository() {
    	SpringJdbcAutoIncIdRepositoryImpl<QuestionTags> questionTagsRepository = new SpringJdbcAutoIncIdRepositoryImpl<QuestionTags>(
    																															   QuestionTags.class,
                                                                                                                                   dataSource,
                                                                                                                                   "base_questiontags");
        return questionTagsRepository;
    }
    
}
