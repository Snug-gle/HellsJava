package itwill.helljava.controller;

import java.io.File;
import java.io.IOException;
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

import itwill.helljava.dto.Award;
import itwill.helljava.dto.Member;
import itwill.helljava.dto.Trainer;
import itwill.helljava.exception.AccountPwAuthException;
import itwill.helljava.service.AccountSevice;
import itwill.helljava.service.AwardService;
import itwill.helljava.service.TrainerService;

@Controller
public class TrainerController {

	// 필드에 WebApplicationContext 객체(Spring Container)를 저장하도록 인젝션 처리
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
	public String trainerRequest(@ModelAttribute Trainer trainer, @ModelAttribute Award award, 
			MultipartHttpServletRequest request, HttpSession session)
			throws AccountPwAuthException, IllegalStateException, IOException {

		// 파일 없을 경우 다시 요청 페이지로 가라
		if (request.getFileNames() == null) {
			return "/user/trainer/trainer_request";
		}
		
		// 수상 경력 설명 배열
		String[] content = request.getParameterValues("awardContent");
		
		// input 태그 name 속성 이름들 담고
		Iterator<String> fileNames = request.getFileNames();

		// 이름들 있으면 돌려라 얜 두번 돌겄지..
		while (fileNames.hasNext()) {

			String fileName = fileNames.next();

			if (fileName.equals("trainerProfileImage")) { // 프로필 이미지일 경우
				MultipartFile profileFile = request.getFile(fileName);

				// WebApplicationContext 객체를 이용하여 ServletContext 객체를 제공받아 서버 디렉토리의
				// 파일 시스템 경로를 반환받아 저장
				String uploadDirectory = context.getServletContext().getRealPath("/resources/assets/profileImages");

				// 일단 프로필 이미지 받은 거 전달 파일명을 트레이너 번호든 이름이든 붙여서 반환받아 저장
				String originalFilename = profileFile.getOriginalFilename() + "_profile_memberNo_"
						+ ((Member) session.getAttribute("loginUserinfo")).getMemberNo();
				
				// 트레이너 이미지 파일 원본 주소 setter로 추가
				trainer.setTrainerProfileImg(originalFilename);
				trainer.setMemberNo(((Member)session.getAttribute("loginUserinfo")).getMemberNo());
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
				List<MultipartFile> awardFiles = request.getFiles(fileName);

				int contentCount = 0; // 수상 설명 카운트 변수
				// 얜 두번 돌거 아녀
				for (MultipartFile multipartFile : awardFiles) {
					
					// WebApplicationContext 객체를 이용하여 ServletContext 객체를 제공받아 서버 디렉토리의
					// 파일 시스템 경로를 반환받아 저장
					String uploadDirectory = context.getServletContext().getRealPath("/resources/assets/awardImages");

					String originalFilename = multipartFile.getOriginalFilename() + "_award_memberNo_"
							+ ((Member) session.getAttribute("loginUserinfo")).getMemberNo();
					
					award.setAwardContent(content[contentCount]);
					award.setAwardImage(originalFilename);
					// 트레이너 번호를 얻어와서 award 추가
					// 얘가 지금 트레이너를 추가하는 과정인데 과연 트레이너번호를 가져올 수 있을까..?
					// => 프로필 이미지 저장할 때 트레이너 추가해버림
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
					
					contentCount++; // 돌려주고.
				}
			}
		}
		
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
