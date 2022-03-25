package itwill.helljava.service;

import java.util.List;

import itwill.helljava.dto.Member;

public interface MemberService {

	void addMember(Member member);
	void modifyMember(Member member);
	Member getMember(int member_no);
	List<Member> getMemberList();
}
