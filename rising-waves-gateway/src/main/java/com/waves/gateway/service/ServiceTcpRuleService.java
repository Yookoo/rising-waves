package com.waves.gateway.service;

import com.waves.gateway.entity.ServiceTcpRule;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 网关路由匹配表 服务类
 * </p>
 *
 * @author 不吃香菜9527
 * @since 2020-10-06
 */
public interface ServiceTcpRuleService extends IService<ServiceTcpRule> {

    ServiceTcpRule queryByServiceId(Long id);
}
