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
import itwill.helljava.util.Auth;
import itwill.helljava.util.AuthUser;
import itwill.helljava.util.Auth.Role;

@Controller
public class PtRequestController {

	@Autowired
	PtServiceService ptServiceService;
	
	//PT 문의 POST 방식 요청
	@Auth(role=Role.USER)
	@RequestMapping(value = "/pt/request/{trainerNo}", method = RequestMethod.POST)
	public String ptRequest(@PathVariable("trainerNo") int trainerNo,
			@AuthUser Member member, @ModelAttribute PtService ptService) {
		
		ptService.setMemberNo(member.getMemberNo());
		ptService.setTrainerNo(trainerNo);
		ptService.setPtServiceStatus(PtServiceStatusEnum.미확인문의.getValue());
		ptService.setPtServiceSortation(PtServiceSortationEnum.피티문의.getValue());
		
		ptServiceService.addPtService(ptService);
		
		return "redirect:/ptqna/list"; // 나의 pt 문의 신청리스트로 보내고 싶다 혹시 하면 주석 제거 할것
	}

}
