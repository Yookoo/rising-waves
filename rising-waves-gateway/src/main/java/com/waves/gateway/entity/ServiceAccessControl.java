package com.waves.gateway.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.waves.common.http.BaseEntity;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 网关权限控制表
 * </p>
 *
 * @author 不吃香菜9527
 * @since 2020-10-06
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("gateway_service_access_control")
@ApiModel(value = "ServiceAccessControl对象", description = "网关权限控制表")
public class ServiceAccessControl extends BaseEntity {

	private static final long serialVersionUID = 1L;

	@ApiModelProperty(value = "服务id")
	private Long serviceId;

	@ApiModelProperty(value = "是否开启权限 1=开启")
	private Integer openAuth;

	@ApiModelProperty(value = "黑名单ip")
	private String blackList;

	@ApiModelProperty(value = "白名单ip")
	private String whiteList;

	@ApiModelProperty(value = "白名单主机")
	private String whiteHostName;

	@ApiModelProperty(value = "客户端ip限流")
	private Integer clientipFlowLimit;

	@ApiModelProperty(value = "服务端限流")
	private Integer serviceFlowLimit;

}
