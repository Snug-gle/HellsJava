package itwill.helljava.controller;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import itwill.helljava.dto.Account;
import itwill.helljava.service.AccountSevice;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class AccountServiceTest {

	private static final Logger logger=LoggerFactory.getLogger(AccountServiceTest.class);

	@Autowired
	private AccountSevice accountSevice;
	
	@Test
	public void testaddAccount() {
		Account account = new Account();
		account.setMember_no(30);
		account.setAccount_bank(1);
		account.setAccount_number(123123);
		account.setAccount_pw("123456");
		
		accountSevice.addAccount(account);
		
		logger.info("저장 완료!");
		
	}
}
