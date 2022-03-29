package itwill.helljava.exception;

//로그인 인증 실패를 위해 작성된 예외클래스
public class LoginAuthFailException extends Exception {
	private static final long serialVersionUID = 1L;

	private String memberId;
	
	public LoginAuthFailException() {
		// TODO Auto-generated constructor stub
	}

	public LoginAuthFailException(String message, String memberId) {
		super(message);
		this.memberId = memberId;
	}

	public String getmemberId() {
		return memberId;
	}

	public void setmemberId(String memberId) {
		this.memberId = memberId;
	}
}
