package itwill.helljava.exception;

//회원정보의 변경,삭제,검색시 아이디의 회원정보가 없는 경우를 위해 작성된 예외클래스
public class MemberPwSearchNotFoundException extends Exception {
	private static final long serialVersionUID = 1L;

	public MemberPwSearchNotFoundException() {
		// TODO Auto-generated constructor stub
	}
	
	public MemberPwSearchNotFoundException(String message) {
		super(message);
	}
}
