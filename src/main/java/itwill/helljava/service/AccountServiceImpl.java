package itwill.helljava.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import itwill.helljava.dao.AccountDAO;
import itwill.helljava.dto.Account;
import itwill.helljava.dto.Member;

public class AccountServiceImpl implements AccountSevice {

	@Autowired
	private AccountDAO accountDAO;

	@Override
	public void addAcount(Member member) {
		accountDAO.insertAcount(member);
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
	public Account getMemberAccount(Member member) {
		return accountDAO.selectAccount(member);
	}

	@Override
	public List<Account> getAccountList() {
		return accountDAO.selectAccountList();
	}


}
