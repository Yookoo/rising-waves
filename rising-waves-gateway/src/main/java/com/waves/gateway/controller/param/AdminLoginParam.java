package com.waves.gateway.controller.param;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.NotNull;

@Data
@ApiModel(value = "管理员登录参数")
public class AdminLoginParam {

	@NotNull
	@Length(min = 4)
	@ApiModelProperty(value = "用户名", example = "admin")
	private String userName;

	@NotNull
	@Length(min = 4)
	@ApiModelProperty(value = "密码", example = "123456")
	private String password;

}
