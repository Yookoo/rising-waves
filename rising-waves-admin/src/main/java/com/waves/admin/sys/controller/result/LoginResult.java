package com.waves.admin.sys.controller.result;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
public class LoginResult {

    @ApiModelProperty(value = "部门ID")
    private Long organId;

    @ApiModelProperty(value = "角色Key")
    private Long roleKey;

    @ApiModelProperty(value = "用户昵称")
    private String nickName;

    @ApiModelProperty(value = "头像地址")
    private String avatar;

    private String token;
}
