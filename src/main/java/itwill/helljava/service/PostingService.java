package itwill.helljava.service;

import itwill.helljava.dto.Posting;

public interface PostingService {

	void addPosting(Posting posting);
	void modifyPosting(Posting posting);
	Posting getPosting(int posting_no);
}
