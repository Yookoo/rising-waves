package com.waves.gateway.configuration;

import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import com.baomidou.mybatisplus.extension.plugins.PaginationInterceptor;
import com.baomidou.mybatisplus.extension.plugins.pagination.optimize.JsqlParserCountOptimize;
import com.waves.gateway.handler.GatewayMetaObjectHandler;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 *
 * mybatis plus 配置文件
 *
 * @author apple
 */
@EnableTransactionManagement
@Configuration
@MapperScan("com.waves.gateway.*.mapper")
public class MybatisPlusConfiguration {

	/**
	 * 分页拦截器
	 * @return
	 */
	@Bean
	public PaginationInterceptor paginationInterceptor() {
		PaginationInterceptor paginationInterceptor = new PaginationInterceptor();
		// 设置请求的页面大于最大页后操作， true调回到首页，false 继续请求 默认false
		// paginationInterceptor.setOverflow(false);
		// 设置最大单页限制数量，默认 500 条，-1 不受限制
		// paginationInterceptor.setLimit(500);
		// 开启 count 的 join 优化,只针对部分 left join
		paginationInterceptor.setCountSqlParser(new JsqlParserCountOptimize(true));
		return paginationInterceptor;
	}

	@Bean
	public MetaObjectHandler adminMetaObjectHandler() {
		return new GatewayMetaObjectHandler();
	}

}