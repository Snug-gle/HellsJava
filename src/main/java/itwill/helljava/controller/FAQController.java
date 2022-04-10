package itwill.helljava.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;

import itwill.helljava.Enum.NoticeServiceCategoryEnum;
import itwill.helljava.Enum.NoticeServiceSortationEnum;
import itwill.helljava.Enum.NoticeServiceStatusEnum;
import itwill.helljava.dto.Member;
import itwill.helljava.dto.NoticeService;
import itwill.helljava.service.NoticeServiceService;
import itwill.helljava.util.Pager;

@Controller
@RequestMapping("/faq")
public class FAQController {

	@Autowired
	private NoticeServiceService noticeServiceService;
	
	// 전체 리스트 페이지 요청 처리 메소드
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String searchAllFaqList(@RequestParam(defaultValue = "1") int pageNum, Model model) {
		// 테이블에 저장된 모든 게시글의 갯수 검색하여 반환받아 저장

		Map<String, Object> countMap = new HashMap<String, Object>();

		countMap.put("notice_service_sortation", NoticeServiceSortationEnum.FAQ.getValue());
		countMap.put("notice_service_status", NoticeServiceStatusEnum.일반글.getValue());

		int totalBoard = noticeServiceService.getNoticeServiceCount(countMap);
		int pageSize = 5;
		int blockSize = 10;
		int number = totalBoard - (pageNum - 1) * pageSize;
		
		// 페이징 처리 관련 값을 Pager 클래스로 저장
		Pager pager = new Pager(pageNum, totalBoard, pageSize, blockSize);

		// 메소드 호출을 위해 매개변수에 전달하기 위한 Map 객체 생성
		Map<String, Object> pagerMap = new HashMap<String, Object>();
		pagerMap.put("startRow", pager.getStartRow());
		pagerMap.put("endRow", pager.getEndRow());
		pagerMap.put("notice_service_sortation", NoticeServiceSortationEnum.FAQ.getValue());
		pagerMap.put("notice_service_status", NoticeServiceStatusEnum.일반글.getValue());

		model.addAttribute("faqList", noticeServiceService.getNoticeServiceList(pagerMap));
		model.addAttribute("pager", pager);
		model.addAttribute("number",number);

		return "/board/faq_list";

	}
	
	@RequestMapping(value = "/list/faqSearch", method = RequestMethod.GET)
	public String searchFaqList(@RequestParam(defaultValue = "1") int pageNum, Model model,
			@RequestParam String searchKeyword, @RequestParam String searchValue) {
		// 테이블에 저장된 모든 게시글의 갯수 검색하여 반환받아 저장
		
		Map<String, Object> countMap = new HashMap<String, Object>();
		countMap.put("notice_service_sortation", NoticeServiceSortationEnum.FAQ.getValue());
		countMap.put("notice_service_status", NoticeServiceStatusEnum.일반글.getValue());
		countMap.put("searchKeyword", searchKeyword);
		countMap.put("searchValue", searchValue);
		
		int totalBoard = noticeServiceService.getNoticeServiceCount(countMap);
		int pageSize = 5;
		int blockSize = 10;
		int number = totalBoard - (pageNum - 1) * pageSize;
		
		// 페이징 처리 관련 값을 Pager 클래스로 저장
		Pager pager = new Pager(pageNum, totalBoard, pageSize, blockSize);
		
		// 메소드 호출을 위해 매개변수에 전달하기 위한 Map 객체 생성
		Map<String, Object> pagerMap = new HashMap<String, Object>();
		pagerMap.put("startRow", pager.getStartRow());
		pagerMap.put("endRow", pager.getEndRow());
		pagerMap.put("notice_service_sortation", NoticeServiceSortationEnum.FAQ.getValue());
		pagerMap.put("notice_service_status", NoticeServiceStatusEnum.일반글.getValue());
		pagerMap.put("searchKeyword", searchKeyword);
		pagerMap.put("searchValue", searchValue);
		
		
		model.addAttribute("faqList", noticeServiceService.getNoticeServiceList(pagerMap));
		model.addAttribute("pager", pager);
		model.addAttribute("number",number);
		model.addAttribute("searchValue",searchValue);
		model.addAttribute("searchKeyword",searchKeyword);
	
		return "/board/faq_list";
		
	}

	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String faqWrite() {
		return "board/faq_write";
	}
	
	// 게시글을 전달받아 테이블에 삽입하여 저장하고 처리 결과를 일반 텍스트로 응답하는 요청 처리 메소드
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String faqWrite(@ModelAttribute NoticeService noticeService, HttpSession session) {
		
		// 누가 썻는지 회원 번호 담기
		noticeService.setMemberNo(((Member) session.getAttribute("loginUserinfo")).getMemberNo());		
		noticeService.setNoticeServiceSortation(NoticeServiceSortationEnum.FAQ.getValue());
		noticeService.setNoticeServiceStatus(NoticeServiceStatusEnum.일반글.getValue());
		
		noticeServiceService.addNoticeService(noticeService);
		
		return "redirect:/faq/list";
	}
	
	/*
	//(faq 세부 사항 출력 요청 처리 메소드)
	@RequestMapping(value = "/view/{num}", method = RequestMethod.GET) 
	public String view(@PathVariable int num , Model model) {
		
		model.addAttribute("faq", noticeServiceService.getNoticeService(num));
		
		return "board/faq_view";
	}
	*/
	/*
	// 글번호를 전달받아 테이블에 저장된 해당 글번호의 게시글을 검색하여 JSON 형식의
	// 텍스트로 응답하는 요청 처리 메소드 - 요청 URL 주소를 이용하여 글번호 전달
	@RequestMapping(value = "/view/{num}", method = RequestMethod.GET)
	@ResponseBody
	public NoticeService faqView(@PathVariable int num) {
		return noticeServiceService.getNoticeService(num);
	}
	*/


	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String faqModify(@ModelAttribute NoticeService noticeService) {
		noticeServiceService.modifyNoticeService(noticeService);
		return "redirect:/faq/list/status";
	}
	/*
	@RequestMapping(value = "/remove/{num}", method = RequestMethod.DELETE)
	@ResponseBody
	public String faqRemove(@PathVariable int num) {
		
		noticeServiceService.removeNoticeService(num);
		
		return "success";
	}*/
	
	//faq 삭제
	@RequestMapping( value = "/remove/{num}" , method = RequestMethod.GET)
	public String remove(@PathVariable int num, @ModelAttribute NoticeService noticeService) throws Exception{

		noticeServiceService.removeNoticeService(num);
		return "redirect:/faq/board";
	}

	/*
	 * //CSS
	 * 
	 * @RequestMapping("/write") public String write() { return "board/faq_write"; }
	 */

}