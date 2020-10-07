package com.waves.gateway.controller;

import com.waves.gateway.service.ServiceInfoService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.waves.common.http.BaseController;
import com.waves.gateway.entity.ServiceInfo;

/**
 * <p>
 * 网关基本信息表 前端控制器
 * </p>
 *
 * @author 不吃香菜9527
 * @since 2020-10-06
 */
@RestController
@RequestMapping("/gateway/service-infos")
public class ServiceInfoController extends BaseController<ServiceInfo, ServiceInfoService> {

}
