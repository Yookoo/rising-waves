package com.waves.gateway.controller;

import com.waves.gateway.service.AdminService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.waves.common.web.BaseController;
import com.waves.gateway.entity.Admin;

/**
 * <p>
 * 管理员表 前端控制器
 * </p>
 *
 * @author 不吃香菜9527
 * @since 2020-10-06
 */
@RestController
@RequestMapping("/gateway/admins")
public class AdminController extends BaseController<Admin, AdminService> {

}
