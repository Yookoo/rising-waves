package com.waves.gateway.configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.core.ValueOperations;

@Configuration
public class RedisConfiguration {

	@Autowired
	private StringRedisTemplate stringRedisTemplate;

	@Bean
	public ValueOperations<String, String> valueOperations() {
		return stringRedisTemplate.opsForValue();
	}

}
