package itwill.helljava.mapper;

import java.util.List;
import java.util.Map;

import itwill.helljava.dto.Pay;

public interface PayMapper {

	int insertPay(Pay pay);

	// void removePay(int pay_no); // 결제 데이터를 삭제할 일은 없을듯..
	int selectPayCount(int member_no);
	
	Pay selectPay(int pay_no);
	
	List<Pay> selectPayList(Map<String, Object> map, int member_no);
}
