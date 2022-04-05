package itwill.helljava.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import itwill.helljava.dto.Member;
import itwill.helljava.exception.MemberExistsException;
import itwill.helljava.exception.PhoneExistsException;
import itwill.helljava.service.MemberService;

@Controller
@RequestMapping("/user")
public class joinController {

	@Autowired
	MemberService memberService;

	// 회원가입 페이지 요청 메서드
	@RequestMapping(value = "/join_form", method = RequestMethod.GET)
	public String join() {
		return "user/join_form";
	}

	// 회원가입 처리 핸들러메서드
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(@ModelAttribute Member member, Model model, HttpServletRequest request)
			throws MemberExistsException, PhoneExistsException {

		String phone = request.getParameter("member_phone1") + "-" + request.getParameter("member_phone2") + "-"
				+ request.getParameter("member_phone3");
		
		String email;

		if (request.getParameter("email2").equals("direct")) {
			email = request.getParameter("email1") + "@" + request.getParameter("selboxDirect");
		} else {
			email = request.getParameter("email1") + "@" + request.getParameter("email2");
		}
 
		member.setMemberEmail(email);
		member.setMemberPhone(phone);
		memberService.addMember(member);
		return "user/login/login_form";
	}

	@ExceptionHandler(value = MemberExistsException.class)
	public String exceptionHandler(MemberExistsException exception, Model model) {
		model.addAttribute("message", exception.getMessage());
		model.addAttribute("member", exception.getMember());
		return "user/join_form";
	}

	@ExceptionHandler(value = PhoneExistsException.class)
	public String exceptionHandler(PhoneExistsException exception, Model model) {
		model.addAttribute("message", exception.getMessage());
		model.addAttribute("member", exception.getMember());
		return "user/join_form";
	}

	@RequestMapping(value = "/user/idcheck", method = RequestMethod.GET)
	@ResponseBody
	public int idCheck(@RequestParam("id") String id) {

		System.out.println("전달받은 id:" + id);
		int cnt = memberService.idCheck(id);
		System.out.println("전달받은 cnt:" + cnt);
		return cnt;
	}
}
