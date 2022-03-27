package itwill.helljava.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import itwill.helljava.dto.Member;
import itwill.helljava.mapper.MemberMapper;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	private SqlSession sqlSession;

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
	public List<Member> selectMemberList(Map<String, Object> map, int member_status, String member_id,
			String member_name) {
		return sqlSession.getMapper(MemberMapper.class).selectMemberList(map, member_status, member_id, member_name);
	}

	
}
