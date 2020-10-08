package com.waves.gateway.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.waves.gateway.controller.res.ServiceInfoRes;
import com.waves.gateway.entity.ServiceInfo;
import com.baomidou.mybatisplus.extension.service.IService;


/**
 * <p>
 * 网关基本信息表 服务类
 * </p>
 *
 * @author 不吃香菜9527
 * @since 2020-10-06
 */
public interface ServiceInfoService extends IService<ServiceInfo> {

    IPage<ServiceInfoRes> pageServiceList(Page<?> page, String keyword);
}
