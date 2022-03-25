package itwill.helljava.service;

import java.util.List;

import itwill.helljava.dto.PtOnce;

public interface PtOnceService {
	
	void addPtOnce(PtOnce ptOnce);

	int getPtOnceCount(int member_no);

	PtOnce getPtOnce(int pt_once_no);
	
	// 트레이너 전용, 회원 전용이므로 상태 변수 매개변수로 받음
	List<PtOnce> getPtOnceList(int member_status);
}
