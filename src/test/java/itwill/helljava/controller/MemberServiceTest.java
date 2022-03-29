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

import itwill.helljava.dto.Member;
import itwill.helljava.exception.MemberIdSearchNotFoundException;
import itwill.helljava.exception.MemberNotFoundException;
import itwill.helljava.exception.MemberPwSearchNotFoundException;
import itwill.helljava.service.MemberService;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class MemberServiceTest {

	private static final Logger logger=LoggerFactory.getLogger(PtOnceServiceTest.class);
	
	@Autowired
	private MemberService memberService;
	
	/*
	 * @Test public void testSelectMemeberList() { Map<String, Object> map = new
	 * HashMap();
	 * 
	 * map.put("startRow", 1); map.put("endRow", 5); map.put("member_id", "ㄴㄴㄴ");
	 * 
	 * List<Member> memberList = memberService.getMemberList(map);
	 * 
	 * for(Member member : memberList) { logger.info(member.toString()); } }
	 */
	
	@Test
	public void testgetSearchMember() throws MemberIdSearchNotFoundException, MemberPwSearchNotFoundException {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("memberName", "트레이너1");
		map.put("memberPhone", "010-1234-1234");
		//map.put("memberId", "trainer1");
		
		Member member = memberService.getSearchMember(map);
		
		logger.info(member.toString());
	}
}
