package com.waves.gateway.configuration;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

/**
 * @author apple
 */
@Configuration
@EnableSwagger2
public class GatewaySwagger2Configuration {

	@Bean
	public Docket adminDocket() {

		return new Docket(DocumentationType.SWAGGER_2).groupName("gateway").apiInfo(adminApiInfo()).select()
				.apis(RequestHandlerSelectors.basePackage("com.waves.gateway")).paths(PathSelectors.any()).build();
	}

	private ApiInfo adminApiInfo() {
		return new ApiInfoBuilder().title("rising-waves-gateway API").description("rising-waves管理后台API")
				.termsOfServiceUrl("https://github.com/Yookoo/rising-waves")
				.contact("https://github.com/Yookoo/rising-waves").version("1.0.0").build();
	}

}