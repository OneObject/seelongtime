package com.longtime.app.util;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.directwebremoting.annotations.Param;
import org.directwebremoting.annotations.RemoteMethod;
import org.directwebremoting.annotations.RemoteProxy;
import org.directwebremoting.spring.SpringCreator;
import org.springframework.stereotype.Service;

import com.longtime.app.base.model.Account;
import com.longtime.app.base.model.Permission;
import com.longtime.app.base.model.Tenant;
import com.longtime.app.base.model.User;
import com.longtime.app.base.service.AccountService;
import com.longtime.app.base.service.PermissionService;
import com.longtime.app.base.service.TenantService;
import com.longtime.app.base.service.UserService;
import com.longtime.common.utils.QueryCondition;
import com.longtime.common.utils.ResultSet;

/**
 * DWR验证工具类
 * @author XuLei
 */
//@RemoteProxy(name="DWRUtil", creator=SpringCreator.class, creatorParams={@Param(name="beanName", value="userService")})
@Service
@RemoteProxy(name="DWRService", creator=SpringCreator.class, creatorParams=@Param(name ="beanName", value="DWRService"))
public class DWRService{

    @Resource
    private UserService userService;
    @Resource
    private PermissionService permissionService;
    @Resource(name = "tenantService")
    private TenantService tenantService;
    @Resource(name = "accountService")
    private AccountService accountService;

    /**
     * 验证属性是否唯一
     * @param domain 类/域
     * @param proName 属性名
     * @param value 值
     * @param conSelf 包括自身
     * @param ignoreCase 忽略大小写
     * @return true可用,false不可用
     */
    @RemoteMethod
    public boolean uniqueValidate(String type, String proName, String value, String id,  boolean conSelf, boolean ignoreCase){
       //TODO conSelf 应该是excludeSelf,排除自身
    	if(ignoreCase){
            value = value.toLowerCase();
        }
        if("user".equals(type)){
            QueryCondition query = new QueryCondition();
            query.addFilterEqual(proName, value);
            query.addFilterEqual("isDel", User.ISDEL_NO);
            ResultSet<User> rs =  userService.list(query);

            if(rs==null || null==rs.getItems() || 0==rs.getItems().size()){
                return true;
            }
            if(rs.getItems().size()>1){
                return false;
            }
            
            if(conSelf){
                for (User u : rs.getItems()) {
                    if(!u.getId().equals(id)){
                        return false;
                    }
                }
                return true;
            }
        } else if("permission".equals(type)){
            QueryCondition query = new QueryCondition();
            query.addFilterEqual(proName, value);
            query.addFilterEqual("isDel", Permission.IS_DEL_NO);
            ResultSet<Permission> rs =  permissionService.list(query);

            if(rs==null || null==rs.getItems() || 0==rs.getItems().size()){
                return true;
            }
            if(rs.getItems().size()>1){
                return false;
            }
            
            if(conSelf){
                for (Permission p : rs.getItems()) {
                    if(!p.getId().equals(id)){
                        return false;
                    }
                }
                return true;
            }
        }else if("account".equals(type)){
        	 QueryCondition query = new QueryCondition();
             query.addFilterEqual(proName, value);
             ResultSet<Account> rs =  accountService.list(query);

             if(rs==null || null==rs.getItems() || 0==rs.getItems().size()){
                 return true;
             }
             if(conSelf){ //conSelf=true排除自身 
                 for (Account p : rs.getItems()) {
                     if(!p.getId().equals(id)){
                         return true;
                     }
                 }
                 return false;
             }
        } else if("tenant".equals(type)){
       	 QueryCondition query = new QueryCondition();
         query.addFilterEqual(proName, value);
         ResultSet<Tenant> rs =  tenantService.list(query);

         if(rs==null || null==rs.getItems() || 0==rs.getItems().size()){
             return true;
         }
         if(conSelf){ //conSelf=true排除自身 
             for (Tenant p : rs.getItems()) {
                 if(!p.getId().equals(id)){
                     return true;
                 }
             }
             return false;
         }
    }
        return false;
    }
    
    
    @RemoteMethod
    public boolean uniqueValidate2(String domain,String type, String proName, String value, String id,  boolean conSelf, boolean ignoreCase){
    	//TODO conSelf 应该是excludeSelf,排除自身
    	if(ignoreCase){
    		value = value.toLowerCase();
    	}
    	if("user".equals(type)){
    		QueryCondition query = new QueryCondition();
    		query.addFilterEqual(proName, value);
    		query.addFilterEqual("isDel", User.ISDEL_NO);
    		if (StringUtils.isNotBlank(domain )) {
    			query.addFilterEqual("domain", domain);
				
			}
    		ResultSet<User> rs =  userService.list(query);
    		
    		if(rs==null || null==rs.getItems() || 0==rs.getItems().size()){
    			return true;
    		}
    		if(rs.getItems().size()>1){
    			return false;
    		}
    		
    		if(conSelf){
    			for (User u : rs.getItems()) {
    				if(!u.getId().equals(id)){
    					return false;
    				}
    			}
    			return true;
    		}
    	} else if("permission".equals(type)){
    		QueryCondition query = new QueryCondition();
    		query.addFilterEqual(proName, value);
    		query.addFilterEqual("isDel", Permission.IS_DEL_NO);
    		ResultSet<Permission> rs =  permissionService.list(query);
    		
    		if(rs==null || null==rs.getItems() || 0==rs.getItems().size()){
    			return true;
    		}
    		if(rs.getItems().size()>1){
    			return false;
    		}
    		
    		if(conSelf){
    			for (Permission p : rs.getItems()) {
    				if(!p.getId().equals(id)){
    					return false;
    				}
    			}
    			return true;
    		}
    	} else if("account".equals(type)){
    		QueryCondition query = new QueryCondition();
    		query.addFilterEqual(proName, value);
    		ResultSet<Account> rs =  accountService.list(query);
    		
    		if(rs==null || null==rs.getItems() || 0==rs.getItems().size()){
    			return true;
    		}
    		if(conSelf){ //conSelf=true排除自身 
    			for (Account p : rs.getItems()) {
    				if(!p.getId().equals(id)){
    					return true;
    				}
    			}
    			return false;
    		}
    	} else if("tenant".equals(type)){
    		QueryCondition query = new QueryCondition();
    		query.addFilterEqual(proName, value);
    		ResultSet<Tenant> rs =  tenantService.list(query);
    		
    		if(rs==null || null==rs.getItems() || 0==rs.getItems().size()){
    			return true;
    		}
    		if(conSelf){ //conSelf=true排除自身 
    			for (Tenant p : rs.getItems()) {
    				if(!p.getId().equals(id)){
    					return true;
    				}
    			}
    			return false;
    		}
    	}
    	return false;
    }
}
