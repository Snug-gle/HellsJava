package itwill.helljava.service;

import itwill.helljava.dto.Account;
import itwill.helljava.dto.Member;
import itwill.helljava.exception.AccountPwAuthException;

public interface AccountSevice {

	void addAccount(Account account);

	void removeAccount(int accountNo);

	Account getMemberAccount(int member_no);
	
	// 계좌 비밀번호 인증 검사
	void accountPwAuth(Account account) throws AccountPwAuthException;
}
