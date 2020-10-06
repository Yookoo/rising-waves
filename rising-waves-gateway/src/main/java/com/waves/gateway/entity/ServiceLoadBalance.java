package com.waves.gateway.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.waves.common.web.BaseEntity;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 网关负载表
 * </p>
 *
 * @author 不吃香菜9527
 * @since 2020-10-06
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("gateway_service_load_balance")
@ApiModel(value="ServiceLoadBalance对象", description="网关负载表")
public class ServiceLoadBalance extends BaseEntity {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "服务id")
    private Long serviceId;

    @ApiModelProperty(value = "检查方法 0=tcpchk,检测端口是否握手成功")
    private Integer checkMethod;

    @ApiModelProperty(value = "check超时时间,单位s")
    private Integer checkTimeout;

    @ApiModelProperty(value = "检查间隔, 单位s")
    private Integer checkInterval;

    @ApiModelProperty(value = "轮询方式 0=random 1=round-robin 2=weight_round-robin 3=ip_hash")
    private Integer roundType;

    @ApiModelProperty(value = "ip列表")
    private String ipList;

    @ApiModelProperty(value = "权重列表")
    private String weightList;

    @ApiModelProperty(value = "禁用ip列表")
    private String forbidList;

    @ApiModelProperty(value = "建立连接超时, 单位s")
    private Integer upstreamConnectTimeout;

    @ApiModelProperty(value = "获取header超时, 单位s")
    private Integer upstreamHeaderTimeout;

    @ApiModelProperty(value = "链接最大空闲时间, 单位s")
    private Integer upstreamIdleTimeout;

    @ApiModelProperty(value = "最大空闲链接数")
    private Integer upstreamMaxIdle;


}
