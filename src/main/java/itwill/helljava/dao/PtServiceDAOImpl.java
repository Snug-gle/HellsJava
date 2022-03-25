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
	public int selectPtServiceCount(int pt_service_sortation) {
		return sqlSession.getMapper(PtServiceMapper.class).selectPtServiceCount(pt_service_sortation);
	}

	@Override
	public PtService selectPtService(int pt_service_no, int pt_service_sortation) {
		return sqlSession.getMapper(PtServiceMapper.class).selectPtService(pt_service_no, pt_service_sortation);
	}

	@Override
	public List<PtService> selectPtServiceList(Map<String, Object> map, int pt_service_sortation) {
		return sqlSession.getMapper(PtServiceMapper.class).selectPtServiceList(map, pt_service_sortation);
	}
	
	
}
