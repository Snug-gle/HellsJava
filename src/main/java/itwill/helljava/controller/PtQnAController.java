package itwill.helljava.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import itwill.helljava.Enum.PtServiceSortationEnum;
import itwill.helljava.Enum.PtServiceStatusEnum;
import itwill.helljava.dto.Member;
import itwill.helljava.dto.PtService;
import itwill.helljava.service.PtServiceService;
import itwill.helljava.util.Pager;

@Controller
@RequestMapping("/ptqna")
public class PtQnAController {

	@Autowired
	private PtServiceService ptServiceService;

	// 그냥 내 pt 문의 리스트 get 요청
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String searchAllList(Model model, @RequestParam(defaultValue = "1") int pageNum,
			HttpSession session) {
		
		// 회원번호 세션으로 받음
		int memberNo = ((Member) session.getAttribute("loginUserinfo")).getMemberNo();

		// 페이징 처리 위한 정보 저장
		Map<String, Object> countMap = new HashMap<String, Object>();

		// 카운트
		countMap.put("pt_service_sortation", PtServiceSortationEnum.피티문의.getValue());
		countMap.put("member_no", memberNo);
		countMap.put("pt_service_status", 234); // 전체일 경우 넘겨봤자임
		
		int totalBroad = ptServiceService.getPtServiceCount(countMap);
		int pageSize = 3;
		int blockSize = 5;
		Pager pager = new Pager(pageNum, totalBroad, pageSize, blockSize);
		
		Map<String, Object> pagerMap = new HashMap<String, Object>();
		pagerMap.put("startRow", pager.getStartRow());
		pagerMap.put("endRow", pager.getEndRow());
		pagerMap.put("pt_service_sortation", PtServiceSortationEnum.피티문의.getValue());
		pagerMap.put("pt_service_status", 345); // 전체 다 나와라
		pagerMap.put("member_no", memberNo);

		model.addAttribute("pager", pager);
		model.addAttribute("ptQnaList", ptServiceService.getPtServiceList(pagerMap));
		
		return "/user/ptQnA/ptQnA_list";
	}

	// 확인, 미확인 여부 리스트 페이지 요청 처리 메소드
	@RequestMapping(value = "/list/status", method = RequestMethod.GET)
	public String searchMissList(Model model, @RequestParam(defaultValue = "1") int pageNum,
			@RequestParam String confirmStatus, HttpSession session) {
		
		// 회원번호 세션으로 받음
		int memberNo = ((Member) session.getAttribute("loginUserinfo")).getMemberNo();

		// 페이징 처리 위한 정보 저장
		Map<String, Object> countMap = new HashMap<String, Object>();

		// 카운트
		countMap.put("pt_service_sortation", PtServiceSortationEnum.피티문의.getValue());
		countMap.put("member_no", memberNo);
		countMap.put("pt_service_status", Integer.parseInt(confirmStatus)); // 전체일 경우 9니까 넘겨봤자임

		int totalBroad = ptServiceService.getPtServiceCount(countMap);
		int pageSize = 3;
		int blockSize = 5;
		Pager pager = new Pager(pageNum, totalBroad, pageSize, blockSize);

		//
		Map<String, Object> pagerMap = new HashMap<String, Object>();
		pagerMap.put("startRow", pager.getStartRow());
		pagerMap.put("endRow", pager.getEndRow());
		pagerMap.put("pt_service_sortation", PtServiceSortationEnum.피티문의.getValue());
		pagerMap.put("pt_service_status", Integer.parseInt(confirmStatus));
		pagerMap.put("member_no", memberNo);

		model.addAttribute("pager", pager);
		model.addAttribute("ptQnaList", ptServiceService.getPtServiceList(pagerMap));
		model.addAttribute("status",confirmStatus);
		
		return "/user/ptQnA/ptQnA_list";
	}

	// PT 문의 수정 요청 처리 메소드
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modify(@ModelAttribute PtService ptService) {

		ptServiceService.modifyPtService(ptService);
		return "redirect:/ptqna/list/miss";
	}

}
