package com.waves.gateway.service.impl;

import com.waves.gateway.entity.ServiceLoadBalance;
import com.waves.gateway.mapper.ServiceLoadBalanceMapper;
import com.waves.gateway.service.ServiceLoadBalanceService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 网关负载表 服务实现类
 * </p>
 *
 * @author 不吃香菜9527
 * @since 2020-10-06
 */
@Service
public class ServiceLoadBalanceServiceImpl extends ServiceImpl<ServiceLoadBalanceMapper, ServiceLoadBalance> implements ServiceLoadBalanceService {

}
