package itwill.helljava.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import itwill.helljava.dto.NoticeService;
import itwill.helljava.dto.PtService;
import itwill.helljava.service.PtServiceService;

@Controller
@RequestMapping("/review")
public class ReviewController {

	@Autowired
	private PtServiceService ptServiceService;
	
	//list 페이지 요청 처리 메소드
	@RequestMapping("/list")
	public String searchList() {
		return "board/review_list";
	}
	//리뷰 작성 페이지 요청 처리 메소드
	@RequestMapping(value = "/write" , method = RequestMethod.GET)
	public String reviewWrite() {
		
	
		return "board/review_write";
	}
	
	//리뷰 작성 후 저장 요청 처리 메소드
	@RequestMapping(value =  "/write", method = RequestMethod.POST)
	public String reviewWrite(@ModelAttribute PtService ptService ,Model model) {
		
		ptServiceService.addPtService(ptService);
		//평점 옵션
		Map ratingOptions = new HashMap();
		ratingOptions.put(0, "☆☆☆☆☆");
		ratingOptions.put(1, "★☆☆☆☆");
		ratingOptions.put(2, "★★☆☆☆");
		ratingOptions.put(3, "★★★☆☆");
		ratingOptions.put(4, "★★★★☆");
		ratingOptions.put(5, "★★★★★");
		
		model.addAttribute("ratingOptions", ratingOptions);
	
		
		return "board/review_list";
	}
	
	//리뷰 수정 후 저장 요청 처리 메소드
	@RequestMapping("/modify")
	public String reviewModify(Model model) {
		return "board/review_list";
	}
	
}
