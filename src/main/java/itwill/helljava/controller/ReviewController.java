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
import itwill.helljava.service.PtServiceService;
import itwill.helljava.util.Pager;

@Controller
@RequestMapping("/review" )
public class ReviewController {

	@Autowired
	private PtServiceService ptServiceService;
	
	//내가 쓴 리뷰 보기 목록 리스트
	@RequestMapping(value = "/list",method = RequestMethod.GET)
	public String searchList(@RequestParam(defaultValue = "1") int pageNum, HttpSession session, Model model){
		
		if (session.getAttribute("loginUserinfo") != null) {
			
		}

		Map<String, Object> searchMap = new HashMap<String, Object>();
		
		searchMap.put("pt_service_sortation", PtServiceSortationEnum.리뷰.getValue());
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
		
		System.out.println(" pt_service_no = "  + pt_service_no);
		System.out.println(" pt_service_status = " + pt_service_status);
		
		
		PtService ptdelete = ptServiceService.getPtService(pt_service_no);
		
		ptdelete.setPtServiceNo(pt_service_no);
		ptdelete.setPtServiceStatus(pt_service_status);
		
		ptServiceService.modifyPtService(ptdelete);
		
		return "redirect:/review/list";
	}
	
	
	
	
	
	//리뷰 작성 페이지 요청 처리 메소드
	@RequestMapping(value = "/write" , method = RequestMethod.GET)
	public String reviewWrite(HttpSession session) {
		
		if (session.getAttribute("loginUserinfo") != null) {
			
		}
	
		return "board/review_write";
	}
	
	//리뷰 작성 후 저장 요청 처리 메소드
	@RequestMapping(value =  "/write", method = RequestMethod.POST)
	public String reviewWrite(@ModelAttribute PtService ptService ,Model model) {
		
		ptServiceService.addPtService(ptService);
		//평점 옵션
		Map ratingOptions = new HashMap();
		ratingOptions.put(0, "☆☆☆☆☆");
		ratingOptions.put(1, "★☆☆☆☆");
		ratingOptions.put(2, "★★☆☆☆");
		ratingOptions.put(3, "★★★☆☆");
		ratingOptions.put(4, "★★★★☆");
		ratingOptions.put(5, "★★★★★");
		
		model.addAttribute("ratingOptions", ratingOptions);
	
		
		return "board/review_list";
	}
	
	//리뷰 수정 후 저장 요청 처리 메소드
	@RequestMapping("/modify")
	public String reviewModify(Model model) {
		return "board/review_list";
	}
	
}
