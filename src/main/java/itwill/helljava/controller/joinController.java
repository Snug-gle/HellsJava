package itwill.helljava.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import itwill.helljava.dto.Member;


@Controller
public class joinController {

	@RequestMapping(value = "/user/join_form", method = RequestMethod.GET)
	public String join() {
		return "user/join_form";
	}
	
	@RequestMapping(value = "/user/join", method = RequestMethod.POST)
	public String join(@ModelAttribute("mem") Member member, Model model) {
		/*
		 * if(member.getMember_id().equals("abc123")) {//아이디가 중복된 경우
		 * model.addAttribute("message", "이미 사용중인 아이디입니다."); return "join_form"; }
		 */
		return "user/login_form";
	}
}
