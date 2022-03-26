package itwill.helljava.dao;

import java.util.List;
import java.util.Map;

import itwill.helljava.dto.Member;

public interface MemberDAO {

	int insertMember(Member member);

	int updateMember(Member member);

	Member selectMember(int member_no);

	List<Member> selectMemberList(Map<String, Object> map, int member_status, String member_id, String member_name);
}
