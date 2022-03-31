package itwill.helljava.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import itwill.helljava.dto.Member;

public class AdminAuthInterceptor implements HandlerInterceptor{


	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		
		Member loginUserinfo = (Member)session.getAttribute("loginUserinfo");
		
		if(loginUserinfo == null || loginUserinfo.getMemberStatus() != 9) {
			throw new Exception();
		}
		
		return true;
	}
}
