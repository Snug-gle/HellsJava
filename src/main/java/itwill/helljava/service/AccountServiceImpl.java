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
	
	@Autowired
	private MemberDAO memberDAO;
	
	@Override
	@Transactional
	public void addAccount(Account account) {
	
		// 계좌 비번에 첨가물 섞기
		account.setAccountPw(BCrypt.hashpw(account.getAccountPw(), BCrypt.gensalt()));

		accountDAO.insertAccount(account);
	}
	
	@Override
	@Transactional
	public void removeAccount(int member_no) {
		accountDAO.deleteAccount(member_no);
	}

	@Override
	public Account getMemberAccount(int member_no) {
		return accountDAO.selectAccount(member_no);
	}

	// 계좌 비밀번호 인증 실패 : 예외 발생, 인증성공 : 예외 미발생
	@Override
	public void accountPwAuth(Account account) throws AccountPwAuthException {
		Account authAccount = accountDAO.selectAccount(account.getMemberNo());
		
		if(authAccount == null) {
			throw new AccountPwAuthException("해당 계좌가 존재하지 않습니다.");
		}
		
		// 암호화 비밀번호 비교
		if(!BCrypt.checkpw(account.getAccountPw(), authAccount.getAccountPw())) {
			throw new AccountPwAuthException("해당 계좌의 비밀번호가 일치하지 않습니다.");
		}
			
		// 결제 액션 실행! 단일 책임 원칙
		payAction(account);
		
	}
	
	// 결제 액션 메서드
	public void payAction(Account account) {
		
		// 계좌 번호 인증 성공했으면 결제를 해야지
		// 필요한 것. pay객체 : pay_price(결제 금액), pay_type(결제 유형)
		Pay pay = new Pay();
		pay.setMemberNo(account.getMemberNo());
		pay.setPayPrice(15000);
		pay.setPayType(PayTypeEnum.트레이너신청.getValue());
				
		// 결제 객체 태워보냄
		payDAO.insertPay(pay);
		
		// 캐시 차감에 태워보낼 member 객체
		Member payMember = new Member();
		
		payMember.setMemberNo(account.getMemberNo());
		payMember.setMemberCash(pay.getPayPrice());
		// 회원 캐시 삭제
		memberDAO.updateMember(payMember);
		
	}

}
