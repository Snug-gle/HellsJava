package itwill.helljava.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import itwill.helljava.dto.Award;
import itwill.helljava.dto.Trainer;
import itwill.helljava.exception.AccountPwAuthException;
import itwill.helljava.service.AccountSevice;
import itwill.helljava.service.AwardService;
import itwill.helljava.service.TrainerService;

@Controller
public class TrainerController {

	@Autowired
	private TrainerService trainerService;

	@Autowired
	private AwardService awardService;

	@Autowired
	private AccountSevice accountSevice;

	// 로그인 화면을 요청
	@RequestMapping(value = "/trainer/request", method = RequestMethod.GET)
	public String trainerRequest() {
		return "user/trainer/trainer_request";
	}

	// 트레이너 신청 포스트 요청 받아온 값
	// 회원 번호, 프로필 사진, 우편번호, 소속센터 주소, 소속센터명, 수상 내용, 수상 사진,
	// 결제 비밀번호
	@RequestMapping(value = "/trainer/mypage", method = RequestMethod.POST)
	public String trainerRequest(@RequestParam Map<String, Object> map, @ModelAttribute Trainer trainer,
			@ModelAttribute Award award, HttpServletRequest request) throws AccountPwAuthException {

		// 일단 트레이너로 정보 추가하고 (아직 예정이지만)
		trainerService.addTrainer(trainer);

		// 트레이너 번호를 얻어와서 award 추가
		award.setTrainerNo(trainerService.getTrainer(trainer.getMemberNo()).getTrainerNo());
		awardService.addAward(award);

		// 이제 계좌 정보를 가져와서 비밀번호를 비교함
		accountSevice.accountPwAuth(accountSevice.getMemberAccount(trainer.getMemberNo()));

		return "user/trainer/trainer_mypage"; // 트레이너 신청 내역 페이지로 이동
	}

	@ExceptionHandler(value = AccountPwAuthException.class)
	public String exceptionHandler(AccountPwAuthException exception, Model model) {

		// 비밀번호 틀리면 에러메시지 넘겨주자
		model.addAttribute("message", exception.getMessage());

		return "user/trainer/trainer_request";
	}

}
