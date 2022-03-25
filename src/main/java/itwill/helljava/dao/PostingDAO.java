package itwill.helljava.dao;

import itwill.helljava.dto.Posting;

public interface PostingDAO {

	int insertPosting(Posting posting);

	int updatePosting(Posting posting);

	Posting selectPosting(int posting_no);
}
