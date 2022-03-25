package itwill.helljava.dao;

import java.util.List;

import itwill.helljava.dto.Member;

public interface MemberDAO {

	int insertMember(Member member);

	int updateMember(Member member);

	Member selectMember(int member_no);

	List<Member> selectMemberList();
}
