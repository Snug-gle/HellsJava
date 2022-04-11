package itwill.helljava.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.core.MethodParameter;
import org.springframework.web.bind.support.WebArgumentResolver;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;

import itwill.helljava.dto.Member;

public class AuthUserHandlerMethodArgumentResolver implements HandlerMethodArgumentResolver{

	@Override
	public Object resolveArgument(MethodParameter parameter, ModelAndViewContainer mavContainer,
			NativeWebRequest webRequest, WebDataBinderFactory binderFactory) throws Exception {
		// TODO Auto-generated method stub
		// 1. 파라미터에 @AuthUser가 붙어 있는지 , 타입이 Member인지 확인 
				if( supportsParameter(parameter) == false ) {
					// 내가 해석할 수 있는 파라미터가 아니다.
					return WebArgumentResolver.UNRESOLVED;
				}
				
				// 5. 여기까지 진행이 되었다면, @AuthUser가 붙어있고 타입이 UserVO인 경우이다.
				HttpServletRequest request = webRequest.getNativeRequest(HttpServletRequest.class);
				HttpSession session = request.getSession();
				if( session == null) {
					return null;
				}
				
				return session.getAttribute("loginUserinfo");
	}
	
	@Override
	public boolean supportsParameter(MethodParameter parameter) {
		// 2. @AuthUser가 붙어 있는지 확인
				AuthUser authUser = parameter.getParameterAnnotation(AuthUser.class);
				
				// 3. @AuthUser가 안붙어 있는 경우
				if( authUser == null ) {
					return false;
				}
				
				// 4. Member 타입이 아닌 경우
				if( parameter.getParameterType().equals(Member.class) == false) {
					return false;
				}
				
				return true;
	}
	
}
