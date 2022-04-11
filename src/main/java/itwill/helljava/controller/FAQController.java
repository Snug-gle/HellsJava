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
	
	// FAQ 전체 리스트 페이지 요청 처리 메소드
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
		
		// 페이징 처리 관련 값을 Pager 객체 생성해 저장
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
	
	// FAQ 카테고리별 리스트 페이지 요청 처리 메소드
	@RequestMapping(value = "/list/category", method = RequestMethod.GET)
	public String searchCategoryFaqList(@RequestParam(defaultValue = "1") int pageNum, 
			Model model, @RequestParam String noticeServiceCategory ) {
		
		int totalBoard = noticeServiceService.getNoticeServiceFaqCount(Integer.parseInt(noticeServiceCategory));
		int pageSize = 5;
		int blockSize = 10;
		int number = totalBoard - (pageNum - 1) * pageSize;
		
		// 페이징 처리 관련 값을 Pager 객체 생성해 저장
		Pager pager = new Pager(pageNum, totalBoard, pageSize, blockSize);
		
		// 메소드 호출을 위해 매개변수에 전달하기 위한 Map 객체 생성
		Map<String, Object> pagerMap = new HashMap<String, Object>();
		pagerMap.put("startRow", pager.getStartRow());
		pagerMap.put("endRow", pager.getEndRow());
		pagerMap.put("notice_service_category", Integer.parseInt(noticeServiceCategory));
		
		model.addAttribute("faqList", noticeServiceService.getNoticeServiceFaqList(pagerMap));
		model.addAttribute("pager", pager);
		model.addAttribute("number",number);
		model.addAttribute("category", Integer.parseInt(noticeServiceCategory));
		
		return "/board/faq_list";
	}
	
	// FAQ 검색 리스트 요청 처리 메소드
	@RequestMapping(value = "/list/faqSearch", method = RequestMethod.GET)
	public String searchFaqList(@RequestParam(defaultValue = "1") int pageNum, Model model,
			@RequestParam String searchKeyword, @RequestParam String searchValue,
			@RequestParam String categoryValue) {
		// 테이블에 저장된 모든 게시글의 갯수 검색하여 반환받아 저장
		
		Map<String, Object> countMap = new HashMap<String, Object>();

		countMap.put("searchValue", searchValue);
		countMap.put("notice_service_category", Integer.parseInt(categoryValue));
		
		int totalBoard = noticeServiceService.getNoticeServiceFaqSearchCount(countMap);
		int pageSize = 5;
		int blockSize = 10;
		int number = totalBoard - (pageNum - 1) * pageSize;
		
		// 페이징 처리 관련 값을 Pager 클래스로 저장
		Pager pager = new Pager(pageNum, totalBoard, pageSize, blockSize);
		
		// 메소드 호출을 위해 매개변수에 전달하기 위한 Map 객체 생성
		Map<String, Object> pagerMap = new HashMap<String, Object>();
		pagerMap.put("startRow", pager.getStartRow());
		pagerMap.put("endRow", pager.getEndRow());
		pagerMap.put("searchValue", searchValue);
		pagerMap.put("notice_service_category", Integer.parseInt(categoryValue));

		
		
		model.addAttribute("faqList", noticeServiceService.getNoticeServiceFaqSearchList(pagerMap));
		model.addAttribute("pager", pager);
		model.addAttribute("number",number);
		model.addAttribute("searchValue",searchValue);
		model.addAttribute("searchKeyword",searchKeyword);
		model.addAttribute("category",Integer.parseInt(categoryValue));
	
		return "/board/faq_list";
	}
	
	//FAQ 신규 작성 페이지 요청 처리 메소드
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String faqWrite() {
		return "board/faq_write";
	}
	
	// FAQ 신규 작성 저장 요청 처리 메소드
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String faqWrite(@ModelAttribute NoticeService noticeService, HttpSession session) {
		
		// 누가 썻는지 회원 번호 담기
		noticeService.setMemberNo(((Member) session.getAttribute("loginUserinfo")).getMemberNo());		
		noticeService.setNoticeServiceSortation(NoticeServiceSortationEnum.FAQ.getValue());
		noticeService.setNoticeServiceStatus(NoticeServiceStatusEnum.일반글.getValue());
		
		noticeServiceService.addNoticeService(noticeService);
		
		return "redirect:/faq/list";
	}
	// FAQ 수정 요청 처리 메소드
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String faqModify(@ModelAttribute NoticeService noticeService) {
		noticeServiceService.modifyNoticeService(noticeService);
		return "redirect:/faq/list/status";
	}
	
	//FAQ 삭제 요청 처리 메소드
	@RequestMapping( value = "/remove/{num}" , method = RequestMethod.GET)
	public String remove(@PathVariable int num, @ModelAttribute NoticeService noticeService) throws Exception{

		noticeServiceService.removeNoticeService(num);
		return "redirect:/faq/list";
	}
}