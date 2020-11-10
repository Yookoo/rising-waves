package com.waves.gateway.interceptor;

import com.waves.common.web.WebConstants;
import com.waves.gateway.util.RequestUtil;
import org.slf4j.MDC;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.util.Assert;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginInterceptor implements HandlerInterceptor {

	private ValueOperations<String, String> valueOperations;

	public LoginInterceptor() {
	}

	public LoginInterceptor(ValueOperations<String, String> valueOperations) {
		this.valueOperations = valueOperations;
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String token = RequestUtil.getAccessToken();
		String adminInfo = valueOperations.get(token);
		Assert.notNull(adminInfo, "登录已超时，请重新登录");
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		MDC.remove(WebConstants.LOG_TRACE_ID);
	}

}