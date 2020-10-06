package com.waves.cms.controller;

import com.waves.cms.entity.ArticleData;
import com.waves.cms.service.ArticleDataService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.waves.common.web.BaseController;

/**
 * <p>
 * 文章详表 前端控制器
 * </p>
 *
 * @author 不吃香菜9527
 * @since 2020-07-11
 */
@RestController
@RequestMapping("/cms/article-datas")
public class ArticleDataController extends BaseController<ArticleData, ArticleDataService> {

}
