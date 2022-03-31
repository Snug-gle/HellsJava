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
	public int selectMemberListCount(Map<String, Object> map) {
		return sqlSession.getMapper(MemberMapper.class).selectMemberListCount(map);
	}

	@Override
	public Member selectMember(int member_no) {
		return sqlSession.getMapper(MemberMapper.class).selectMember(member_no);
	}

	@Override
	public Member selectIdMember(String member_id) {
		return sqlSession.getMapper(MemberMapper.class).selectIdMember(member_id);
	}
	
	@Override
	public Member selectSearchMember(Map<String, Object> map) {
		return sqlSession.getMapper(MemberMapper.class).selectSearchMember(map);
	}
	
	@Override
	public List<Member> selectMemberList(Map<String, Object> map) {
		return sqlSession.getMapper(MemberMapper.class).selectMemberList(map);
	}

	
}
