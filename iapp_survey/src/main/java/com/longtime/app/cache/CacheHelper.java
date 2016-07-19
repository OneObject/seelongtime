/**
 * project : iapp
 * user created : yangwk
 * date created : 2013-9-23 - 上午10:53:39
 */
package com.longtime.app.cache;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.longtime.app.cache.service.CacheService;

/**
 * @since 2013-9-23
 * @author yangwk
 * 
 */
@Component("cacheHelper")
public class CacheHelper {
	
	@Resource(name = "jedisService")
	private CacheService cacheService;
	
	/**
	 * 添加一个key-value映射
	 * @param key
	 * @param value
	 */
    public void add(String key , String value){
    	this.cacheService.add(key, value);
    }
    
    /**
     * 获取一个key对应的value值
     * @param key
     * @return
     */
    public String get(String key){
    	return this.cacheService.get(key);
    }
	
	/**
	 * 向一个key添加多个值
	 * @param key
	 * @param value
	 */
    public void sadd(String key , String value){
    	this.cacheService.sadd(key, value);
    }
    
    /**
     * 移除一个key所对应值中的一个
     * @param key
     * @param member
     */
    public void srem(String key , String member){
    	this.cacheService.srem(key, member);
    }
    
    /**
     * 获取一个可以所对应的所有value值，{"id":"","answer"},{"id":"","answer"},
     * @param key
     * @return
     */
    public String sget(String key){
    	return this.cacheService.sget(key);
    }
    
    /**
     * 删除一个key对应的值
     * @param key
     */
    public void del(String key){
    	this.cacheService.del(key);
    }
	
}
