# rising-waves
奔涌吧，后浪，我们在同一条奔涌的河流。
## 项目介绍
这是一个后端管理系统，项目命名借鉴了B站2020年五四青年节推出的演讲视频。
其中"后"寓意后端管理系统，"后浪"也希望我们年轻一代有更好的未来。当然，一分耕耘一分收获，
美好的未来也不是说说就能来的，还是要靠脚踏实地，一步一个脚印，所以有了本项目。
本项目参考了多个开源项目，一方面可以巩固我所学的知识，另一方面也可以给大家一个可参考的案例。
如果你觉得对你有帮助，请多多 Star ,谢谢大家支持。

### 技术栈

| 后端         |      |
| ------------ | ---- |
| SpringBoot   |      |
| MyBatis Plus |      |
| Maven        |      |

### Maven 插件介绍



## 快速开始

### 在本地运行本项目
本项目是一个春天启动应用程序建立使用Maven。可以生成 jar 文件并从命令行运行它：
```shell script
git clone https://github.com/Yookoo/rising-waves.git
cd rising-waves
mvn package
java -jar target/*.jar
```
然后，您可以在此处访问本项目：`http://localhost:8080/`


或者，您也可以直接使用 Spring Boot Maven 插件从 Maven 运行它。如果这样做，它会立即获取您在项目中所做的更改（对 Java 源文件的更改也需要编译 - 大多数人为此使用 IDE）：
`mvn spring-boot:run`


### 数据库配置
在其默认配置中, 使用的是内存中数据库 （H2），该数据库在启动时使用数据填充。h2 控制台在 `http://localhost:8080/h2-consolejdbc:h2:mem:testdb`，可以使用此 URL 查看数据库的内容。

如果需要持久数据库配置，为 MySql 提供了类似的设置。请注意，每当更改数据库类型时，都需要使用不同的配置文件运行应用：对于 MySql。`spring.profiles.active=mysql`

您可以在本地使用适用于操作系统的任何安装程序或 docker 启动 MySql：
```shell script
docker run -e MYSQL_USER=root -e MYSQL_PASSWORD=root -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=rising-waves -p 3306:3306 mysql:5.7.8
```
此处提供了进一步的文档。

## 帮助改进本项目

如果你发现一个错误 建议帮助改进本项目

我们的问题跟踪器可在此处获取：`https://github.com/Yookoo/rising-waves/issues`

### 先决条件

应在系统中安装以下项目：

- Java 8 或 更高
- git 命令行工具（`https://help.github.com/articles/set-up-git`)
- 选择您的 IDE： Eclipse（带 maven 插件）、STS、 IntelliJ IDEA、 VS Code

### 步骤：

 1. 在命令行上 `git clone https://github.com/Yookoo/rising-waves.git`
 2. 导入项目至 IDE
 3. 通过右键单击主类并选择 运行应用程序。
 4. 访问浏览器中的`http://localhost:8080`。


## 贡献
问题跟踪器是错误报告、功能请求和提交拉取请求的首选通道。

对于拉取请求，编辑器配置中提供了编辑器首选项，便于在常见文本编辑器中使用。阅读更多，并在https://editorconfig.org下载插件。如果您以前没有这样做，请填写并提交贡献者许可协议。

### 代码规范


## 许可证
rising-waves 示例应用程序发布在Apache 许可证2.0 版本下。