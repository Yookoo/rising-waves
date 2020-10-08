package com.waves.gateway.domain;

import com.waves.gateway.entity.*;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
public class ServiceDetail {

    private static final long serialVersionUID = 1L;
    @ApiModelProperty(value = "ID")
    private Long id;
    @ApiModelProperty(value = "负载类型 0=http 1=tcp 2=grpc")
    private Integer loadType;

    @ApiModelProperty(value = "服务名称 6-128 数字字母下划线")
    private String serviceName;

    @ApiModelProperty(value = "服务描述")
    private String serviceDesc;

    private ServiceTcpRule serviceTcpRule;
    private ServiceGrpcRule serviceGrpcRule;
    private ServiceHttpRule serviceHttpRule;
    private ServiceLoadBalance serviceLoadBalance;
    private ServiceAccessControl serviceAccessControl;
}
