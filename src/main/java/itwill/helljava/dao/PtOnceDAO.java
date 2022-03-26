package itwill.helljava.dao;

import java.util.List;
import java.util.Map;

import itwill.helljava.dto.PtOnce;

public interface PtOnceDAO {
	
	int insertPtOnce(PtOnce ptOnce);

	int selectPtOnceCount(int member_no);
	
	int selectPtOnceTrainerCount(int trainer_no);

	PtOnce selectPtOnce(int pt_once_no);

	// 회원 전용 1회 PT 신청 리스트
	List<PtOnce> selectPtOnceList(Map<String, Object> map, int member_no);
		
	// 트레이너 전용 1회 PT 신청 리스트
	List<PtOnce> selectPtOnceTrainerList(Map<String, Object> map, int trainer_no);

}
