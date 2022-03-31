package itwill.helljava.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/review")
public class ReviewController {

	@RequestMapping("/write")
	public String reviewWrite() {
		return "board"
	}
}
