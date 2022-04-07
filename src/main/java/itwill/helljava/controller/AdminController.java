package itwill.helljava.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import itwill.helljava.Enum.NoticeServiceSortationEnum;
import itwill.helljava.dto.Award;
import itwill.helljava.dto.Member;
import itwill.helljava.dto.NoticeService;
import itwill.helljava.service.AwardService;
import itwill.helljava.service.MemberService;
import itwill.helljava.service.NoticeServiceService;
import itwill.helljava.service.TrainerService;
import itwill.helljava.util.Pager;

@Controller
public class AdminController {

	@Autowired
	private NoticeServiceService noticeServiceService;

	@Autowired
	private MemberService memberService;

	@Autowired
	private TrainerService trainerService;

	@Autowired
	private AwardService awardService;

	@RequestMapping(value = "/admin/questionList", method = RequestMethod.GET)
	public String questionList() {
		return "/admin/admin_questionList";
	}

	// 1:1 문의 리스트 출력 메서드(Map 형태로 반환)
	@RequestMapping(value = "/admin/question_list", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> restQAList(@RequestParam(defaultValue = "1") int pageNum) {

		Map<String, Object> searchMap = new HashMap<String, Object>();

		searchMap.put("notice_service_sortation", NoticeServiceSortationEnum.일대일문의.getValue());

		int totalBoard = noticeServiceService.getNoticeServiceCount(searchMap);
		int pageSize = 5; // 한 페이지에 출력될 게시글의 갯수 저장
		int blockSize = 10; // 한 페이지 블럭에 출력될 페이지 번호의 갯수 저장

		// 페이징 처리 관련 값을 제공하는 Pager 클래스로 객체를 생성하여 저장
		Pager pager = new Pager(pageNum, totalBoard, pageSize, blockSize);

		// Service 클래스의 메소드 호출을 위한 Map 객체 생성
		Map<String, Object> pagerMap = new HashMap<String, Object>();
		pagerMap.put("startRow", pager.getStartRow());
		pagerMap.put("endRow", pager.getEndRow());
		pagerMap.put("notice_service_sortation", NoticeServiceSortationEnum.일대일문의.getValue());

		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("restAdminQAList", noticeServiceService.getNoticeServiceList(pagerMap));
		returnMap.put("pager", pager);

		return returnMap;
	}

	// 1:1 문의 리스트 검색 메서드(Map 형태로 반환)
	@RequestMapping(value = "/admin/questionSearch", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> restQASearchList(@RequestParam(defaultValue = "1") int pageNum,
			@RequestParam String searchKeyword, @RequestParam String searchValue) {

		Map<String, Object> searchMap = new HashMap<String, Object>();

		// 검색 값 넣고.
		searchMap.put("searchKeyword", searchKeyword);
		searchMap.put("searchValue", searchValue);
		searchMap.put("notice_service_sortation", NoticeServiceSortationEnum.일대일문의.getValue());

		int totalBoard = noticeServiceService.getNoticeServiceCount(searchMap);
		int pageSize = 5; // 한 페이지에 출력될 게시글의 갯수 저장
		int blockSize = 10; // 한 페이지 블럭에 출력될 페이지 번호의 갯수 저장

		// 페이징 처리 관련 값을 제공하는 Pager 클래스로 객체를 생성하여 저장
		Pager pager = new Pager(pageNum, totalBoard, pageSize, blockSize);

		// Service 클래스의 메소드 호출을 위한 Map 객체 생성
		Map<String, Object> pagerMap = new HashMap<String, Object>();

		pagerMap.put("searchKeyword", searchKeyword);
		pagerMap.put("searchValue", searchValue);
		pagerMap.put("startRow", pager.getStartRow());
		pagerMap.put("endRow", pager.getEndRow());
		pagerMap.put("notice_service_sortation", NoticeServiceSortationEnum.일대일문의.getValue());

		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("restAdminQAList", noticeServiceService.getNoticeServiceList(pagerMap));
		returnMap.put("pager", pager);

		return returnMap;
	}

	// 회원 리스트 요청 get 방식
	@RequestMapping(value = "/admin/userList", method = RequestMethod.GET)
	public String memberList(@RequestParam(defaultValue = "1") int pageNum, Model model) {

		Map<String, Object> searchMap = new HashMap<String, Object>();

		int totalBoard = memberService.getMemberListCount(searchMap);

		int pageSize = 5;
		int blockSize = 10;
		int number = totalBoard - (pageNum - 1) * pageSize;

		Pager pager = new Pager(pageNum, totalBoard, pageSize, blockSize);

		Map<String, Object> returnMap = new HashMap<String, Object>();

		returnMap.put("startRow", pager.getStartRow());
		returnMap.put("endRow", pager.getEndRow());

		model.addAttribute("memberList", memberService.getMemberList(returnMap));
		model.addAttribute("pager", pager);
		model.addAttribute("number", number);

		return "/admin/admin_userList";
	}

	// 회원 상태 변경 요청 -> 상태값을 전달받자.
	@RequestMapping(value = "/admin/userStatusModify", method = RequestMethod.GET)
	public String memberStatusModify(@RequestParam int memberNo, @RequestParam int memberStatus) {

		// 회원 객체 가져오고
		Member modifyMember = memberService.getMember(memberNo);

		// 회원 객체에 setter로 인자 값 넣고
		modifyMember.setMemberNo(memberNo);
		modifyMember.setMemberStatus(memberStatus);

		// 바뀐 속성 값 가진 객체 태워 보내기
		memberService.modifyMember(modifyMember);

		return "redirect:/admin/userList";
	}

	// 회원 검색 get 방식 요청
	@RequestMapping(value = "/admin/userSearch", method = RequestMethod.GET)
	public String memberSearch(@RequestParam(defaultValue = "1") int pageNum, @RequestParam String searchKeyword,
			@RequestParam String searchValue, Model model) {

		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("searchKeyword", searchKeyword);
		searchMap.put("searchValue", searchValue);

		int totalBoard = memberService.getMemberListCount(searchMap);
		int pageSize = 5;
		int blockSize = 10;
		int number = totalBoard - (pageNum - 1) * pageSize;

		Pager pager = new Pager(pageNum, totalBoard, pageSize, blockSize);

		Map<String, Object> returnMap = new HashMap<String, Object>();

		returnMap.put("searchKeyword", searchKeyword);
		returnMap.put("searchValue", searchValue);
		returnMap.put("startRow", pager.getStartRow());
		returnMap.put("endRow", pager.getEndRow());

		model.addAttribute("memberList", memberService.getMemberList(returnMap));
		model.addAttribute("pager", pager);
		model.addAttribute("number", number);
		model.addAttribute("searchValue", searchValue);

		return "/admin/admin_userList";
	}

	// 트레이너 목록 get 방식 요청
	@RequestMapping(value = "/admin/trainerList/{memberStatus}", method = RequestMethod.GET)
	public String trainerList(@PathVariable("memberStatus") int memberStatus,
			@RequestParam(defaultValue = "1") int pageNum, Model model) {

		Map<String, Object> searchMap = new HashMap<String, Object>();

		searchMap.put("memberStatus", memberStatus);

		int totalBoard = trainerService.getTrainerListCount(searchMap);

		int pageSize = 5;
		int blockSize = 10;
		int number = totalBoard - (pageNum - 1) * pageSize;

		Pager pager = new Pager(pageNum, totalBoard, pageSize, blockSize);

		Map<String, Object> returnMap = new HashMap<String, Object>();

		returnMap.put("startRow", pager.getStartRow());
		returnMap.put("endRow", pager.getEndRow());
		returnMap.put("memberStatus", memberStatus);

		model.addAttribute("trainerList", trainerService.getTrainerList(returnMap));
		model.addAttribute("pager", pager);
		model.addAttribute("number", number);
		model.addAttribute("memberStatus", memberStatus);

		return "/admin/admin_trainerList";
	}

	// 트레이너 검색 get 방식 요청
	@RequestMapping(value = "/admin/trainerSearch", method = RequestMethod.GET)
	public String trainerSearch(@RequestParam(defaultValue ="1") int pageNum, @RequestParam String searchKeyword, 
			@RequestParam String searchValue, @RequestParam String memberStatus, Model model) {
			

		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("searchKeyword", searchKeyword);
		searchMap.put("searchValue", searchValue);
		searchMap.put("memberStatus", Integer.parseInt(memberStatus));

			
		int totalBoard = trainerService.getTrainerListCount(searchMap);
		int pageSize = 5;
		int blockSize = 10;
		int number = totalBoard - (pageNum - 1) * pageSize;

		Pager pager = new Pager(pageNum, totalBoard, pageSize, blockSize);

		Map<String, Object> returnMap = new HashMap<String, Object>();
			
		returnMap.put("searchKeyword", searchKeyword);
		returnMap.put("searchValue", searchValue);
		returnMap.put("startRow", pager.getStartRow());
		returnMap.put("endRow", pager.getEndRow());
		returnMap.put("memberStatus", Integer.parseInt(memberStatus));
			
		model.addAttribute("trainerList", trainerService.getTrainerList(returnMap));
		model.addAttribute("pager",pager);
		model.addAttribute("number",number);
		model.addAttribute("searchValue",searchValue);
		model.addAttribute("memberStatus", memberStatus);
			
		return "/admin/admin_trainerList";
	}

	// 트레이너 리스트 모달 창 ajax get 요청 awardList로 반환
	@RequestMapping(value = "/admin/trainerList/modal/request", method = RequestMethod.GET)
	public String modalAwardRequest(@RequestParam int trainerNo, Model model) {

		List<Award> returnList = new ArrayList<Award>();

		returnList = awardService.getAwardList(trainerNo);

		model.addAttribute("List", returnList);
		return "/admin/testaward";
	}

	// 답글 추가 메서드 post 방식 요청
	@RequestMapping(value = "/question/reply/{noticeServiceNo}", method = RequestMethod.POST)
	public String replyAdd(@PathVariable("noticeServiceNo") int noticeServiceNo, HttpServletRequest request) {

		NoticeService noticeService = new NoticeService();
		noticeService.setNoticeServiceReply(request.getParameter("replyText"));
		noticeService.setNoticeServiceNo(noticeServiceNo);

		noticeServiceService.modifyReplyNoticeService(noticeService);

		return "redirect:/admin/questionList";
	}

}
