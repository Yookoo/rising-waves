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
@TableName("gateway_service_http_rule")
@ApiModel(value = "ServiceHttpRule对象", description = "网关路由匹配表")
public class ServiceHttpRule extends BaseEntity {

	private static final long serialVersionUID = 1L;

	@ApiModelProperty(value = "服务id")
	private Long serviceId;

	@ApiModelProperty(value = "匹配类型 0=url前缀url_prefix 1=域名domain ")
	private Integer ruleType;

	@ApiModelProperty(value = "type=domain表示域名，type=url_prefix时表示url前缀")
	private String rule;

	@ApiModelProperty(value = "支持https 1=支持")
	private Integer needHttps;

	@ApiModelProperty(value = "启用strip_uri 1=启用")
	private Integer needStripUri;

	@ApiModelProperty(value = "是否支持websocket 1=支持")
	private Integer needWebsocket;

	@ApiModelProperty(value = "url重写功能 格式：^/gatekeeper/test_service(.*) $1 多个逗号间隔")
	private String urlRewrite;

	@ApiModelProperty(value = "header转换支持增加(add)、删除(del)、修改(edit) 格式: add headname headvalue 多个逗号间隔")
	private String headerTransfor;

}
