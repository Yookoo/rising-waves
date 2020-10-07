package com.waves.gateway.controller;

import com.waves.gateway.entity.ArticleData;
import com.waves.gateway.service.ArticleDataService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.waves.common.http.BaseController;

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
