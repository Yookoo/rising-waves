package com.waves.cms.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import java.time.LocalDateTime;
import com.waves.common.web.BaseEntity;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 文章表
 * </p>
 *
 * @author 不吃香菜9527
 * @since 2020-07-11
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("cms_article")
@ApiModel(value = "Article对象", description = "文章表")
public class Article extends BaseEntity {

	private static final long serialVersionUID = 1L;

	@ApiModelProperty(value = "栏目编号")
	private Long categoryId;

	@ApiModelProperty(value = "标题")
	private String title;

	@ApiModelProperty(value = "文章链接")
	private String link;

	@ApiModelProperty(value = "标题颜色")
	private String color;

	@ApiModelProperty(value = "文章图片")
	private String image;

	@ApiModelProperty(value = "关键字")
	private String keywords;

	@ApiModelProperty(value = "描述、摘要")
	private String description;

	@ApiModelProperty(value = "权重，越大越靠前")
	private Integer weight;

	@ApiModelProperty(value = "权重期限")
	private LocalDateTime weightDate;

	@ApiModelProperty(value = "点击数")
	private Integer hits;

	@ApiModelProperty(value = "推荐位，多选")
	private String posid;

	@ApiModelProperty(value = "自定义内容视图")
	private String customContentView;

	@ApiModelProperty(value = "视图配置")
	private String viewConfig;

	@ApiModelProperty(value = "备注信息")
	private String remarks;

	@ApiModelProperty(value = "状态(1发布2审核)")
	private Boolean status;

	@ApiModelProperty(value = "文章来源")
	private String copyfrom;

	@ApiModelProperty(value = "相关文章")
	private String relation;

	@ApiModelProperty(value = "是否允许评论")
	private Boolean allowComment;

	@ApiModelProperty(value = "文章正文")
	private Long contentId;

}
