package itwill.helljava.dao;

import java.util.List;
import java.util.Map;

import itwill.helljava.dto.Member;

public interface MemberDAO {

	int insertMember(Member member);

	int updateMember(Member member);

	Member selectMember(int member_no);

	Member selectIdMember(String member_id);
	
	// 아이디 & 비밀번호 찾기 쿼리
	Member selectSearchMember(Map<String, Object> map);
	
	List<Member> selectMemberList(Map<String, Object> map);
}
