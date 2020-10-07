package com.waves.gateway.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import java.time.LocalDateTime;
import com.waves.common.http.BaseEntity;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 管理员表
 * </p>
 *
 * @author 不吃香菜9527
 * @since 2020-10-06
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("gateway_admin")
@ApiModel(value = "Admin对象", description = "管理员表")
public class Admin extends BaseEntity {

	private static final long serialVersionUID = 1L;

	@ApiModelProperty(value = "用户名")
	private String userName;

	@ApiModelProperty(value = "盐")
	private String salt;

	@ApiModelProperty(value = "密码")
	private String password;

}
