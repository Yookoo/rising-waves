package com.waves.admin.sys.controller;

import com.waves.admin.sys.entity.Role;
import com.waves.admin.sys.service.RoleService;
import com.waves.common.web.controller.BaseController;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 角色信息表 前端控制器
 * </p>
 *
 * @author 不吃香菜9527
 * @since 2020-11-12
 */
@RestController
@RequestMapping("/sys/roles")
public class RoleController extends BaseController<Role, RoleService> {

}
