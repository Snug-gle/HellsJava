package itwill.helljava.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import itwill.helljava.dao.MemberDAO;
import itwill.helljava.dao.PayDAO;
import itwill.helljava.dto.Pay;
import itwill.helljava.exception.AmountOfPaymentException;

@Service
public class PayServiceImpl implements PayService {

	@Autowired
	private PayDAO payDAO;

	@Autowired
	MemberDAO memberDAO;

	@Override
	@Transactional
	public void addPay(Pay pay) {
		payDAO.insertPay(pay);
	}

	@Override
	public int getPayCount(int member_no) {
		return payDAO.selectPayCount(member_no);
	}

	@Override
	public Pay getPay(int pay_no) {
		return payDAO.selectPay(pay_no);
	}

	@Override
	public List<Pay> getPayList(Map<String, Object> map, int member_no) {
		return payDAO.selectPayList(map, member_no);
	}

	@Override
	public void payAuth(Pay pay) throws AmountOfPaymentException {
		if (pay.getPayPrice() > memberDAO.selectMember(pay.getMemberNo()).getMemberCash()) {
			throw new AmountOfPaymentException("캐시 잔액이 모자랍니다. 충전하시고 결제 하시기 바랍니다.");
		}

	}
}
