package itwill.helljava.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/notice")
public class NoticeController {

	@RequestMapping("/list")
	public String list() {
		
		return "board/notice_list";
	}

	@RequestMapping( value = "/write" ,method = RequestMethod.POST)
	public String write() {
			
		return "board/notice_write";
	}

	@RequestMapping(value =  "/modify" , method = RequestMethod.POST)
	public String modify() {
				
		return "redirect:/board/notice_list";
	}


	/*
	 * @RequestMapping("/remove") public String remove() {
	 * 
	 * return "redirect:/notice/list"; }
	 */
}
