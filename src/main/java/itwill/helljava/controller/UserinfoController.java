package itwill.helljava.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import itwill.helljava.dto.Member;
import itwill.helljava.service.MemberService;
import itwill.helljava.service.PostingService;
import itwill.helljava.service.TrainerService;

@Controller
public class UserinfoController {

	@Autowired
	MemberService memberService;

	@Autowired
	PostingService postingService;

	@Autowired
	TrainerService trainerService;

	// 내 정보 수정 페이지 요청
	@RequestMapping(value = "/member/modify", method = RequestMethod.GET)
	public String memberModify() {
		return "/user/member_modify";
	}

	// 내 정보 수정 페이지 post 요청
	@RequestMapping(value = "/member/modify", method = RequestMethod.POST)
	public String memberModify(@ModelAttribute Member member, HttpServletRequest request, HttpSession session) {

		((Member) session.getAttribute("loginUserinfo")).getMemberStatus();

		String phone = request.getParameter("member_phone1") + "-" + request.getParameter("member_phone2") + "-"
				+ request.getParameter("member_phone3");

		String email = request.getParameter("email1") + "@" + request.getParameter("email2");

		if (request.getParameter("email2").equals("direct")) {
			email = request.getParameter("email1") + "@" + request.getParameter("selboxDirect");
		}

		member.setMemberPhone(phone);
		member.setMemberEmail(email);
		member.setMemberStatus(((Member) session.getAttribute("loginUserinfo")).getMemberStatus());
		member.setMemberNo(((Member) session.getAttribute("loginUserinfo")).getMemberNo());

		memberService.modifyMember(member);

		return "/material/mypage";
	}
	
	
	// 마이 페이지 요청
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String myPage() {

		return "/material/mypage";
	}

}
