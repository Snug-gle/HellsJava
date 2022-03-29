package itwill.helljava.service;

import java.util.List;
import java.util.Map;

import itwill.helljava.dto.Member;
import itwill.helljava.exception.LoginAuthFailException;
import itwill.helljava.exception.MemberExistsException;

public interface MemberService {

	void addMember(Member member) throws MemberExistsException;
	void modifyMember(Member member);
	Member getMember(int member_no);
	Member getIdMember(String member_id);
	List<Member> getMemberList(Map<String, Object> map);
	void loginAuth(Member member) throws LoginAuthFailException;
}
