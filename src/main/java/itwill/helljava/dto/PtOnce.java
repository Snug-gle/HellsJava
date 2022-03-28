package itwill.helljava.dto;

public class PtOnce {
	private int ptOnceNo;
	private int ptOnceGender;
	private int ptOnceAge;
	private int ptOncePurpose;
	private int ptOnceExperience;
	private String ptOnceSignificant;
	private int memberNo;
	private int trainerNo;
	private String ptOnceApplicationDate;
	private int ptOnceStatus;

	private String memberName;
	private String memberPhone;

	@Override
	public String toString() {
		return "PtOnce [ptOnceNo=" + ptOnceNo + ", ptOnceGender=" + ptOnceGender + ", ptOnceAge=" + ptOnceAge
				+ ", ptOncePurpose=" + ptOncePurpose + ", ptOnceExperience=" + ptOnceExperience + ", ptOnceSignificant="
				+ ptOnceSignificant + ", memberNo=" + memberNo + ", trainerNo=" + trainerNo + ", ptOnceApplicationDate="
				+ ptOnceApplicationDate + ", ptOnceStatus=" + ptOnceStatus + ", memberName=" + memberName
				+ ", memberPhone=" + memberPhone + "]";
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

	public PtOnce() {
		// TODO Auto-generated constructor stub
	}

	public int getPtOnceNo() {
		return ptOnceNo;
	}

	public void setPtOnceNo(int ptOnceNo) {
		this.ptOnceNo = ptOnceNo;
	}

	public int getPtOnceGender() {
		return ptOnceGender;
	}

	public void setPtOnceGender(int ptOnceGender) {
		this.ptOnceGender = ptOnceGender;
	}

	public int getPtOnceAge() {
		return ptOnceAge;
	}

	public void setPtOnceAge(int ptOnceAge) {
		this.ptOnceAge = ptOnceAge;
	}

	public int getPtOncePurpose() {
		return ptOncePurpose;
	}

	public void setPtOncePurpose(int ptOncePurpose) {
		this.ptOncePurpose = ptOncePurpose;
	}

	public int getPtOnceExperience() {
		return ptOnceExperience;
	}

	public void setPtOnceExperience(int ptOnceExperience) {
		this.ptOnceExperience = ptOnceExperience;
	}

	public String getPtOnceSignificant() {
		return ptOnceSignificant;
	}

	public void setPtOnceSignificant(String ptOnceSignificant) {
		this.ptOnceSignificant = ptOnceSignificant;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getTrainerNo() {
		return trainerNo;
	}

	public void setTrainerNo(int trainerNo) {
		this.trainerNo = trainerNo;
	}

	public String getPtOnceApplicationDate() {
		return ptOnceApplicationDate;
	}

	public void setPtOnceApplicationDate(String ptOnceApplicationDate) {
		this.ptOnceApplicationDate = ptOnceApplicationDate;
	}

	public int getPtOnceStatus() {
		return ptOnceStatus;
	}

	public void setPtOnceStatus(int ptOnceStatus) {
		this.ptOnceStatus = ptOnceStatus;
	}

}