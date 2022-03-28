package itwill.helljava.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import itwill.helljava.dao.PtServiceDAO;
import itwill.helljava.dto.PtService;

@Service
public class PtServiceServiceImpl implements PtServiceService {
	@Autowired
	private PtServiceDAO ptServiceDAO;
	
	@Transactional
	@Override
	public void addPtService(PtService ptService) {
		ptServiceDAO.insertPtService(ptService);
	}
	
	@Transactional
	@Override
	public void modifyPtService(PtService ptService) {
		ptServiceDAO.updatePtService(ptService);
	}
	
	@Transactional
	@Override
	public void modifyPtServiceGood(int pt_service_no) {
		ptServiceDAO.updatePtServiceGood(pt_service_no);
	}

	@Override
	public int getPtServiceCount(int pt_service_sortation, int member_no) {
		return ptServiceDAO.selectPtServiceCount(pt_service_sortation, member_no);
	}

	@Override
	public int getPtServiceTrainerCount(int pt_service_sortation, int trainer_no) {
		return ptServiceDAO.selectPtServiceTrainerCount(pt_service_sortation, trainer_no);
	}

	@Override
	public PtService getPtService(int pt_service_no) {
		return ptServiceDAO.selectPtService(pt_service_no);
	}

	@Override
	public List<PtService> getPtServiceList(Map<String, Object> map) {
		return ptServiceDAO.selectPtServiceList(map);
	}

	@Override
	public List<PtService> getPtServiceTrainerList(Map<String, Object> map) {
		return ptServiceDAO.selectPtServiceTrainerList(map);
	}

	@Override
	public List<PtService> getReviewGoodList() {
		return ptServiceDAO.selectReviewGoodList();
	}

}
