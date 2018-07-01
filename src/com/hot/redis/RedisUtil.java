package com.hot.redis;


public class RedisUtil {

	private static RedisDataSourceImpl redisDataSource;
	private static RedisClientTemplate redisTemplate = null;
	public static RedisDataSourceImpl getRedisDataSource() {
		return redisDataSource;
	}
	public static void setRedisDataSource(RedisDataSourceImpl redisDataSource) {
		RedisUtil.redisDataSource = redisDataSource;
	}
	public static RedisClientTemplate getRedisTemplate() {
		if(redisTemplate == null){
			redisTemplate = new RedisClientTemplate(redisDataSource);
		}
		
		return redisTemplate ;
	}
}
