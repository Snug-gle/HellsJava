package itwill.helljava.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import itwill.helljava.service.PtServiceService;

@Controller
@RequestMapping("/review")
public class ReviewController {

	@Autowired
	private PtServiceService ptServiceService;
	
	@RequestMapping("/write")
	public String reviewWrite(Model model) {
		
		//평점 옵션
		Map ratingOptions = new HashMap();
		ratingOptions.put(0, "☆☆☆☆☆");
		ratingOptions.put(1, "★☆☆☆☆");
		ratingOptions.put(2, "★★☆☆☆");
		ratingOptions.put(3, "★★★☆☆");
		ratingOptions.put(4, "★★★★☆");
		ratingOptions.put(5, "★★★★★");
		
		model.addAttribute("ratingOptions", ratingOptions);
		
		return "board/review_write";
	}
}
