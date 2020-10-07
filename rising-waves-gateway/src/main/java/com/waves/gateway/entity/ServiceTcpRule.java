package com.waves.gateway.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.waves.common.http.BaseEntity;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 网关路由匹配表
 * </p>
 *
 * @author 不吃香菜9527
 * @since 2020-10-06
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("gateway_service_tcp_rule")
@ApiModel(value = "ServiceTcpRule对象", description = "网关路由匹配表")
public class ServiceTcpRule extends BaseEntity {

	private static final long serialVersionUID = 1L;

	@ApiModelProperty(value = "服务id")
	private Long serviceId;

	@ApiModelProperty(value = "端口号")
	private Integer port;

}
