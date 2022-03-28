package itwill.helljava.service;

import java.util.List;
import java.util.Map;

import itwill.helljava.dto.PtService;

public interface PtServiceService {

	void addPtService(PtService ptService);

	void modifyPtService(PtService ptService);
	
	void modifyPtServiceGood(int pt_service_no);

	int getPtServiceCount(int pt_service_sortation, int member_no);
	
	int getPtServiceTrainerCount(int pt_service_sortation, int trainer_no);

	PtService getPtService(int pt_service_no);

	List<PtService> getPtServiceList(Map<String, Object> map);

	List<PtService> getPtServiceTrainerList(Map<String, Object> map);
	
	List<PtService> getReviewGoodList();
}
