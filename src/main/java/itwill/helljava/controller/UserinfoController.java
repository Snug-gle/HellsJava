package itwill.helljava.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import itwill.helljava.dto.Member;
import itwill.helljava.service.MemberService;

@Controller
public class UserinfoController {

	@Autowired
	MemberService memberService;
	
	// 내 정보 수정 페이지 요청
	@RequestMapping(value = "/member/modify", method = RequestMethod.GET)
	public String memberModify(HttpServletRequest reqeust) {
		return "/user/member_modify";
	}

	// 내 정보 수정 페이지 post 요청
	@RequestMapping(value = "/member/modify", method = RequestMethod.POST)
	public String memberModify(@ModelAttribute Member member, HttpServletRequest reqeust,
			HttpSession session) {

		((Member)session.getAttribute("loginUserinfo")).getMemberStatus();
		
		String email = reqeust.getParameter("email1") + "@" + reqeust.getParameter("email2");

		if (reqeust.getParameter("email2").equals("direct")) {
			email = reqeust.getParameter("email1") + "@" + reqeust.getParameter("selboxDirect");
		}

		member.setMemberEmail(email);
		member.setMemberStatus(((Member)session.getAttribute("loginUserinfo")).getMemberStatus());
		member.setMemberNo(((Member)session.getAttribute("loginUserinfo")).getMemberNo());
		
		memberService.modifyMember(member);
		
		return "/user/member_modify";
	}

	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String myPage() {
		return "/material/mypage";
	}
	
}
