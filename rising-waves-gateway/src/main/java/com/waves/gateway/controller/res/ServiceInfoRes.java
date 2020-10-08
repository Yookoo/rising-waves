package com.waves.gateway.controller.res;


import com.waves.gateway.entity.*;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;


/**
 * <p>
 * 网关基本信息表
 * </p>
 *
 * @author 不吃香菜9527
 * @since 2020-10-06
 */
@Data
@ApiModel(value = "Service", description = "网关基本信息")
public class ServiceInfoRes {

	private static final long serialVersionUID = 1L;
	@ApiModelProperty(value = "ID")
	private Long id;
	@ApiModelProperty(value = "负载类型 0=http 1=tcp 2=grpc")
	private Integer loadType;

	@ApiModelProperty(value = "服务名称 6-128 数字字母下划线")
	private String serviceName;

	@ApiModelProperty(value = "服务描述")
	private String serviceDesc;

	@ApiModelProperty(value = "服务地址")
	private String serviceAddr;

	private Integer totalNode;

	private Integer qps;

	private Integer dps;



}
