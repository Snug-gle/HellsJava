package itwill.helljava.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import itwill.helljava.Enum.AccountEnum;
import itwill.helljava.dto.Account;
import itwill.helljava.dto.Member;
import itwill.helljava.service.AccountSevice;

@Controller
@RequestMapping("/account")
public class AccountController {

	@Autowired
	private AccountSevice accountService;
	
	@RequestMapping(value = "/info" , method = RequestMethod.GET)
	public String accountInfo(Model model, HttpSession session) {
		accountService.getMemberAccount(((Member)session.getAttribute("loginUserinfo")).getMemberNo());
		model.addAttribute("account", accountService.getMemberAccount(((Member)session.getAttribute("loginUserinfo")).getMemberNo()));
		model.addAttribute("bankName", String.valueOf(AccountEnum.of(accountService.getMemberAccount(((Member)session.getAttribute("loginUserinfo")).getMemberNo()).getAccountBank())));
		return "account/account_info";
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String register() {
		
		return "account/account_register";
	}
	
	@RequestMapping(value = "/register" , method = RequestMethod.POST)
	public String register(@ModelAttribute Account account, HttpSession session) {
		
		account.setMemberNo(((Member)session.getAttribute("loginUserinfo")).getMemberNo());
		accountService.addAccount(account);
		
		return "account/account_info";
	}
	
	@RequestMapping(value = "/remove/{num}" , method = RequestMethod.GET)
	public String remove(@PathVariable int num) {
		accountService.removeAccount(num);	
		return "account/account_info";
	}
	
}
