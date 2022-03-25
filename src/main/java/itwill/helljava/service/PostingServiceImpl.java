package itwill.helljava.service;

import org.springframework.beans.factory.annotation.Autowired;

import itwill.helljava.dao.PostingDAO;
import itwill.helljava.dto.Posting;

public class PostingServiceImpl implements PostingService {

	@Autowired
	PostingDAO postingDAO;

	@Override
	public void addPosting(Posting posting) {
		postingDAO.insertPosting(posting);
	}

	@Override
	public void modifyPosting(Posting posting) {
		postingDAO.updatePosting(posting);
	}

	@Override
	public Posting getPosting(int posting_no) {
		return postingDAO.selectPosting(posting_no);
	}

}
