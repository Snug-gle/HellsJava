package itwill.helljava.exception;

import itwill.helljava.dto.Member;

//회원등록시 사용자가 입력한 아이디가 이미 존재하는 경우를 위해 작성된 예외클래스
public class MemberExistsException extends Exception {
	private static final long serialVersionUID = 1L;

	//예외 처리시 필요한 값을 저장하기 위한 필드
	// => 사용자가 입력한 회원정보를 저장하기 위해 필드 선언
	private Member member;
	
	public MemberExistsException() {
		// TODO Auto-generated constructor stub
	}

	public MemberExistsException(String message, Member member) {
		super(message);
		this.member = member;
	}

	
	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

}
