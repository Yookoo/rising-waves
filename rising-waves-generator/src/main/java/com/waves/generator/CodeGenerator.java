package com.waves.generator;

import com.baomidou.mybatisplus.core.exceptions.MybatisPlusException;
import com.baomidou.mybatisplus.core.toolkit.StringPool;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.generator.AutoGenerator;
import com.baomidou.mybatisplus.generator.InjectionConfig;
import com.baomidou.mybatisplus.generator.config.*;
import com.baomidou.mybatisplus.generator.config.po.TableInfo;
import com.baomidou.mybatisplus.generator.config.rules.NamingStrategy;
import com.baomidou.mybatisplus.generator.engine.FreemarkerTemplateEngine;
import com.waves.common.web.BaseController;
import com.waves.common.web.BaseEntity;

import java.util.*;

/**
 * <p>
 * 演示例子，执行 main 方法控制台输入模块表名回车自动生成对应项目目录中
 * </p>
 *
 * @author zhukaiyuan
 */

public class CodeGenerator {

	/**
	 * 基本包名
	 */
	private static final String BASE_PACKAGE = "com.waves.gateway";

	/**
	 * 作者
	 */
	private static final String AUTHOR_NAME = "不吃香菜9527";

	/**
	 * <p>
	 * 读取控制台内容
	 * </p>
	 */
	public static String scanner(String tip) {
		Scanner scanner = new Scanner(System.in);
		System.out.println("请输入" + tip + "：");
		if (scanner.hasNext()) {
			String ipt = scanner.next();
			if (StringUtils.isNotBlank(ipt)) {
				return ipt;
			}
		}
		throw new MybatisPlusException("请输入正确的" + tip + "！");
	}

	public static void main(String[] args) {
		// 代码生成器
		AutoGenerator mpg = new AutoGenerator();

		// 全局配置
		GlobalConfig gc = new GlobalConfig();
		String projectPath = System.getProperty("user.dir");
		gc.setOutputDir(projectPath + "/src/main/java");
		gc.setOpen(false);
		// 实体属性 Swagger2 注解
		gc.setSwagger2(true);
		gc.setAuthor(AUTHOR_NAME);
		// 修改Service接口的文件名，去掉前面的I
		gc.setServiceName("%sService");
		gc.setFileOverride(true);
		mpg.setGlobalConfig(gc);

		// 数据源配置
		DataSourceConfig dsc = new DataSourceConfig();
		dsc.setUrl("jdbc:mysql://localhost:3306/rw-gateway?useUnicode=true&useSSL=false&characterEncoding=utf8");
		dsc.setDriverName("com.mysql.cj.jdbc.Driver");
		dsc.setUsername("root");
		dsc.setPassword("root");
		// dsc.setSchemaName("public");
		// dsc.setUrl("jdbc:h2:mem:public;MODE=MYSQL;DATABASE_TO_UPPER=false;INIT=CREATE
		// SCHEMA IF NOT EXISTS public");
		// dsc.setDriverName("org.h2.Driver");
		// dsc.setUsername("sa");
		// dsc.setPassword("");
		mpg.setDataSource(dsc);

		// 包配置
		PackageConfig pc = new PackageConfig();
		pc.setModuleName(scanner("模块名"));
		pc.setParent(BASE_PACKAGE);
		mpg.setPackageInfo(pc);

		// 自定义配置
		InjectionConfig cfg = new InjectionConfig() {
			@Override
			public void initMap() {
				// to do nothing
				Map<String, Object> map = new HashMap<>();
				map.put("abc", this.getConfig().getGlobalConfig().getAuthor() + "-mp");
				this.setMap(map);
			}
		};

		// 如果模板引擎是 freemarker
		String templatePath = "/templates/mapper.xml.ftl";
		// 如果模板引擎是 velocity
		// String templatePath = "/templates/mapper.xml.vm";

		// 自定义输出配置
		List<FileOutConfig> focList = new ArrayList<>();
		// 自定义配置会被优先输出
		focList.add(new FileOutConfig(templatePath) {
			@Override
			public String outputFile(TableInfo tableInfo) {
				// 自定义输出文件名 ， 如果你 Entity 设置了前后缀、此处注意 xml 的名称会跟着发生变化！！
				return projectPath + "/src/main/resources/mapper/" + pc.getModuleName() + "/"
						+ tableInfo.getEntityName() + "Mapper" + StringPool.DOT_XML;
			}
		});
		cfg.setFileOutConfigList(focList);
		mpg.setCfg(cfg);

		// 配置模板
		TemplateConfig templateConfig = new TemplateConfig();

		// 配置自定义输出模板
		// 这里我没有使用这种方案，而是创建一个controller覆盖其默认模板
		// 指定自定义模板路径，注意不要带上.ftl/.vm, 会根据使用的模板引擎自动识别
		// templateConfig.setEntity("templates/entity2.java");
		// templateConfig.setService();
		// templateConfig.setController();

		templateConfig.setXml(null);
		mpg.setTemplate(templateConfig);

		// 策略配置
		StrategyConfig strategy = new StrategyConfig();
		strategy.setNaming(NamingStrategy.underline_to_camel);
		strategy.setColumnNaming(NamingStrategy.underline_to_camel);
		strategy.setSuperEntityClass(BaseEntity.class);
		strategy.setEntityLombokModel(true);
		strategy.setRestControllerStyle(true);
		// 公共父类
		strategy.setSuperControllerClass(BaseController.class);
		strategy.setInclude(scanner("表名，多个英文逗号分割").split(","));
		strategy.setControllerMappingHyphenStyle(true);
		strategy.setTablePrefix(pc.getModuleName() + "_");
		mpg.setStrategy(strategy);
		mpg.setTemplateEngine(new FreemarkerTemplateEngine());
		mpg.execute();
	}

}