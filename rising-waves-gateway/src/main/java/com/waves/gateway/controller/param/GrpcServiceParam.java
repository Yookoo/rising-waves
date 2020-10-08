package com.waves.gateway.controller.param;

import io.swagger.annotations.ApiModelProperty;

public class GrpcServiceParam {


    private Long id;

    @ApiModelProperty(value = "负载类型 0=http 1=tcp 2=grpc")
    private Integer loadType;

    @ApiModelProperty(value = "服务名称 6-128 数字字母下划线")
    private String serviceName;

    @ApiModelProperty(value = "服务描述")
    private String serviceDesc;


    @ApiModelProperty(value = "服务id")
    private Long serviceId;

    @ApiModelProperty(value = "端口")
    private Integer port;

    @ApiModelProperty(value = "header转换支持增加(add)、删除(del)、修改(edit) 格式: add headname headvalue 多个逗号间隔")
    private String headerTransfor;
}
