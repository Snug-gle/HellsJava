package itwill.helljava.service;

import java.util.List;
import java.util.Map;

import itwill.helljava.dto.Pay;
import itwill.helljava.exception.AmountOfPaymentException;

public interface PayService {

	void addPay(Pay pay);

	// 결제 일자 변경 메서드
	void modifyPay(Map<String, Object> map);

	// void removePay(int pay_no); // 결제 데이터를 삭제할 일은 없을듯..
	int getPayCount(int member_no);

	Pay getPay(Map<String, Object> map);

	List<Pay> getPayList(Map<String, Object> map, int member_no);

	// 결제 금액과 잔액 비교
	void payAuth(Pay pay) throws AmountOfPaymentException;

}
