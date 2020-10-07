package com.waves.gateway.controller.res;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
public class AdminInfoRes {

	@ApiModelProperty(value = "id")
	private String id;

	@ApiModelProperty(value = "用户名")
	private String userName;

	@ApiModelProperty(value = "token")
	private String avtor;

}
