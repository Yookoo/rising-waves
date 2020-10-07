package com.waves.gateway.interceptor;

import com.waves.common.http.WebConstants;
import org.slf4j.MDC;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.util.Assert;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.UUID;

public class LoginInterceptor implements HandlerInterceptor {

	@Autowired
	private ValueOperations<String, String> valueOperations;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String authorization = request.getHeader("Authorization");
		Assert.notNull(authorization, "请先登录");
		String adminInfo = valueOperations.get(authorization);
		Assert.notNull(adminInfo, "登录已超时，请重新登录");
		return true;
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		MDC.remove(WebConstants.LOG_TRACE_ID);
	}

}