package itwill.helljava.service;

import java.util.List;
import java.util.Map;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import itwill.helljava.dao.MemberDAO;
import itwill.helljava.dto.Member;
import itwill.helljava.exception.MemberExistsException;


@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO memberDAO;

	@Override
	@Transactional
	public void addMember(Member member) throws MemberExistsException {
		// 전달받은 회원정보의 아이디가 기존 회원의 아이디와 중복된 경우
		if (memberDAO.selectIdMember(member.getMemberId())!= null) {
			// 인위적 예외 발생
			throw new MemberExistsException("이미 사용중인 아이디를 입력 하였습니다.", member);
		}

		// 사용자로부터 입력받아 전달된 비밀번호를 암호화 처리하여 필드값 변경
		// => 요청 처리 메소드에서 암호화 처리하여 필드값 변경 가능
		// 암호화 처리 기능을 제공하는 jbcrypt 라이브러리를 프로젝트에 빌드 처리 - pom.xml
		// BCrypt.hashpw(String password, String salt) : 전달받은 비밀번호에 첨가물을 삽입한 후 암호화 처리하여
		// 반환하는 메소드
		// BCrypt.gensalt(int log_bounds) : 첨가물의 길이를 전달받아 첨가물을 생성하여 반환하는 메소드
		// => 매개변수가 없는 메소드를 호출한 경우 첨가물의 길이는 기본값(10)으로 자동 설정
		member.setMemberPw(BCrypt.hashpw(member.getMemberPw(), BCrypt.gensalt()));

		memberDAO.insertMember(member);
	}

	@Override
	@Transactional
	public void modifyMember(Member member) {
		memberDAO.updateMember(member);
	}

	@Override
	public Member getMember(int member_no) {
		return memberDAO.selectMember(member_no);
	}

	@Override
	public Member getIdMember(String member_id) {
		return memberDAO.selectIdMember(member_id);
	}

	@Override
	public List<Member> getMemberList(Map<String, Object> map) {
		return memberDAO.selectMemberList(map);
	}

}
