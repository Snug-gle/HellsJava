package itwill.helljava.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import itwill.helljava.dto.PtOnce;
import itwill.helljava.mapper.PtOnceMapper;

@Repository
public class PtOnceDAOImpl implements PtOnceDAO{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int insertPtOnce(PtOnce ptOnce) {
		return sqlSession.getMapper(PtOnceMapper.class).insertPtOnce(ptOnce);
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
	public int selectPtOnceTrainerCount(int trainer_no) {
		return sqlSession.getMapper(PtOnceMapper.class).selectPtOnceTrainerCount(trainer_no);
	}


	@Override
	public List<PtOnce> selectPtOnceList(Map<String, Object> map, int member_no) {
		return sqlSession.getMapper(PtOnceMapper.class).selectPtOnceList(map, member_no);
	}


	@Override
	public List<PtOnce> selectPtOnceTrainerList(Map<String, Object> map, int trainer_no) {
		return sqlSession.getMapper(PtOnceMapper.class).selectPtOnceTrainerList(map, trainer_no);
	}

	
	
	
}
