package itwill.helljava.service;

import java.util.List;
import java.util.Map;

import itwill.helljava.dto.PtService;

public interface PtServiceService {

	void addPtService(PtService ptService);

	void modifyPtService(PtService ptService);

	int getPtServiceCount(int pt_service_sortation, int member_no);

	PtService getPtService(int pt_service_no);

	List<PtService> getPtServiceList(Map<String, Object> map, int pt_service_sortation, int member_status);

}
