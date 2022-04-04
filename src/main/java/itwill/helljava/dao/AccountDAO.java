package itwill.helljava.dao;

import itwill.helljava.dto.Account;
import itwill.helljava.dto.Member;

public interface AccountDAO {

	int insertAccount(Account account);

	int deleteAccount(int accountNo);

	Account selectAccount(int member_no);

}
