package itwill.helljava.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import itwill.helljava.dto.Posting;
import itwill.helljava.mapper.PostingMapper;

@Repository
public class PostingDAOImpl implements PostingDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public int insertPosting(Posting posting) {
		return sqlSession.getMapper(PostingMapper.class).insertPosting(posting);
	}

	@Override
	public int updatePosting(Posting posting) {
		return sqlSession.getMapper(PostingMapper.class).updatePosting(posting);
	}

	@Override
	public Posting selectPosting(int trainer_no) {
		return sqlSession.getMapper(PostingMapper.class).selectPosting(trainer_no);
	}
}
