package com.waves.common.selector;

import org.springframework.context.annotation.ImportSelector;
import org.springframework.core.type.AnnotationMetadata;

public class GobalExeceptionHandlerImportSelector implements ImportSelector {

	/**
	 * @param annotationMetadata
	 * @return
	 */
	@Override
	public String[] selectImports(AnnotationMetadata annotationMetadata) {
		// 返回一个自定义类
		// 使用MyImportSelector导入MyConfiguration，而不是直接导入MyConfiguration
		// return new String[]{MyConfiguration.class.getName()};
		return null;
	}

}