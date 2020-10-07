package com.waves.gateway.handler;

import com.waves.common.http.R;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.ConversionNotSupportedException;
import org.springframework.beans.TypeMismatchException;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.http.converter.HttpMessageNotWritableException;
import org.springframework.validation.BindException;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.HttpMediaTypeNotAcceptableException;
import org.springframework.web.HttpMediaTypeNotSupportedException;
import org.springframework.web.HttpRequestMethodNotSupportedException;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.MissingPathVariableException;
import org.springframework.web.bind.MissingServletRequestParameterException;
import org.springframework.web.bind.ServletRequestBindingException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.context.request.async.AsyncRequestTimeoutException;
import org.springframework.web.multipart.support.MissingServletRequestPartException;
import org.springframework.web.servlet.NoHandlerFoundException;

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
			List<String> messages = new ArrayList<>();
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
		for (ConstraintViolation<?> violation : violations) {
			log.error("参数格式错误：错误原因:{}", violation.getPropertyPath().toString() + violation.getMessage());
			builder.append(violation.getMessage());
		}
		return R.failed("参数格式错误:" + builder.toString());
	}

	/**
	 * 参数不合法
	 */
	@ExceptionHandler(IllegalArgumentException.class)
	public R illegalArgumentException(IllegalArgumentException e) {
		log.error("参数不合法:", e);
		return R.failed("参数不合法:" + e.getMessage());
	}

	/**
	 * Controller上一层相关异常
	 * @param e 异常
	 * @return 异常结果
	 */
	@ExceptionHandler({ NoHandlerFoundException.class, HttpMediaTypeNotSupportedException.class,
			MissingPathVariableException.class, MissingServletRequestParameterException.class,
			TypeMismatchException.class, HttpMessageNotReadableException.class, HttpMessageNotWritableException.class,
			HttpMediaTypeNotAcceptableException.class, ServletRequestBindingException.class,
			ConversionNotSupportedException.class, MissingServletRequestPartException.class,
			AsyncRequestTimeoutException.class })
	public ResponseEntity handleServletException(Exception e) {
		log.error(e.getMessage(), e);
		return ResponseEntity.badRequest().body(e.getMessage());
	}

	/**
	 * 参数绑定异常
	 * @param e 异常
	 * @return 异常结果
	 */
	@ExceptionHandler(value = BindException.class)
	@ResponseBody
	public ResponseEntity handleBindException(BindException e) {
		log.error("参数绑定校验异常", e);
		return ResponseEntity.badRequest().body(e.getBindingResult());
	}

	/**
	 * 请求方式不支持
	 */
	@ExceptionHandler({ HttpRequestMethodNotSupportedException.class })
	public R handleException(HttpRequestMethodNotSupportedException e) {
		log.error(e.getMessage(), e);
		return R.failed("不支持' " + e.getMethod() + "'请求");
	}

	/**
	 * 拦截未知的运行时异常
	 */
	@ExceptionHandler(RuntimeException.class)
	public R notFount(RuntimeException e) {
		log.error("运行时异常:", e);
		return R.failed("运行时异常:" + e.getMessage());
	}

	/**
	 * 全局异常处理
	 * @param e
	 * @return
	 */
	@ExceptionHandler(Exception.class)
	public R globalExceptionHandler(Exception e) {
		// 自定义异常
		log.error(e.getMessage(), e);
		return R.failed("服务器错误，请联系管理员");
	}

}