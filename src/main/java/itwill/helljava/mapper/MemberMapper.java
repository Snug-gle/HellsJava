package itwill.helljava.mapper;

import java.util.List;
import java.util.Map;

import itwill.helljava.dto.Member;

public interface MemberMapper {

	int insertMember(Member member);

	int updateMember(Member member);

	// 비번 변경
	int updateMemberPw(Map<String, Object> map);

	// 캐쉬 변경
	int updateMemberCash(Map<String, Object> map);

	int selectMemberListCount(Map<String, Object> map);

	Member selectMember(int member_no);

	// 아이디로 회원 검색
	Member selectIdMember(String member_id);

	// 휴대폰 번호로 회원 검색
	Member selectPhoneMember(String memberPhone);

	// 아이디 & 비밀번호 찾기 쿼리
	Member selectSearchMember(Map<String, Object> map);

	// 회원 조회 (검색 기능 아이디, 이름 포함)
	List<Member> selectMemberList(Map<String, Object> map);

	// 아이디 중복 체크용
	int selectIdCheck(String member_id);

}
