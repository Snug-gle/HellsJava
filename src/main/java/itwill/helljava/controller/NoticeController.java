package itwill.helljava.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import itwill.helljava.dto.NoticeService;
import itwill.helljava.service.NoticeServiceService;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	@Autowired 
	NoticeServiceService noticeServiceService;
		
	//공지사항 리스트 출력 요청 처리 메소드
	@RequestMapping("/list")
	public String List(@ModelAttribute NoticeService noticeService, Model model){
		model.addAttribute("noticeList", noticeServiceService.getNoticeServiceList(noticeService, 0));
		return "board/notice_list";
	}
	
	//공지사항 세부 사항 출력 요청 처리 메소드
	@RequestMapping(value = "/view", method = RequestMethod.GET) 
	public String view(@RequestParam int notice_service_no , Model model) {
		model.addAttribute("notice", noticeServiceService.getNoticeService(notice_service_no, 0));
		
		return "redirect:board/notice_view";
	}
	
	//공지사항 입력 페이지 출력 요청 처리 메소드
	@RequestMapping("/write")
	public String write() {
			
		return "board/notice_write";
	}
	
	//공지사항 입력 사항 저장 요청 처리 메소드
	@RequestMapping( value = "/write" , method = RequestMethod.POST)
	public String write(Model model) {
		noticeServiceService.addNoticeService(null);
		return "redirect:board/notice_list";
	}
	
	//공지사항 수정 페이지 출력 요청 처리 메소드
	@RequestMapping(value =  "/modify" , method = RequestMethod.GET)
	public String modify(@RequestParam int notice_service_no , Model model) throws Exception {
		model.addAttribute("notice" , noticeServiceService.getNoticeService(notice_service_no, 0));
		return "board/notice_modify";
	}
	
	//공지사항 수정 사항 저장 요청 처리 메소드
	@RequestMapping(value =  "/modify" , method = RequestMethod.POST)
	public String modify(@ModelAttribute NoticeService noticeService , HttpSession session) throws Exception {
		this.noticeServiceService.modifyNoticeService(noticeService);
		return "redirect:board/notice_list";
	}

	//공지사항 삭제
	@RequestMapping( value = "/remove/{num}" , method = RequestMethod.POST)
	public String remove(@PathVariable int num, @ModelAttribute NoticeService noticeService) throws Exception{
		noticeService.modifyNoticeService(noticeService);
		return "redirect:/notice/list";
	}
	 
}
