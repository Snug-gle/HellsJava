package itwill.helljava.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import itwill.helljava.Enum.PtServiceSortationEnum;
import itwill.helljava.Enum.PtServiceStatusEnum;
import itwill.helljava.dto.Member;
import itwill.helljava.service.PtServiceService;
import itwill.helljava.util.Pager;

@Controller
@RequestMapping("/ptqna")
public class PtQnAController {
	
	@Autowired
	private PtServiceService ptServiceService;
	
	//미확인 리스트 페이지 요청 처리 메소드
	@RequestMapping("/list/miss")
	public String searchMissList(Model model , HttpSession session ,@RequestParam(defaultValue = "1" )int pageNum) {
		
		//페이징 처리 위한 정보 저장
		Map<String, Object> countMap = new HashMap<String, Object>();
		countMap.put("pt_service_sortation", PtServiceSortationEnum.피티문의.getValue());
		countMap.put("member_no", ((Member)session.getAttribute("loginUserinfo")).getMemberNo());
		
		int totalBroad =  ptServiceService.getPtServiceCount(countMap);
		int pageSize = 3;
		int blockSize = 5;
		Pager pager = new Pager(pageNum, totalBroad, pageSize, blockSize);

		//미확인 리스트
		Map<String, Object> missMap = new HashMap<String, Object>();
		missMap.put("startRow", pager.getStartRow());
		missMap.put("endRow", pager.getEndRow());
		missMap.put("pt_service_sortation",PtServiceSortationEnum.피티문의.getValue());
		missMap.put("pt_service_status", PtServiceStatusEnum.미확인문의.getValue());	
		missMap.put("member_no", ((Member)session.getAttribute("loginUserinfo")).getMemberNo());
		
		model.addAttribute("pager",pager);	
		model.addAttribute("missList",ptServiceService.getPtServiceList(missMap));
		return "/user/ptQnA/ptQnA_list_miss";
	}
	
	//확인 리스트 페이지 요청 처리 메소드
	@RequestMapping("/list/confirm")
	public String searchConfirmList(Model model , HttpSession session ,@RequestParam(defaultValue = "1" )int pageNum) {
		
		//페이징 처리 위한 정보 저장
		Map<String, Object> countMap = new HashMap<String, Object>();
		countMap.put("pt_service_sortation", PtServiceSortationEnum.피티문의.getValue());
		countMap.put("member_no", ((Member)session.getAttribute("loginUserinfo")).getMemberNo());
		
		int totalBroad =  ptServiceService.getPtServiceCount(countMap);
		int pageSize = 3;
		int blockSize = 5;
		Pager pager = new Pager(pageNum, totalBroad, pageSize, blockSize);
		
		//확인 리스트
		Map<String, Object> confirmMap = new HashMap<String, Object>();
		confirmMap.put("startRow", pager.getStartRow());
		confirmMap.put("endRow", pager.getEndRow());
		confirmMap.put("pt_service_sortation",PtServiceSortationEnum.피티문의.getValue());
		confirmMap.put("pt_service_status", PtServiceStatusEnum.확인문의.getValue());	
		
		model.addAttribute("pager",pager);
		model.addAttribute("confirmList",ptServiceService.getPtServiceList(confirmMap));
		return "/user/ptQnA/ptQnA_list_confirm";
	}

}
