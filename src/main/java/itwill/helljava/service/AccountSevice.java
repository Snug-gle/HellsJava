package itwill.helljava.service;

import itwill.helljava.dto.Account;
import itwill.helljava.dto.Member;

public interface AccountSevice {

	void addAccount(Member member);

	void removeAccount(int member_no);

	Account getMemberAccount(int member_no);
}
