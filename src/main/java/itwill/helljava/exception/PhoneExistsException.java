package itwill.helljava.exception;

import itwill.helljava.dto.Member;

// 회원 등록 시 사용자가 입력한 휴대폰 번호가 이미 존재한 경우 작성된 예외 클래스
public class PhoneExistsException extends Exception {

	private static final long serialVersionUID = 1L;
	private Member member;

	public PhoneExistsException() {
		// TODO Auto-generated constructor stub
	}

	public PhoneExistsException(String message, Member member) {
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
