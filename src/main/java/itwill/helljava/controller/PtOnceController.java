package itwill.helljava.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import itwill.helljava.Enum.PayTypeEnum;
import itwill.helljava.dto.Account;
import itwill.helljava.dto.Member;
import itwill.helljava.dto.Pay;
import itwill.helljava.dto.PtOnce;
import itwill.helljava.exception.AccountPwAuthException;
import itwill.helljava.service.AccountSevice;
import itwill.helljava.service.PayService;
import itwill.helljava.service.PtOnceService;
import itwill.helljava.service.TrainerService;
import itwill.helljava.util.Pager;


@Controller
@RequestMapping("/ptonce")
public class PtOnceController {
	
	@Autowired
	private PtOnceService ptOnceService;
	
	@Autowired
	private AccountSevice accountSevice;
	
	@Autowired
	private PayService payService;
	
	//list : 페이징 처리 시도
	@RequestMapping(value = "/list" , method = RequestMethod.GET)
	public String searchPtOnceList(HttpSession session, Model model, @RequestParam(defaultValue="1")int pageNum){
			
		int totalBoard = ptOnceService.getPtOnceCount(((Member)session.getAttribute("loginUserinfo")).getMemberNo());
		int pageSize = 5; //한 페이지에 출력될 게시글의 갯수 저장
		int blockSize = 10; //한 페이지 블럭에 출력될 페이지 번호의 갯수 저장
		Pager pager = new Pager(pageNum, totalBoard, pageSize, blockSize);
		Map<String, Object> pagerMap = new HashMap<String, Object>();
		pagerMap.put("startRow", pager.getStartRow());
		pagerMap.put("endRow", pager.getEndRow());
		pagerMap.put("memberNo", ((Member)session.getAttribute("loginUserinfo")).getMemberNo());
		
		model.addAttribute("ptonceList", ptOnceService.getPtOnceList(pagerMap));
		model.addAttribute("pager",pager);
				
		return "/board/ptonce_list";
	}
	
	@RequestMapping("/board")
	public String showList() {
		return "board/ptonce_list2";
	}
		
	// 포스팅 페이지에서 1회 pt 신청 post 방식 요청 (트레이너 번호 넘김)
	@RequestMapping(value = "/request/{trainerNo}", method = RequestMethod.POST)
	public String addPtOnce(@PathVariable int trainerNo,@ModelAttribute PtOnce ptOnce ,
			@RequestParam Map<String, Object> map, HttpSession session, @ModelAttribute Account account) throws AccountPwAuthException {
		
		// 결제 비밀번호 대조
		account.setMemberNo(((Member)session.getAttribute("loginUserinfo")).getMemberNo());
		accountSevice.accountPwAuth(account);
		
		ptOnce.setTrainerNo(trainerNo);
		ptOnce.setMemberNo(((Member)session.getAttribute("loginUserinfo")).getMemberNo());
		ptOnceService.addPtOnce(ptOnce);
		
		// ~~'원'이 넘어왔으므로 원 자르고 숫자로 바꿔서 데이터 저장
		String oncePrice = (String) map.get("payoPrice");
		int idx = oncePrice.indexOf("원");
		String op = oncePrice.substring(0,idx);
		
		Pay pay = new Pay();
		pay.setMemberNo(account.getMemberNo());
		pay.setPayPrice(Integer.parseInt(op));
		pay.setPayType(PayTypeEnum.일회피티.getValue());
		
		payService.addPay(pay);
		
		return "/"; // 어디로 보내지? 1회 pT 신청리스트로 보내고 싶다 혹시 하면 주석 제거 할것
	}
	
	//계좌 비밀번호가 틀릴 때 예외 핸들러 메서드
	@ExceptionHandler(value = AccountPwAuthException.class)
	public String exception(HttpSession session, AccountPwAuthException exception, Model model) {
		
		// 비밀번호 틀리면 에러메시지 넘겨주자
		model.addAttribute("message", exception.getMessage());
		String trainerNo = (String) session.getAttribute("trainerNo");
		
		return "redirect:/posting/detail/"+trainerNo; // 해당 포스팅 페이지로 다시 이동
	}
}
