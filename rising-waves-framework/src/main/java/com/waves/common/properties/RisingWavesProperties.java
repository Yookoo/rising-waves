package com.waves.common.properties;

import org.springframework.boot.context.properties.ConfigurationProperties;

/**
 * 系统配置 参数
 * @author apple
 */
@ConfigurationProperties(
		prefix = "risingwaves"
)
public class RisingWavesProperties {

	// 是否允许跨域
	private Boolean crossOrgin;

	// 是否开启token校验
	private Boolean allowToken;

	// 是否开启文档
	private Boolean swaggerDoc;

	// 是否开启日志记录
	private Boolean log;

}
