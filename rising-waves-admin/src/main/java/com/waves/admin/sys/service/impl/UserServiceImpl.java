package com.waves.admin.sys.service.impl;

import cn.hutool.core.convert.Convert;
import cn.hutool.core.util.IdUtil;
import cn.hutool.json.JSONUtil;
import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.waves.admin.sys.controller.param.LoginParam;
import com.waves.admin.sys.controller.result.LoginResult;
import com.waves.admin.sys.entity.User;
import com.waves.admin.sys.exception.UserException;
import com.waves.admin.sys.mapper.UserMapper;
import com.waves.admin.sys.service.UserService;
import com.waves.common.util.Sha256Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;


/**
 * <p>
 * 用户信息表 服务实现类
 * </p>
 *
 * @author zhukaiyuan
 * @since 2020-06-26
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {

    @Autowired
    private StringRedisTemplate stringRedisTemplate;

    @Override
    public LoginResult login(LoginParam param) {
        Wrapper<User> wrapper = Wrappers.<User>lambdaQuery()
                .eq(User::getUserName, param.getUserName());
        User user = baseMapper.selectOne(wrapper);
        if (user!=null){
            String sha256Password = user.getPassword();
            if (Sha256Util.getSHA256(param.getPassword()).equals(sha256Password)){
               return createSession(user);
            } else {
                throw new UserException("用户名或密码不正确");
            }
        } else {
            throw new UserException("用户名或密码不正确");
        }
    }

    private LoginResult createSession(User user) {
        String token = IdUtil.simpleUUID();
        stringRedisTemplate.opsForValue().set(token, JSONUtil.toJsonStr(user), 30*60*1000);
        LoginResult loginResult = Convert.convert(LoginResult.class, user);
        // TODO 查询角色 key
        loginResult.setToken(token);
        return loginResult;
    }
}
