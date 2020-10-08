package com.waves.gateway.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.waves.common.http.R;
import com.waves.gateway.controller.res.ServiceInfoRes;
import com.waves.gateway.service.ServiceInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.waves.common.http.controller.BaseController;
import com.waves.gateway.entity.ServiceInfo;

/**
 * <p>
 * 网关基本信息表 前端控制器
 * </p>
 *
 * @author 不吃香菜9527
 * @since 2020-10-06
 */
@RestController
@RequestMapping("/service-infos")
public class ServiceInfoController extends BaseController<ServiceInfo, ServiceInfoService> {
    @Autowired
    private ServiceInfoService serviceInfoService;
    /**
     *
     */
    /**
     * 分页
     * @param num {@code int} 页码
     * @param size {@code int} 笔数
     * @return {@link R}
     */
    @GetMapping("list/{num}/{size}")
    public R<IPage<ServiceInfoRes>> list(@PathVariable int num,@PathVariable int size,@RequestParam(required = false) String keyword) {
        IPage<ServiceInfoRes> serviceInfoRes = serviceInfoService.pageServiceList(new Page<>(num, size), keyword);
        return R.ok(serviceInfoRes);
    }
}
