package itwill.helljava.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import itwill.helljava.dao.AccountDAO;
import itwill.helljava.dto.Account;
import itwill.helljava.dto.Member;

@Service
public class AccountServiceImpl implements AccountSevice {

	@Autowired
	private AccountDAO accountDAO;

	@Override
	public void addAccount(Member member) {
		accountDAO.insertAccount(member);
	}
	
	@Override
	public void removeAccount(int member_no) {
		accountDAO.deleteAccount(member_no);
	}

	@Override
	public Account getMemberAccount(int member_no) {
		return accountDAO.selectAccount(member_no);
	}

}
