package itwill.helljava.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import itwill.helljava.dto.Member;

//Tiles : 템플릿 페이지를 이용한 사이트 구현 기능을 제공하는 프로그램
//1.Tiles 관련 라이브러리를 빌드 처리 - pom.xml
//2.요청 처리 메소드에서 반환받는 ViewName를 Tiles 프로그램으로 응답되도록 ViewResolver 설정 - servlet-context.xml 
//3.Tiles Configuration File(XML) 작성 - 요청 처리 메소드에서 반환되는 ViewName에 대한 템플릿 페이지(JSP) 설정

@Controller
public class TilesController {
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String tiles() {
		return "main";
	}
	
	@RequestMapping(value = "/", method = RequestMethod.POST)
	public String main(@ModelAttribute Member member, HttpSession session) {
		
		session.setAttribute("loginMember", "김성훈");
		return "main";
	}
	
	/*
	 * @RequestMapping("/admin") public String admin() { return "admin"; }
	 * 
	 * @RequestMapping("/admin/member") public String manager() { return
	 * "admin/member_manager"; }
	 */
	@RequestMapping("/terms1")
		
	public String terms1() {
		return "material/terms1";
	}
	
	@RequestMapping("/terms2")
	public String terms2() {
		return "material/terms2";
	}
	
	@RequestMapping("/mypage")
	public String myPage() {
		return "material/mypage";
	}
}
