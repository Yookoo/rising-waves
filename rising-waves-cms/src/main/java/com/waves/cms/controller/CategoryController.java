package com.waves.cms.controller;

import com.waves.cms.entity.Category;
import com.waves.cms.service.CategoryService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.waves.common.web.BaseController;

/**
 * <p>
 * 栏目表 前端控制器
 * </p>
 *
 * @author 不吃香菜9527
 * @since 2020-07-11
 */
@RestController
@RequestMapping("/cms/categorys")
public class CategoryController extends BaseController<Category, CategoryService> {

}
