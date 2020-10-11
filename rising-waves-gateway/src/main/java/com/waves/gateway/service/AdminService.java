package com.waves.gateway.service;

import com.waves.gateway.entity.Admin;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 管理员表 服务类
 * </p>
 *
 * @author 不吃香菜9527
 * @since 2020-10-06
 */
public interface AdminService extends IService<Admin> {

	void changePasswd(String userName, String newPasswd);

	Admin login(String userName, String password);

	Admin queryByUserName(String userName);

}
