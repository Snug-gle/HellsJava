package itwill.helljava.mapper;

import java.util.List;
import java.util.Map;

import itwill.helljava.dto.Member;

public interface MemberMapper {

	int insertMember(Member member);

	int updateMember(Member member);

	Member selectMember(int member_no);

	// 회원 조회 (검색 기능 아이디, 이름 포함)
	List<Member> selectMemberList(Map<String, Object> map, int member_status, String member_id, String member_name);
	

	
}
