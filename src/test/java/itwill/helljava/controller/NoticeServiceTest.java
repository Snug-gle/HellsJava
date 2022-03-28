package itwill.helljava.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import itwill.helljava.dto.NoticeService;
import itwill.helljava.service.NoticeServiceService;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class NoticeServiceTest {
	
	private static final Logger logger=LoggerFactory.getLogger(PtOnceServiceTest.class);

	@Autowired
	private NoticeServiceService noticeServiceService;
	
	@Test
	public void testSearchSelectCount() {
		Map<String, Object> map = new HashMap();
		
		map.put("startRow", 1);
		map.put("endRow", 10);
//		map.put("searchKeyword", "notice_service_title");
//		map.put("searchValue", "문의");
		map.put("notice_service_status", 3);
//		map.put("notice_service_sortation", 2);
		map.put("member_no", 21);
		
		List<NoticeService> list = noticeServiceService.getNoticeServicePersonalList(map);
		
		for(NoticeService noticeService : list) {
		logger.info(list.toString());
		}
	}
}
