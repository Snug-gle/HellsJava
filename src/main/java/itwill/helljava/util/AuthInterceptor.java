package itwill.helljava.util;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;

import itwill.helljava.dto.Member;

public class AuthInterceptor implements HandlerInterceptor{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws IOException {
		// 1. handler 종류 확인
				// 우리가 관심 있는 것은 Controller에 있는 메서드이므로 HandlerMethod 타입인지 체크
				if( handler instanceof HandlerMethod == false ) {
					// return true이면  Controller에 있는 메서드가 아니므로, 그대로 컨트롤러로 진행
					return true;
				}

				// 2.형 변환
				HandlerMethod handlerMethod = (HandlerMethod)handler;
				
				// 3. @Auth 받아오기
				Auth auth = handlerMethod.getMethodAnnotation(Auth.class);
				Auth userRole = handlerMethod.getMethod().getDeclaringClass().getAnnotation(Auth.class);
				
				// 4. method와 class에 @Auth가 없는 경우, 즉 인증이 필요 없는 요청
				if( auth == null && userRole ==null ) {
					return true;
				}
				
				// 5. @Auth가 있는 경우이므로, 세션이 있는지 체크
				HttpSession session = request.getSession();
				if( session == null ) {
					// 로그인 화면으로 이동
					response.sendRedirect(request.getContextPath() + "/user/login/login_form");
					return false;
				}
				
				// 6. 세션이 존재하면 유효한 유저인지 확인
				Member authUser = (Member)session.getAttribute("loginUserinfo");
				if ( authUser == null ) {
					response.sendRedirect(request.getContextPath() + "/user/login/login_form");
					return false;
				}
				
				
				// 7. admin일 경우
				if( userRole != null) {
					String role=userRole.role().toString();
					if( "ADMIN".equals(role) ) {
						if( !(authUser.getMemberStatus() == 9) ){
							response.sendRedirect(request.getContextPath());
							return false;
						}
					}
				} else if(auth != null ){
					String role=auth.role().toString();
					if( "ADMIN".equals(role) ) {
						if( !(authUser.getMemberStatus() == 9) ){
							response.sendRedirect(request.getContextPath());
							return false;
						}
					}
				}

//				// 8. 트레이너일 경우
//				if( "TRAINER".equals(role) ) {
//					// 트레이너임을 알 수 있는 조건을 작성한다.
//					// ex) MemberStatus가 3이면 트레이너이다.
//					if( !(authUser.getMemberStatus() == 3) ){   //트레이너가 아니므로 return false
//						response.sendRedirect(request.getContextPath());
//						return false;
//					}
//				}
				
				// 8. 트레이너일 경우
				if( userRole != null) {
					String role=userRole.role().toString();
					if( "TRAINER".equals(role) ) {
						if( !(authUser.getMemberStatus() == 3) ){
							response.sendRedirect(request.getContextPath());
							return false;
						}
					}
				} else if(auth != null ){
					String role=auth.role().toString();
					if( "TRAINER".equals(role) ) {
						if( !(authUser.getMemberStatus() == 3) ){
							response.sendRedirect(request.getContextPath());
							return false;
						}
					}
				}
		
				
				// 9. 예비트레이너일 경우
				if( userRole != null) {
					String role=userRole.role().toString();
					if( "PRETRAINER".equals(role) ) {
						if( !(authUser.getMemberStatus() == 2) ){
							response.sendRedirect(request.getContextPath());
							return false;
						}
					}
				} else if(auth != null ){
					String role=auth.role().toString();
					if( "PRETRAINER".equals(role) ) {
						if( !(authUser.getMemberStatus() == 2) ){
							response.sendRedirect(request.getContextPath());
							return false;
						}
					}
				}
	
				
				// 10. 유저일 경우
				if( userRole != null) {
					String role=userRole.role().toString();
					if( "USER".equals(role) ) {
						if( !(authUser.getMemberStatus() == 1) ){
							response.sendRedirect(request.getContextPath());
							return false;
						}
					}
				} else if(auth != null ){
					String role=auth.role().toString();
					if( "USER".equals(role) ) {
						if( !(authUser.getMemberStatus() == 1) ){
							response.sendRedirect(request.getContextPath());
							return false;
						}
					}
				}
				
				// 11. 유저or 예비트레이너일 경우
				if( userRole != null) {
					String role=userRole.role().toString();
					if( "USERnPRETRAINER".equals(role) ) {
						if( !(authUser.getMemberStatus() == 1 || authUser.getMemberStatus() == 2 )) {
							response.sendRedirect(request.getContextPath());
							return false;
						}
					}
				} else if(auth != null ){
					String role=auth.role().toString();
					if( "USERnPRETRAINER".equals(role) ) {
						if( !(authUser.getMemberStatus() == 1 || authUser.getMemberStatus() == 2 )) {
							response.sendRedirect(request.getContextPath());
							return false;
						}
					}
				}

				// 사용예시 EX) 컨트롤러의 메소드 위 또는 클래스위에 @Auth or @Auth(role=Role.ADMIN) or @Auth(role=Role.TRAINER) 등으로 사용
				// 10. 접근허가, 즉 메서드를 실행하도록 함
				return true;
			}

}
