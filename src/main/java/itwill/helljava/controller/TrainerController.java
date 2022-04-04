package itwill.helljava.controller;

import java.io.File;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import itwill.helljava.dto.Award;
import itwill.helljava.dto.Member;
import itwill.helljava.dto.Trainer;
import itwill.helljava.exception.AccountPwAuthException;
import itwill.helljava.service.AccountSevice;
import itwill.helljava.service.AwardService;
import itwill.helljava.service.TrainerService;

@Controller
public class TrainerController {

	//필드에 WebApplicationContext 객체(Spring Container)를 저장하도록 인젝션 처리
	@Autowired
	private WebApplicationContext context;
	
	@Autowired
	private TrainerService trainerService;

	@Autowired
	private AwardService awardService;

	@Autowired
	private AccountSevice accountSevice;

	// 트레이너 신청 화면을 요청
	@RequestMapping(value = "/trainer/request", method = RequestMethod.GET)
	public String trainerRequest() {
		return "/user/trainer/trainer_request";
	}

	// 트레이너 신청 POST 요청 받아온 값
	// 회원 번호, 프로필 사진, 우편번호, 소속센터 주소, 소속센터명, 수상 내용들, 수상 사진들,
	// 결제 비밀번호
	@RequestMapping(value = "/trainer/request", method = RequestMethod.POST)
	public String trainerRequest(@RequestParam Map<String, Object> map, @ModelAttribute Trainer trainer,
			@ModelAttribute Award award, @RequestParam MultipartFile uploadFile, HttpSession session) throws AccountPwAuthException {

		// 파일 없을 경우 다시 요청 페이지로 가라
		if(uploadFile.isEmpty()) {
			return "/user/trainer/trainer_request";
		}
		
		//WebApplicationContext 객체를 이용하여 ServletContext 객체를 제공받아 서버 디렉토리의
		//파일 시스템 경로를 반환받아 저장
		String uploadDirectory = context.getServletContext().getRealPath("/resources/assets/img");
		
		//일단 프로필 이미지 받은 거 전달 파일명을 트레이너 번호든 이름이든 붙여서 반환받아 저장
		String originalFilename = uploadFile.getOriginalFilename()+"_"+"profile_memberNo_"+((Member)session.getAttribute("loginUserinfo")).getMemberNo();
		File file = new File(uploadDirectory, originalFilename);
		
		//실제 서버 디렉토리에 저장되는 파일명을 저장하기 위한 변수 선언
		// => 초기값으로 전달파일의 이름을 저장
		String uploadFilename=originalFilename;
		
		//uploadFile.transferTo(file);
		
	
		//uploadFile.transferTo(new File(fileName));

		
			/*
			 * // 트레이너 프로필 이미지 추가 multipartRequest.getr
			 * 
			 * // 일단 트레이너로 정보 추가하고 (아직 예정이지만) trainerService.addTrainer(trainer);
			 */

		// 트레이너 번호를 얻어와서 award 추가
		award.setTrainerNo(trainerService.getTrainer(trainer.getMemberNo()).getTrainerNo());
		awardService.addAward(award);

		// 이제 계좌 정보를 가져와서 비밀번호를 비교하고 결제 완료할 것임
		accountSevice.accountPwAuth(accountSevice.getMemberAccount(trainer.getMemberNo()));

		
		return "user/trainer/trainer_mypage"; // 트레이너 신청 내역 페이지로 이동 (트레이너 관리 상세를 연동시키면 됨)
	}

	@ExceptionHandler(value = AccountPwAuthException.class)
	public String exceptionHandler(AccountPwAuthException exception, Model model) {

		// 비밀번호 틀리면 에러메시지 넘겨주자
		model.addAttribute("message", exception.getMessage());

		return "/user/trainer/trainer_request";
	}

}
