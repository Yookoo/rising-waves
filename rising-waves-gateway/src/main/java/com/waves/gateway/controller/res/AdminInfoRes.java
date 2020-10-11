package com.waves.gateway.controller.res;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.List;

@Data
public class AdminInfoRes {

	@ApiModelProperty(value = "id")
	private String id;

	@ApiModelProperty(value = "用户名")
	private String userName;

	@ApiModelProperty(value = "头像")
	private String avatar;

	@ApiModelProperty(value = "角色")
	private List<String> roles;

}
