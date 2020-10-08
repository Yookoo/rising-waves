package com.waves.gateway.mapper;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.waves.gateway.controller.res.ServiceInfoRes;
import com.waves.gateway.domain.ServiceDetail;
import com.waves.gateway.entity.ServiceInfo;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * <p>
 * 网关基本信息表 Mapper 接口
 * </p>
 *
 * @author 不吃香菜9527
 * @since 2020-10-06
 */
public interface ServiceInfoMapper extends BaseMapper<ServiceInfo> {

    IPage<ServiceDetail> selectServiceList(Page page, String keyword);
}
