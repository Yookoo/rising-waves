package com.waves.admin.sys.controller;


import com.baomidou.mybatisplus.extension.service.IService;
import com.waves.admin.sys.entity.User;
import com.waves.common.web.BaseController;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 用户表 前端控制器
 * </p>
 *
 * @author zhukaiyuan
 * @since 2020-06-23
 */
@RestController
@RequestMapping("/sys/users")
public class UserController extends BaseController<User, IService<User>> {

}
