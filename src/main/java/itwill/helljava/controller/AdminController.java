package itwill.helljava.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminController {

	@RequestMapping(value = "admin/userList", method = RequestMethod.GET)
	public String userList() {
		return "admin/admin_userList";
	}
	
}
