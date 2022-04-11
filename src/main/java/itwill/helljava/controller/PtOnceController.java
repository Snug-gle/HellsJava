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
import itwill.helljava.exception.AmountOfPaymentException;
import itwill.helljava.service.AccountSevice;
import itwill.helljava.service.PayService;
import itwill.helljava.service.PtOnceService;
import itwill.helljava.service.PtServiceService;
import itwill.helljava.service.TrainerService;
import itwill.helljava.util.Pager;

@Controller
public class PtOnceController {

	@Autowired
	private PtOnceService ptOnceService;

	@Autowired
	private AccountSevice accountSevice;

	@Autowired
	private PayService payService;

	@Autowired
	private TrainerService trainerService;

//====================회원 전용 1회피티===============================================================================================================================

	// 1회 피티 신청 리스트 최초 화면 요청 처리 메소드(회원)
	@RequestMapping(value = "/ptonce/list", method = RequestMethod.GET)
	public String searchPtOnceList(HttpSession session, Model model, @RequestParam(defaultValue = "1") int pageNum) {

		int totalBoard = ptOnceService.getPtOnceCount(((Member) session.getAttribute("loginUserinfo")).getMemberNo());
		int pageSize = 5; // 한 페이지에 출력될 게시글의 갯수 저장
		int blockSize = 10; // 한 페이지 블럭에 출력될 페이지 번호의 갯수 저장
		int number = totalBoard - (pageNum - 1) * pageSize;

		Pager pager = new Pager(pageNum, totalBoard, pageSize, blockSize);

		Map<String, Object> pagerMap = new HashMap<String, Object>();

		pagerMap.put("startRow", pager.getStartRow());
		pagerMap.put("endRow", pager.getEndRow());
		pagerMap.put("memberNo", ((Member) session.getAttribute("loginUserinfo")).getMemberNo());

		model.addAttribute("ptonceList", ptOnceService.getPtOnceList(pagerMap));
		model.addAttribute("pager", pager);
		model.addAttribute("number", number);

		return "/user/ptonce/ptonce_list";
	}

	// 포스팅 페이지에서 1회 pt 신청 post 방식 요청 (트레이너 번호 넘김) (회원 전용)
	@RequestMapping(value = "/ptonce/request/{trainerNo}", method = RequestMethod.POST)
	public String addPtOnce(@PathVariable int trainerNo, @ModelAttribute PtOnce ptOnce,
			@RequestParam Map<String, Object> map, HttpSession session, @ModelAttribute Account account)
			throws AccountPwAuthException, AmountOfPaymentException {

		// 결제 비밀번호 대조
		account.setMemberNo(((Member) session.getAttribute("loginUserinfo")).getMemberNo());
		accountSevice.accountPwAuth(account);

		ptOnce.setTrainerNo(trainerNo);
		ptOnce.setMemberNo(((Member) session.getAttribute("loginUserinfo")).getMemberNo());
		ptOnceService.addPtOnce(ptOnce);

		// ~~'원'이 넘어왔으므로 원 자르고 숫자로 바꿔서 데이터 저장
		String oncePrice = (String) map.get("payoPrice");
		int idx = oncePrice.indexOf("원");
		String op = oncePrice.substring(0, idx);

		Pay pay = new Pay();
		pay.setMemberNo(account.getMemberNo());
		pay.setPayPrice(Integer.parseInt(op));
		pay.setPayType(PayTypeEnum.일회피티.getValue());

		payService.payAuth(pay); // 결제 금액 > 캐시 잔액 예외 발생
		payService.addPay(pay);

		return "main"; // 어디로 보내지? 1회 pT 신청리스트로 보내고 싶다 혹시 하면 주석 제거 할것
	}

//====================트레이너 전용===============================================================================================================================

	// 1회 피티 신청 리스트 최초 화면 요청 처리 메소드 (트레이너용)
	@RequestMapping(value = "/ptonce/trainer/list", method = RequestMethod.GET)
	public String searchAllList(Model model, HttpSession session, @RequestParam(defaultValue = "1") int pageNum) {

		Map<String, Object> countMap = new HashMap<String, Object>();
		countMap.put("pt_once_status", 232); // 아무거나 넣음
		countMap.put("trainer_no", trainerService
				.getTrainer(((Member) session.getAttribute("loginUserinfo")).getMemberNo()).getTrainerNo());

		// 전체 리스트를 위한 페이징 정보 저장
		int totalBoard = ptOnceService.getPtOnceTrainerCount(countMap);
		int pageSize = 5;
		int blockSize = 10;
		int number = totalBoard - (pageNum - 1) * pageSize;

		Pager pager = new Pager(pageNum, totalBoard, pageSize, blockSize);

		Map<String, Object> pagerMap = new HashMap<String, Object>();
		pagerMap.put("pt_once_status", 231);// 임의의 값
		pagerMap.put("trainer_no", trainerService
				.getTrainer(((Member) session.getAttribute("loginUserinfo")).getMemberNo()).getTrainerNo());
		pagerMap.put("startRow", pager.getStartRow());
		pagerMap.put("endRow", pager.getEndRow());

		model.addAttribute("ptOnceList", ptOnceService.getPtOnceTrainerList(pagerMap));
		model.addAttribute("pager", pager);
		model.addAttribute("number", number);

		return "/user/trainer/trainer_ptonce_list";
	}

	// 1회 피티 신청 리스트 카테고리 변경 GET 요청 [미확인:0], [확인:1], [완료:2] (트레이너 전용)
	@RequestMapping(value = "/ptonce/trainer/list/status", method = RequestMethod.GET)
	public String searchList(@RequestParam String ptOnceStatus, HttpSession session,
			@RequestParam(defaultValue = "1") int pageNum, Model model) {

		Map<String, Object> countMap = new HashMap<String, Object>();

		countMap.put("pt_once_status", Integer.parseInt(ptOnceStatus));
		countMap.put("trainer_no", trainerService
				.getTrainer(((Member) session.getAttribute("loginUserinfo")).getMemberNo()).getTrainerNo());

		// 상태별 리스트 페이징 정보 저장
		int totalBoard = ptOnceService.getPtOnceTrainerCount(countMap);
		int pageSize = 5;
		int blockSize = 10;
		int number = totalBoard - (pageNum - 1) * pageSize;

		Pager pager = new Pager(pageNum, totalBoard, pageSize, blockSize);

		Map<String, Object> pagerMap = new HashMap<String, Object>();
		pagerMap.put("pt_once_status", Integer.parseInt(ptOnceStatus));
		pagerMap.put("trainer_no", trainerService
				.getTrainer(((Member) session.getAttribute("loginUserinfo")).getMemberNo()).getTrainerNo());
		pagerMap.put("startRow", pager.getStartRow());
		pagerMap.put("endRow", pager.getEndRow());

		model.addAttribute("ptOnceList", ptOnceService.getPtOnceTrainerList(pagerMap));
		model.addAttribute("pager", pager);
		model.addAttribute("status", ptOnceStatus);
		model.addAttribute("number", number);

		return "/user/trainer/trainer_ptonce_list";
	}

	// PT 완료 후 status 수정하는 메소드
	@RequestMapping(value = "/ptonce/trainer/modify/{ptOnceNo}/{status}", method = RequestMethod.GET)
	public String modifyStatus(@PathVariable(value = "ptOnceNo") int ptOnceNo,
			@PathVariable(value = "status") int status, HttpSession session) {

		Map<String, Object> modifyMap = new HashMap<String, Object>();

		modifyMap.put("pt_once_no", ptOnceNo);
		modifyMap.put("pt_once_status", status);
		ptOnceService.modifyPtOnceStatus(modifyMap);

		return "redirect:/ptonce/trainer/list";
	}

//====================예외 처리===============================================================================================================================

	// 계좌 비밀번호가 틀릴 때 예외 핸들러 메서드
	@ExceptionHandler(value = AccountPwAuthException.class)
	public String exception(HttpSession session, AccountPwAuthException exception, Model model) {

		// 비밀번호 틀리면 에러메시지 넘겨주자
		model.addAttribute("message", exception.getMessage());
		int trainerNo = (int) session.getAttribute("trainerNo");

		return "redirect:/posting/detail/" + trainerNo; // 해당 포스팅 페이지로 다시 이동
	}

	@ExceptionHandler(value = AmountOfPaymentException.class)
	public String exception(HttpSession session, AmountOfPaymentException exception, Model model) {

		// 캐시 잔액 모자라면 에러메시지 넘기기
		model.addAttribute("cashMessage", exception.getMessage());
		int trainerNo = (int) session.getAttribute("trainerNo");

		return "redirect:/posting/detail/" + trainerNo; // 해당 포스팅 페이지로 다시 이동
	}
}
