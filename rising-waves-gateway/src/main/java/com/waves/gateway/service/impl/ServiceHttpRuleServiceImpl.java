package com.waves.gateway.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.waves.gateway.entity.ServiceHttpRule;
import com.waves.gateway.entity.ServiceGrpcRule;
import com.waves.gateway.entity.ServiceHttpRule;
import com.waves.gateway.mapper.ServiceHttpRuleMapper;
import com.waves.gateway.service.ServiceHttpRuleService;
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
public class ServiceHttpRuleServiceImpl extends ServiceImpl<ServiceHttpRuleMapper, ServiceHttpRule>
		implements ServiceHttpRuleService {
	@Override
	public ServiceHttpRule queryByServiceId(Long id) {
		LambdaQueryWrapper<ServiceHttpRule> wrapper = Wrappers.<ServiceHttpRule>lambdaQuery()
				.eq(ServiceHttpRule::getServiceId, id);
		return baseMapper.selectOne(wrapper);
	}
}
