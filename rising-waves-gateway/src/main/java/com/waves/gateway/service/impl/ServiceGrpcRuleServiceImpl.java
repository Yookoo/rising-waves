package com.waves.gateway.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.waves.gateway.entity.ServiceGrpcRule;
import com.waves.gateway.entity.ServiceGrpcRule;
import com.waves.gateway.mapper.ServiceGrpcRuleMapper;
import com.waves.gateway.service.ServiceGrpcRuleService;
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
public class ServiceGrpcRuleServiceImpl extends ServiceImpl<ServiceGrpcRuleMapper, ServiceGrpcRule>
		implements ServiceGrpcRuleService {
	@Override
	public ServiceGrpcRule queryByServiceId(Long id) {
		LambdaQueryWrapper<ServiceGrpcRule> wrapper = Wrappers.<ServiceGrpcRule>lambdaQuery()
				.eq(ServiceGrpcRule::getServiceId, id);
		return baseMapper.selectOne(wrapper);
	}
}
