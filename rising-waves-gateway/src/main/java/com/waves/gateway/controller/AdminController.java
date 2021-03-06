package com.waves.gateway.controller;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.IdUtil;
import cn.hutool.json.JSONUtil;
import com.waves.common.web.R;
import com.waves.gateway.controller.param.AdminLoginParam;
import com.waves.gateway.controller.res.AdminInfoRes;
import com.waves.gateway.controller.res.AdminLoginRes;
import com.waves.gateway.service.AdminService;
import com.waves.gateway.util.RequestUtil;
import io.swagger.annotations.Api;
import lombok.extern.slf4j.Slf4j;
import org.hibernate.validator.constraints.Length;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.http.MediaType;
import org.springframework.util.Assert;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import com.waves.common.web.controller.BaseController;
import com.waves.gateway.entity.Admin;

import javax.validation.Valid;
import java.util.Collections;

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
@RequestMapping("/admins")
@Api("管理员")
@Validated
public class AdminController extends BaseController<Admin, AdminService> {

	@Autowired
	private AdminService adminService;

	@Autowired
	private ValueOperations<String, String> valueOperations;

	@PostMapping("/login")
	public R<AdminLoginRes> login(@Valid AdminLoginParam param) {

		Admin admin = adminService.login(param.getUserName(), param.getPassword());
		// 设置session
		String token = IdUtil.simpleUUID();
		AdminLoginRes adminLoginRes = BeanUtil.toBean(admin, AdminLoginRes.class);
		adminLoginRes.setToken(token);
		valueOperations.set(token, JSONUtil.toJsonStr(adminLoginRes));

		return R.ok(adminLoginRes);
	}

	@GetMapping("/info")
	public R<AdminInfoRes> info() {
		String token = RequestUtil.getAccessToken();
		String res = valueOperations.get(token);
		AdminInfoRes adminInfoRes = JSONUtil.toBean(res, AdminInfoRes.class);
		adminInfoRes.setAvatar("https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif");
		adminInfoRes.setRoles(Collections.singletonList("admin"));
		return R.ok(adminInfoRes);
	}

	@GetMapping("/logout")
	public R<AdminInfoRes> logout() {
		String token = RequestUtil.getAccessToken();
		Assert.notNull(token, "Token不存在");
		clearToken(token);
		return R.ok();
	}

	@PostMapping(value = "/passwd", consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
	public R<String> changePasswd(
			@Length(min = 4, message = "密码的长度不能小于4") @RequestParam("newPasswd") String newPasswd) {
		String token = RequestUtil.getAccessToken();
		String res = valueOperations.get(token);
		AdminLoginRes adminLoginRes = JSONUtil.toBean(res, AdminLoginRes.class);
		Assert.notNull(adminLoginRes, "用户不存在");

		adminService.changePasswd(adminLoginRes.getUserName(), newPasswd);
		// 清空token
		clearToken(token);
		return R.ok();
	}

	private void clearToken(String token) {
		valueOperations.getOperations().delete(token);
	}

}
