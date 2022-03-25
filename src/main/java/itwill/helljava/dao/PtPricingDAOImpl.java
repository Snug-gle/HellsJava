package itwill.helljava.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import itwill.helljava.dto.PtPricing;
import itwill.helljava.mapper.PtPricingMapper;

@Repository
public class PtPricingDAOImpl implements PtPricingDAO{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int insertPtPricing(PtPricing ptPricing) {
		return sqlSession.getMapper(PtPricingMapper.class).insertPtPricing(ptPricing);
	}

	@Override
	public int updatePtPricing(PtPricing ptPricing) {
		return sqlSession.getMapper(PtPricingMapper.class).updatePtPricing(ptPricing);
	}

	@Override
	public PtPricing selectPtPring(int pt_pricing_no) {
		return sqlSession.getMapper(PtPricingMapper.class).selectPtPring(pt_pricing_no);
	}

	@Override
	public List<PtPricing> selectPtPricingList() {
		return sqlSession.getMapper(PtPricingMapper.class).selectPtPricingList();
	}
	
	
}
