package itwill.helljava.dao;

import java.util.List;

import itwill.helljava.dto.PtOnce;

public interface PtOnceDAO {
	int insertPtOnce(PtOnce ptOnce);
	int updatePtOnce(PtOnce ptOnce);
	int selectPtOnceCount(int member_no);
	PtOnce selectPtOnce(int pt_once_no);
	List<PtOnce> selectPtOnceList();
}
