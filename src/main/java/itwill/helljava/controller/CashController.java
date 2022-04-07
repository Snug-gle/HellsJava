package itwill.helljava.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import itwill.helljava.Enum.PayTypeEnum;
import itwill.helljava.dto.Account;
import itwill.helljava.dto.Pay;
import itwill.helljava.exception.AccountPwAuthException;
import itwill.helljava.service.AccountSevice;
import itwill.helljava.service.MemberService;

@Controller
public class CashController {

	@Autowired
	private AccountSevice accountSevice;

	@Autowired
	private MemberService memberService;

	// 캐시 충전 post 요청
	@RequestMapping(value = "/cash/refill", method = RequestMethod.POST)
	public String cashRefill(@ModelAttribute Account account, @RequestParam int memberNo,
			@RequestParam String refillCash, Model model, HttpSession session) throws AccountPwAuthException {

		accountSevice.accountPwAuth(account);

		// 비번 인증 성공하면
		Map<String, Object> refillMap = new HashMap<String, Object>();

		refillMap.put("cashType", PayTypeEnum.캐시충전.getValue());
		refillMap.put("cash", Integer.parseInt(refillCash));
		refillMap.put("memberNo", memberNo);

		memberService.modifyMemberCash(refillMap);

		// 결제 데이터 추가
		Pay pay = new Pay();
		pay.setMemberNo(memberNo);
		pay.setPayPrice(Integer.parseInt(refillCash));
		pay.setPayType(PayTypeEnum.캐시충전.getValue());

		session.setAttribute("loginUserinfo", memberService.getMember(memberNo));
		
		return "main";
	}

	// 계좌 비번 틀릴 시 예외 처리 핸들러 메서드
	@ExceptionHandler(AccountPwAuthException.class)
	public String exceptionHandler(AccountPwAuthException exception, Model model) {
		model.addAttribute("message", exception.getMessage());

		return "main";
	}
}
