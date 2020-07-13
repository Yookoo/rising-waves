package com.waves.admin.sys.controller;

import com.waves.admin.sys.entity.User;
import com.waves.admin.sys.service.UserService;
import com.waves.common.web.BaseController;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 用户信息表 前端控制器
 * </p>
 *
 * @author zhukaiyuan
 * @since 2020-06-26
 */
@RestController
@RequestMapping("/sys/users")
public class UserController extends BaseController<User, UserService> {

}
