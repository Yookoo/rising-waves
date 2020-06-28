package com.waves.common.web;

import com.baomidou.mybatisplus.annotation.*;
import com.fasterxml.jackson.annotation.JsonIgnore;
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

    @TableId(value = "id", type = IdType.AUTO)
    @JsonIgnore
    private Long id;

    @TableField(fill = FieldFill.INSERT)
    @JsonIgnore
    private LocalDateTime createTime;

    @TableField(fill = FieldFill.INSERT)
    @JsonIgnore
    private String createBy;

    @TableField(fill = FieldFill.INSERT_UPDATE)
    @JsonIgnore
    private LocalDateTime updateTime;

    @TableField(fill = FieldFill.INSERT_UPDATE)
    @JsonIgnore
    private String updateBy;

    @TableLogic
    @JsonIgnore
    private Boolean deleted;

    private String remark;

}
