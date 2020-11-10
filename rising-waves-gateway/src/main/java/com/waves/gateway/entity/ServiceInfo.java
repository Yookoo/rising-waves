package com.waves.gateway.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.waves.common.web.BaseEntity;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 网关基本信息表
 * </p>
 *
 * @author 不吃香菜9527
 * @since 2020-10-06
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("gateway_service_info")
@ApiModel(value = "ServiceInfo对象", description = "网关基本信息表")
public class ServiceInfo extends BaseEntity {

	private static final long serialVersionUID = 1L;

	@ApiModelProperty(value = "负载类型 0=http 1=tcp 2=grpc")
	private Integer loadType;

	@ApiModelProperty(value = "服务名称 6-128 数字字母下划线")
	private String serviceName;

	@ApiModelProperty(value = "服务描述")
	private String serviceDesc;

}
