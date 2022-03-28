package itwill.helljava.dto;

public class Trainer {
	private int trainerNo;
	private int memberNo;
	private String trainerProfileImg;
	private String trainerAddress1;
	private String trainerAddress2;
	private String trainerZip;

	private String memberId;
	private String memberName;
	private String memberPhone;
	private String memberEmail;

	public Trainer() {
		// TODO Auto-generated constructor stub
	}

	public int getTrainerNo() {
		return trainerNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberPhone() {
		return memberPhone;
	}

	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public void setTrainerNo(int trainerNo) {
		this.trainerNo = trainerNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getTrainerProfileImg() {
		return trainerProfileImg;
	}

	public void setTrainerProfileImg(String trainerProfileImg) {
		this.trainerProfileImg = trainerProfileImg;
	}

	public String getTrainerAddress1() {
		return trainerAddress1;
	}

	public void setTrainerAddress1(String trainerAddress1) {
		this.trainerAddress1 = trainerAddress1;
	}

	public String getTrainerAddress2() {
		return trainerAddress2;
	}

	public void setTrainerAddress2(String trainerAddresss2) {
		this.trainerAddress2 = trainerAddresss2;
	}

	public String getTrainerZip() {
		return trainerZip;
	}

	public void setTrainerZip(String trainerZip) {
		this.trainerZip = trainerZip;
	}

	@Override
	public String toString() {
		return "Trainer [trainerNo=" + trainerNo + ", memberNo=" + memberNo + ", trainerProfileImg=" + trainerProfileImg
				+ ", trainerAddress1=" + trainerAddress1 + ", trainerAddress2=" + trainerAddress2 + ", trainerZip="
				+ trainerZip + "]";
	}

}
