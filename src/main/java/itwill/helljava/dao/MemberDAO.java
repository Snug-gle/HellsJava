package itwill.helljava.dao;

import java.util.List;
import java.util.Map;

import itwill.helljava.dto.Member;

public interface MemberDAO {

	int insertMember(Member member);

	int updateMember(Member member);

	// 비번 변경
	int updateMemberPw(Map<String, Object> map);

	// 캐쉬 변경
	int updateMemberCash(Map<String, Object> map);

	int selectMemberListCount(Map<String, Object> map);

	Member selectMember(int member_no);

	Member selectIdMember(String member_id);

	Member selectPhoneMember(String memberPhone);

	// 아이디 & 비밀번호 찾기 쿼리
	Member selectSearchMember(Map<String, Object> map);

	List<Member> selectMemberList(Map<String, Object> map);

	// 자동 결제를 위한 트레이너 리스트 뽑기
	List<Member> selectAutoPayMemberList();

	//
	int selectIdCheck(String member_id);

}
