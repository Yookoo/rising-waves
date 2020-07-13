# 使用Swagger测试Api



## 配置swagger



访问`http://localhost:8080/swagger-ui.html#`

## 增加分页过滤器

```
PaginationInterceptor
```

## 增加日期/操作人填充

```
MetaObjectHandler
```

## 增加逻辑删除

```
@TableLogic
```

## 优化实体属性显示

1、属性可以作为参数，但是不能返回；eg. password

2、属性可以作为返回值，但是不能作为参数; eg. createTime、LoginIp



解决方法：

1、通过Query、AO(Param)、VO 解决

2、通过 @JsonIgnore

3、通过自定义注解

4、通过@JsonPropertiy





