package itwill.helljava.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import itwill.helljava.dto.PtService;
import itwill.helljava.mapper.PtServiceMapper;

@Repository
public class PtServiceDAOImpl implements PtServiceDAO{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int insertPtService(PtService ptService) {
		return sqlSession.getMapper(PtServiceMapper.class).insertPtService(ptService);
	}

	@Override
	public int updatePtService(PtService ptService) {
		return sqlSession.getMapper(PtServiceMapper.class).updatePtService(ptService);
	}

	@Override
	public int updatePtServiceGood(int pt_service_no) {
		return sqlSession.getMapper(PtServiceMapper.class).updatePtServiceGood(pt_service_no);
	}

	@Override
	public int selectPtServiceCount(Map<String, Object> map) {
		return sqlSession.getMapper(PtServiceMapper.class).selectPtServiceCount(map);
	}

	@Override
	public int selectPtServiceTrainerCount(Map<String, Object> map) {
		return sqlSession.getMapper(PtServiceMapper.class).selectPtServiceTrainerCount(map);
	}

	@Override
	public PtService selectPtService(int pt_service_no) {
		return sqlSession.getMapper(PtServiceMapper.class).selectPtService(pt_service_no);
	}

	@Override
	public PtService selectPtServiceReview(Map<String, Object> map) {
		return sqlSession.getMapper(PtServiceMapper.class).selectPtServiceReview(map);
	}
	
	@Override
	public List<PtService> selectPtServiceList(Map<String, Object> map) {
		return sqlSession.getMapper(PtServiceMapper.class).selectPtServiceList(map);
	}

	@Override
	public List<PtService> selectPtServiceTrainerList(Map<String, Object> map) {
		return sqlSession.getMapper(PtServiceMapper.class).selectPtServiceTrainerList(map);
	}

	@Override
	public List<PtService> selectReviewGoodList() {
		return sqlSession.getMapper(PtServiceMapper.class).selectReviewGoodList();
	}
	
	
}
