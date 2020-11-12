package com.waves.admin.sys.controller;

import com.waves.admin.sys.entity.Perms;
import com.waves.admin.sys.service.PermsService;
import com.waves.common.web.controller.BaseController;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 菜单权限表 前端控制器
 * </p>
 *
 * @author 不吃香菜9527
 * @since 2020-11-12
 */
@RestController
@RequestMapping("/sys/permss")
public class PermsController extends BaseController<Perms, PermsService> {

}
