package itwill.helljava.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import itwill.helljava.Enum.PtServiceSortationEnum;
import itwill.helljava.Enum.PtServiceStatusEnum;
import itwill.helljava.dto.Member;
import itwill.helljava.dto.PtService;
import itwill.helljava.service.PtServiceService;

@Controller
public class PtRequestController {

	@Autowired
	PtServiceService ptServiceService;
	
	//PT 문의 POST 방식 요청
	@RequestMapping(value = "/pt/request/{trainerNo}", method = RequestMethod.POST)
	public String ptRequest(@PathVariable("trainerNo") int trainerNo,
			HttpSession session, @ModelAttribute PtService ptService) {
		
		ptService.setMemberNo(((Member)session.getAttribute("loginUserinfo")).getMemberNo());
		ptService.setTrainerNo(trainerNo);
		ptService.setPtServiceStatus(PtServiceStatusEnum.미확인문의.getValue());
		ptService.setPtServiceSortation(PtServiceSortationEnum.피티문의.getValue());
		
		ptServiceService.addPtService(ptService);
		
		return "main"; // 나의 pt 문의 신청리스트로 보내고 싶다 혹시 하면 주석 제거 할것
	}
	
	// 나의 PT 문의 리스트 페이지 이동
	@RequestMapping(value = "/pt/request/list", method = RequestMethod.GET)
	public String myPtRequestList() {
		
		return "/user/ptonce/ptonce_list";
	}
}
