package itwill.helljava.service;

import java.util.List;
import java.util.Map;

import itwill.helljava.dto.Member;

public interface MemberService {

	void addMember(Member member);
	void modifyMember(Member member);
	Member getMember(int member_no);
	Member getIdMember(String member_id);
	List<Member> getMemberList(Map<String, Object> map);
}
