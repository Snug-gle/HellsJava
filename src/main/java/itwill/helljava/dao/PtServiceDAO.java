package itwill.helljava.dao;

import java.util.List;
import java.util.Map;

import itwill.helljava.dto.PtService;

public interface PtServiceDAO {
	int insertPtService(PtService ptService);
	int updatePtService(PtService ptService);
	int selectPtServiceCount(int pt_service_sortation);
	PtService selectPtService(int pt_service_no, int pt_service_sortation);
	List<PtService> selectPtServiceList(Map<String, Object> map, int pt_service_sortation);
}
