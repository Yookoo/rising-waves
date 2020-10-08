package com.waves.common.http;

import lombok.Data;
import org.slf4j.MDC;
import org.springframework.util.StringUtils;

import java.util.HashMap;
import java.util.Map;

import static com.waves.common.http.WebConstants.*;
import static com.waves.common.http.WebConstants.UPDATED_FAILURE;

@Data
public class R<T> {

	private long code;

	private T data;

	private String msg;

	private Map<String, Object> extra;

	private String traceId;
	// 构造方法
	public R() {}

	public R(long code, T data, String msg) {
		this.code = code;
		this.data = data;
		this.msg = msg;
		this.traceId = MDC.get(WebConstants.LOG_TRACE_ID);
	}

	public static <T> R<T> ok(T data) {
		return new R<T>(Type.SUCCESS.value, data, OPTIONED_SUCCESS);
	}
	public static <T> R<T> ok(String msg) {
		return new R<T>(Type.SUCCESS.value, null, msg);
	}
	public static <T> R<T> ok() {
		return new R<T>(Type.SUCCESS.value, null, OPTIONED_SUCCESS);
	}

	public static <T> R<T> failed(String msg) {
		return new R<T>(Type.ERROR.value, null, msg);
	}

	public static <T> R<T> failed(long errorCode) {
		return new R<T>(errorCode, null, OPTIONED_FAILURE);
	}

	public static <T> R<T> failed(long errorCode, String msg) {
		return new R<T>(errorCode, null, msg);
	}


    public R<T> put(String key, Object value) {
		if (StringUtils.isEmpty(key) || value == null) {
			throw new IllegalArgumentException("R的键或值不能为null");
		}
		if (extra == null) {
			extra = new HashMap<>();
		}
		extra.put(key, value);
		return this;
	}

	public R<T> put(Map<String, Object> extraMap) {
		if (extraMap == null) {
			throw new IllegalArgumentException("extraMap不能为null");
		}
		if (extra == null) {
			extra = new HashMap<>();
		}
		extra.putAll(extraMap);
		return this;
	}

	/**
	 *
	 * @param b true 表示R.ok false 表示 R.faild
	 * @param <T>
	 * @return
	 */
	public static <T> R<T> build(boolean b){
		return b ? R.ok(OPTIONED_SUCCESS) :R.failed(OPTIONED_FAILURE);
	}
	public static <T> R<T> created(boolean b){
		return b ? R.ok(CREATED_SUCCESS) :R.failed(CREATED_FAILURE);
	}
	public static <T> R<T> updated(boolean b){
		return b ? R.ok(UPDATED_SUCCESS) :R.failed(UPDATED_FAILURE);
	}
	public static <T> R<T> deleted(boolean b){
		return b ? R.ok(DELETED_SUCCESS) :R.failed(DELETED_FAILURE);
	}
	/**
	 * 功能描述: 判断是否传入值是否为空,非空则返回值，为空则返回失败信息
	 *
	 * @auther: zhukaiyuan
	 * @param: 返回的错误信息
	 * @return: Result<T>
	 * @date: 2018/4/21
	 */
	public static <T> R<T> build(T data){
		return data != null ? R.ok(data) :R.failed(OPTIONED_FAILURE);
	}


	public enum Type {

		/** 成功 */
		SUCCESS(200),
		/** 警告 */
		WARN(301),
		/** 错误 */
		ERROR(500);

		private final int value;

		Type(int value) {
			this.value = value;
		}

		public int value() {
			return this.value;
		}

	}

}
