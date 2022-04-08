package itwill.helljava.service;

import java.util.List;
import java.util.Map;

import itwill.helljava.dto.PtOnce;

public interface PtOnceService {
	
	void addPtOnce(PtOnce ptOnce);

	void modifyPtOnceStatus(Map<String, Object> map);
	
	int getPtOnceCount(int member_no);

	int getPtOnceTrainerCount(Map<String, Object> map);
	
	PtOnce getPtOnce(int pt_once_no);
	
	List<PtOnce> getPtOnceList(Map<String, Object> map);
	
	List<PtOnce> getPtOnceTrainerList(Map<String, Object> map);

}
