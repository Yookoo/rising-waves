package com.waves.gateway.controller.param;

import io.swagger.annotations.ApiModelProperty;

public class TcpServiceParam {

    private Long id;

    @ApiModelProperty(value = "负载类型 0=http 1=tcp 2=grpc")
    private Integer loadType;

    @ApiModelProperty(value = "服务名称 6-128 数字字母下划线")
    private String serviceName;

    @ApiModelProperty(value = "服务描述")
    private String serviceDesc;

    @ApiModelProperty(value = "服务id")
    private Long serviceId;

    @ApiModelProperty(value = "端口号")
    private Integer port;

}
