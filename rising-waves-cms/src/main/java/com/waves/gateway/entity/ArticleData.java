package com.waves.gateway.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.waves.common.web.BaseEntity;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 文章详表
 * </p>
 *
 * @author 不吃香菜9527
 * @since 2020-07-11
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("cms_article_data")
@ApiModel(value = "ArticleData对象", description = "文章详表")
public class ArticleData extends BaseEntity {

	private static final long serialVersionUID = 1L;

	@ApiModelProperty(value = "文章内容")
	private String content;

}
