package itwill.helljava.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
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

		int modifyMemberNo = ((Member) session.getAttribute("loginUserinfo")).getMemberNo();

		// 모델에다가 트레이너 객체 넘김
		model.addAttribute("trainer", trainerService.getTrainer(modifyMemberNo));
		model.addAttribute("trainerAwards",
				awardService.getAwardList(trainerService.getTrainer(modifyMemberNo).getTrainerNo()));

		model.addAttribute("postingInfo",
				postingService.getPosting(trainerService.getTrainer(modifyMemberNo).getTrainerNo())); // 포스팅
		model.addAttribute("scheduleInfo",
				scheduleService.getScheduleList(trainerService.getTrainer(modifyMemberNo).getTrainerNo())); // 스케쥴 리스트
		model.addAttribute("ptPricingInfo",
				ptPricingService.getPtPricingList(trainerService.getTrainer(modifyMemberNo).getTrainerNo())); // pt 가격
																												// 관련

		return "/content/posting_detail_modify";
	}

	// 포스팅 수정 POST 방식 요청 스케줄과 포스팅 수정
	@RequestMapping(value = "/posting/modify", method = RequestMethod.POST)
	public String trainerPostingUpdate(@ModelAttribute Posting posting, HttpSession session,
			MultipartHttpServletRequest request) throws IllegalStateException, IOException {

		// 포스팅 수정한 트레이너의 회원 번호
		int memberNo = ((Member) session.getAttribute("loginUserinfo")).getMemberNo();

// ===========================파일 수정=================================

		// 파일 없을 경우 다시 포스팅 작성 페이지로 가라
		if (request.getFileNames() == null) {
			return "redirect:/posting/write";
		}

		/*
		 * // 기존 파일 이름들 배열 String[] currentImages =
		 * request.getParameterValues("currentImage");
		 * 
		 * // 기존 파일들을 삭제 for (String currentImg : currentImages) {
		 * 
		 * String savedDirectory = context.getServletContext()
		 * .getRealPath("/resources/assets/postingSelfIntroductionImages"); String
		 * currentFillName = currentImg; // 기존 파일들 삭제 new File(savedDirectory,
		 * currentFillName).delete();
		 * 
		 * }
		 */

		// 얘가 해당 포스팅 정보 다 가지고 있음
		Posting dbPosting = postingService.getPosting(trainerService.getTrainer(memberNo).getTrainerNo());

		String posName1 = dbPosting.getPostingSelfIntroductionImg1();
		String posName2 = dbPosting.getPostingSelfIntroductionImg2();
		String posName3 = dbPosting.getPostingSelfIntroductionImg3();
		String posName4 = dbPosting.getPostingSelfIntroductionImg4();

		String uploadDirectory = context.getServletContext()
				.getRealPath("/resources/assets/postingSelfIntroductionImages");

		MultipartFile img1 = null;
		MultipartFile img2 = null;
		MultipartFile img3 = null;
		MultipartFile img4 = null;

		// 일단 파일이 있든 없든 파일 형식 받기
		
		if (request.getFile("Img1") != null) { // 받아온 file이 있다?
			img1 = request.getFile("Img1"); 

			if (!(img1.getOriginalFilename().equals(posName1))) { // 받아온 파일 이름과 dB에 저장된 파일 이름을 비교해서 없다?
				
				// 다르면(파일이 변경되었다는 의미) db setter로 파일 이름 바로 추가
				posting.setPostingSelfIntroductionImg1(img1.getOriginalFilename()); 

				// 기존 업로드 된 파일 삭제
				new File(uploadDirectory, posName1);

				// 새로운 File 객체 생성 후 받아온 파일 이름 인자로 주입
				File file = new File(uploadDirectory, img1.getOriginalFilename());

				// 서버에 업로드할 이름은 받아온 파일 이름으로 통일
				String uploadFilename = img1.getOriginalFilename();

				// 서버 디렉토리에 전달파일과 같은 이름의 파일이 존재할 경우 서버 디렉토리에 저장될 파일명 변경
				int i = 0;
				while (file.exists()) {// 서버 디렉토리에 같은 이름의 파일이 있는 경우 반복 처리
					i++;
					int index = img1.getOriginalFilename().lastIndexOf(".");
					uploadFilename = img1.getOriginalFilename().substring(0, index) + "_" + i
							+ img1.getOriginalFilename().substring(index);
					file = new File(uploadDirectory, uploadFilename);
				}

				img1.transferTo(file); // 받아온 파일 서버에 업로드
			}
		}

		if (request.getFile("Img2") != null) {
			img2 = request.getFile("Img2");

			if (!(img2.getOriginalFilename().equals(posName2))) {
				posting.setPostingSelfIntroductionImg2(img2.getOriginalFilename());

				File file = new File(uploadDirectory, img2.getOriginalFilename());

				String uploadFilename = img2.getOriginalFilename();

				// 서버 디렉토리에 전달파일과 같은 이름의 파일이 존재할 경우 서버 디렉토리에 저장될 파일명 변경
				int i = 0;
				while (file.exists()) {// 서버 디렉토리에 같은 이름의 파일이 있는 경우 반복 처리
					i++;
					int index = img2.getOriginalFilename().lastIndexOf(".");
					uploadFilename = img2.getOriginalFilename().substring(0, index) + "_" + i
							+ img2.getOriginalFilename().substring(index);
					file = new File(uploadDirectory, uploadFilename);
				}

				img2.transferTo(file); // 파일 이동

			}
		} 

		if (request.getFile("Img3") != null) {
			img3 = request.getFile("Img3");

			if (!(img3.getOriginalFilename().equals(posName3))) {
				posting.setPostingSelfIntroductionImg3(img3.getOriginalFilename());

				File file = new File(uploadDirectory, img3.getOriginalFilename());

				String uploadFilename = img3.getOriginalFilename();

				// 서버 디렉토리에 전달파일과 같은 이름의 파일이 존재할 경우 서버 디렉토리에 저장될 파일명 변경
				int i = 0;
				while (file.exists()) {// 서버 디렉토리에 같은 이름의 파일이 있는 경우 반복 처리
					i++;
					int index = img3.getOriginalFilename().lastIndexOf(".");
					uploadFilename = img3.getOriginalFilename().substring(0, index) + "_" + i
							+ img3.getOriginalFilename().substring(index);
					file = new File(uploadDirectory, uploadFilename);
				}

				img1.transferTo(file); // 파일 이동

			}

		} 

		if (request.getFile("Img4") != null) {
			img4 = request.getFile("Img4"); // ==> 얘가 널 검증하고

			if (!(img4.getOriginalFilename().equals(posName4))) {
				posting.setPostingSelfIntroductionImg4(img4.getOriginalFilename());

				File file = new File(uploadDirectory, img4.getOriginalFilename());

				String uploadFilename = img4.getOriginalFilename();

				// 서버 디렉토리에 전달파일과 같은 이름의 파일이 존재할 경우 서버 디렉토리에 저장될 파일명 변경
				int i = 0;
				while (file.exists()) {// 서버 디렉토리에 같은 이름의 파일이 있는 경우 반복 처리
					i++;
					int index = img4.getOriginalFilename().lastIndexOf(".");
					uploadFilename = img4.getOriginalFilename().substring(0, index) + "_" + i
							+ img4.getOriginalFilename().substring(index);
					file = new File(uploadDirectory, uploadFilename);
				}

				img4.transferTo(file); // 파일 이동
			}

		}
	
		/*
		 * Iterator<String> fileNames = request.getFileNames();
		 * 
		 * // 얜 한번 돌텐데? while (fileNames.hasNext()) {
		 * 
		 * // 파일 네임 가져오기 String fileName = fileNames.next();
		 * 
		 * List<MultipartFile> postingFiles = request.getFiles(fileName);
		 * 
		 * int count = 1; // for문 도는 거 카운트 for (MultipartFile multipartFile :
		 * postingFiles) {
		 * 
		 * if (multipartFile.getSize() != 0) {// 파일이 있을 경우만
		 * 
		 * String uploadDirectory = context.getServletContext()
		 * .getRealPath("/resources/assets/postingSelfIntroductionImages");
		 * 
		 * String originalFilename = multipartFile.getOriginalFilename();
		 * System.out.println("originalFilename :[" + count + "]번쟤 이름"); if (count == 1)
		 * posting.setPostingSelfIntroductionImg1(originalFilename); else if (count ==
		 * 2) posting.setPostingSelfIntroductionImg2(originalFilename); else if (count
		 * == 3) posting.setPostingSelfIntroductionImg3(originalFilename); else if
		 * (count == 4) posting.setPostingSelfIntroductionImg4(originalFilename);
		 * 
		 * File file = new File(uploadDirectory, originalFilename);
		 * 
		 * String uploadFilename = originalFilename;
		 * 
		 * // 서버 디렉토리에 전달파일과 같은 이름의 파일이 존재할 경우 서버 디렉토리에 저장될 파일명 변경 int i = 0; while
		 * (file.exists()) {// 서버 디렉토리에 같은 이름의 파일이 있는 경우 반복 처리 i++; int index =
		 * originalFilename.lastIndexOf("."); uploadFilename =
		 * originalFilename.substring(0, index) + "_" + i +
		 * originalFilename.substring(index); file = new File(uploadDirectory,
		 * uploadFilename); }
		 * 
		 * multipartFile.transferTo(file); // 파일 이동 count++; } }
		 * 
		 * }
		 */
		posting.setTrainerNo(trainerService.getTrainer(memberNo).getTrainerNo());

		// 포스팅 추가 서비스 메서드 호출 (자기소개, 프로그램 소개는 이미 들가있음)
		postingService.modifyPosting(posting);

// ===========================PT 스케쥴 수정================================

		// 체크 박스 선택된 애들만 받아옴
		String[] workdays = request.getParameterValues("workdayCheck");
		String[] hour1s = request.getParameterValues("hour1");
		String[] minute1s = request.getParameterValues("minute1");
		String[] hour2s = request.getParameterValues("hour2");
		String[] minute2s = request.getParameterValues("minute2");
		String[] workDayScheduleNos = request.getParameterValues("workDayScheduleNo");

		String dayOff = request.getParameter("dayoff");
		String dayOffText = request.getParameter("dayOffText");

		int dayCount = 0;
		for (String workday : workdays) {

			Schedule schedule = new Schedule();
			String time = hour1s[dayCount] + ":" + minute1s[dayCount] + "~" + hour2s[dayCount] + ":"
					+ minute2s[dayCount];
			System.out.println("time[" + dayCount + "]의 값은 : " + time);
			schedule.setScheduleHours(time);
			schedule.setScheduleWorkday(ScheduleWorkdayEnum.of(Integer.parseInt(workday)).getValue());
			schedule.setTrainerNo(trainerService.getTrainer(memberNo).getTrainerNo());
			schedule.setScheduleNo(Integer.parseInt(workDayScheduleNos[dayCount]));

			scheduleService.modifySchedule(schedule); // 기존 휴무일 제외 스케쥴 수정

			dayCount++;
		}

		// 휴무일 정보도 있을 시
		if ((dayOff != null) && (!dayOffText.equals(""))) {
			Schedule schedule = new Schedule();
			schedule.setScheduleWorkday(ScheduleWorkdayEnum.of(Integer.parseInt(dayOff)).getValue());
			schedule.setScheduleDayoff(dayOffText);
			schedule.setTrainerNo(trainerService.getTrainer(memberNo).getTrainerNo());
			schedule.setScheduleNo(Integer.parseInt(request.getParameter("dayOffScheduleNo")));

			scheduleService.modifySchedule(schedule);
		}

// ===========================PT 이용가격 수정================================

		String[] roundList = request.getParameterValues("round");
		String[] priceList = request.getParameterValues("roundPrice");
		String[] ptPricingNumbers = request.getParameterValues("ptPricingNumber");

		int priceCount = 0;
		for (String round : roundList) {

			PtPricing ptPricing = new PtPricing();
			ptPricing.setPtPricingRound(Integer.parseInt(round));
			ptPricing.setPtPricingPrice(Integer.parseInt(priceList[priceCount]));
			ptPricing.setTrainerNo(trainerService.getTrainer(memberNo).getTrainerNo());
			ptPricing.setPtPricingNo(Integer.parseInt(ptPricingNumbers[priceCount]));

			ptPricingService.modifyPtPricing(ptPricing);

			priceCount++;
		}

		return "redirect:/myposting/detail/" + memberNo; // 다시 포스팅 디테일로 재요청 시켜야지 머.
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
