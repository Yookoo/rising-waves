package com.waves.gateway.controller;

import com.waves.gateway.service.ServiceLoadBalanceService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.waves.common.http.BaseController;
import com.waves.gateway.entity.ServiceLoadBalance;

/**
 * <p>
 * 网关负载表 前端控制器
 * </p>
 *
 * @author 不吃香菜9527
 * @since 2020-10-06
 */
@RestController
@RequestMapping("/gateway/service-load-balances")
public class ServiceLoadBalanceController extends BaseController<ServiceLoadBalance, ServiceLoadBalanceService> {

}
