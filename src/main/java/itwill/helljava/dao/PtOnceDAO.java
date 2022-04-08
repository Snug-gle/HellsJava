package itwill.helljava.dao;

import java.util.List;
import java.util.Map;

import itwill.helljava.dto.PtOnce;

public interface PtOnceDAO {

	int insertPtOnce(PtOnce ptOnce);

	// 회원번호, 글 상태 받아오기
	// 글 상태 변경(확인, 미확인, 완료)
	int updatePtOnceStatus(Map<String, Object> map);

	int selectPtOnceCount(int member_no);

	int selectPtOnceTrainerCount(Map<String, Object> map);

	PtOnce selectPtOnce(int pt_once_no);

	// 회원 전용 1회 PT 신청 리스트
	List<PtOnce> selectPtOnceList(Map<String, Object> map);

	// 트레이너 전용 1회 PT 신청 리스트
	List<PtOnce> selectPtOnceTrainerList(Map<String, Object> map);

}
