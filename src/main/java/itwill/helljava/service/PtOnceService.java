package itwill.helljava.service;

import java.util.List;

import itwill.helljava.dto.PtOnce;

public interface PtOnceService {
	void addPtOnce(PtOnce ptOnce);

	void modifyPtOnce(PtOnce ptOnce);

	int getPtOnceCount(int member_no);

	PtOnce getPtOnce(int pt_once_no);
	
	// 트레이너 전용, 회원 전용 리스트인지 가져올 방법 생각해야함
	List<PtOnce> getPtOnceList();
}
