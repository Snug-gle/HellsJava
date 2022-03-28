package itwill.helljava.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BankController {
	
	@RequestMapping(value = "/money/cache_charge", method = RequestMethod.GET)
	public String login() {
		return "/money/cache_charge";
	}
}
