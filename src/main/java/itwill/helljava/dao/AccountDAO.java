package itwill.helljava.dao;

import java.util.List;

import itwill.helljava.dto.Account;
import itwill.helljava.dto.Member;

public interface AccountDAO {

	void addAcount(Member member);

	void removeAccount(int member_no);

	void modifyAccount(Member member);

	Account getMemberAccount(Member member);

	List<Account> getAccountList();
	
}
