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
import itwill.helljava.Enum.NoticeServiceStatusEnum;
import itwill.helljava.dto.NoticeService;
import itwill.helljava.service.NoticeServiceService;
import itwill.helljava.util.Pager;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	@Autowired 
	private NoticeServiceService noticeServiceService;
	
	
	//공지사항 리스트 출력 처리 메소드
	@RequestMapping(value = "/list" ,method = RequestMethod.GET)
	public String List(Model model,NoticeService noticeService , @RequestParam(defaultValue = "1") int pageNum){
		//테이블에 저장된 모든 게시글의 갯수를 검색하여 반환받아 저장
		
		Map<String, Object> countMap = new HashMap<String, Object>();
		
		countMap.put("notice_service_sortation", NoticeServiceSortationEnum.공지사항.getValue());
		
		int totalBoard = noticeServiceService.getNoticeServiceCount(countMap);
		int pageSize = 5; //한 페이지에 출력될 게시글의 갯수 저장
		int blockSize = 10; //한 페이지 블럭에 출력될 페이지 번호의 갯수 저장
		
		//페이징 처리 관련 값을 제공하는 Pager 클래스로 객체를 생성하여 저장
		Pager pager = new Pager(pageNum, totalBoard, pageSize, blockSize);
		
		//Service 클래스의 메소드 호출을 위한 Map 객체 생성
		Map<String,	Object> pagerMap = new HashMap<String, Object>();
		pagerMap.put("startRow", pager.getStartRow());
		pagerMap.put("endRow", pager.getEndRow());
		pagerMap.put("notice_service_sortation", NoticeServiceSortationEnum.공지사항.getValue());
		pagerMap.put("notice_service_status", NoticeServiceStatusEnum.일반글.getValue());
		
		model.addAttribute("noticeList", noticeServiceService.getNoticeServiceList(pagerMap));
		return "board/notice_list";
	}
	
	
	//공지사항 세부 사항 출력 요청 처리 메소드
	@RequestMapping(value = "/view", method = RequestMethod.GET) 
	public String view(@RequestParam int notice_service_no , Model model) {
		model.addAttribute("notice", noticeServiceService.getNoticeService(notice_service_no));
		
		return "board/notice_view";
	}
	
	//공지사항 입력 페이지 출력 요청 처리 메소드
	@RequestMapping("/write")
	public String write() {
			
		return "board/notice_write";
	}
	
	//공지사항 입력 사항 저장 요청 처리 메소드
	@RequestMapping( value = "/write" , method = RequestMethod.POST)
	public String write(@ModelAttribute Model model) {
		noticeServiceService.addNoticeService(null);
		return "redirect:/notice/list";
	}
	
	//번호를 전달 받아 공지사항 수정 페이지 출력 요청 처리 메소드
	//=> 관리자만 요청 가능하도록 인터셉터 사용(필요하면 추가)
	@RequestMapping(value =  "/modify" , method = RequestMethod.GET)
	public String modify(@RequestParam int notice_service_no , Model model) throws Exception {
		model.addAttribute("noticeNo" , noticeServiceService.getNoticeService(notice_service_no));
		return "board/notice_modify";
	}
	
	//공지사항 수정 사항 저장 요청 처리 메소드
	@RequestMapping(value =  "/modify" , method = RequestMethod.POST)
	public String modify(@ModelAttribute NoticeService noticeService , HttpSession session) throws Exception {
		noticeServiceService.modifyNoticeService(noticeService);
		
		//글 수정 중 된 회원(관리자)이
		return "redirect:/notice/list";
	}

	//공지사항 삭제
	@RequestMapping( value = "/remove/{num}" , method = RequestMethod.GET)
	public String remove(@PathVariable int num, @ModelAttribute NoticeService noticeService) throws Exception{
		noticeServiceService.modifyNoticeService(noticeService);
		return "redirect:/notice/list";
	}
	
	//css용
	
	@RequestMapping("/list") 
	public String cssList() { 
	  return "board/notice_list";
	  }

	@RequestMapping("/view") 
	public String cssView() { 
		return "board/notice_view";
	}
	 
	 
}
