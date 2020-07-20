package com.waves.common.web;

import com.baomidou.mybatisplus.annotation.*;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * @author zhukaiyuan
 */
@Getter
@Setter
public class BaseEntity implements Serializable {

	private static final long serialVersionUID = 1L;

	@TableId(value = "id", type = IdType.AUTO )
	@JsonProperty(access = JsonProperty.Access.READ_ONLY)
	@ApiModelProperty(hidden = true, example = "0")
	private Long id;

	@TableField(fill = FieldFill.INSERT)
	@JsonProperty(access = JsonProperty.Access.READ_ONLY)
	@ApiModelProperty(hidden = true)
	private LocalDateTime createTime;

	@TableField(fill = FieldFill.INSERT)
	@JsonProperty(access = JsonProperty.Access.READ_ONLY)
	@ApiModelProperty(hidden = true)
	private String createBy;

	@TableField(fill = FieldFill.INSERT_UPDATE)
	@JsonProperty(access = JsonProperty.Access.READ_ONLY)
	@ApiModelProperty(hidden = true)
	private LocalDateTime updateTime;

	@TableField(fill = FieldFill.INSERT_UPDATE)
	@JsonProperty(access = JsonProperty.Access.READ_ONLY)
	@ApiModelProperty(hidden = true)
	private String updateBy;

	@TableLogic
	@JsonProperty(access = JsonProperty.Access.READ_ONLY)
	@ApiModelProperty(hidden = true)
	private Boolean deleted;

	private String remark;

}
