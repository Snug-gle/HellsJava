package itwill.helljava.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import itwill.helljava.dto.Member;
import itwill.helljava.dto.PtService;
import itwill.helljava.service.PtServiceService;

@Controller
@RequestMapping("/oOo")
public class OneOnOneController {

	@Autowired
	private PtServiceService ptServiceService;
	
	//1:1 문의 내역
	@RequestMapping("/list")
	public String list() {
		return "board/oOo_list";
	}
	
	//1:1 문의 작성 페이지 요청 처리 메소드
	@RequestMapping(value =  "/write" ,method = RequestMethod.GET)
	public String write() {
		return "board/oOo_write";
	}
	
	//1:1 문의 등록 포스트 방식 요청 처리 메소드
	@RequestMapping(value =  "/write" , method = RequestMethod.POST)
	public String register(@ModelAttribute PtService ptService, HttpSession session) { 
		
		ptService.setMemberNo(((Member)session.getAttribute("loginUserinfo")).getMemberNo());
		ptServiceService.addPtService(ptService);
		return "board/oOo_list";
	}
	
	// 글번호를 받아 1:1 문의 삭제 요청
	// =>삭제 메소드를 만드는게 더 나을듯 함
	@RequestMapping(value = "/remove/{num}" ,method = RequestMethod.GET)
	public String remove(@ModelAttribute PtService ptService ,@PathVariable int num) {
		ptServiceService.modifyPtServiceGood(num);
		return "board/oOo_list";
	}
}
