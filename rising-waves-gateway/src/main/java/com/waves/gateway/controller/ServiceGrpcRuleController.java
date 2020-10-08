package com.waves.gateway.controller;

import com.waves.gateway.service.ServiceGrpcRuleService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.waves.common.http.controller.BaseController;
import com.waves.gateway.entity.ServiceGrpcRule;

/**
 * <p>
 * 网关路由匹配表 前端控制器
 * </p>
 *
 * @author 不吃香菜9527
 * @since 2020-10-06
 */
@RestController
@RequestMapping("/gateway/service-grpc-rules")
public class ServiceGrpcRuleController extends BaseController<ServiceGrpcRule, ServiceGrpcRuleService> {

}
