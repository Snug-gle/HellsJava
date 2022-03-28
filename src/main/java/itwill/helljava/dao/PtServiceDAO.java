package itwill.helljava.dao;

import java.util.List;
import java.util.Map;

import itwill.helljava.dto.PtService;

public interface PtServiceDAO {

	int insertPtService(PtService ptService);

	int updatePtService(PtService ptService);
	
	// 좋아요 올리는 메서드
	int updatePtServiceGood(int pt_service_no);

	// 회원 문의 리스트 & 리뷰 글 갯수
	int selectPtServiceCount(int pt_service_sortation, int member_no);
	
	// 트레이너 (나한테 온 문의들) 글 갯수
	int selectPtServiceTrainerCount(int pt_service_sortation, int trainer_no);

	PtService selectPtService(int pt_service_no);

	// 회원 (리뷰 & pt 문의) 게시글 리스트
	List<PtService> selectPtServiceList(Map<String, Object> map);
	
	// 트레이너 (리뷰 & pt 문의) 게시글 리스트
	List<PtService> selectPtServiceTrainerList(Map<String, Object> map);
	
	// 메인에 띄울 좋아요 순 리뷰 리스트
	List<PtService> selectReviewGoodList();
}
