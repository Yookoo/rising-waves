package com.waves.gateway.service.impl;

import com.waves.gateway.entity.ServiceInfo;
import com.waves.gateway.mapper.ServiceInfoMapper;
import com.waves.gateway.service.ServiceInfoService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 网关基本信息表 服务实现类
 * </p>
 *
 * @author 不吃香菜9527
 * @since 2020-10-06
 */
@Service
public class ServiceInfoServiceImpl extends ServiceImpl<ServiceInfoMapper, ServiceInfo> implements ServiceInfoService {

}
