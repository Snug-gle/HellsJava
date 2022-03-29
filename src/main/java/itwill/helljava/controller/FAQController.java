package itwill.helljava.controller;


import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.HtmlUtils;

import itwill.helljava.Enum.NoticeServiceSortationEnum;
import itwill.helljava.Enum.NoticeServiceStatusEnum;
import itwill.helljava.dto.NoticeService;
import itwill.helljava.service.NoticeServiceService;
import itwill.helljava.util.Pager;

@Controller
@RequestMapping("/faq")
public class FAQController {

	@Autowired
	private NoticeServiceService noticeServiceService;
	
	@RequestMapping("/board" )
	public String faqList() {
		return "board/faq_list";
	}
	
	//테이블에 저장된 게시글 목록을 검색하여 JSON 형식의 텍스트로 응답하는 요청 처리 메소드
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> faqList(@RequestParam(defaultValue = "1")int pageNum) {
		//테이블에 저장된 모든 게시글의 갯수 검색하여 반환받아 저장
		
		Map<String, Object> countMap = new HashMap<String, Object>();
		
		countMap.put("notice_service_sortation", NoticeServiceSortationEnum.FAQ.getValue());
		countMap.put("notice_service_status", NoticeServiceStatusEnum.일반글.getValue());
		
		int totalBoard=noticeServiceService.getNoticeServiceCount(countMap);
		int pageSize=5;
		int blockSize=10;
		
		//페이징 처리 관련 값을 Pager 클래스로 저장
		Pager pager = new Pager(pageNum, totalBoard, pageSize, blockSize);
		
		//메소드 호출을 위해 매개변수에 전달하기 위한 Map 객체 생성
		Map<String, Object> pagerMap = new HashMap<String,Object>();
		pagerMap.put("startRow", pager.getStartRow());
		pagerMap.put("endRow", pager.getEndRow());
		pagerMap.put("notice_service_sortation", NoticeServiceSortationEnum.FAQ.getValue());
		pagerMap.put("notice_service_status", NoticeServiceStatusEnum.일반글.getValue());
		
		//요청 처리 메소드의 반환값으로 사용될 Map 객체 생성
		Map<String, Object> returnMap = new HashMap<String,Object>();
		returnMap.put("faqList", noticeServiceService.getNoticeServiceList(pagerMap));
		returnMap.put("pager", pager);
		
		return returnMap;
		
	}
	
	//게시글을 전달받아 테이블에 삽입하여 저장하고 처리 결과를 일반 텍스트로 응답하는 요청 처리 메소드
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	@ResponseBody
	public String faqWrite(@RequestBody NoticeService noticeService) {
		noticeService.setNoticeServiceContent(HtmlUtils.htmlEscape(noticeService.getNoticeServiceContent()));
		noticeServiceService.addNoticeService(noticeService);
		return "success";
	} 
	
	//글번호를 전달받아 테이블에 저장된 해당 글번호의 게시글을 검색하여 JSON 형식의
	//텍스트로 응답하는 요청 처리 메소드 - 요청 URL 주소를 이용하여 글번호 전달
	@RequestMapping(value = "/view/{num}" , method = RequestMethod.GET)
	@ResponseBody
	public NoticeService faqView(@PathVariable int num) {
		return noticeServiceService.getNoticeService(num);
	}
	
	//게시글을 전달 받아 테이블에 저장된 게시글을 변경하고 
	//처리 결과를 일반 텍스트로 응답하는 요청 처리 메소드
	@RequestMapping(value = "/modify", method = {RequestMethod.PUT, RequestMethod.PATCH})
	@ResponseBody
	public String faqModify(@RequestBody NoticeService noticeService) {
		noticeServiceService.modifyNoticeService(noticeService);
		return "success";
	}

	@RequestMapping(value = "/remove/{num}", method = RequestMethod.DELETE)
	@ResponseBody
	public String faqRemove(@PathVariable int num) {
		
		return "success";
	}
	
	/*
	 * //CSS
	 * 
	 * @RequestMapping("/write") public String write() { return "board/faq_write"; }
	 */
	
}
