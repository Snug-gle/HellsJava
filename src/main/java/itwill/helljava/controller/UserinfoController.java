package itwill.helljava.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import itwill.helljava.dto.Member;

@Controller
public class UserinfoController {

	@RequestMapping(value = "/member/modify", method = RequestMethod.GET)
	public String md(@ModelAttribute Member member, HttpServletRequest reqeust) {
		
		String email = reqeust.getParameter("email1") + "@" + reqeust.getParameter("email2");
		
		if(reqeust.getParameter("email2").equals("direct")) {
			email = reqeust.getParameter("email1") + "@" + reqeust.getParameter("selboxDirect");
		}
		
		
		return "user/member_modify";
	}
	
	@RequestMapping("/mypage")
	public String myPage2() {
		return "material/mypage";
	}
}
