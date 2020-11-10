package com.waves.gateway.controller;

import com.waves.gateway.entity.Comment;
import com.waves.gateway.service.CommentService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.waves.common.web.controller.BaseController;

/**
 * <p>
 * 评论表 前端控制器
 * </p>
 *
 * @author 不吃香菜9527
 * @since 2020-07-11
 */
@RestController
@RequestMapping("/cms/comments")
public class CommentController extends BaseController<Comment, CommentService> {

}
