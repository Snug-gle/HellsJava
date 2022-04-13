package itwill.helljava.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import itwill.helljava.Enum.MemberEnum;
import itwill.helljava.dto.Member;
import itwill.helljava.service.MemberService;
import itwill.helljava.service.PostingService;
import itwill.helljava.service.TrainerService;
import itwill.helljava.util.Auth;
import itwill.helljava.util.Auth.Role;
import itwill.helljava.util.AuthUser;


@Controller
public class UserinfoController {

	@Autowired
	MemberService memberService;

	@Autowired
	PostingService postingService;

	@Autowired
	TrainerService trainerService;

	// 내 정보 수정 페이지 요청
	@Auth // 전체 가능
	@RequestMapping(value = "/member/modify", method = RequestMethod.GET)
	public String memberModify() {
		return "/user/member_modify";
	}
	
	//회원 탈퇴
	@RequestMapping(value = "/user/withdrawal", method = RequestMethod.POST)
	public String memberRemove(@AuthUser Member member,HttpSession session) {
		
		member.setMemberStatus(MemberEnum.탈퇴회원.getValue());
		memberService.modifyMember(member);
		session.invalidate();
		
		return "redirect:/";
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
		session.setAttribute("loginUserinfo", memberService.getMember(member.getMemberNo()));
		

		return "/user/mypage";
	}
	
	
	// 마이 페이지 요청 회원 예비트레이너 관리자 같은 jsp 공유
	@Auth(role = Role.USER_PRETRAINER_ADMIN)
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String myPage() {

		return "/user/mypage";
	}

}
