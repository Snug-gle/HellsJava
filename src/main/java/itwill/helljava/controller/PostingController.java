package itwill.helljava.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import itwill.helljava.dto.Award;
import itwill.helljava.dto.Member;
import itwill.helljava.service.AccountSevice;
import itwill.helljava.service.AwardService;
import itwill.helljava.service.PostingService;
import itwill.helljava.service.TrainerService;

@Controller
public class PostingController {

	@Autowired
	private PostingService postingService;

	@Autowired
	private TrainerService trainerService;

	@Autowired
	private AwardService awardService;

	// 포스팅 작성 페이지 요청
	@RequestMapping(value = "/posting/write", method = RequestMethod.GET)
	public String trainerRequesAdd(HttpSession session, Model model) {

		// 모델에다가 트레이너 객체 넘김
		model.addAttribute("trainer",
				trainerService.getTrainer(((Member) session.getAttribute("loginUserinfo")).getMemberNo()));
		model.addAttribute("trainerAwards", awardService.getAwardList(trainerService
				.getTrainer(((Member) session.getAttribute("loginUserinfo")).getMemberNo()).getTrainerNo()));

		return "/content/posting_detail_insert";
	}

}
