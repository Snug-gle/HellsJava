package itwill.helljava.mapper;

import java.util.List;

import itwill.helljava.dto.PtOnce;

public interface PtOnceMapper {
	int insertPtOnce(PtOnce ptOnce);
	int updatePtOnce(PtOnce ptOnce);
	int selectPtOnce();
	PtOnce selectPtOnce(int pt_once_no);
	List<PtOnce> selectPtOnceList();
}
