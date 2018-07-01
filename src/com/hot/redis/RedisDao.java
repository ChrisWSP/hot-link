package com.hot.redis;

import java.util.List;


public class RedisDao {
	private RedisClientTemplate redisTemplate = RedisUtil.getRedisTemplate();
	private static RedisDao instance  = null;
	public static RedisDao getInstance(){
		if(instance == null){
			instance = new RedisDao();
		}
		return instance; 
	}
	 /**
     * 设置单个值 String-->String
     * 
     */
	public String set(String key, String value) {
	       
		return redisTemplate.set(key, value);
	}
	 /**
     * 获取单个值对象 根据对象获取对象
     * 
     */
	public byte[] get(byte[] bs) {
        return redisTemplate.get(bs);
    }
	/**
     * 获取单个值 根据String获取String
     * 
     */
	public String get(String key) {
        return redisTemplate.get(key);
    }
	  /**
     * 删除单个值
     */
    public Long del(String key) {
        return redisTemplate.del(key);
    }
	  /**
     * 设置单个值对象 byte[]-->byte[]
     * 			对象-->对象
     * 
     */
	public String set(byte[] bytes, byte[] serialize) {

		return redisTemplate.set(bytes, serialize);
	}
	/**
     * 判断key是否存在
     * 
     */
	public Boolean exists(String key) {
        return redisTemplate.exists(key);
    }
	/**
     * 获取value类型
     * 
     */
    public String type(String key) {
    	return redisTemplate.type(key);
    }
    /**
     * 设置一个key的活动时间
     */
    public Long expire(String key, int seconds) {

    	return redisTemplate.expire(key,seconds);
    }
    /**
     * 在某个时间点失效
     * 
     */
    public Long expireAt(String key, long unixTime) {

    	return redisTemplate.expireAt(key,unixTime);
    }
    /**
     * 获得一个key的活动时间（expire）
     */
    public Long ttl(String key) {
    	return redisTemplate.ttl(key);
    }
    /**
     * 设置hash
     */
    public Long hset(String key, String field, String value) {
    	return redisTemplate.hset(key,field,value);
    }
    /**
     * 获取hash
     */
    public String hget(String key, String field) {

    	return redisTemplate.hget(key,field);
    }
    /**
     * 删除hash
     */
    public Long hdel(String key, String field) {

    	return redisTemplate.hdel(key,field);
    }
    /**
     * 设置key，并返回旧的value
     */
    public String getSet(String key, String value) {

    	return redisTemplate.getSet(key,value);
    }
    /**
     *当key不存在时添加key
     */
    public Long setnx(String key, String value) {
    	return redisTemplate.setnx(key,value);
    }
    /**
     *添加一个ksy->value,并设置时间
     */
    public String setex(String key, int seconds, String value) {
    	return redisTemplate.setex(key,seconds,value);
    }
    /*
     * 插入一个元素到数组末尾
     */
    public Long rpush(String key, String string) {
    	return redisTemplate.rpush(key, string);
    }
    /*
     * 插入一个元素到数组开头
     */
    public Long lpush(String key, String string) {
    	return redisTemplate.lpush(key, string);
    }

    /*
     * 获取数组长度
     */
    public Long llen(String key) {
    	return redisTemplate.llen(key);
    }
    /*
     * 获取一个数组的开始-结束区间内的数组
     */
    public List<String> lrange(String key, long start, long end) {
    	return redisTemplate.lrange(key, start, end);
    }
    /*
     * 只保留数组开始-结束区间内的元素，其他删除
     */
    public String ltrim(String key, long start, long end) {
    	return redisTemplate.ltrim(key, start, end);
    }
    /*
     *获取数组下班的元素
     */
    public String lindex(String key, long index) {
    	return redisTemplate.lindex(key, index);
    }
    /*
     * 设置数组下表的元素
     */
    public String lset(String key, long index, String value) {
    	return redisTemplate.lset(key, index, value);
    }
    /*
     * 从count开始找到元素为value并删除
     */
    public Long lrem(String key, long count, String value) {
    	return redisTemplate.lrem(key, count, value);
    }
    /*
     * 移除并返回列表 key 的头元素
     */
    public String lpop(String key) {
    	return redisTemplate.lpop(key);
    }
    /*
     *移除并返回列表 key 的尾元素。
     */
    public String rpop(String key){
    	return redisTemplate.rpop(key);
    }
}
