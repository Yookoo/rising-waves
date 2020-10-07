package com.waves.gateway.configuration;

import com.waves.common.interceptor.LogInterceptor;
import com.waves.gateway.interceptor.LoginInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * @author apple
 */
@Configuration
public class GatewayInterceptorConfiguration implements WebMvcConfigurer {

	@Autowired
	private ValueOperations<String, String> valueOperations;

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(new LogInterceptor()).addPathPatterns("/**");
		registry.addInterceptor(new LoginInterceptor(valueOperations))
		 .excludePathPatterns("/**/admins/login**","/doc.html","/error",
				 "/swagger-resources/**", "/configuration/security","/v2/api-docs"
				 ,"/webjars/**","/**/favicon.ico","/caches/**"
				 ).addPathPatterns("/**");

	}
	@Override
 	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("doc.html")
				.addResourceLocations("classpath:/META-INF/resources/");
		registry.addResourceHandler("/webjars/**")
				.addResourceLocations("classpath:/META-INF/resources/webjars/");
	}
}
