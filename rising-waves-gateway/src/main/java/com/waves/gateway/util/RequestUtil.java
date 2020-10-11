package com.waves.gateway.util;

import org.springframework.util.Assert;
import org.springframework.util.StringUtils;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RequestUtil {

	public static HttpServletRequest getRequest() {
		return ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
	}

	public static HttpServletResponse getResponse() {
		return ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getResponse();
	}

	/**
	 * 获取token 如果没有拿到直接抛出异常，调用方无需再次判断
	 * @return
	 */
	public static String getAccessToken() {
		HttpServletRequest request = getRequest();
		String token = request.getParameter("token");
		if (StringUtils.isEmpty(token)) {
			token = request.getHeader("Authorization");
		}
		Assert.notNull(token, request.getRequestURI() + "需要登录才能访问，请先登录");
		return token;
	}

}