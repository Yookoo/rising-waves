package com.waves.gateway.service.impl;

import com.waves.gateway.entity.ServiceAccessControl;
import com.waves.gateway.mapper.ServiceAccessControlMapper;
import com.waves.gateway.service.ServiceAccessControlService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 网关权限控制表 服务实现类
 * </p>
 *
 * @author 不吃香菜9527
 * @since 2020-10-06
 */
@Service
public class ServiceAccessControlServiceImpl extends ServiceImpl<ServiceAccessControlMapper, ServiceAccessControl> implements ServiceAccessControlService {

}
