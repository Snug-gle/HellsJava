package itwill.helljava.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import itwill.helljava.service.AccountSevice;

@Controller
@RequestMapping("/account")
public class AccountController {

	@Autowired
	private AccountSevice accountService;
	
	@RequestMapping("/info/{num}")
	public String accountInfo(@PathVariable int num, Model model) {
		model.addAttribute("account", accountService.getMemberAccount(num));
		return "account/account_info";
	}
	
	@RequestMapping("/register")
	public String register() {
		
		return "account/account_register";
	}
	
}
