package com.waves.cms.service.impl;

import com.waves.cms.entity.Category;
import com.waves.cms.mapper.CategoryMapper;
import com.waves.cms.service.CategoryService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 栏目表 服务实现类
 * </p>
 *
 * @author 不吃香菜9527
 * @since 2020-07-11
 */
@Service
public class CategoryServiceImpl extends ServiceImpl<CategoryMapper, Category> implements CategoryService {

}
