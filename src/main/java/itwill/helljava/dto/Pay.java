package itwill.helljava.dto;

public class Pay {

	int pay_no;
	int member_no;
	String pay_start;
	int pay_price;
	int pay_type;

	public int getPay_no() {
		return pay_no;
	}

	public void setPay_no(int pay_no) {
		this.pay_no = pay_no;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public String getPay_start() {
		return pay_start;
	}

	public void setPay_start(String pay_start) {
		this.pay_start = pay_start;
	}

	public int getPay_price() {
		return pay_price;
	}

	public void setPay_price(int pay_price) {
		this.pay_price = pay_price;
	}

	public int getPay_type() {
		return pay_type;
	}

	public void setPay_type(int pay_type) {
		this.pay_type = pay_type;
	}

}
