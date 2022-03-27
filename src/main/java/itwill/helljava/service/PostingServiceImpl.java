package itwill.helljava.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import itwill.helljava.dao.PostingDAO;
import itwill.helljava.dto.Posting;

@Service
public class PostingServiceImpl implements PostingService {

	@Autowired
	private PostingDAO postingDAO;

	@Override
	public void addPosting(Posting posting) {
		postingDAO.insertPosting(posting);
	}

	@Override
	public void modifyPosting(Posting posting) {
		postingDAO.updatePosting(posting);
	}

	@Override
	public Posting getPosting(int trainer_no) {
		return postingDAO.selectPosting(trainer_no);
	}

}
