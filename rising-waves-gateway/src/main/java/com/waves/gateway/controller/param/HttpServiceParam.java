package com.waves.gateway.controller.param;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

@Data
public class HttpServiceParam {


    private Long id;

    @NotNull
    @ApiModelProperty(value = "负载类型 0=http 1=tcp 2=grpc")
    private Integer loadType;
    @NotNull
    @Length(min = 6, max = 128)
    @Pattern(regexp = "^[a-zA-z0-9_]+$" ,message = "服务名称由数字字母下划线组成")
    @ApiModelProperty(value = "服务名称 6-128 数字字母下划线")
    private String serviceName;
    @Length(max = 255)
    @ApiModelProperty(value = "服务描述")
    private String serviceDesc;

    @ApiModelProperty(value = "服务id")
    private Long serviceId;

    @NotNull
    @ApiModelProperty(value = "匹配类型 0=url前缀url_prefix 1=域名domain ")
    private Integer ruleType;
    @NotNull
    @ApiModelProperty(value = "type=domain表示域名，type=url_prefix时表示url前缀")
    private String rule;
    @NotNull
    @ApiModelProperty(value = "支持https 1=支持")
    private Integer needHttps;
    @NotNull
    @ApiModelProperty(value = "启用strip_uri 1=启用")
    private Integer needStripUri;
    @NotNull
    @ApiModelProperty(value = "是否支持websocket 1=支持")
    private Integer needWebsocket;

    @ApiModelProperty(value = "url重写功能 格式：^/gatekeeper/test_service(.*) $1 多个逗号间隔")
    private String urlRewrite;
    @NotNull
    @NotBlank
    @ApiModelProperty(value = "header转换支持增加(add)、删除(del)、修改(edit) 格式: add headname headvalue 多个逗号间隔")
    private String headerTransfor;

    @NotNull
    @ApiModelProperty(value = "是否开启权限 1=开启")
    private Integer openAuth;

    @ApiModelProperty(value = "黑名单ip")
    private String blackList;

    @ApiModelProperty(value = "白名单ip")
    private String whiteList;
    @Min(0)
    @ApiModelProperty(value = "客户端ip限流")
    private Integer clientipFlowLimit;
    @Min(0)
    @ApiModelProperty(value = "服务端限流")
    private Integer serviceFlowLimit;
    @NotNull
    @ApiModelProperty(value = "轮询方式 0=random 1=round-robin 2=weight_round-robin 3=ip_hash")
    private Integer roundType;

    @NotNull
    @ApiModelProperty(value = "ip列表")
    @NotBlank
    private String ipList;
    @NotNull
    @ApiModelProperty(value = "权重列表")
    @NotBlank
    private String weightList;

    @ApiModelProperty(value = "禁用ip列表")
    private String forbidList;
    @Min(0)
    @ApiModelProperty(value = "建立连接超时, 单位s")
    private Integer upstreamConnectTimeout;
    @Min(0)
    @ApiModelProperty(value = "获取header超时, 单位s")
    private Integer upstreamHeaderTimeout;
    @Min(0)
    @ApiModelProperty(value = "链接最大空闲时间, 单位s")
    private Integer upstreamIdleTimeout;

    @Min(0)
    @ApiModelProperty(value = "最大空闲链接数")
    private Integer upstreamMaxIdle;

}
