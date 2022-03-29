package itwill.helljava.service;

import java.util.List;
import java.util.Map;

import itwill.helljava.dto.Member;
import itwill.helljava.exception.LoginAuthFailException;
import itwill.helljava.exception.MemberExistsException;
import itwill.helljava.exception.MemberNotFoundException;

public interface MemberService {

	void addMember(Member member) throws MemberExistsException;
	void modifyMember(Member member);
	Member getMember(int member_no);
	Member getIdMember(String member_id);
	Member getSearchMember(Map<String, Object> map) throws MemberNotFoundException;
	List<Member> getMemberList(Map<String, Object> map);
	void loginAuth(Member member) throws LoginAuthFailException;
}
