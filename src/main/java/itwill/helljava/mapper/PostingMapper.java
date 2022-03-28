package itwill.helljava.mapper;

import itwill.helljava.dto.Posting;

public interface PostingMapper {

	int insertPosting(Posting posting);

	int updatePosting(Posting posting);

	Posting selectPosting(int trainer_no);
	
}
