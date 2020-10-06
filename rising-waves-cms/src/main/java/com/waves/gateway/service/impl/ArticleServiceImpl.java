package com.waves.gateway.service.impl;

import com.waves.gateway.entity.Article;
import com.waves.gateway.mapper.ArticleMapper;
import com.waves.gateway.service.ArticleService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 文章表 服务实现类
 * </p>
 *
 * @author 不吃香菜9527
 * @since 2020-07-11
 */
@Service
public class ArticleServiceImpl extends ServiceImpl<ArticleMapper, Article> implements ArticleService {

}
