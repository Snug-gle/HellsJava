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
@RequestMapping("/review" )
public class ReviewController {

	@Autowired
	private PtServiceService ptServiceService;
	
	@Autowired
	private TrainerService trainerService;
	
	//내가 쓴 리뷰 보기 목록 리스트
	@RequestMapping(value = "/list",method = RequestMethod.GET)
	public String searchList(@RequestParam(defaultValue = "1") int pageNum, HttpSession session, Model model){
		
		if (session.getAttribute("loginUserinfo") != null) {
			
		}

		Map<String, Object> searchMap = new HashMap<String, Object>();
		
		searchMap.put("pt_service_sortation", PtServiceSortationEnum.리뷰.getValue());
		searchMap.put("pt_service_status", PtServiceStatusEnum.일반리뷰.getValue());
		searchMap.put("member_no", ((Member) session.getAttribute("loginUserinfo")).getMemberNo());
		
		int totalBoard = ptServiceService.getPtServiceCount(searchMap);
		int pageSize = 5; //한 페이지에 출력될 게시글의 갯수 저장
		int blockSize = 10; //한 페이지 블럭에 출력될 페이지 번호의 갯수 저장
		
		//페이징 처리 관련 값을 제공하는 Pager 클래스로 객체를 생성하여 저장
		Pager pager = new Pager(pageNum, totalBoard, pageSize, blockSize);
		
		//Service 클래스의 메소드 호출을 위한 Map 객체 생성
		Map<String,	Object> returnMap = new HashMap<String, Object>();
		returnMap.put("startRow", pager.getStartRow());
		returnMap.put("endRow", pager.getEndRow());
		returnMap.put("pt_service_sortation", PtServiceSortationEnum.리뷰.getValue());
		returnMap.put("pt_service_status", PtServiceStatusEnum.일반리뷰.getValue());
		returnMap.put("member_no", ((Member) session.getAttribute("loginUserinfo")).getMemberNo());
		
		model.addAttribute("reviewrList",ptServiceService.getPtServiceList(returnMap));
		model.addAttribute("pager",pager);

		return "board/review_list";
	}
	
	// //내가 쓴 리뷰 보기 목록 리스트 =>삭제
	@RequestMapping(value = "list/reviewUpdate", method = RequestMethod.GET)
	public String memberStatusModify(HttpServletRequest req) {
		
		int pt_service_no = Integer.parseInt(req.getParameter("ptServiceNo"));
		int pt_service_status =Integer.parseInt(req.getParameter("ptServiceStatus"));
		
		PtService ptdelete = ptServiceService.getPtService(pt_service_no);
		
		ptdelete.setPtServiceNo(pt_service_no);
		ptdelete.setPtServiceStatus(pt_service_status);
		
		ptServiceService.modifyPtService(ptdelete);
		
		return "redirect:/review/list";
	}

	//리뷰 작성 및 수정 페이지 요청 처리 메소드
	@RequestMapping(value = "/write" , method = RequestMethod.GET)
	public String reviewWrite(HttpServletRequest req, HttpSession session, Model model) {
		
		if (session.getAttribute("loginUserinfo") != null) {
			
		}
		if(req.getParameter("ptServiceNo") !=null) {
			int ptServiceNo = Integer.parseInt(req.getParameter("ptServiceNo"));
			PtService ptdelete = ptServiceService.getPtService(ptServiceNo);//글 넘버로 글 정보 받아오기
			Trainer trainer = trainerService.getTrainerTrainerNo(ptdelete.getTrainerNo()); //글정보에 있는 트레이너 번호로 이름 가져오기
			

			model.addAttribute("review", ptdelete);
			model.addAttribute("trainer", trainer);
		}
	
		return "board/review_write";
	}
	
	//리뷰 작성 후 저장 요청 처리 메소드
	@RequestMapping(value =  "/write", method = RequestMethod.POST)
	public String reviewWrite(@ModelAttribute PtService ptService , HttpSession session, Model model) {
		
		int memberNo = ((Member) (session.getAttribute("loginUserinfo"))).getMemberNo();//이거슨 로그인한놈의 회원번호여
		
		  ptService.setMemberNo(memberNo); ptService.setPtServiceStatus(1);
		  ptService.setPtServiceSortation(1);
		
		  //테스트 코드
		  ptService.setTrainerNo(1);//수동으로 부여
		
		  ptServiceService.addPtService(ptService);

		return "redirect:/review/list";
	}
	
	//리뷰 수정 후 저장 요청 처리 메소드
	@RequestMapping("/modify")
	public String reviewModify(@ModelAttribute PtService ptService) {
		
		
		ptService.setPtServiceStatus(9);//쿼리 if문 회피용 값 수동 부여
		ptServiceService.modifyPtService(ptService);

		return "redirect:/review/list";
	}
	
}