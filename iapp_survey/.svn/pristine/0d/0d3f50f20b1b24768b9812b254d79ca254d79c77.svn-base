/**
 * project : iapp
 * user created : yangwk
 * date created : 2013-9-23 - 上午11:10:05
 */
package com.longtime.app.cache.service.impl;

import java.util.Set;

import net.sf.json.JSONArray;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

import com.longtime.app.cache.service.CacheService;

/**
 * @since 2013-9-23
 * @author yangwk
 * 
 */
public class JedisServiceImpl implements CacheService{

	private final Logger logger = LoggerFactory.getLogger(getClass());

    private JedisPool jedisPool;

    public void setJedisPool(JedisPool jedisPool) {
        this.jedisPool = jedisPool;
    }

	@Override
	public void add(String key, String value) {
		Jedis jedis = null;
		try {
			jedis = jedisPool.getResource();
			jedis.set(key, value);
		} catch (Exception e) {
			 logger.error("Jedis Error:" + e.getMessage(), e);
		} finally {
			if (jedis != null) {
                jedisPool.returnResource(jedis);
            }
		}
	}

	@Override
	public String get(String key) {
		Jedis jedis = null;
		try {
			jedis = jedisPool.getResource();
			String value = jedis.get(key);
			return value;
		} catch (Exception e) {
			 logger.error("Jedis Error:" + e.getMessage(), e);
		} finally {
			if (jedis != null) {
                jedisPool.returnResource(jedis);
            }
		}
		return null;
	}

	@Override
	public void del(String key) {
		Jedis jedis = null;
		try {
			jedis = jedisPool.getResource();
			jedis.del(key);
		} catch (Exception e) {
			 logger.error("Jedis Error:" + e.getMessage(), e);
		} finally {
			if (jedis != null) {
                jedisPool.returnResource(jedis);
            }
		}
	}

	@Override
	public void sadd(String key, String value) {
		Jedis jedis = null;
		try {
			jedis = jedisPool.getResource();
			jedis.sadd(key, value);
		} catch (Exception e) {
			 logger.error("Jedis Error:" + e.getMessage(), e);
		} finally {
			if (jedis != null) {
                jedisPool.returnResource(jedis);
            }
		}
	}

	@Override
	public String sget(String key) {
		Jedis jedis = null;
		try {
			jedis = jedisPool.getResource();
			Set<String> set = jedis.smembers(key); 
			JSONArray jsonArray = JSONArray.fromObject(set);
			return jsonArray.toString();
		} catch (Exception e) {
			 logger.error("Jedis Error:" + e.getMessage(), e);
		} finally {
			if (jedis != null) {
                jedisPool.returnResource(jedis);
            }
		}
		return null;
	}

	@Override
	public void srem(String key, String member) {
		Jedis jedis = null;
		try {
			jedis = jedisPool.getResource();
			jedis.srem(key, member);
		} catch (Exception e) {
			 logger.error("Jedis Error:" + e.getMessage(), e);
		} finally {
			if (jedis != null) {
                jedisPool.returnResource(jedis);
            }
		}
	}
    
}
