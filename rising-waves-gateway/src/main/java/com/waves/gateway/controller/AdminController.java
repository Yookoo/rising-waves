package com.waves.gateway.controller;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.convert.impl.BeanConverter;
import cn.hutool.core.convert.impl.UUIDConverter;
import cn.hutool.core.lang.UUID;
import cn.hutool.core.util.IdUtil;
import cn.hutool.json.JSON;
import cn.hutool.json.JSONUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.waves.common.http.R;
import com.waves.common.util.Sha256Util;
import com.waves.gateway.controller.param.AdminLoginParam;
import com.waves.gateway.controller.res.AdminLoginRes;
import com.waves.gateway.service.AdminService;
import io.netty.util.internal.StringUtil;
import io.swagger.annotations.Api;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.http.ResponseEntity;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.waves.common.http.BaseController;
import com.waves.gateway.entity.Admin;
import springfox.documentation.spring.web.json.Json;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

/**
 * <p>
 * 管理员表 前端控制器
 * </p>
 *
 * @author 不吃香菜9527
 * @since 2020-10-06
 */
@Slf4j
@RestController
@RequestMapping("/gateway/admins")
@Api("管理员")
public class AdminController extends BaseController<Admin, AdminService> {

	@Autowired
	private AdminService adminService;

	@Autowired
	private ValueOperations<String, String> valueOperations;

	@PostMapping("/login")
	public R<AdminLoginRes> login(@Valid AdminLoginParam param) {
		LambdaQueryWrapper<Admin> queryWrapper = Wrappers.<Admin>lambdaQuery().eq(Admin::getUserName,
				param.getUserName());
		Admin admin = adminService.getOne(queryWrapper);
		Assert.notNull(admin, "用户名不存在");
		// 校验密码
		Assert.isTrue(vertifyPassword(param.getPassword() + admin.getSalt(), admin.getPassword()), "用户名密码错误");

		// 设置session
		String token = IdUtil.simpleUUID();
		AdminLoginRes adminLoginRes = BeanUtil.toBean(admin, AdminLoginRes.class);
		adminLoginRes.setToken(token);
		valueOperations.set(token, JSONUtil.toJsonStr(adminLoginRes));

		return R.ok(adminLoginRes);
	}

	@GetMapping("/info")
	public R<String> info(String token) {
		Assert.notNull(token, "Token不存在");
		String res = valueOperations.get(token);
		return R.ok(res);
	}

	/**
	 * 校验密码
	 * @param password
	 * @param saltPassword
	 * @return
	 */
	private boolean vertifyPassword(String password, String saltPassword) {
		String sha256 = Sha256Util.getSHA256(password);
		log.info(sha256);
		return sha256.equals(saltPassword);
	}

}
