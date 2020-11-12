package com.waves.gateway.handler;

import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.reflection.MetaObject;

import java.time.LocalDateTime;

/**
 * @author apple
 */
@Slf4j
public class GatewayMetaObjectHandler implements MetaObjectHandler {

	@Override
	public void insertFill(MetaObject metaObject) {
		log.info("start insert fill ..");
		this.strictInsertFill(metaObject, "createTime", LocalDateTime.class, LocalDateTime.now());

	}

	@Override
	public void updateFill(MetaObject metaObject) {
		log.info("start update fill ..");
		this.strictUpdateFill(metaObject, "updateTime", LocalDateTime.class, LocalDateTime.now());
	}

}