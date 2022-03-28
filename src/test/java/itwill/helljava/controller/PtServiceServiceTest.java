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

import itwill.helljava.dto.PtService;
import itwill.helljava.service.PtServiceService;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class PtServiceServiceTest {

	private static final Logger logger=LoggerFactory.getLogger(PtServiceServiceTest.class);
	
	@Autowired
	private PtServiceService ptServiceService;
	
	
	@Test
	public void selectTrainerList() {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("pt_service_status", 2);
		map.put("pt_service_sortation", 0);
		map.put("member_no", 26);
		map.put("startRow", 1);
		map.put("endRow", 5);
		
		List<PtService> list = ptServiceService.getPtServiceList(map) ;
		
		for(PtService lists : list) {
			logger.info("lists : " +lists);
		}
		
		
	}
}
