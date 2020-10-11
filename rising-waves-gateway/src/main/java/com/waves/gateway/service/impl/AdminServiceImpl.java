package com.waves.gateway.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.IdUtil;
import cn.hutool.json.JSONUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.waves.common.util.Sha256Util;
import com.waves.gateway.controller.res.AdminLoginRes;
import com.waves.gateway.entity.Admin;
import com.waves.gateway.mapper.AdminMapper;
import com.waves.gateway.service.AdminService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

/**
 * <p>
 * 管理员表 服务实现类
 * </p>
 *
 * @author 不吃香菜9527
 * @since 2020-10-06
 */
@Service
@Slf4j
public class AdminServiceImpl extends ServiceImpl<AdminMapper, Admin> implements AdminService {

	@Autowired
	private ValueOperations<String, String> valueOperations;

	/**
	 * 校验密码
	 * @param password
	 * @param saltPassword
	 * @return
	 */
	private boolean vertifyPassword(String password, String saltPassword) {
		String sha256 = Sha256Util.getSHA256(password);
		log.info("sha256:" + sha256);
		return sha256.equals(saltPassword);
	}

	@Override
	public void changePasswd(String userName, String newPasswd) {
		// 先查询用户数是否存在
		Admin admin = queryByUserName(userName);
		Assert.notNull(admin, "用户不存在");
		// 修改密码
		LambdaUpdateWrapper<Admin> updateWrapper = Wrappers.<Admin>lambdaUpdate().eq(Admin::getUserName, userName)
				.set(Admin::getPassword, Sha256Util.getSHA256(newPasswd + admin.getSalt()));
		Assert.isTrue(baseMapper.update(null, updateWrapper) > 0, "修改用户密码失败");

	}

	@Override
	public Admin login(String userName, String password) {

		Admin admin = queryByUserName(userName);
		Assert.notNull(admin, "用户名不存在");
		// 校验密码
		Assert.isTrue(vertifyPassword(password + admin.getSalt(), admin.getPassword()), "用户名或密码错误");
		return admin;
	}

	@Override
	public Admin queryByUserName(String userName) {
		LambdaQueryWrapper<Admin> queryWrapper = Wrappers.<Admin>lambdaQuery().eq(Admin::getUserName, userName);
		return baseMapper.selectOne(queryWrapper);
	}

}
