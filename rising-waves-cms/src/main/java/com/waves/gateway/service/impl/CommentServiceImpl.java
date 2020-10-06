package com.waves.gateway.service.impl;

import com.waves.gateway.entity.Comment;
import com.waves.gateway.mapper.CommentMapper;
import com.waves.gateway.service.CommentService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 评论表 服务实现类
 * </p>
 *
 * @author 不吃香菜9527
 * @since 2020-07-11
 */
@Service
public class CommentServiceImpl extends ServiceImpl<CommentMapper, Comment> implements CommentService {

}
