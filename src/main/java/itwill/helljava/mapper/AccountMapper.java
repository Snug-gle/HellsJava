package itwill.helljava.mapper;

import itwill.helljava.dto.Account;
import itwill.helljava.dto.Member;

public interface AccountMapper {

	int insertAccount(Account account);

	int deleteAccount(int member_no);

	Account selectAccount(int member_no);
}
