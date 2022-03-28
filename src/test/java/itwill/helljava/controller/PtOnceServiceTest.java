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

import itwill.helljava.dto.PtOnce;
import itwill.helljava.service.PtOnceService;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class PtOnceServiceTest {
	private static final Logger logger=LoggerFactory.getLogger(PtOnceServiceTest.class);
	
	@Autowired
	private PtOnceService ptOnceService;
	
	/*
	@Test
	public void testAddPtOnce() {
		PtOnce ptOnce=new PtOnce();
		ptOnce.setPt_once_gender(0);
		ptOnce.setPt_once_age(0);
		ptOnce.setPt_once_purpose(0);
		ptOnce.setPt_once_experience(0);
		ptOnce.setPt_once_significant("특이사항");
		ptOnce.setMember_no(30);
		ptOnce.setTrainer_no(1);
		ptOnce.setPt_once_status(0);
		
		ptOnceService.addPtOnce(ptOnce);
		
		logger.info("완료");
	}
	*/

	/*
	@Test
	public void testGetPtOnceCount() {
		logger.info("30번 = "+ptOnceService.getPtOnceCount(30));
	}
	*/
	
	
	/*
	 * @Test public void testGetPtOnce() { logger.info("하이"); PtOnce ptOnce =
	 * ptOnceService.getPtOnce(10);
	 * 
	 * logger.info("10 번 성별 : " +ptOnce); }
	 */
	
	@Test
	public void testGetSelectPtOnceTrainerList() {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("startRow", 1);
		map.put("endRow", 10);
		//map.put("pt_service_status", 0);
		map.put("trainer_no", 1);
		
		List<PtOnce> list = ptOnceService.getPtOnceTrainerList(map);
		
		for(PtOnce one : list) {
			logger.info(one.toString());
		}
	}
	
	
	
	
}
