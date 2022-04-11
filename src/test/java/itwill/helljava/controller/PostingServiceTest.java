package itwill.helljava.controller;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import itwill.helljava.dto.Posting;
import itwill.helljava.service.NoticeServiceService;
import itwill.helljava.service.PostingService;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class PostingServiceTest {
	
	private static final Logger logger = LoggerFactory.getLogger(PtOnceServiceTest.class);

	@Autowired
	private PostingService postingService;
}
	
