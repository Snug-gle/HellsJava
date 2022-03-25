package itwill.helljava.mapper;

import java.util.List;

import itwill.helljava.dto.Member;

public interface MemberMapper {

	int insertMember(Member member);

	int updateMember(Member member);

	Member selectMember(int member_no);

	List<Member> selectMemberList();
}
