package com.waves.admin.sys.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.waves.common.web.BaseEntity;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 角色和菜单关联表
 * </p>
 *
 * @author 不吃香菜9527
 * @since 2020-11-12
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("sys_role_perms")
@ApiModel(value="RolePerms对象", description="角色和菜单关联表")
public class RolePerms extends BaseEntity {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "角色ID")
    private Long roleId;

    @ApiModelProperty(value = "菜单ID")
    private Long permsId;


}
