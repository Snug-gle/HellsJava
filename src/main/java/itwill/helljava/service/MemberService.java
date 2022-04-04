package itwill.helljava.service;

import java.util.List;
import java.util.Map;

import itwill.helljava.dto.Member;
import itwill.helljava.exception.LoginAuthFailException;
import itwill.helljava.exception.MemberExistsException;
import itwill.helljava.exception.MemberIdSearchNotFoundException;
import itwill.helljava.exception.MemberNotFoundException;
import itwill.helljava.exception.MemberPwSearchNotFoundException;

public interface MemberService {

	void addMember(Member member) throws MemberExistsException;

	void modifyMember(Member member);

	// 비번 변경
	void modifyMemberPw(Map<String, Object> map);

	// 캐쉬 변경
	void modifyMemberCash(Map<String, Object> map);

	int getMemberListCount(Map<String, Object> map);

	Member getMember(int member_no);

	Member getIdMember(String member_id);

	Member getSearchMember(Map<String, Object> map)
			throws MemberIdSearchNotFoundException, MemberPwSearchNotFoundException;

	List<Member> getMemberList(Map<String, Object> map);

	void loginAuth(Member member) throws LoginAuthFailException;

	int idCheck(String member_id);
}
