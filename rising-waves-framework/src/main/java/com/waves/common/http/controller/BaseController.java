package com.waves.common.http.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.waves.common.http.BaseEntity;
import com.waves.common.http.R;
import org.springframework.beans.factory.annotation.Autowired;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import java.util.List;

/**
 * 通用请求处理
 *
 * @author zhukaiyuan
 * @since v1.0.0
 */
public class BaseController<T extends BaseEntity, S extends IService<T>> {

	@Resource
	HttpServletRequest request;

	@Autowired
	S service;
	/**
	 * 删除
	 * @param id {@code Long}
	 * @return {@link R}
	 */
	protected R remove(Long id) {
		return R.deleted(service.removeById(id));
	}

	/**
	 * 获取
	 * @param id {@code Long}
	 * @return {@link R}
	 */
	protected R get(Long id) {
		return R.ok(service.getById(id));
	}

	/**
	 * 修改
	 * @param entity 领域模型
	 * @return {@link R}
	 */

	protected R update(Long id, T entity) {
		// 业务逻辑
		entity.setId(id);
		return R.updated(service.updateById(entity));
	}

	/**
	 * 新增
	 * @param entity 领域模型
	 * @return {@link R}
	 */
	protected R create(T entity) {
		boolean created = service.save(entity);
		return R.created(created);
	}

	/**
	 * 分页
	 * @param num {@code int} 页码
	 * @param size {@code int} 笔数
	 * @return {@link R}
	 */
	protected R<IPage<T>> pages(int num, int size, T entity) {
		Page<T>               page         = new Page<>(num, size);
		LambdaQueryWrapper<T> queryWrapper = Wrappers.lambdaQuery(entity);
		IPage<T>              pageRes      = service.page(page, queryWrapper);
		return R.ok(pageRes);
	}

	/**
	 * 列表
	 * @return {@link R}
	 */
	protected R<List<T>> lists(T entity) {
		LambdaQueryWrapper<T> queryWrapper = Wrappers.lambdaQuery(entity);
		List<T>               list         = service.list(queryWrapper);
		return R.ok(list);
	}
}
