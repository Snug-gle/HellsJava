package itwill.helljava.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import itwill.helljava.Enum.NoticeServiceSortationEnum;
import itwill.helljava.dto.Member;
import itwill.helljava.service.MemberService;
import itwill.helljava.service.NoticeServiceService;
import itwill.helljava.util.Pager;

@Controller
public class AdminController {
	
	@Autowired
	private NoticeServiceService noticeServiceService;
	
	@Autowired
	private MemberService memberService;

	/*
	 * @RequestMapping(value = "admin/userList", method = RequestMethod.GET) public
	 * String userList() { return "admin/admin_userList"; }
	 */
	@RequestMapping(value = "admin/trainerList", method = RequestMethod.GET)
	public String trainerList() {
		return "admin/admin_trainerList";
	}
	
	@RequestMapping(value = "admin/testList", method = RequestMethod.GET)
	public String testList() {
		return "admin/admin_testList";
	}
	
	/*
	 * @RequestMapping(value = "admin/questionList", method = RequestMethod.GET)
	 * public String questionList() { return "admin/admin_questionList"; }
	 */
	
	// 1:1 문의 리스트 출력 메서드 (Map 형태로 반환)
	@RequestMapping(value = "admin/questionList",method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> restQAList(@RequestParam(defaultValue = "1") int pageNum, Model model){
		
		Map<String, Object> searchMap = new HashMap<String, Object>();
		
		searchMap.put("notice_service_sortation", NoticeServiceSortationEnum.일대일문의.getValue());
		
		int totalBoard = noticeServiceService.getNoticeServiceCount(searchMap);
		int pageSize = 5; //한 페이지에 출력될 게시글의 갯수 저장
		int blockSize = 10; //한 페이지 블럭에 출력될 페이지 번호의 갯수 저장
		
		//페이징 처리 관련 값을 제공하는 Pager 클래스로 객체를 생성하여 저장
		Pager pager = new Pager(pageNum, totalBoard, pageSize, blockSize);
		
		//Service 클래스의 메소드 호출을 위한 Map 객체 생성
		Map<String,	Object> pagerMap = new HashMap<String, Object>();
		pagerMap.put("startRow", pager.getStartRow());
		pagerMap.put("endRow", pager.getEndRow());
		pagerMap.put("notice_service_sortation", NoticeServiceSortationEnum.일대일문의.getValue());
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("restAdminQAList", noticeServiceService.getNoticeServiceList(pagerMap));
		returnMap.put("pager", pager);
		
		return returnMap;
	}
	
	// 회원 리스트 요청
	@RequestMapping(value = "admin/userList", method = RequestMethod.GET)
	public String memberList(@RequestParam(defaultValue ="1") int pageNum, Model model) {
		
		Map<String, Object> searchMap = new HashMap<String, Object>();
		
		int totalBoard = memberService.getMemberListCount(searchMap);
		
		int pageSize = 5;
		int blockSize = 10;
		
		Pager pager = new Pager(pageNum, totalBoard, pageSize, blockSize);

		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		returnMap.put("startRow", pager.getStartRow());
		returnMap.put("endRow", pager.getEndRow());
		
		model.addAttribute("memberList", memberService.getMemberList(returnMap));

		return "/admin/admin_userList";
	}
	
	// 회원 상태 변경 요청 -> 상태값을 전달받자.
	@RequestMapping(value = "/admin/userStatusModify", method = RequestMethod.GET)
	public String memberStatusModify(@RequestParam int memberNo, @RequestParam int memberStatus) {
	
		// 회원 객체 가져오고
		Member modifyMember =memberService.getMember(memberNo);
		
		// 회원 객체에 setter로 인자 값 넣고
		modifyMember.setMemberNo(memberNo);
		modifyMember.setMemberStatus(memberStatus);
		
		// 바뀐 속성 값 가진 객체 태워 보내기 
		memberService.modifyMember(modifyMember);
		
		return "redirect:/admin/userList";
	}
	
}
