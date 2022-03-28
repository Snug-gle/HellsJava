package itwill.helljava.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class DetailSearchController {
	
	@RequestMapping(value = "/content/search_list", method = RequestMethod.GET)
	public String searchList() {
		return "/content/search_list";
	}
	
	@RequestMapping(value = "/content/posting_detail", method = RequestMethod.GET)
	public String postingDetail(@RequestParam(value = "code", defaultValue="1") int code ,Model model) {
		model.addAttribute("testReview", code);
		return "/content/posting_detail";
	}
	
	@RequestMapping(value = "/content/insert", method = RequestMethod.GET)
	public String postingDetailInsert() {
		return "/content/posting_detail_insert";
	}
	

	
}
