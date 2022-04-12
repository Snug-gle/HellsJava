package itwill.helljava.controller;

import java.util.HashMap;
import java.util.List;
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
import org.springframework.web.bind.annotation.ResponseBody;


import itwill.helljava.Enum.NoticeServiceSortationEnum;
import itwill.helljava.Enum.NoticeServiceStatusEnum;
import itwill.helljava.dto.Member;
import itwill.helljava.dto.NoticeService;
import itwill.helljava.service.NoticeServiceService;
import itwill.helljava.util.Auth;
import itwill.helljava.util.Pager;
import itwill.helljava.util.Auth.Role;
import itwill.helljava.util.AuthUser;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	@Autowired 
	private NoticeServiceService noticeServiceService;
	
	// 공지사항 리스트 출력 요청 처리 메소드 
	@RequestMapping(value = "/list",method = RequestMethod.GET)
	public String searchNoticeList(@RequestParam(defaultValue = "1") int pageNum, Model model){
		
		//게시글 수 정보를 가져오기 위한 메소드 호출을 위한 매개변수
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("notice_service_sortation", NoticeServiceSortationEnum.공지사항.getValue());
		searchMap.put("notice_service_status", NoticeServiceStatusEnum.일반글.getValue());
		
		int totalBoard = noticeServiceService.getNoticeServiceCount(searchMap);
		int pageSize = 5; //한 페이지에 출력될 게시글의 갯수 저장
		int blockSize = 10; //한 페이지 블럭에 출력될 페이지 번호의 갯수 저장
		int number = totalBoard - (pageNum - 1)* pageSize;
		
		//페이징 처리 관련 값을 제공하는 Pager 클래스로 객체를 생성하여 저장
		Pager pager = new Pager(pageNum, totalBoard, pageSize, blockSize);
		
		//Service 클래스의 메소드 호출을 위한 Map 객체 생성
		Map<String,	Object> pagerMap = new HashMap<String, Object>();
		pagerMap.put("startRow", pager.getStartRow());
		pagerMap.put("endRow", pager.getEndRow());
		pagerMap.put("notice_service_sortation", NoticeServiceSortationEnum.공지사항.getValue());
		pagerMap.put("notice_service_status", NoticeServiceStatusEnum.일반글.getValue());
		
		model.addAttribute("noticeList", noticeServiceService.getNoticeServiceList(pagerMap));
		model.addAttribute("pager", pager);
		model.addAttribute("number",number);
				
		return "/board/notice_list";
	}
	
	@Auth(role=Role.ADMIN)
	//공지사항 입력 페이지 출력 요청 처리 메소드
	@RequestMapping(value = "/write" , method = RequestMethod.GET)
	public String write() {
		return "board/notice_write";
	}

	@Auth(role = Role.ADMIN)
	//공지사항 입력 사항 저장 요청 처리 메소드
	@RequestMapping( value = "/write" , method = RequestMethod.POST)
	public String write(@ModelAttribute NoticeService noticeService, Model model, @AuthUser Member member) {
				
		noticeService.setMemberNo(member.getMemberNo());
		
		noticeService.setNoticeServiceSortation(NoticeServiceSortationEnum.공지사항.getValue());
		noticeService.setNoticeServiceStatus(NoticeServiceStatusEnum.일반글.getValue());
		
		noticeServiceService.addNoticeService(noticeService);
		return "redirect:/notice/list";
	}
	
	@Auth(role = Role.ADMIN)
	//공지사항 수정 사항 저장 요청 처리 메소드
	@RequestMapping(value = "/modify" , method = RequestMethod.POST)
	public String modify(@ModelAttribute NoticeService noticeService) throws Exception {
		noticeServiceService.modifyNoticeService(noticeService);
		return "redirect:/notice/list";
	}

	//공지사항 삭제
	@Auth(role=Role.ADMIN)
	@RequestMapping( value = "/remove/{num}" , method = RequestMethod.GET)
	public String remove(@PathVariable(value = "num") int num, @ModelAttribute NoticeService noticeService) throws Exception{

		noticeServiceService.removeNoticeService(num);
		return "redirect:/notice/list";
	}
}
