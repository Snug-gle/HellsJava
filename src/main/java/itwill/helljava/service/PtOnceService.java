package itwill.helljava.service;

import java.util.List;
import java.util.Map;

import itwill.helljava.dto.PtOnce;

public interface PtOnceService {
	
	void addPtOnce(PtOnce ptOnce);

	int getPtOnceCount(int member_no);

	int getPtOnceTrainerCount(int trainer_no);
	
	PtOnce getPtOnce(int pt_once_no);
	
	List<PtOnce> getPtOnceList(Map<String, Object> map, int member_no);
	
	List<PtOnce> getPtOnceTrainerList(Map<String, Object> map, int trainer_no);

}
