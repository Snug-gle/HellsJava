package itwill.helljava.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import itwill.helljava.Enum.AccountEnum;
import itwill.helljava.dto.Member;
import itwill.helljava.dto.PtService;
import itwill.helljava.dto.Trainer;
import itwill.helljava.service.AccountSevice;
import itwill.helljava.service.MemberService;
import itwill.helljava.service.PtServiceService;
import itwill.helljava.service.TrainerService;

//Tiles : 템플릿 페이지를 이용한 사이트 구현 기능을 제공하는 프로그램
//1.Tiles 관련 라이브러리를 빌드 처리 - pom.xml
//2.요청 처리 메소드에서 반환받는 ViewName를 Tiles 프로그램으로 응답되도록 ViewResolver 설정 - servlet-context.xml 
//3.Tiles Configuration File(XML) 작성 - 요청 처리 메소드에서 반환되는 ViewName에 대한 템플릿 페이지(JSP) 설정

@Controller
public class HomeController {

	@Autowired
	private AccountSevice accountSevice;

	@Autowired
	private TrainerService trainerService;

	@Autowired
	private PtServiceService ptServiceService;

	@Autowired
	private MemberService memberService;

	// 메인 페이지 get요청
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String tiles(HttpSession session, Model model) {

		// 로그인 정보가 있을 때
		if (session.getAttribute("loginUserinfo") != null) {
			session.setAttribute("memberAccount",
					accountSevice.getMemberAccount((((Member) session.getAttribute("loginUserinfo")).getMemberNo())));

			// 계좌가 등록되어 있을 경우만
			if (accountSevice.getMemberAccount((((Member) session.getAttribute("loginUserinfo")).getMemberNo())) != null) {
				model.addAttribute("bankName",AccountEnum.of(accountSevice.getMemberAccount((((Member) session.getAttribute("loginUserinfo")).getMemberNo())).getAccountBank()));
			}
		}

		List<Trainer> trainer = trainerService.getMonthTrainer();
		List<PtService> review = ptServiceService.getReviewGoodList();

		model.addAttribute("trainerInfo", trainer);
		model.addAttribute("reviewInfo", review);

		return "main";
	}

	@RequestMapping(value = "/terms1", method = RequestMethod.GET)

	public String terms1() {
		return "/material/terms1";
	}

	@RequestMapping(value = "/terms2", method = RequestMethod.GET)
	public String terms2() {
		return "/material/terms2";
	}

}
