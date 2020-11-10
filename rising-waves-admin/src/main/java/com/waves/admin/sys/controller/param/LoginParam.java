package com.waves.admin.sys.controller.param;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.NotNull;

@Data
public class LoginParam {
    @NotNull
    @Length(min = 4)
    @ApiModelProperty(value = "用户账号")
    private String userName;

    @ApiModelProperty(value = "密码")
    @NotNull
    @Length(min = 4)
    private String password;

    @ApiModelProperty(value = "记住我")
    private boolean rememberMe;
}
