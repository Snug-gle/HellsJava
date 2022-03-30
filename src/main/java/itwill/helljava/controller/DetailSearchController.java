package itwill.helljava.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import itwill.helljava.dto.Trainer;
import itwill.helljava.service.TrainerService;
import itwill.helljava.util.Pager;

@Controller
public class DetailSearchController {

	@Autowired
	TrainerService trainerService;

	// 메인 페이지에서 트레이너 검색
	@RequestMapping(value = "/content/search", method = RequestMethod.POST)
	public String search(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes) {

		int pageNum = 1;

		Map<String, Object> countMap = new HashMap<String, Object>();

		countMap.put("searchKeyword", map.get("searchKeyword"));
		countMap.put("searchValue", map.get("searchValue"));

		int totalBoard = trainerService.getMainPageTrainerListCount(countMap);
		int pageSize = 5;
		int blockSize = 10;

		Pager pager = new Pager(pageNum, totalBoard, pageSize, blockSize);

		map.put("startRow", pager.getStartRow());
		map.put("endRow", pager.getEndRow());

		// 메인 페이지에서 검색 결과 리스트 모델에 넣기
		redirectAttributes.addFlashAttribute("searchList", trainerService.getMainPageTrainerList(map));
		redirectAttributes.addFlashAttribute("searchValue", map.get("searchValue"));
		return "redirect:/search_list";
	}

	@RequestMapping(value = "/search_list", method = RequestMethod.GET)
	public String searchList() {
		return "/content/search_list";
	}

	/*
	 * @RequestMapping(value = "/content/posting_detail", method =
	 * RequestMethod.GET) public String postingDetail(@RequestParam(value = "code",
	 * defaultValue="1") int code ,Model model) { model.addAttribute("testReview",
	 * code); return "/content/posting_detail"; }
	 */

	@RequestMapping(value = "/content/posting_detail", method = RequestMethod.GET)
	public String postingDetail() {
		return "/content/posting_detail";
	}

	@RequestMapping(value = "/content/insert", method = RequestMethod.GET)
	public String postingDetailInsert() {
		return "/content/posting_detail_insert";
	}

}
