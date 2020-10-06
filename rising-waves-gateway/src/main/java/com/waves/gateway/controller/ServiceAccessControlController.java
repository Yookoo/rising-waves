package com.waves.gateway.controller;

import com.waves.gateway.service.ServiceAccessControlService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.waves.common.web.BaseController;
import com.waves.gateway.entity.ServiceAccessControl;

/**
 * <p>
 * 网关权限控制表 前端控制器
 * </p>
 *
 * @author 不吃香菜9527
 * @since 2020-10-06
 */
@RestController
@RequestMapping("/gateway/service-access-controls")
public class ServiceAccessControlController extends BaseController<ServiceAccessControl, ServiceAccessControlService> {

}
