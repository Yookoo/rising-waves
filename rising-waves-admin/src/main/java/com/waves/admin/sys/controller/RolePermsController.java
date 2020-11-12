package com.waves.admin.sys.controller;

import com.waves.admin.sys.entity.RolePerms;
import com.waves.admin.sys.service.RolePermsService;
import com.waves.common.web.controller.BaseController;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 角色和菜单关联表 前端控制器
 * </p>
 *
 * @author 不吃香菜9527
 * @since 2020-11-12
 */
@RestController
@RequestMapping("/sys/role-permss")
public class RolePermsController extends BaseController<RolePerms, RolePermsService> {

}
