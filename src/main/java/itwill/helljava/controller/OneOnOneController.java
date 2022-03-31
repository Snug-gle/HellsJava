package itwill.helljava.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/oOo")
public class OneOnOneController {

	@RequestMapping("/oOo_write")
	public String write() {
		return "board/oOo_write";
	}
}
