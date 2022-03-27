package itwill.helljava.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import itwill.helljava.dao.PayDAO;
import itwill.helljava.dto.Pay;

@Service
public class PayServiceImpl implements PayService {

	@Autowired
	private PayDAO payDAO;

	@Override
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

}
