package itwill.helljava.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import itwill.helljava.dao.PtServiceDAO;
import itwill.helljava.dto.PtService;

@Service
public class PtServiceServiceImpl implements PtServiceService {
	@Autowired
	private PtServiceDAO ptServiceDAO;

	@Override
	public void addPtService(PtService ptService) {
		ptServiceDAO.insertPtService(ptService);
	}

	@Override
	public void modifyPtService(PtService ptService) {
		ptServiceDAO.updatePtService(ptService);
	}

	@Override
	public int getPtServiceCount(int pt_service_sortation, int member_no) {
		return ptServiceDAO.selectPtServiceCount(pt_service_sortation, member_no);
	}

	@Override
	public PtService getPtService(int pt_service_no) {
		return ptServiceDAO.selectPtService(pt_service_no);
	}

	@Override
	public List<PtService> getPtServiceList(Map<String, Object> map, int pt_service_sortation, int member_status) {
		return ptServiceDAO.selectPtServiceList(map, pt_service_sortation, member_status);
	}

}
