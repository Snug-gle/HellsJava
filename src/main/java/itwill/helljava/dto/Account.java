package itwill.helljava.dto;

public class Account {

	private int accountNo;
	private int memberNo;
	private int accountBank;
	private int accountNumber;
	private String accountPw;

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getAccountNo() {
		return accountNo;
	}

	public void setAccountNo(int accountNo) {
		this.accountNo = accountNo;
	}

	public int getAccountBank() {
		return accountBank;
	}

	public void setAccountBank(int accountBank) {
		this.accountBank = accountBank;
	}

	public int getAccountNumber() {
		return accountNumber;
	}

	public void setAccountNumber(int accountNumber) {
		this.accountNumber = accountNumber;
	}

	public String getAccountPw() {
		return accountPw;
	}

	public void setAccountPw(String accountPw) {
		this.accountPw = accountPw;
	}

	public Account() {
		// TODO Auto-generated constructor stub
	}

}
