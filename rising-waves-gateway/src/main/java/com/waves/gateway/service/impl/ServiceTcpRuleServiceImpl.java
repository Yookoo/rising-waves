package com.waves.gateway.service.impl;

import com.waves.gateway.entity.ServiceTcpRule;
import com.waves.gateway.mapper.ServiceTcpRuleMapper;
import com.waves.gateway.service.ServiceTcpRuleService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 网关路由匹配表 服务实现类
 * </p>
 *
 * @author 不吃香菜9527
 * @since 2020-10-06
 */
@Service
public class ServiceTcpRuleServiceImpl extends ServiceImpl<ServiceTcpRuleMapper, ServiceTcpRule>
		implements ServiceTcpRuleService {

}
