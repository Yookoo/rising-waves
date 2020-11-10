package com.waves.admin.sys.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.waves.admin.sys.controller.param.LoginParam;
import com.waves.admin.sys.controller.result.LoginResult;
import com.waves.admin.sys.entity.User;

/**
 * <p>
 * 用户信息表 服务类
 * </p>
 *
 * @author zhukaiyuan
 * @since 2020-06-26
 */
public interface UserService extends IService<User> {

    LoginResult login(LoginParam param);
}
