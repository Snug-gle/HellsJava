package itwill.helljava.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import itwill.helljava.Enum.NoticeServiceSortationEnum;
import itwill.helljava.dto.Member;
import itwill.helljava.dto.NoticeService;
import itwill.helljava.dto.PtService;
import itwill.helljava.service.NoticeServiceService;
import itwill.helljava.util.Pager;

@Controller
@RequestMapping("/oOo")
public class OneOnOneController {

	@Autowired
	private NoticeServiceService noticeServiceService;
	
	//1:1 문의 내역
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(HttpSession session, Model model, @RequestParam(defaultValue = "1")int pageNum) {
		Map<String, Object> countMap = new HashMap<String, Object>();
		countMap.put("notice_service_sortation", NoticeServiceSortationEnum.일대일문의.getValue());
		countMap.put("member_no",((Member)session.getAttribute("loginUserinfo")).getMemberNo());
		
		int totalBoard = noticeServiceService.getNoticeServicePersonalCount(countMap);
		int pageSize = 5;
		int blockSize = 10;
		Pager pager = new Pager(pageNum, totalBoard, pageSize, blockSize);
		Map<String, Object> pagerMap = new HashMap<String, Object>();
		pagerMap.put("startRow", pager.getStartRow());
		pagerMap.put("endRow", pager.getEndRow());
		pagerMap.put("memberNo", ((Member)session.getAttribute("loginUserinfo")).getMemberNo());
		/*
		pagerMap.put("notice_service_sortation", NoticeServiceSortationEnum.일대일문의.getValue());
		*/
		model.addAttribute("oOoList", noticeServiceService.getNoticeServicePersonalList(pagerMap));
		model.addAttribute("pager",pager);
		return "/board/oOo_list";
	}
	
	//1:1 문의 작성 페이지 요청 처리 메소드
	@RequestMapping(value =  "/write" ,method = RequestMethod.GET)
	public String write() {
		return "/board/oOo_write";
	}
	
	//1:1 문의 등록 포스트 방식 요청 처리 메소드
	@RequestMapping(value =  "/write" , method = RequestMethod.POST)
	public String register(@ModelAttribute NoticeService noticeService, HttpSession session) { 
		
		noticeService.setMemberNo(((Member)session.getAttribute("loginUserinfo")).getMemberNo());
		noticeServiceService.addNoticeService(noticeService);
		return "/board/oOo_list";
	}
	
	// 글번호를 받아 1:1 문의 삭제 요청
	@RequestMapping(value = "/remove/{num}" ,method = RequestMethod.GET)
	public String remove(@ModelAttribute PtService ptService ,@PathVariable int num) {
		noticeServiceService.removeNoticeService(num);
		return "/board/oOo_list";
	}
}
