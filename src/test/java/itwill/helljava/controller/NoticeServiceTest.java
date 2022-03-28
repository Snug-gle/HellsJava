package itwill.helljava.controller;

import java.util.HashMap;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

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
		
		map.put("notice_service_status", 3);
		map.put("notice_service_title", "궁금");
		
		int count = noticeServiceService.getNoticeOneManageCount(map);
		
		logger.info("count 는 ? = " +count);
	}
}
