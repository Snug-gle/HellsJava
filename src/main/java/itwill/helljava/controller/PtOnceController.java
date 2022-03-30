package itwill.helljava.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import itwill.helljava.dto.Member;
import itwill.helljava.dto.PtOnce;
import itwill.helljava.service.PtOnceService;
import itwill.helljava.util.Pager;



@Controller
@RequestMapping("/ptonce")
public class PtOnceController {
	
	@Autowired
	private PtOnceService ptOnceService;
	
	@RequestMapping("/list")
	public String list(@ModelAttribute PtOnce ptonce) {
		
		return "ptonce/ptonce_list";
	}
	
	@RequestMapping(value = "/list" , method = RequestMethod.GET)
	public String searchPtOnceList(HttpSession session , Model model, @RequestParam(defaultValue="1")int pageNum){
		
		int totalBoard = ptOnceService.getPtOnceCount(((Member)session.getAttribute("loginUserinfo")).getMemberNo());
		int pageSize = 5; //한 페이지에 출력될 게시글의 갯수 저장
		int blockSize = 10; //한 페이지 블럭에 출력될 페이지 번호의 갯수 저장
		Pager pager = new Pager(pageNum, totalBoard, pageSize, blockSize);
		Map<String, Object> pagerMap = new HashMap<String, Object>();
		pagerMap.put("starRow", pager.getStartRow());
		pagerMap.put("endRow", pager.getEndRow());
		
		model.addAttribute("ptOnceList", ptOnceService.getPtOnceTrainerList(pagerMap));
		return "ptonce/ptonce_list";
	}
	
	
}
