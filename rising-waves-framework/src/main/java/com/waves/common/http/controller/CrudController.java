package com.waves.common.http.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.waves.common.http.BaseEntity;
import com.waves.common.http.R;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

public class CrudController<T extends BaseEntity, S extends IService<T>> extends BaseController<T, S >{
    /**
     * 删除
     *
     * @param id {@code Long}
     * @return {@link R}
     */
    @Override
    @DeleteMapping("{id}")
    public R<T> remove(@PathVariable Long id) {
        return super.remove(id);
    }

    /**
     * 获取
     *
     * @param id {@code Long}
     * @return {@link R}
     */
    @Override
    @GetMapping("/{id}")
    public R<T> get(@PathVariable Long id) {
        return super.get(id);
    }

    /**
     * 修改
     *
     * @param id
     * @param entity
     * @return {@link R}
     */
    @Override
    @PutMapping("/{id}")
    public R<T> update(@PathVariable Long id, @Valid @RequestBody T entity) {

        return super.update(id, entity);
    }

    /**
     * 新增
     *
     * @param entity 领域模型
     * @return {@link R}
     */
    @Override
    @PostMapping
    public R<T> create(@Valid @RequestBody T entity) {

        return super.create(entity);
    }

    /**
     * 分页
     *
     * @param num    {@code int} 页码
     * @param size   {@code int} 笔数
     * @param entity
     * @return {@link R}
     */
    @Override
    @GetMapping("pages/{num}/{size}")
    public R<IPage<T>> pages(@PathVariable int num, @PathVariable int size, @ModelAttribute T entity) {
            return super.pages(num, size, entity);
    }

    /**
     * 列表
     *
     * @param entity
     * @return {@link R}
     */
    @Override
    @GetMapping("lists")
    protected R<List<T>> lists(T entity) {
        return super.lists(entity);
    }
}
