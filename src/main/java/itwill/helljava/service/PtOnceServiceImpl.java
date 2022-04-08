package itwill.helljava.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import itwill.helljava.dao.PtOnceDAO;
import itwill.helljava.dto.PtOnce;

@Service
public class PtOnceServiceImpl implements PtOnceService {
	@Autowired
	private PtOnceDAO ptOnceDAO;

	@Transactional
	@Override
	public void addPtOnce(PtOnce ptOnce) {
		ptOnceDAO.insertPtOnce(ptOnce);
	}

	@Override
	public void modifyPtOnceStatus(Map<String, Object> map) {
		ptOnceDAO.updatePtOnceStatus(map);
	}

	@Override
	public PtOnce getPtOnce(int pt_once_no) {
		return ptOnceDAO.selectPtOnce(pt_once_no);
	}

	@Override
	public int getPtOnceCount(int member_no) {
		return ptOnceDAO.selectPtOnceCount(member_no);
	}

	@Override
	public int getPtOnceTrainerCount(Map<String, Object> map) {
		return ptOnceDAO.selectPtOnceTrainerCount(map);
	}

	@Override
	public List<PtOnce> getPtOnceList(Map<String, Object> map) {
		return ptOnceDAO.selectPtOnceList(map);
	}

	@Override
	public List<PtOnce> getPtOnceTrainerList(Map<String, Object> map) {
		return ptOnceDAO.selectPtOnceTrainerList(map);
	}

}
