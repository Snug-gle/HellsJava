package itwill.helljava.controller;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import itwill.helljava.Enum.ScheduleWorkdayEnum;
import itwill.helljava.dto.Award;
import itwill.helljava.dto.Member;
import itwill.helljava.dto.Posting;
import itwill.helljava.dto.PtPricing;
import itwill.helljava.dto.Schedule;
import itwill.helljava.dto.Trainer;
import itwill.helljava.service.AccountSevice;
import itwill.helljava.service.AwardService;
import itwill.helljava.service.PostingService;
import itwill.helljava.service.PtPricingService;
import itwill.helljava.service.ScheduleService;
import itwill.helljava.service.TrainerService;

@Controller
public class PostingController {

	@Autowired
	private WebApplicationContext context;

	@Autowired
	private PostingService postingService;

	@Autowired
	private TrainerService trainerService;

	@Autowired
	private AwardService awardService;

	@Autowired
	private ScheduleService scheduleService;

	@Autowired
	private PtPricingService ptPricingService;

	// 포스팅 작성 페이지 요청
	@RequestMapping(value = "/posting/write", method = RequestMethod.GET)
	public String trainerRequestAdd(HttpSession session, Model model) {

		// 모델에다가 트레이너 객체 넘김
		model.addAttribute("trainer",
				trainerService.getTrainer(((Member) session.getAttribute("loginUserinfo")).getMemberNo()));
		model.addAttribute("trainerAwards", awardService.getAwardList(trainerService
				.getTrainer(((Member) session.getAttribute("loginUserinfo")).getMemberNo()).getTrainerNo()));

		return "/content/posting_detail_insert";
	}
	
	// 포스팅 수정 페이지 요청
	@RequestMapping(value = "/posting/modify", method = RequestMethod.GET)
	public String trainerRequestUpdate(HttpSession session, Model model) {

		// 모델에다가 트레이너 객체 넘김
		model.addAttribute("trainer",
				trainerService.getTrainer(((Member) session.getAttribute("loginUserinfo")).getMemberNo()));
		model.addAttribute("trainerAwards", awardService.getAwardList(trainerService
				.getTrainer(((Member) session.getAttribute("loginUserinfo")).getMemberNo()).getTrainerNo()));

		//포스팅 :postingInfo
		//스케쥴 : scheduleInfo
		//pt가격관련 : ptPricingInfo

		
		
		
		
		return "/content/posting_detail_modify";
	}
	
	// 포스트 작성 페이지 post 요청 스케쥴과 포스팅 추가하는 핸들러 메서드
	@RequestMapping(value = "/posting/write", method = RequestMethod.POST)
	public String trainerRequestAdd(@ModelAttribute Posting posting, HttpSession httpSession,
			MultipartHttpServletRequest request) throws IllegalStateException, IOException {

		// 세션으로 얻어온 멤버 넘버
		int memberNo = ((Member) (httpSession.getAttribute("loginUserinfo"))).getMemberNo();

		// 파일 없을 경우 다시 포스팅 작성 페이지로 가라
		if (request.getFileNames() == null) {
			return "redirect:/posting/write";
		}

		Iterator<String> fileNames = request.getFileNames();

		// 얜 한번 돌텐데?
		while (fileNames.hasNext()) {

			// 파일 네임 가져오기
			String fileName = fileNames.next();

			List<MultipartFile> postingFiles = request.getFiles(fileName);

			int count = 1; // for문 도는 거 카운트
			for (MultipartFile multipartFile : postingFiles) {

				if (multipartFile.getSize() != 0) {// 파일이 있을 경우만

					String uploadDirectory = context.getServletContext()
							.getRealPath("/resources/assets/postingSelfIntroductionImages");

					String originalFilename = multipartFile.getOriginalFilename();

					if (count == 1)
						posting.setPostingSelfIntroductionImg1(originalFilename);
					else if (count == 2)
						posting.setPostingSelfIntroductionImg2(originalFilename);
					else if (count == 3)
						posting.setPostingSelfIntroductionImg3(originalFilename);
					else if (count == 4)
						posting.setPostingSelfIntroductionImg4(originalFilename);

					File file = new File(uploadDirectory, originalFilename);

					String uploadFilename = originalFilename;

					// 서버 디렉토리에 전달파일과 같은 이름의 파일이 존재할 경우 서버 디렉토리에 저장될 파일명 변경
					int i = 0;
					while (file.exists()) {// 서버 디렉토리에 같은 이름의 파일이 있는 경우 반복 처리
						i++;
						int index = originalFilename.lastIndexOf(".");
						uploadFilename = originalFilename.substring(0, index) + "_" + i
								+ originalFilename.substring(index);
						file = new File(uploadDirectory, uploadFilename);
					}

					multipartFile.transferTo(file); // 파일 이동
					count++;
				}
			}

		}
		posting.setTrainerNo(trainerService.getTrainer(memberNo).getTrainerNo());

		// 포스팅 추가 서비스 메서드 호출 (자기소개, 프로그램 소개는 이미 들가있음)
		postingService.addPosting(posting);

		// ===============================PT 가격 추가===============================

		String[] roundList = request.getParameterValues("round");
		String[] priceList = request.getParameterValues("roundPrice");

		int priceCount = 0;
		for (String round : roundList) {

			PtPricing ptPricing = new PtPricing();
			ptPricing.setPtPricingRound(Integer.parseInt(round));
			ptPricing.setPtPricingPrice(Integer.parseInt(priceList[priceCount]));
			ptPricing.setTrainerNo(trainerService.getTrainer(memberNo).getTrainerNo());

			ptPricingService.addPtPricing(ptPricing);

			priceCount++;
		}

		// ===============================PT 스케쥴 추가===============================

		// 체크 박스 선택된 애들만 받아옴
		String[] workdays = request.getParameterValues("workdayCheck");
		String[] hour1s = request.getParameterValues("hour1");
		String[] minute1s = request.getParameterValues("minute1");
		String[] hour2s = request.getParameterValues("hour2");
		String[] minute2s = request.getParameterValues("minute2");

		String dayOff = request.getParameter("dayoff");
		String dayOffText = request.getParameter("dayOffText");

		int dayCount = 0;
		for (String workday : workdays) {

			Schedule schedule = new Schedule();
			String time = hour1s[dayCount] + ":" + minute1s[dayCount] + "~" + hour2s[dayCount] + ":"
					+ minute2s[dayCount];
			schedule.setScheduleHours(time);
			schedule.setScheduleWorkday(ScheduleWorkdayEnum.of(Integer.parseInt(workday)).getValue());
			schedule.setTrainerNo(trainerService.getTrainer(memberNo).getTrainerNo());

			scheduleService.addSchedule(schedule);

			dayCount++;
		}

		// 휴무일 정보도 있을 시
		if ((dayOff != null) && (!dayOffText.equals(""))) {
			Schedule schedule = new Schedule();
			schedule.setScheduleWorkday(ScheduleWorkdayEnum.of(Integer.parseInt(dayOff)).getValue());
			schedule.setScheduleDayoff(dayOffText);
			schedule.setTrainerNo(trainerService.getTrainer(memberNo).getTrainerNo());

			scheduleService.addSchedule(schedule);
		}

		return "/user/trainer/trainer_mypage";
		// 일단 트레이너 마이페이지로 가지만 포스팅 디테일 완성하면 경로 바꾸고 주석 지우기
		// 포스팅 추가하면 포스팅 디테일 페이지로 이동 얘도 수정필요 리다이렉트 요청 ㄱㄱ
	}

	// 트레이너가 마이페이지에서 포스팅 디테일 페이지 GET 요청
	@RequestMapping(value = "/myposting/detail/{memberNo}", method = RequestMethod.GET)
	public String trPostingDetail(@PathVariable(value = "memberNo") int memberNo, Model model) {

		Trainer trainer = trainerService.getTrainer(memberNo);

		model.addAttribute("trainer", trainer); // 트레이너 객체 보내기
		model.addAttribute("award", awardService.getAwardList(trainer.getTrainerNo()));
		model.addAttribute("ptPricing", ptPricingService.getPtPricingList(trainer.getTrainerNo()));
		model.addAttribute("schedule", scheduleService.getScheduleList(trainer.getTrainerNo()));
		model.addAttribute("posting", postingService.getPosting(trainer.getTrainerNo()));

		return "/content/posting_detail";
	}

	// 트레이너 리스트나 메인에서 트레이너 배너 눌럿을 때 포스팅 디테일 페이지 GET 요청
	@RequestMapping(value = "/posting/detail/{trainerNo}", method = RequestMethod.GET)
	public String postingDetail(@PathVariable(value = "trainerNo") int trainerNo, Model model, HttpSession session) {
		
		// 재요청을 위해 세션에 트레이너 번호 담아두기
		session.setAttribute("trainerNo", trainerNo);
		
		// 트레이너 번호로 트레이너 가져오기
		Trainer trainer = trainerService.getTrainerTrainerNo(trainerNo);
		
		model.addAttribute("trainer", trainer); // 트레이너 객체 보내기
		model.addAttribute("award", awardService.getAwardList(trainer.getTrainerNo()));
		model.addAttribute("ptPricing", ptPricingService.getPtPricingList(trainer.getTrainerNo()));
		model.addAttribute("schedule", scheduleService.getScheduleList(trainer.getTrainerNo()));
		model.addAttribute("posting", postingService.getPosting(trainer.getTrainerNo()));
		
		return "/content/posting_detail";
	}
}
