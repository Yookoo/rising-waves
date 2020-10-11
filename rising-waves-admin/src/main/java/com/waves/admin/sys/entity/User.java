package com.waves.admin.sys.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.waves.common.http.BaseEntity;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.time.LocalDateTime;

/**
 * <p>
 * 用户信息表
 * </p>
 *
 * @author zhukaiyuan
 * @since 2020-06-26
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("sys_user")
@ApiModel(value = "User对象", description = "用户信息表")
public class User extends BaseEntity {

	private static final long serialVersionUID = 1L;

	@ApiModelProperty(value = "部门ID")
	private Long deptId;

	@ApiModelProperty(value = "用户账号")
	private String userName;

	@ApiModelProperty(value = "用户昵称")
	private String nickName;

	@ApiModelProperty(value = "用户邮箱")
	private String email;

	@ApiModelProperty(value = "手机号码")
	private String telephone;

	@ApiModelProperty(value = "头像地址")
	private String avatar;

	@ApiModelProperty(value = "密码")
	@JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
	private String password;

	@ApiModelProperty(value = "帐号状态（0正常 1停用）", hidden = true)
	@JsonProperty(access = JsonProperty.Access.READ_ONLY)
	private Integer status;

	@ApiModelProperty(value = "最后登陆IP", hidden = true)
	@JsonProperty(access = JsonProperty.Access.READ_ONLY)
	private String lastLoginIp;

	@ApiModelProperty(value = "最后登陆时间", hidden = true)
	@JsonProperty(access = JsonProperty.Access.READ_ONLY)
	private LocalDateTime lastLoginTime;

}
