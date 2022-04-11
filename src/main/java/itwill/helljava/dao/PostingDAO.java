package itwill.helljava.dao;

import java.util.List;

import itwill.helljava.dto.Posting;

public interface PostingDAO {

	int insertPosting(Posting posting);

	int updatePosting(Posting posting);

	Posting selectPosting(int trainer_no);

}
