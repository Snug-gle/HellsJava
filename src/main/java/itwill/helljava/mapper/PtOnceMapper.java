package itwill.helljava.mapper;

import java.util.List;

import itwill.helljava.dto.PtOnce;

public interface PtOnceMapper {
	int insertPtOnce(PtOnce ptOnce);
	int selectPtOnceCount(int member_no);
	PtOnce selectPtOnce(int pt_once_no);
	List<PtOnce> selectPtOnceList(int member_status);
}
