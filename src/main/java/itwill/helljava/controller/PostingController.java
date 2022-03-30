package itwill.helljava.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import itwill.helljava.dto.Award;
import itwill.helljava.dto.Member;
import itwill.helljava.service.AccountSevice;
import itwill.helljava.service.AwardService;
import itwill.helljava.service.PostingService;

@Controller
public class PostingController {

	@Autowired
	private PostingService postingService;
	
	@Autowired
	private AwardService awardService;
	
	@Autowired
	private AccountSevice accountSevice;
	
	// 트레이너 신청 포스트 요청
	@RequestMapping(value = "/trainer/request", method = RequestMethod.POST)
	public String trainerRequesAdd() {
		return "";
	}
	
}
