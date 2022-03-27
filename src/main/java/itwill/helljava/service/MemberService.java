package itwill.helljava.service;

import java.util.List;
import java.util.Map;

import itwill.helljava.dto.Member;

public interface MemberService {

	void addMember(Member member);
	void modifyMember(Member member);
	Member getMember(int member_no);
	List<Member> getMemberList(Map<String, Object> map, int member_status, String member_id, String member_name);
}
