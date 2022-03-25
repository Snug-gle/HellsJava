package itwill.helljava.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import itwill.helljava.dto.Member;
import itwill.helljava.mapper.MemberMapper;

public class MemberDAOImpl implements MemberDAO {

	@Autowired
	SqlSession sqlSession;

	@Override
	public int insertMember(Member member) {
		return sqlSession.getMapper(MemberMapper.class).insertMember(member);
	}

	@Override
	public int updateMember(Member member) {
		return sqlSession.getMapper(MemberMapper.class).updateMember(member);
	}

	@Override
	public Member selectMember(int member_no) {
		return sqlSession.getMapper(MemberMapper.class).selectMember(member_no);
	}

	@Override
	public List<Member> selectMemberList() {
		return sqlSession.getMapper(MemberMapper.class).selectMemberList();
	}

}
