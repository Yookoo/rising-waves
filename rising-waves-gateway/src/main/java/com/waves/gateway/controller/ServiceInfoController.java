package com.waves.gateway.controller;

import cn.hutool.core.net.NetUtil;
import cn.hutool.core.util.ReUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.core.util.URLUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.waves.common.http.R;
import com.waves.gateway.controller.param.GrpcServiceParam;
import com.waves.gateway.controller.param.HttpServiceParam;
import com.waves.gateway.controller.param.TcpServiceParam;
import com.waves.gateway.controller.res.ServiceInfoRes;
import com.waves.gateway.entity.ServiceHttpRule;
import com.waves.gateway.service.ServiceHttpRuleService;
import com.waves.gateway.service.ServiceInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import com.waves.common.http.controller.BaseController;
import com.waves.gateway.entity.ServiceInfo;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;

/**
 * <p>
 * 网关基本信息表 前端控制器
 * </p>
 *
 * @author 不吃香菜9527
 * @since 2020-10-06
 */
@RestController
@RequestMapping("/service-infos")
@Validated
public class ServiceInfoController extends BaseController<ServiceInfo, ServiceInfoService> {

	@Autowired
	private ServiceInfoService serviceInfoService;

	@Autowired
	private ServiceHttpRuleService serviceHttpRuleService;

	/**
	 *
	 */
	/**
	 * 分页
	 * @param num {@code int} 页码
	 * @param size {@code int} 笔数
	 * @return {@link R}
	 */
	@GetMapping("list/{num}/{size}")
	public R<IPage<ServiceInfoRes>> list(@PathVariable int num, @PathVariable int size,
			@RequestParam(required = false) String keyword) {
		IPage<ServiceInfoRes> serviceInfoRes = serviceInfoService.pageServiceList(new Page<>(num, size), keyword);
		return R.ok(serviceInfoRes);
	}

	/**
	 * 删除
	 * @param id {@code Long}
	 * @return {@link R}
	 */
	@Override
	@DeleteMapping("{id}")
	public R remove(@PathVariable Long id) {
		return super.remove(id);
	}

	/**
	 * 新增 HTTP 服务
	 * @param param 领域模型
	 * @return {@link R}
	 */
	@PostMapping("http")
	public R createHttp(@Valid HttpServiceParam param) {
		// 校验参数
		validHttpServiceParam(param);

		return R.created(serviceInfoService.saveHttp(param));
	}

	/**
	 * 新增 HTTP 服务
	 * @param param 领域模型
	 * @return {@link R}
	 */
	@PostMapping("tcp")
	public R createTcp(@Valid @RequestBody TcpServiceParam param) {

		return R.created(serviceInfoService.saveTcp(param));
	}

	/**
	 * 新增 HTTP 服务
	 * @param param 领域模型
	 * @return {@link R}
	 */
	@PostMapping("grpc")

	public R createGrpc(@Valid @RequestBody GrpcServiceParam param) {

		return R.created(serviceInfoService.saveGrpc(param));
	}

	private void validHttpServiceParam(@Valid HttpServiceParam param) {
		validHeaderTransfor(param.getHeaderTransfor());
		validRule(param.getRuleType(), param.getRule());
		validIpList(param.getIpList());
		validWeightList(param.getWeightList());
		validIpListAndWeightListLength(param.getIpList(), param.getWeightList());
		uniqueServiceName(param.getServiceName());

	}

	private void validIpListAndWeightListLength(String ipList, String weightList) {
		if (!StringUtils.split(weightList, "\n").equals(StringUtils.split(ipList, "\n"))) {
			throw new IllegalArgumentException("IP列表和权重列表数量不相同");
		}
	}

	private void uniqueServiceName(String serviceName) {
		// 服务名唯一
		LambdaQueryWrapper<ServiceInfo> queryWrapper = Wrappers.<ServiceInfo>lambdaQuery()
				.eq(ServiceInfo::getServiceName, serviceName);
		ServiceInfo serviceInfo = serviceInfoService.getOne(queryWrapper);
		if (serviceInfo != null) {
			throw new IllegalArgumentException("服务已存在");
		}
	}

	private void validWeightList(String weightList) {
		String[] split1 = StringUtils.split(weightList, "\n");
		for (String s1 : split1) {
			if (ReUtil.isMatch("^\\d+$", s1)) {
				throw new IllegalArgumentException("WeightList规则不符合规范");
			}
		}
	}

	private void validIpList(String ipList) {
		String[] split1 = StringUtils.split(ipList, "\n");
		for (String s1 : split1) {
			if (ReUtil.isMatch("^\\S:\\d+$", s1)) {
				throw new IllegalArgumentException("IpList规则不符合规范");
			}
		}
	}

	private void validHeaderTransfor(String headerTransfor) {
		String[] split1 = StringUtils.split(headerTransfor, "\n");
		for (String s1 : split1) {
			String[] s2 = StringUtils.split(s1, " ");
			if (s2.length != 3) {
				throw new IllegalArgumentException("Header规则不符合规范");
			}
		}
	}

	private void validRule(Integer ruleType, String rule) {
		String[] split = StringUtils.split(rule, "\n");
		for (String s : split) {
			String[] s1 = StringUtils.split(s, " ");
			if (s1.length != 2) {
				throw new IllegalArgumentException("规则不符合规范");
			}
		}

		//
		// 服务名唯一
		LambdaQueryWrapper<ServiceHttpRule> queryWrapper = Wrappers.<ServiceHttpRule>lambdaQuery()
				.eq(ServiceHttpRule::getRule, rule).eq(ServiceHttpRule::getRuleType, ruleType);
		ServiceHttpRule serviceHttpRule = serviceHttpRuleService.getOne(queryWrapper);
		if (serviceHttpRule != null) {
			throw new IllegalArgumentException("服务接入前缀或域名已存在");
		}
	}

}
