package itwill.helljava.service;

import java.util.List;
import java.util.Map;

import itwill.helljava.dto.PtService;

public interface PtServiceService {

	void addPtService(PtService ptService);

	void modifyPtService(PtService ptService);
	
	void modifyPtServiceGood(int pt_service_no);

	int getPtServiceCount(Map<String, Object> map);
	
	int getPtServiceTrainerCount(Map<String, Object> map);

	PtService getPtService(int pt_service_no);
	
	// 회원번호로 리뷰 리스트 찾기
	PtService getPtServiceReview(Map<String, Object> map);

	List<PtService> getPtServiceList(Map<String, Object> map);

	List<PtService> getPtServiceTrainerList(Map<String, Object> map);
	
	List<PtService> getReviewGoodList();
}
