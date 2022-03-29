package itwill.helljava.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import itwill.helljava.dto.Member;
import itwill.helljava.exception.LoginAuthFailException;
import itwill.helljava.exception.MemberIdSearchNotFoundException;

import itwill.helljava.exception.MemberPwSearchNotFoundException;
import itwill.helljava.service.MemberService;

@Controller
public class LoginController {

	@Autowired
	MemberService memberService;

	// 로그인 처리
	@RequestMapping(value = "/user/login/login", method = RequestMethod.POST)
	public String login(@ModelAttribute Member member, Model model, HttpSession session) throws LoginAuthFailException {
		// 메소드 호출시 예외가 발생된 경우 인증 실패
		memberService.loginAuth(member);
		// 예외가 발생되지 않은 경우 인증 성공 - 세션에 권한 관련 정보를 속성값으로 저장
		session.setAttribute("loginUserinfo", memberService.getIdMember(member.getMemberId()));
		return "main";
	}

	// 로그인 화면을 요청
	@RequestMapping(value = "/user/login/login_form", method = RequestMethod.GET)
	public String loginForm() {
		return "user/login/login_form";
	}

	// 아이디 찾기 페이지 요청
	@RequestMapping(value = "/user/login/id_search", method = RequestMethod.GET)
	public String idSearch() {
		return "user/login/id_search";
	}

	// 비밀번호 찾기 => 수정 페이지 요청
	@RequestMapping(value = "/user/login/password_search", method = RequestMethod.GET)
	public String pswdSearch() {
		return "user/login/password_search";
	}

	// 포스트 방식 -> 아이디 찾기 작업 요청
	@RequestMapping(value = "/user/login/id_print", method = RequestMethod.POST)
	public String idPrint(@ModelAttribute Member member, HttpServletRequest request, Model model)
			throws MemberIdSearchNotFoundException, MemberPwSearchNotFoundException {

		String phone = request.getParameter("member_phone1") + "-" + request.getParameter("member_phone2") + "-"
				+ request.getParameter("member_phone3");

		Map<String, Object> idSearchMap = new HashMap<String, Object>();

		idSearchMap.put("memberName", member.getMemberName());
		idSearchMap.put("memberPhone", phone);

		if (memberService.getSearchMember(idSearchMap) == null) {
			throw new MemberIdSearchNotFoundException("검색된 회원 정보가 없습니다.");
		}

		model.addAttribute("id", memberService.getSearchMember(idSearchMap).getMemberId());

		return "user/login/id_print";
	}

	// 포스트 방식 -> 비밀번호 수정시 필요한 3개(아이디, 이름, 연락처) 유효성 검사 요청
	@RequestMapping(value = "/user/login/password_search", method = RequestMethod.POST)
	public String pswdSearch(@ModelAttribute Member member, HttpServletRequest request, Model model)
			throws MemberPwSearchNotFoundException, MemberIdSearchNotFoundException {

		String phone = request.getParameter("member_phone1") + "-" + request.getParameter("member_phone2") + "-"
				+ request.getParameter("member_phone3");

		Map<String, Object> pwSearchMap = new HashMap<String, Object>();

		pwSearchMap.put("memberPhone", phone);
		pwSearchMap.put("memberName", member.getMemberName());
		pwSearchMap.put("memberId", member.getMemberId());

		if (memberService.getSearchMember(pwSearchMap) == null) {
			throw new MemberPwSearchNotFoundException("검색된 회원 정보가 없습니다.");
		}

		model.addAttribute("member", memberService.getSearchMember(pwSearchMap)); // 멤버 객체 넘기기
		return "user/login/password_update";
	}
	
	// 포스트 방식 -> 비밀번호 수정 요청 -> 로그인 페이지 이동
	@RequestMapping(value = "/user/login/password_update", method = RequestMethod.POST)
	public String pswdUpdate(@ModelAttribute Member member, HttpServletRequest request) {
		
		member.setMemberNo(Integer.parseInt(request.getParameter("memberNo")));
		memberService.modifyMember(member);
		
		return "user/login/login_form";
	}

	// 로그아웃 작업 요청
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	// @ExceptionHandler : Controller 클래스의 요청 처리 메소드에서 발생된 예외를 처리하기 위해
	// 예외처리 메소드를 설정하는 어노테이션
	// value 속성 : 예외 처리할 예외클래스(Clazz)를 속성값으로 설정
	// => 다른 속성이 없는 경우 속성값만 설정 가능
	@ExceptionHandler(value = LoginAuthFailException.class)
	public String exceptionHandler(LoginAuthFailException exception, Model model) {
		model.addAttribute("message", exception.getMessage());
		model.addAttribute("member_id", exception.getmemberId());
		return "user/login/user_login";
	}

	// 아이디 찾기 시 못 찾았을 때 예외 처리
	@ExceptionHandler(value = MemberIdSearchNotFoundException.class)
	public String exceptionHandler(MemberIdSearchNotFoundException exception, Model model) {
		model.addAttribute("message", exception.getMessage());
		return "user/login/id_search";
	}

	// 비밀번호 찾기 및 수정 시 해당 회원 못 찾았을 때 예외 처리
	@ExceptionHandler(value = MemberPwSearchNotFoundException.class)
	public String exceptionHandler(MemberPwSearchNotFoundException exception, Model model) {
		model.addAttribute("message", exception.getMessage());
		return "user/login/password_search";
	}

	/*
	 * //요청 처리 메소드의 매개변수를 HttpSession 자료형으로 선언하면 Front Controller에 //의해 바인딩 처리된 세션을
	 * 매개변수에 전달하여 제공
	 * 
	 * @RequestMapping(value = "/login", method = RequestMethod.POST) public String
	 * login(@RequestParam String id, @RequestParam String passwd , Model model,
	 * HttpSession session) { if(!id.equals("abc123") || !passwd.equals("123456"))
	 * {//인증 실패 //Request Scope : 요청 처리 메소드의 뷰페이지에서만 속성값 사용 가능
	 * model.addAttribute("message", "아이디 또는 비밀번호를 확인해 주세요.");
	 * model.addAttribute("id", id); return "session/login_form"; }
	 * 
	 * //Session Scope : 동일한 세션을 사용하는 모든 요청 처리 메소드와 뷰페이지에서 속상값 사용 가능
	 * session.setAttribute("loginId", id);
	 * 
	 * return "session/login_result"; }
	 */

	/*
	 * @RequestMapping(value = "/login", method = RequestMethod.POST) public String
	 * login(@ModelAttribute Member member, Model model, HttpSession session) {
	 * if(!member.getMember_id().equals("abc123") ||
	 * !member.getMember_pw().equals("123456")) {//인증 실패
	 * model.addAttribute("message", "아이디 또는 비밀번호를 확인해 주세요."); return
	 * "user/login_form"; }
	 * 
	 * session.setAttribute("loginId", member.getMember_id());
	 * 
	 * return "main"; }
	 */
}