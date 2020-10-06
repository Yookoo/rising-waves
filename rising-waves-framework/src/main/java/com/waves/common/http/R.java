package com.waves.common.http;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.MultiValueMap;

import java.util.Map;

public class R<T> extends ResponseEntity<T>{

	private Map<String, Object> extra;

	private String traceId;

	public R(HttpStatus status) {
		super(status);
	}

	public R(T body, HttpStatus status) {
		super(body, status);
	}

	public R(MultiValueMap<String, String> headers, HttpStatus status) {
		super(headers, status);
	}

	public R(T body, MultiValueMap<String, String> headers, HttpStatus status) {
		super(body, headers, status);
	}

	public String getTraceId() {
		return traceId;
	}

	public void setTraceId(String traceId) {
		this.traceId = traceId;
	}

	public Map<String, Object> getExtra() {
		return extra;
	}

	public void setExtra(Map<String, Object> extra) {
		this.extra = extra;
	}

}
