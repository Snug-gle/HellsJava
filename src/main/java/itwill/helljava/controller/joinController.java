package itwill.helljava.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import itwill.helljava.dto.Member;
import itwill.helljava.service.MemberService;


@Controller
@RequestMapping("/user")
public class joinController {

	@Autowired
	MemberService memberService;
	
	@RequestMapping(value = "/join_form", method = RequestMethod.GET)
	public String join() {
		return "user/join_form";
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(@ModelAttribute Member member, Model model, HttpServletRequest request) {
		
		String phone = String.valueOf(request.getParameter("member_phone1") + request.getParameter("member_phone2") + request.getParameter("member_phone3"));
		
		member.setMemberPhone(phone);
		memberService.addMember(member);
		return "user/login/login_form";
	}
}
