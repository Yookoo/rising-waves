package com.waves.gateway.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.waves.common.web.BaseEntity;
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
@TableName("gateway_service_grpc_rule")
@ApiModel(value = "ServiceGrpcRule对象", description = "网关路由匹配表")
public class ServiceGrpcRule extends BaseEntity {

	private static final long serialVersionUID = 1L;

	@ApiModelProperty(value = "服务id")
	private Long serviceId;

	@ApiModelProperty(value = "端口")
	private Integer port;

	@ApiModelProperty(value = "header转换支持增加(add)、删除(del)、修改(edit) 格式: add headname headvalue 多个逗号间隔")
	private String headerTransfor;

}
