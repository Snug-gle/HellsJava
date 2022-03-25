package itwill.helljava.service;

import org.springframework.beans.factory.annotation.Autowired;

import itwill.helljava.dao.AccountDAO;
import itwill.helljava.dto.Account;
import itwill.helljava.dto.Member;

public class AccountServiceImpl implements AccountSevice {

	@Autowired
	private AccountDAO accountDAO;

	@Override
	public void addAccount(Member member) {
		accountDAO.insertAccount(member);
	}

	@Override
	public void modifyAccount(Member member) {
		accountDAO.updateAccount(member);
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
