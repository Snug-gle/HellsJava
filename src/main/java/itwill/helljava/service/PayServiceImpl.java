package itwill.helljava.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import itwill.helljava.dao.PayDAO;
import itwill.helljava.dto.Pay;

public class PayServiceImpl implements PayService {

	@Autowired
	PayDAO payDAO;

	@Override
	public void addPay(Pay pay) {
		payDAO.insertPay(pay);
	}

	@Override
	public void modifyPay(Pay pay) {
		payDAO.updatePay(pay);
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
	public List<Pay> getPayList(Map<String, Object> map) {
		return payDAO.selectPayList(map);
	}

}
