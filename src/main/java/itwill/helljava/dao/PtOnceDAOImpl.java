package itwill.helljava.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import itwill.helljava.dto.PtOnce;
import itwill.helljava.mapper.PtOnceMapper;

@Repository
public class PtOnceDAOImpl implements PtOnceDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int insertPtOnce(PtOnce ptOnce) {
		return sqlSession.getMapper(PtOnceMapper.class).insertPtOnce(ptOnce);
	}

	@Override
	public int updatePtOnceStatus(Map<String, Object> map) {
		return sqlSession.getMapper(PtOnceMapper.class).updatePtOnceStatus(map);
	}

	@Override
	public PtOnce selectPtOnce(int pt_once_no) {
		return sqlSession.getMapper(PtOnceMapper.class).selectPtOnce(pt_once_no);
	}

	@Override
	public int selectPtOnceCount(int member_no) {
		return sqlSession.getMapper(PtOnceMapper.class).selectPtOnceCount(member_no);
	}

	@Override
	public int selectPtOnceTrainerCount(Map<String, Object> map) {
		return sqlSession.getMapper(PtOnceMapper.class).selectPtOnceTrainerCount(map);
	}

	@Override
	public List<PtOnce> selectPtOnceList(Map<String, Object> map) {
		return sqlSession.getMapper(PtOnceMapper.class).selectPtOnceList(map);
	}

	@Override
	public List<PtOnce> selectPtOnceTrainerList(Map<String, Object> map) {
		return sqlSession.getMapper(PtOnceMapper.class).selectPtOnceTrainerList(map);
	}

}
