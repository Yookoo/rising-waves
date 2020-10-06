package com.waves.common.handler;


import com.baomidou.mybatisplus.extension.api.R;
import com.waves.common.exception.BaseException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

/**
 * 统一的异常处理
 *
 * @author zhu
 */
@Slf4j
@RestControllerAdvice
public class GlobalExceptionHandler {

	/**
	 * @param e
	 * @return
	 * @valid 参数校验异常处理
	 */
	@ExceptionHandler(MethodArgumentNotValidException.class)
	public R<String> validationMethodArgumentNotValidException(MethodArgumentNotValidException e) {
		BindingResult bindingResult = e.getBindingResult();
		if (bindingResult.hasErrors()) {
			List<ObjectError> allErrors = bindingResult.getAllErrors();
			List<String>      messages  = new ArrayList<>();
			allErrors.forEach(p -> {
				FieldError fieldError = (FieldError) p;
				log.error("参数格式错误：参数对象：{}；字段：{}；错误原因:{}", fieldError.getObjectName(), fieldError.getField(),
						fieldError.getDefaultMessage());
				messages.add(fieldError.getDefaultMessage());
			});
			return R.failed(String.join(",", messages));
		}
		return R.failed("参数格式错误");
	}

	@ExceptionHandler(ConstraintViolationException.class)
	public R<String> validationConstraintViolationException(ConstraintViolationException e) {
		Set<ConstraintViolation<?>> violations = e.getConstraintViolations();

		StringBuilder builder = new StringBuilder();
		for (ConstraintViolation violation : violations) {
			log.error("参数格式错误：错误原因:{}", violation.getPropertyPath().toString() + violation.getMessage());
			builder.append(violation.getMessage());
		}
		return R.failed("参数格式错误:" + builder.toString());
	}

	/**
	 * 全局异常处理
	 * @param e
	 * @return
	 */
	@ExceptionHandler(Exception.class)
	public R globalExceptionHandler(Exception e) {
		// MyBaseException自定义异常
		if (e instanceof BaseException) {
			// 自定义异常
			log.error("自定义异常", e);
			return R.failed(e.getMessage());
		}
		else {
			// 其他异常
			log.error("未知异常", e);
			// 给用户有好的提示（不能直接把异常信息传回前端）
			return R.failed("系统开小差了");
		}
	}

}