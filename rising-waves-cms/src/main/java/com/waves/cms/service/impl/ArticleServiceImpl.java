package com.waves.cms.service.impl;

import com.waves.cms.entity.Article;
import com.waves.cms.mapper.ArticleMapper;
import com.waves.cms.service.ArticleService;
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
