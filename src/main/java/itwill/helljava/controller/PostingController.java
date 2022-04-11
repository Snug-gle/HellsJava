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

	private static final String NULL_COMMENT = "빈 값 넣어줘";
	
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

	
	// 트레이너가 마이페이지에서 포스팅 디테일 페이지 GET 요청
	@RequestMapping(value = "/myposting/detail/{memberNo}", method = RequestMethod.GET)
	public String trPostingDetail(@PathVariable(value = "memberNo") int memberNo, Model model) {

		Trainer trainer = trainerService.getTrainer(memberNo);

		Map<String, Object> countMap = new HashMap<String, Object>();
		
		countMap.put("pt_service_sortation", PtServiceSortationEnum.리뷰.getValue());
		countMap.put("pt_service_status", PtServiceStatusEnum.일반리뷰.getValue());
		countMap.put("trainer_no", trainer.getTrainerNo());		
		
		int totalReviewCount = ptServiceService.getPtServiceTrainerCount(countMap);
		
		Map<String, Object> reviewMap = new HashMap<String, Object>();
		
		reviewMap.put("startRow", 1);
		reviewMap.put("endRow", totalReviewCount);
		reviewMap.put("pt_service_sortation", PtServiceSortationEnum.리뷰.getValue());
		reviewMap.put("pt_service_status", PtServiceStatusEnum.일반리뷰.getValue());
		reviewMap.put("trainer_no", trainer.getTrainerNo());
		
		model.addAttribute("trainer", trainer); // 트레이너 객체 보내기
		model.addAttribute("award", awardService.getAwardList(trainer.getTrainerNo()));
		model.addAttribute("ptPricing", ptPricingService.getPtPricingList(trainer.getTrainerNo()));
		model.addAttribute("schedule", scheduleService.getScheduleList(trainer.getTrainerNo()));
		model.addAttribute("posting", postingService.getPosting(trainer.getTrainerNo()));
		model.addAttribute("reviews", ptServiceService.getPtServiceTrainerList(reviewMap));
		
		return "/content/posting_detail";
	}

	// 트레이너 리스트나 메인에서 트레이너 배너 눌럿을 때 포스팅 디테일 페이지 GET 요청
	@RequestMapping(value = "/posting/detail/{trainerNo}", method = RequestMethod.GET)
	public String postingDetail(@PathVariable(value = "trainerNo") int trainerNo, Model model, HttpSession session) {

		// 재요청을 위해 세션에 트레이너 번호 담아두기
		session.setAttribute("trainerNo", trainerNo);

		// 트레이너 번호로 트레이너 가져오기
		Trainer trainer = trainerService.getTrainerTrainerNo(trainerNo);

		Map<String, Object> countMap = new HashMap<String, Object>();
		
		countMap.put("pt_service_sortation", PtServiceSortationEnum.리뷰.getValue());
		countMap.put("pt_service_status", PtServiceStatusEnum.일반리뷰.getValue());
		countMap.put("trainer_no", trainer.getTrainerNo());		
		
		int totalReviewCount = ptServiceService.getPtServiceTrainerCount(countMap);
		
		Map<String, Object> reviewMap = new HashMap<String, Object>();
		
		reviewMap.put("startRow", 1);
		reviewMap.put("endRow", totalReviewCount);
		reviewMap.put("pt_service_sortation", PtServiceSortationEnum.리뷰.getValue());
		reviewMap.put("pt_service_status", PtServiceStatusEnum.일반리뷰.getValue());
		reviewMap.put("trainer_no", trainer.getTrainerNo());
		
		model.addAttribute("trainer", trainer); // 트레이너 객체 보내기
		model.addAttribute("award", awardService.getAwardList(trainer.getTrainerNo()));
		model.addAttribute("ptPricing", ptPricingService.getPtPricingList(trainer.getTrainerNo()));
		model.addAttribute("schedule", scheduleService.getScheduleList(trainer.getTrainerNo()));
		model.addAttribute("posting", postingService.getPosting(trainer.getTrainerNo()));
		model.addAttribute("reviews", ptServiceService.getPtServiceTrainerList(reviewMap));
		
		return "/content/posting_detail";
	}
	
	// 답글 추가 메서드 POST 요청
	@RequestMapping(value = "/review/reply/write", method = RequestMethod.POST)
	public String reviewReplyAdd(@ModelAttribute PtService ptService, HttpServletRequest request, HttpSession session) {
		
		int trainerMemberNo = ((Member)session.getAttribute("loginUserinfo")).getMemberNo();
		
		// pk는 이미 들어가있음
		request.getParameter("ptServiceReply");
		ptServiceService.modifyPtService(ptService);
		
		return "redirect:/myposting/detail/"+trainerMemberNo;
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

		Posting dbPosting = postingService.getPosting(trainerService.getTrainer(memberNo).getTrainerNo());
		List<MultipartFile> item = new ArrayList<MultipartFile>(); // 자기소개 파일들
		List<String> dbName = new ArrayList<String>(); // DB에 있는 파일 이름들
		List<String> hiddenListNames = new ArrayList<String>(); // hidden 속성 파일 첨부 및 삭제 영향 받은 파일 이름들

		// 파일이 저장될 서버디렉토리 주소
		String uploadDirectory = context.getServletContext()
				.getRealPath("/resources/assets/postingSelfIntroductionImages");

		item.add(request.getFile("Img1"));
		item.add(request.getFile("Img2"));
		item.add(request.getFile("Img3"));
		item.add(request.getFile("Img4"));

		dbName.add(dbPosting.getPostingSelfIntroductionImg1());
		dbName.add(dbPosting.getPostingSelfIntroductionImg2());
		dbName.add(dbPosting.getPostingSelfIntroductionImg3());
		dbName.add(dbPosting.getPostingSelfIntroductionImg4());

		hiddenListNames.add(request.getParameter("currentImage1"));
		hiddenListNames.add(request.getParameter("currentImage2"));
		hiddenListNames.add(request.getParameter("currentImage3"));
		hiddenListNames.add(request.getParameter("currentImage4"));
		
		for (int i = 0; i <= 3; i++) {

			if (!item.get(i).isEmpty()) { // 받아온 file이 있다?

				if (dbName.get(i) != null) {// DB에도 같은 file이 있어
					
					// (파일 [추가된]변경의 의미 -> 받아온 파일 이름과 dB에 저장된 파일 이름을 비교해서 없다?
					if ((item.get(i).getOriginalFilename().equals(dbName.get(i))) == false) {

						// 다르면(파일이 변경되었다는 의미) db setter로 파일 이름 바로 추가
						if (i == 0) {
							posting.setPostingSelfIntroductionImg1(item.get(i).getOriginalFilename());
						}
						if (i == 1) {
							posting.setPostingSelfIntroductionImg2(item.get(i).getOriginalFilename());
						}
						if (i == 2) {
							posting.setPostingSelfIntroductionImg3(item.get(i).getOriginalFilename());
						}
						if (i == 3) {
							posting.setPostingSelfIntroductionImg4(item.get(i).getOriginalFilename());
						}

						// 기존 업로드 된 파일 삭제
						new File(uploadDirectory, dbName.get(i)).delete();

						// 새로운 File 객체 생성 후 받아온 파일 이름 인자로 주입
						File file = new File(uploadDirectory, item.get(i).getOriginalFilename());

						// 서버에 업로드할 이름은 받아온 파일 이름으로 통일
						String uploadFilename = item.get(i).getOriginalFilename();

						// 서버 디렉토리에 전달파일과 같은 이름의 파일이 존재할 경우 서버 디렉토리에 저장될 파일명 변경
						int j = 0;
						while (file.exists()) {// 서버 디렉토리에 같은 이름의 파일이 있는 경우 반복 처리
							j++;
							int index = item.get(i).getOriginalFilename().lastIndexOf(".");
							
							uploadFilename = item.get(i).getOriginalFilename().substring(0, index) + "_" + j
									+ item.get(i).getOriginalFilename().substring(index);
							file = new File(uploadDirectory, uploadFilename);
						}
						item.get(i).transferTo(file); // 받아온 파일 서버에 업로드
					}
				} else if(dbName.get(i) == null) { // DB에 파일이 없을 경우 -> 파일 추가
					
					if (i == 0) {
						posting.setPostingSelfIntroductionImg1(item.get(i).getOriginalFilename());
					}
					if (i == 1) {
						posting.setPostingSelfIntroductionImg2(item.get(i).getOriginalFilename());
					}
					if (i == 2) {
						posting.setPostingSelfIntroductionImg3(item.get(i).getOriginalFilename());
					}
					if (i == 3) {
						posting.setPostingSelfIntroductionImg4(item.get(i).getOriginalFilename());
					}

					// 새로운 File 객체 생성 후 받아온 파일 이름 인자로 주입
					File file = new File(uploadDirectory, item.get(i).getOriginalFilename());

					// 서버에 업로드할 이름은 받아온 파일 이름으로 통일
					String uploadFilename = item.get(i).getOriginalFilename();

					// 서버 디렉토리에 전달파일과 같은 이름의 파일이 존재할 경우 서버 디렉토리에 저장될 파일명 변경
					int j = 0;
					while (file.exists()) {// 서버 디렉토리에 같은 이름의 파일이 있는 경우 반복 처리
						j++;
						int index = item.get(i).getOriginalFilename().lastIndexOf(".");
						uploadFilename = item.get(i).getOriginalFilename().substring(0, index) + "_" + j
								+ item.get(i).getOriginalFilename().substring(index);
						file = new File(uploadDirectory, uploadFilename);
					}
					item.get(i).transferTo(file); // 받아온 파일 서버에 업로드
				}
				
			} else if (item.get(i).isEmpty()) { // 받아온 파일이 없을 경우
				
				if (hiddenListNames.get(i) == null || hiddenListNames.get(i).equals("")) { // 파일을 진짜 삭제하고자 하는 경우
					
					//DB에는 파일이 있다 (삭제하는 경우 : DB & Server directory)
					// 서버 파일 삭제 및 DB 삭제
					
					if (i == 0) {
						posting.setPostingSelfIntroductionImg1(NULL_COMMENT);
					}
					if (i == 1) {
						posting.setPostingSelfIntroductionImg2(NULL_COMMENT);
						System.out.println("posting.getPostingSelfIntroductionImg2() = "+posting.getPostingSelfIntroductionImg2());
					}
					if (i == 2) {
						posting.setPostingSelfIntroductionImg3(NULL_COMMENT);
						System.out.println("posting.getPostingSelfIntroductionImg3() = "+posting.getPostingSelfIntroductionImg3());

					}
					if (i == 3) {
						posting.setPostingSelfIntroductionImg4(NULL_COMMENT);
						System.out.println("posting.getPostingSelfIntroductionImg4() = "+posting.getPostingSelfIntroductionImg4());

					}
					
					
					// 기존 업로드 된 파일 삭제
					if(dbName.get(i) != null)
						new File(uploadDirectory, dbName.get(i)).delete();
					
				}
				
			}
		}

		posting.setTrainerNo(trainerService.getTrainer(memberNo).getTrainerNo());

		// 포스팅 추가 서비스 메서드 호출 (자기소개, 프로그램 소개는 이미 들가있음)
		postingService.modifyPosting(posting);

// ===========================PT 스케쥴 수정(전체 삭제 후 추가하는 로직)================================

		// 일단 전체 삭제 (트레이너 번호로 전체 삭제)
		scheduleService.removeTrainerSchdule(trainerService.getTrainer(memberNo).getTrainerNo());

		// 체크 박스 선택된 애들만 받아옴
		String[] workdays = request.getParameterValues("workdayCheck");
		String[] hour1s = request.getParameterValues("hour1");
		String[] minute1s = request.getParameterValues("minute1");
		String[] hour2s = request.getParameterValues("hour2");
		String[] minute2s = request.getParameterValues("minute2");

		String dayOff = request.getParameter("dayoff");
		String dayOffText = request.getParameter("dayOffText");

		scheduleService.getScheduleList(trainerService.getTrainer(memberNo).getTrainerNo());

		int dayCount = 0;
		for (String workday : workdays) {

			Schedule schedule = new Schedule();
			String time = hour1s[dayCount] + ":" + minute1s[dayCount] + "~" + hour2s[dayCount] + ":"
					+ minute2s[dayCount];
			System.out.println("time[" + dayCount + "]의 값은 : " + time);
			schedule.setScheduleHours(time);
			schedule.setScheduleWorkday(ScheduleWorkdayEnum.of(Integer.parseInt(workday)).getValue());
			schedule.setTrainerNo(trainerService.getTrainer(memberNo).getTrainerNo());

			scheduleService.addSchedule(schedule); // 기존 휴무일 제외 스케쥴 다시 추가

			dayCount++;
		}

		// 휴무일 정보도 있을 시
		if ((dayOff != null) && (!dayOffText.equals(""))) {
			Schedule schedule = new Schedule();
			schedule.setScheduleWorkday(ScheduleWorkdayEnum.of(Integer.parseInt(dayOff)).getValue());
			schedule.setScheduleDayoff(dayOffText);
			schedule.setTrainerNo(trainerService.getTrainer(memberNo).getTrainerNo());

			scheduleService.addSchedule(schedule); // 휴무일도 다시 추가
		}

// ===========================PT 이용가격 수정(전체 삭제 후 추가하는 로직)================================

		// 일단 전체 이용가격 삭제
		ptPricingService.removeTrainerPtPricing(trainerService.getTrainer(memberNo).getTrainerNo());

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
