package com.waves.gateway.controller;

import com.waves.common.http.R;
import io.lettuce.core.RedisClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.CacheManager;
import org.springframework.data.redis.cache.RedisCache;
import org.springframework.data.redis.cache.RedisCacheWriter;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import sun.security.util.Cache;

import java.lang.reflect.Field;
import java.util.*;

@RestController
@RequestMapping("/caches")
public class CacheController {

	@Autowired
	private ValueOperations<String, String> valueOperations;

	@GetMapping("/{key}")
	public R get(@PathVariable String key) {
		Map<String, String> map = new HashMap<>();
		map.put(key, valueOperations.get(key));
		return R.ok(map);
	}

	/**
	 * 查询缓存
	 */
	@GetMapping
	public R pages() {
		Set<String> keys = valueOperations.getOperations().keys("*");
		Map<String, String> map = new HashMap<>();
		for (String k : keys) {
			map.put(k, valueOperations.get(k));
		}
		return R.ok(map);
	}

}
