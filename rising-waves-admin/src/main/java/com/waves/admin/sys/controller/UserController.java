package com.waves.admin.sys.controller;

import com.waves.admin.sys.controller.param.LoginParam;
import com.waves.admin.sys.controller.result.LoginResult;
import com.waves.admin.sys.entity.User;
import com.waves.admin.sys.service.UserService;
import com.waves.common.web.R;
import com.waves.common.web.controller.BaseController;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;

/**
 * <p>
 * 用户信息表 前端控制器
 * </p>
 *
 * @author zhukaiyuan
 * @since 2020-06-26
 */
@Validated
@RestController
@RequestMapping("/sys/users")
public class UserController extends BaseController<User, UserService> {


    @PostMapping("/login")
    public R<LoginResult> login(@Valid @RequestBody LoginParam param){
        LoginResult loginResult = this.service.login(param);
        return R.build(loginResult);
    }


}
