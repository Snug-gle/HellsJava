package itwill.helljava.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
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
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import itwill.helljava.Enum.MemberEnum;
import itwill.helljava.Enum.PayTypeEnum;
import itwill.helljava.dto.Account;
import itwill.helljava.dto.Award;
import itwill.helljava.dto.Member;
import itwill.helljava.dto.Pay;
import itwill.helljava.dto.Trainer;
import itwill.helljava.exception.AccountPwAuthException;
import itwill.helljava.exception.AmountOfPaymentException;
import itwill.helljava.service.AccountSevice;
import itwill.helljava.service.AwardService;
import itwill.helljava.service.MemberService;
import itwill.helljava.service.PayService;
import itwill.helljava.service.PostingService;
import itwill.helljava.service.TrainerService;
import itwill.helljava.util.Auth;
import itwill.helljava.util.Auth.Role;
import itwill.helljava.util.AuthUser;

@Controller
public class TrainerController {

	private static final int PAY_COMPLETE = 1; // 결제 완료 상수
	
	// 필드에 WebApplicationContext 객체(Spring Container)를 저장하도록 인젝션 처리
	@Autowired
	private WebApplicationContext context;

	@Autowired
	private TrainerService trainerService;

	@Autowired
	private AwardService awardService;

	@Autowired
	private AccountSevice accountSevice;

	@Autowired
	private MemberService memberService;

	@Autowired
	private PayService payService;

	@Autowired
	private PostingService postingService;
	
	// 트레이너 마이페이지 Get 요청
	@Auth(role = Role.TRAINER)
	@RequestMapping(value = "/trainer/mypage", method = RequestMethod.GET)
	public String trainerPage(Model model, @AuthUser Member member) {
		int trainerNo = trainerService.getTrainer(member.getMemberNo())
				.getTrainerNo();

		model.addAttribute("posting", postingService.getPosting(trainerNo));
		return "user/trainer/trainer_mypage";
	}

	// 트레이너 신청 화면을 요청
	@Auth(role = Role.USER)
	@RequestMapping(value = "/trainer/request", method = RequestMethod.GET)
	public String trainerRequest(@AuthUser Member member, RedirectAttributes red ) {
		Account account =  accountSevice.getMemberAccount(member.getMemberNo());
		
		if(account == null) {
			red.addFlashAttribute("message", "1");
			return "redirect:/mypage";
		}
		
		return "/user/trainer/trainer_request";
	}

	// 트레이너 수정 화면을 요청 예비트레이너 & 트레이너
	@Auth(role = Role.PRETRAINER_TRAINER)
	@RequestMapping(value = "/trainer/modify", method = RequestMethod.GET)
	public String trainerModify(@AuthUser Member member, Model model) {

		int MemberNo = member.getMemberNo();

		model.addAttribute("trainerInfo", trainerService.getTrainer(MemberNo));
		model.addAttribute("awardInfo", awardService.getAwardList(trainerService.getTrainer(MemberNo).getTrainerNo()));

		return "/user/trainer/trainer_modify";
	}

	// 트레이너 신청 POST 요청 받아온 값
	// 회원 번호, 프로필 사진, 우편번호, 소속센터 주소, 소속센터명, 수상 내용들, 수상 사진들,
	// 결제 비밀번호
	@RequestMapping(value = "/trainer/request", method = RequestMethod.POST)
	public String trainerRequest(@RequestParam Map<String, Object> map, @ModelAttribute Trainer trainer,
			@ModelAttribute Account account, MultipartHttpServletRequest request, @AuthUser Member member)
			throws AccountPwAuthException, IllegalStateException, IOException, AmountOfPaymentException {

		// 계좌 정보를 가져와서 비밀번호를 비교하고 결제 완료할 것임
		// account에 들어있는 값 : 받아온 비밀번호와 회원 번호
		account.setMemberNo(trainer.getMemberNo());
		accountSevice.accountPwAuth(account);

		// 결제 데이터 추가
		Pay pay = new Pay();
		pay.setMemberNo(account.getMemberNo());
		pay.setPayPrice(15000);
		pay.setPayType(PayTypeEnum.트레이너신청.getValue());
		pay.setPayStatus(PAY_COMPLETE);

		payService.payAuth(pay); // 결제 금액 > 캐시 잔액 예외 발생
		payService.addPay(pay);

		// 파일 없을 경우 다시 요청 페이지로 가라
		if (request.getFileNames() == null) {
			return "redirect:/trainer/request";
		}

		// 수상 경력 설명 배열
		String[] content = request.getParameterValues("aContent");

		// input 태그 name 속성 이름들 담고
		Iterator<String> fileNames = request.getFileNames();

		// 이름들 있으면 돌려라 얜 두번 돌겄지..
		while (fileNames.hasNext()) {

			String fileName = fileNames.next();

			if (fileName.equals("profileImage")) { // 프로필 이미지일 경우
				MultipartFile profileFile = request.getFile(fileName);

				// WebApplicationContext 객체를 이용하여 ServletContext 객체를 제공받아 서버 디렉토리의
				// 파일 시스템 경로를 반환받아 저장
				String uploadDirectory = context.getServletContext().getRealPath("/resources/assets/profileImages");

				// 일단 프로필 이미지 받은 거 전달 파일명을 저장
				String originalFilename = profileFile.getOriginalFilename();

				// 트레이너 이미지 파일 원본 주소 setter로 추가
				trainer.setTrainerProfileImg(originalFilename);
				trainer.setMemberNo(member.getMemberNo());
				// 트레이너 추가.
				trainerService.addTrainer(trainer);

				File file = new File(uploadDirectory, originalFilename);

				// 실제 서버 디렉토리에 저장되는 파일명을 저장하기 위한 변수 선언
				// => 초기값으로 전달파일의 이름을 저장
				String uploadFilename = originalFilename;

				// 서버 디렉토리에 전달파일과 같은 이름의 파일이 존재할 경우 서버 디렉토리에 저장될 파일명 변경
				int i = 0;
				while (file.exists()) {// 서버 디렉토리에 같은 이름의 파일이 있는 경우 반복 처리
					i++;
					int index = originalFilename.lastIndexOf(".");
					uploadFilename = originalFilename.substring(0, index) + "_" + i + originalFilename.substring(index);
					file = new File(uploadDirectory, uploadFilename);
				}

				profileFile.transferTo(file);
			}

			else { // 수상경력 이미지일 경우

				Award award = new Award();
				List<MultipartFile> awardFiles = request.getFiles(fileName);

				int contentCount = 0; // 수상 설명 카운트 변수

				// 얜 이미지 입력 갯수만큼 돌것지.
				for (MultipartFile multipartFile : awardFiles) {
					// WebApplicationContext 객체를 이용하여 ServletContext 객체를 제공받아 서버 디렉토리의
					// 파일 시스템 경로를 반환받아 저장
					String uploadDirectory = context.getServletContext().getRealPath("/resources/assets/awardImages");

					String originalFilename = multipartFile.getOriginalFilename();

					award.setAwardContent(content[contentCount]);
					contentCount++; // 돌려주고.
					award.setAwardImage(originalFilename);
					// 트레이너 번호를 얻어와서 award 추가
					// 얘가 지금 트레이너를 추가하는 과정인데 과연 트레이너번호를 가져올 수 있을까..?
					// => 프로필 이미지 저장할 때 트레이너 추가해버림 됨
					award.setTrainerNo(trainerService.getTrainer(trainer.getMemberNo()).getTrainerNo());
					awardService.addAward(award);

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

					multipartFile.transferTo(file);

				}
			}
		}

		// 트레이너로 다 신청 되면은 멤버 등급을 말이야 트레이너 예정으로 변경해야지
		Member modifyMember = new Member();
		modifyMember.setMemberNo(member.getMemberNo());
		modifyMember.setMemberStatus(MemberEnum.트레이너예정.getValue());
		memberService.modifyMember(modifyMember);

		// 회원번호는 이미 map에 들가잇음. 캐쉬 차감
		map.put("cash", 15000);
		map.put("cashType", PayTypeEnum.트레이너신청.getValue());
		memberService.modifyMemberCash(map);

		if (member.getMemberStatus() == 2) {
			return "redirect:/mypage"; // 마이페이지로 이동 (트레이너 관리 상세를 연동시키면 됨)
		}
		return "redirect:/mypage";
	}

	// 트레이너 신청 정보 수정 post 요청
	// 받아온(변경 가능) 값 : 센터 주소, 우편번호, 센터명, 프로필 사진, 수상경력 설명 및 사진
	@RequestMapping(value = "/trainer/modify", method = RequestMethod.POST)
	public String trainerModify(@RequestParam Map<String, Object> map, @ModelAttribute Trainer trainer,
			MultipartHttpServletRequest request, @AuthUser Member member, @RequestParam String memberNo)
			throws IllegalStateException, IOException {

		// 파일 없을 경우 다시 수정 페이지로 가라
		if (request.getFileNames() == null) {
			return "redirect:/trainer/modify";
		}

//--------------------------프로필, 수상경력 사진 변경-------------------------------------

		// DB에 있는 트레이너 정보 불러오기
		Trainer dbTrainer = trainerService.getTrainer(Integer.parseInt(memberNo));

		// 프로필 이미지가 저장될 서버디렉토리 주소
		String uploadProfileDirectory = context.getServletContext().getRealPath("/resources/assets/profileImages");

		// 트레이너 프로필 변경 (변경 파일이 있을 경우) => 변경해야지
		if (!request.getFile("profileImage").isEmpty()) {

			// 받아온 프로필 이미지 파일
			MultipartFile modifyProfileImage = request.getFile("profileImage");

			// 기존 파일 삭제
			new File(uploadProfileDirectory, dbTrainer.getTrainerProfileImg());

			// 서버에 저장할 파일 객체 생성 (서버 디렉토리 경로, 받아온 파일의 이름)
			File file = new File(uploadProfileDirectory, modifyProfileImage.getOriginalFilename());

			// service 변경 메서드에 태워보낼 trainer 객체의 img 속성으로 받아온 파일의 이름을 추가
			trainer.setTrainerProfileImg(modifyProfileImage.getOriginalFilename());
			trainer.setTrainerNo(dbTrainer.getTrainerNo());

			// 서버에 업로드할 파일 이름을 받아온 파일 이름과 통일
			String uploadFileName = modifyProfileImage.getOriginalFilename();

			// 서버 디렉토리에 전달파일과 같은 이름의 파일이 존재할 경우 서버 디렉토리에 저장될 파일명 변경
			int j = 0;
			while (file.exists()) {// 서버 디렉토리에 같은 이름의 파일이 있는 경우 반복 처리
				j++;
				int index = modifyProfileImage.getOriginalFilename().lastIndexOf(".");

				uploadFileName = modifyProfileImage.getOriginalFilename().substring(0, index) + "_" + j
						+ modifyProfileImage.getOriginalFilename().substring(index);
				file = new File(uploadProfileDirectory, uploadFileName);
			}

			modifyProfileImage.transferTo(file); // 파일을 서버에 업로드 시킴

			// 트레이너 번호, 센터 주소, 센터이름, 우편번호, 다 들어가있음 (Command 객체)
			trainerService.modifyTrainer(trainer);
		}

		else {
			trainer.setTrainerNo(dbTrainer.getTrainerNo());
			trainerService.modifyTrainer(trainer);
		}

// ------------------------수상 경력 이미지 및 설명 텍스트 변경-------------------------

		// 수상 경력 이미지가 저장될 서버 디렉토리
		String uploadAwardImagesDirectory = context.getServletContext().getRealPath("/resources/assets/awardImages");

		// 기존 DB 데이터들
		String[] hiddenAwardImages = request.getParameterValues("hiddenAwardImages"); // hidden 수상 경력 이미지 이름들
		String[] hiddenAwardNumbers = request.getParameterValues("hiddenAwardNumbers"); // hidden award PK들

		String[] currentAwardNumbers = request.getParameterValues("currentAwardNumbers"); // DB 수상 경력 PK들

		// 수상 경력 사진 이미지들
		List<MultipartFile> modifyAwardImages = request.getFiles("aImage");

		// 수상 경력 사진 설명들
		String[] modifyAwardContents = request.getParameterValues("aContent");

		// 기존 hidden갯수 = DB 레코드 수
		// => hidden의 갯수가 변하는 경우 : 기존 파일을 삭제하는 경우 => (-) 버튼을 눌렀을 때
		// 개수가 같을 땐 변함 없다 => 변함 없음

		// 받아온 파일이 없다 : 유지 or 삭제

		List<String> awardImgList = new ArrayList<String>();

		for (int a = 0; a < currentAwardNumbers.length; a++) {
			awardImgList.add(awardService.getAward(Integer.parseInt(currentAwardNumbers[a])).getAwardImage());
		}

		// hidden 갯수 랑 DB갯수가 안맞을때(그냥 삭제했을때)
		// hidden 갯수 < DB 레코드 갯수
		if (hiddenAwardNumbers.length < currentAwardNumbers.length) {

			// 1. 기존 파일 삭제 -> 해당 DB 삭제
			for (int i = 0; i < awardImgList.size(); i++) {

				// hidden에는 없지만 DB 배열엔 있는 경우 db 레코드를 삭제 -> 해당 인덱스는 곧 awardNo PK
				if (Arrays.asList(hiddenAwardImages).contains(awardImgList.get(i)) == false) {

					new File(uploadAwardImagesDirectory,
							awardService.getAward(Integer.parseInt(currentAwardNumbers[i])).getAwardImage()).delete(); // 파일
																														// 삭제

					awardService.removeAward(Integer.parseInt(currentAwardNumbers[i])); // 해당 DB 레코드 삭제
				}
			}
		} else {// 히든의 크기는 같은데 (변경된 파일 삭제)

			for (int hid = 0; hid < currentAwardNumbers.length; hid++) {
				if (hiddenAwardImages[hid].equals(awardImgList.get(hid)) == false) { // 히든의 값이 DB값이랑 일치하지 않으면
					// 기존 DB값과 기존 파일서버에서 삭제
					new File(uploadAwardImagesDirectory,
							awardService.getAward(Integer.parseInt(currentAwardNumbers[hid])).getAwardImage()).delete(); // 파일삭제

					awardService.removeAward(Integer.parseInt(currentAwardNumbers[hid])); // 해당 DB 레코드 삭제

				}
			}
		}

		// DB최신화
		List<Award> awardList3 = awardService.getAwardList(trainer.getTrainerNo());
		String[] imgArray = new String[awardList3.size()];
		int i = 0;
		for (Award award : awardList3) {
			imgArray[i] = award.getAwardImage();
			i++;
		}

		for (int c = 0; c < modifyAwardImages.size(); c++) {

			// 받아온 파일이 있다 : 추가
			if (!modifyAwardImages.get(c).isEmpty()) {

				// DB값에 받은 파일 명이 있는지 확인.
				if (!Arrays.asList(imgArray).contains(modifyAwardImages.get(c).getOriginalFilename())) {// 없으면

					// 이제 추가만 하면됨.
					Award award = new Award();

					award.setTrainerNo(dbTrainer.getTrainerNo());
					award.setAwardImage(modifyAwardImages.get(c).getOriginalFilename());
					award.setAwardContent(modifyAwardContents[c]);

					File file = new File(uploadAwardImagesDirectory, modifyAwardImages.get(c).getOriginalFilename());

					String uploadFileName = modifyAwardImages.get(c).getOriginalFilename();

					// 서버 디렉토리에 전달파일과 같은 이름의 파일이 존재할 경우 서버 디렉토리에 저장될 파일명 변경
					int j = 0;
					while (file.exists()) {// 서버 디렉토리에 같은 이름의 파일이 있는 경우 반복 처리
						j++;
						int index = modifyAwardImages.get(c).getOriginalFilename().lastIndexOf(".");

						uploadFileName = modifyAwardImages.get(c).getOriginalFilename().substring(0, index) + "_" + j
								+ modifyAwardImages.get(c).getOriginalFilename().substring(index);
						file = new File(uploadAwardImagesDirectory, uploadFileName);
					}

					modifyAwardImages.get(c).transferTo(file);

					awardService.addAward(award);
				}
			}
		}

		if (member.getMemberStatus() == 2) {
			return "redirect:/mypage"; // 마이페이지로 이동 (트레이너 관리 상세를 연동시키면 됨)
		}
		return "redirect:/trainer/mypage"; // 트레이너 마이페이지로 이동

	}

//----------------------------예외 처리----------------------------	

	@ExceptionHandler(value = AccountPwAuthException.class)
	public String exceptionHandler(AccountPwAuthException exception, Model model) {

		// 비밀번호 틀리면 에러메시지 넘겨주자
		model.addAttribute("message", exception.getMessage());

		return "/user/trainer/trainer_request";
	}

	@ExceptionHandler(value = AmountOfPaymentException.class)
	public String exception(AmountOfPaymentException exception, Model model) {

		// 캐시 잔액 모자라면 에러메시지 넘기기
		model.addAttribute("cashMessage", exception.getMessage());
		return "/user/trainer/trainer_request";
	}

}
