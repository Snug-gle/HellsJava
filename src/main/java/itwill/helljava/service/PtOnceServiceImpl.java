package itwill.helljava.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import itwill.helljava.dao.PtOnceDAO;
import itwill.helljava.dto.PtOnce;

@Service
public class PtOnceServiceImpl implements PtOnceService {
	@Autowired
	private PtOnceDAO ptOnceDAO;

	@Override
	public void addPtOnce(PtOnce ptOnce) {
		ptOnceDAO.insertPtOnce(ptOnce);
	}

	@Override
	public int getPtOnceCount(int member_no, int member_status) {
		return ptOnceDAO.selectPtOnceCount(member_no, member_status);
	}

	@Override
	public PtOnce getPtOnce(int pt_once_no) {
		return ptOnceDAO.selectPtOnce(pt_once_no);
	}

	@Override
	public List<PtOnce> getPtOnceList(int member_status) {
		return ptOnceDAO.selectPtOnceList(member_status);
	}

	
	
}
