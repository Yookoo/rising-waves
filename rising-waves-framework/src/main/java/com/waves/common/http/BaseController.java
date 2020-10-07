package com.waves.common.http;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.net.URI;

/**
 * 通用请求处理
 *
 * @author zhukaiyuan
 * @since v1.0.0
 */
@SuppressWarnings("all")
public abstract class BaseController<T extends BaseEntity, S extends IService<T>> {

	@Resource
	protected HttpServletRequest request;

	@Autowired
	protected S service;

	/**
	 * 新增
	 * @param domain 领域模型
	 * @return {@link ResponseResult}
	 */
	@PostMapping
	public ResponseEntity create(@Valid @RequestBody T entity) {
		boolean created = service.save(entity);
		if (created) {
			URI uri = URI.create(request.getContextPath() + entity.getId());
			return ResponseEntity.created(uri).body(WebConstants.CREATED_SUCCESS);
		}
		return ResponseEntity.badRequest().body(WebConstants.CREATED_FAILURE);
	}

	/**
	 * 删除
	 * @param id {@code Long}
	 * @return {@link ResponseResult}
	 */
	@DeleteMapping("{id}")
	public ResponseEntity remove(@PathVariable Long id) {

		boolean deleted = service.removeById(id);
		if (deleted) {
			return ResponseEntity.status(HttpStatus.NO_CONTENT).body(WebConstants.DELETED_SUCCESS);
		}
		return ResponseEntity.status(HttpStatus.RESET_CONTENT).body(WebConstants.DELETED_FAILURE);
	}

	/**
	 * 修改
	 * @param domain 领域模型
	 * @return {@link ResponseResult}
	 */
	@PutMapping("/{id}")
	public ResponseEntity update(@PathVariable Long id, @Valid @RequestBody T entity) {
		// 业务逻辑
		entity.setId(id);
		boolean updated = service.updateById(entity);
		if (updated) {
			return ResponseEntity.ok(WebConstants.UPDATED_SUCCESS);
		}
		return ResponseEntity.status(HttpStatus.RESET_CONTENT).body(WebConstants.UPDATED_FAILURE);
	}

	/**
	 * 获取
	 * @param id {@code Long}
	 * @return {@link ResponseResult}
	 */
	@GetMapping("/{id}")
	public ResponseEntity get(@PathVariable Long id) {
		T domain = service.getById(id);
		return ResponseEntity.ok(domain);
	}

	/**
	 * 分页
	 * @param num {@code int} 页码
	 * @param size {@code int} 笔数
	 * @return {@link ResponseResult}
	 */
	@GetMapping("pages/{num}/{size}")
	public ResponseEntity pages(@PathVariable int num, @PathVariable int size, @ModelAttribute T entity) {
		Page<T> page = new Page<>(num, size);
		LambdaQueryWrapper<T> queryWrapper = Wrappers.lambdaQuery(entity);
		IPage<T> pageRes = service.page(page, queryWrapper);
		return ResponseEntity.ok(pageRes);
	}

}