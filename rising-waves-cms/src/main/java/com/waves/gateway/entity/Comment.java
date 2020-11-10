package com.waves.gateway.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import java.time.LocalDateTime;
import com.waves.common.web.BaseEntity;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 评论表
 * </p>
 *
 * @author 不吃香菜9527
 * @since 2020-07-11
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("cms_comment")
@ApiModel(value = "Comment对象", description = "评论表")
public class Comment extends BaseEntity {

	private static final long serialVersionUID = 1L;

	@ApiModelProperty(value = "栏目编号")
	private Long categoryId;

	@ApiModelProperty(value = "栏目内容的编号")
	private Long contentId;

	@ApiModelProperty(value = "栏目内容的标题")
	private String title;

	@ApiModelProperty(value = "评论内容")
	private String content;

	@ApiModelProperty(value = "评论姓名")
	private String name;

	@ApiModelProperty(value = "评论IP")
	private String ip;

	@ApiModelProperty(value = "审核人")
	private String auditUserId;

	@ApiModelProperty(value = "审核时间")
	private LocalDateTime auditTime;

	@ApiModelProperty(value = "备注信息")
	private String remarks;

}
