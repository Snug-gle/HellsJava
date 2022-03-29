package itwill.helljava.service;

import java.util.List;
import java.util.Map;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import itwill.helljava.dao.MemberDAO;
import itwill.helljava.dto.Member;
import itwill.helljava.exception.LoginAuthFailException;
import itwill.helljava.exception.MemberExistsException;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO memberDAO;

	@Override
	@Transactional
	public void addMember(Member member) throws MemberExistsException {
		// 전달받은 회원정보의 아이디가 기존 회원의 아이디와 중복된 경우
		if (memberDAO.selectIdMember(member.getMemberId()) != null) {
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

	// 로그인 인증 실패 : 예외 발생, 로그인 인증 성공 : 예외 미발생
	@Override
	public void loginAuth(Member member) throws LoginAuthFailException{
		Member authMember = memberDAO.selectIdMember(member.getMemberId());
		if (authMember == null) {
			throw new LoginAuthFailException("아이디의 회원정보가 존재하지 않습니다.",member.getMemberId());
		}
		
		// BCrypt.checkpw(String plainText, String hashed) : 일반 문자열과 암호화 처리된 문자열을
		// 비교하여 다른 경우 false 반환하고 같은 경우 true를 반환하는 메소드
		if (!BCrypt.checkpw(authMember.getMemberPw(), authMember.getMemberPw())) {// 비밀번호 인증 실패
			throw new LoginAuthFailException("아이디가 없거나 비밀번호가 맞지 않습니다.", authMember.getMemberId());
		}
	}

}
