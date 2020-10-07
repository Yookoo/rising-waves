package com.waves.gateway.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.waves.common.http.BaseEntity;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 栏目表
 * </p>
 *
 * @author 不吃香菜9527
 * @since 2020-07-11
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("cms_category")
@ApiModel(value = "Category对象", description = "栏目表")
public class Category extends BaseEntity {

	private static final long serialVersionUID = 1L;

	@ApiModelProperty(value = "父级编号")
	private Long parentId;

	@ApiModelProperty(value = "所有父级编号")
	private String parentIds;

	@ApiModelProperty(value = "层次级别")
	private Integer treeLevel;

	@ApiModelProperty(value = "是否是最末级（1是、0不是）")
	private Boolean treeLeaf;

	@ApiModelProperty(value = "站点编号")
	private Long siteId;

	@ApiModelProperty(value = "归属机构")
	private Long officeId;

	@ApiModelProperty(value = "栏目模块")
	private String module;

	@ApiModelProperty(value = "栏目名称")
	private String name;

	@ApiModelProperty(value = "栏目图片")
	private String image;

	@ApiModelProperty(value = "链接")
	private String href;

	@ApiModelProperty(value = "目标")
	private String target;

	@ApiModelProperty(value = "描述")
	private String description;

	@ApiModelProperty(value = "关键字")
	private String keywords;

	@ApiModelProperty(value = "排序（升序）")
	private Integer sort;

	@ApiModelProperty(value = "是否在导航中显示")
	private Boolean inMenu;

	@ApiModelProperty(value = "是否在分类页中显示列表")
	private Boolean inList;

	@ApiModelProperty(value = "展现方式")
	private Integer showModes;

	@ApiModelProperty(value = "是否允许评论")
	private Boolean allowComment;

	@ApiModelProperty(value = "是否需要审核")
	private Boolean isAudit;

	@ApiModelProperty(value = "自定义列表视图")
	private String customListView;

	@ApiModelProperty(value = "自定义内容视图")
	private String customContentView;

	@ApiModelProperty(value = "视图配置")
	private String viewConfig;

	@ApiModelProperty(value = "备注信息")
	private String remarks;

}
