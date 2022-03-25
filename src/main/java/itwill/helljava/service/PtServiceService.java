package itwill.helljava.service;

import java.util.List;
import java.util.Map;

import itwill.helljava.dto.PtService;

public interface PtServiceService {
	void addPtService(PtService ptService);
	void modifyPtService(PtService ptService);
	int getPtServiceCount(int pt_service_sortation);
	PtService getPtService(int pt_service_no, int pt_service_sortation);
	List<PtService> getPtServiceList(Map<String, Object> map, int pt_service_sortation);
	
}
