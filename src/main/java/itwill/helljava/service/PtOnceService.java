package itwill.helljava.service;

import java.util.List;

import itwill.helljava.dto.PtOnce;

public interface PtOnceService {
	void addPtOnce(PtOnce ptOnce);
	void modifyPtOnce(PtOnce ptOnce);
	int getPtOnceCount();
	PtOnce getPtOnce(int pt_once_no);
	List<PtOnce> getPtOnceList();
}
