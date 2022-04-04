package itwill.helljava.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import itwill.helljava.dto.Account;
import itwill.helljava.dto.Member;
import itwill.helljava.mapper.AccountMapper;

@Repository
public class AccountDAOImpl implements AccountDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public int insertAccount(Account account) {
		return sqlSession.getMapper(AccountMapper.class).insertAccount(account);
	}

	@Override
	public int deleteAccount(int accountNo) {
		return sqlSession.getMapper(AccountMapper.class).deleteAccount(accountNo);
	}

	@Override
	public Account selectAccount(int member_no) {
		return sqlSession.getMapper(AccountMapper.class).selectAccount(member_no);
	}
}
