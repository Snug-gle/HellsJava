package itwill.helljava.service;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import itwill.helljava.Enum.PayTypeEnum;
import itwill.helljava.dao.AccountDAO;
import itwill.helljava.dao.MemberDAO;
import itwill.helljava.dao.PayDAO;
import itwill.helljava.dto.Account;
import itwill.helljava.dto.Member;
import itwill.helljava.dto.Pay;
import itwill.helljava.exception.AccountPwAuthException;

@Service
public class AccountServiceImpl implements AccountSevice {

	@Autowired
	private AccountDAO accountDAO;

	@Autowired
	private PayDAO payDAO;

	@Override
	@Transactional
	public void addAccount(Account account) {

		// 계좌 비번에 첨가물 섞기
		account.setAccountPw(BCrypt.hashpw(account.getAccountPw(), BCrypt.gensalt()));
		accountDAO.insertAccount(account);
	}

	@Override
	@Transactional
	public void removeAccount(int accountNo) {
		accountDAO.deleteAccount(accountNo);
	}

	@Override
	public Account getMemberAccount(int member_no) {
		return accountDAO.selectAccount(member_no);
	}

	// 계좌 비밀번호 인증 실패 : 예외 발생, 인증성공 : 예외 미발생
	@Override
	public void accountPwAuth(Account account) throws AccountPwAuthException {
		Account authAccount = accountDAO.selectAccount(account.getMemberNo());

		if (authAccount == null) {
			throw new AccountPwAuthException("해당 계좌가 존재하지 않습니다.");
		}

		// 암호화 비밀번호 비교
		if (!BCrypt.checkpw(account.getAccountPw(), authAccount.getAccountPw())) {
			throw new AccountPwAuthException("해당 계좌의 비밀번호가 일치하지 않습니다.");
		}

	}


}
