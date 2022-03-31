package itwill.helljava.controller;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

// 예외 처리 컨트롤러
@ControllerAdvice
public class ExceptionController {

	@ExceptionHandler(value = Exception.class)
	public String exceptionHandler(Exception exception) {
		exception.printStackTrace();
		return ""; // 에러페이지 뷰네임 반환
	}

}
