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
	public PtOnce getPtOnce(int pt_once_no) {
		return ptOnceDAO.selectPtOnce(pt_once_no);
	}


	@Override
	public int getPtOnceCount(int member_no) {
		return ptOnceDAO.selectPtOnceCount(member_no);
	}


	@Override
	public int getPtOnceTrainerCount(int trainer_no) {
		return ptOnceDAO.selectPtOnceTrainerCount(trainer_no);
	}


	@Override
	public List<PtOnce> getPtOnceList(Map<String, Object> map, int member_no) {
		return ptOnceDAO.selectPtOnceList(map, member_no);
	}


	@Override
	public List<PtOnce> getPtOnceTrainerList(Map<String, Object> map, int trainer_no) {
		return ptOnceDAO.selectPtOnceTrainerList(map, trainer_no);
	}


	
	
}
