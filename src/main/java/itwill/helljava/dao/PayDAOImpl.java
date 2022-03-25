package itwill.helljava.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import itwill.helljava.dto.Pay;
import itwill.helljava.mapper.PayMapper;

public class PayDAOImpl implements PayDAO {

	@Autowired
	SqlSession sqlSession;

	@Override
	public int insertPay(Pay pay) {
		return sqlSession.getMapper(PayMapper.class).insertPay(pay);
	}


	@Override
	public int updatePay(Pay pay) {
		return sqlSession.getMapper(PayMapper.class).updatePay(pay);
	}

	@Override
	public int selectPayCount(int member_no) {
		return sqlSession.getMapper(PayMapper.class).selectPayCount(member_no);
	}

	@Override
	public Pay selectPay(int pay_no) {
		return sqlSession.getMapper(PayMapper.class).selectPay(pay_no);
	}

	@Override
	public List<Pay> selectPayList(Map<String, Object> map) {
		return sqlSession.getMapper(PayMapper.class).selectPayList(map);
	}

}
