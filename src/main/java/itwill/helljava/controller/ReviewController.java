package itwill.helljava.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import itwill.helljava.Enum.NoticeServiceSortationEnum;
import itwill.helljava.Enum.PtServiceSortationEnum;
import itwill.helljava.Enum.PtServiceStatusEnum;
import itwill.helljava.dto.Member;
import itwill.helljava.dto.NoticeService;
import itwill.helljava.dto.PtService;
import itwill.helljava.dto.Trainer;
import itwill.helljava.service.PtServiceService;
import itwill.helljava.service.TrainerService;
import itwill.helljava.util.Pager;

@Controller
@RequestMapping("/review")
public class ReviewController {

	@Autowired
	private PtServiceService ptServiceService;

	@Autowired
	private TrainerService trainerService;

	// 내가 쓴 리뷰 보기 목록 리스트
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String searchList(@RequestParam(defaultValue = "1") int pageNum, HttpSession session, Model model) {

		if (session.getAttribute("loginUserinfo") != null) {

		}

		Map<String, Object> searchMap = new HashMap<String, Object>();

		searchMap.put("pt_service_sortation", PtServiceSortationEnum.리뷰.getValue());
		searchMap.put("pt_service_status", PtServiceStatusEnum.일반리뷰.getValue());
		searchMap.put("member_no", ((Member) session.getAttribute("loginUserinfo")).getMemberNo());

		int totalBoard = ptServiceService.getPtServiceCount(searchMap);
		int pageSize = 5; // 한 페이지에 출력될 게시글의 갯수 저장
		int blockSize = 10; // 한 페이지 블럭에 출력될 페이지 번호의 갯수 저장

		// 페이징 처리 관련 값을 제공하는 Pager 클래스로 객체를 생성하여 저장
		Pager pager = new Pager(pageNum, totalBoard, pageSize, blockSize);

		// Service 클래스의 메소드 호출을 위한 Map 객체 생성
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("startRow", pager.getStartRow());
		returnMap.put("endRow", pager.getEndRow());
		returnMap.put("pt_service_sortation", PtServiceSortationEnum.리뷰.getValue());
		returnMap.put("pt_service_status", PtServiceStatusEnum.일반리뷰.getValue());
		returnMap.put("member_no", ((Member) session.getAttribute("loginUserinfo")).getMemberNo());

		model.addAttribute("reviewrList", ptServiceService.getPtServiceList(returnMap));
		model.addAttribute("pager", pager);

		return "/board/review_list";
	}

	// 내가 쓴 리뷰 보기 목록 리스트 =>삭제
	@RequestMapping(value = "/reviewDelete", method = RequestMethod.GET)
	public String memberStatusModify(HttpServletRequest req, @RequestParam int ptServiceNo) {

		PtService ptdelete = ptServiceService.getPtService(ptServiceNo);

		ptdelete.setPtServiceNo(ptServiceNo);
		ptdelete.setPtServiceStatus(PtServiceStatusEnum.삭제리뷰.getValue());

		ptServiceService.modifyPtService(ptdelete);

		return "redirect:/review/list";
	}

	// 회원 1회 pt 신청 리스트에서 리뷰 작성 버튼을 눌렀을 때 요청 처리 메소드
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String reviewWrite(HttpServletRequest req, HttpSession session, Model model,
			@RequestParam int trainerNo) {
		
		// 작성 회원 번호
		int writeMemberNo = ((Member)session.getAttribute("loginUserinfo")).getMemberNo();
		
		Map<String, Object> reviewMap = new HashMap<String, Object>();
		
		reviewMap.put("memberNo", writeMemberNo);
		reviewMap.put("trainerNo", trainerNo);
		
		// 작성된 리뷰가 없을 때
		if(ptServiceService.getPtServiceReview(reviewMap)==null){
			model.addAttribute("trainer", trainerService.getTrainerTrainerNo(trainerNo));
			return "/board/review_write";
		}
		
		// 있으면
		return "redirect:/review/list";
	}

	// 리뷰 수정 버튼을 눌렀을 때 페이지 GET 요청
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String reviewUpdate(HttpServletRequest req, Model model, @RequestParam int ptServiceNo,@RequestParam int trainerNo) {
		
		

		PtService review = ptServiceService.getPtService(ptServiceNo);// 글 넘버로 글 정보 받아오기
		Trainer trainer = trainerService.getTrainerTrainerNo(trainerNo); // 글정보에 있는 트레이너 번호로 이름 가져오기

		model.addAttribute("review", review);
		model.addAttribute("trainer", trainer);


		return "/board/review_write";
	}
	
	// 리뷰 작성 후 저장 요청 처리 메소드 POST 요청
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String reviewWrite(@ModelAttribute PtService ptService, HttpSession session, Model model
			,HttpServletRequest request) {

		int memberNo = ((Member) (session.getAttribute("loginUserinfo"))).getMemberNo();// 이거슨 로그인한놈의 회원번호여

		ptService.setMemberNo(memberNo);
		ptService.setPtServiceStatus(PtServiceStatusEnum.일반리뷰.getValue());
		ptService.setPtServiceSortation(PtServiceSortationEnum.리뷰.getValue());
		
		ptService.setTrainerNo(Integer.parseInt(request.getParameter("trainerNo")));
		
		ptServiceService.addPtService(ptService);

		return "redirect:/review/list";
	}

	// 리뷰 수정 후 저장 요청 처리 메소드 POST 요청
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String reviewModify(@ModelAttribute PtService ptService, @RequestParam int trainerNo) {

		ptService.setPtServiceStatus(PtServiceStatusEnum.일반리뷰.getValue());// 쿼리 if문 회피용 값 수동 부여
		ptServiceService.modifyPtService(ptService);

		return "redirect:/review/list";
	}

}