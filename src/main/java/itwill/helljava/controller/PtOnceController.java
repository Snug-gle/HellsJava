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
import org.springframework.web.bind.annotation.ResponseBody;

import itwill.helljava.dto.Member;
import itwill.helljava.dto.PtOnce;
import itwill.helljava.service.AccountSevice;
import itwill.helljava.service.PtOnceService;
import itwill.helljava.service.TrainerService;
import itwill.helljava.util.Pager;


@Controller
@RequestMapping("/ptonce")
public class PtOnceController {
	
	@Autowired
	private PtOnceService ptOnceService;
	
	@Autowired
	private TrainerService trainerService;
	
	@Autowired
	private AccountSevice accountSevice;
	
	//list : 페이징 처리 시도
	@RequestMapping(value = "/list" , method = RequestMethod.GET)
	public String searchPtOnceList(HttpSession session, Model model, @RequestParam(defaultValue="1")int pageNum){
			
		int totalBoard = ptOnceService.getPtOnceCount(((Member)session.getAttribute("loginUserinfo")).getMemberNo());
		int pageSize = 5; //한 페이지에 출력될 게시글의 갯수 저장
		int blockSize = 10; //한 페이지 블럭에 출력될 페이지 번호의 갯수 저장
		Pager pager = new Pager(pageNum, totalBoard, pageSize, blockSize);
		Map<String, Object> pagerMap = new HashMap<String, Object>();
		pagerMap.put("startRow", pager.getStartRow());
		pagerMap.put("endRow", pager.getEndRow());
		pagerMap.put("memberNo", ((Member)session.getAttribute("loginUserinfo")).getMemberNo());
		
		model.addAttribute("ptonceList", ptOnceService.getPtOnceList(pagerMap));
		model.addAttribute("pager",pager);
				
		return "/board/ptonce_list";
	}
	
	@RequestMapping("/board")
	public String showList() {
		return "board/ptonce_list2";
	}
		
	// 포스팅 페이지에서 1회 pt 신청 post 방식 요청 트레이너 번호 넘김
	@RequestMapping(value = "/request/{trainerNo}", method = RequestMethod.POST)
	public String addPtOnce(@PathVariable int trainerNo,@ModelAttribute PtOnce ptOnce ,
			@RequestParam Map<String, Object> map, HttpSession session) {
		
		map.get("accountPw");
		
		ptOnce.setTrainerNo(trainerNo);
		ptOnce.setMemberNo(((Member)session.getAttribute("loginUserinfo")).getMemberNo());
		ptOnceService.addPtOnce(ptOnce);
		return "";
	}
	
}
