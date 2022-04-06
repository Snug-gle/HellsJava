package itwill.helljava.dto;

public class PtService {

	private int ptServiceNo;
	private int memberNo;
	private int trainerNo;
	private String ptServiceTitle;
	private String ptServiceContent;
	private String ptServiceReply;
	private double ptServiceStars;
	private int ptServiceGood;
	private String ptServiceDate;
	private int ptServiceStatus;
	private int ptServiceSortation;

	private String memberName;
	
	public PtService() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "PtService [ptServiceNo=" + ptServiceNo + ", memberNo=" + memberNo + ", trainerNo=" + trainerNo
				+ ", ptServiceTitle=" + ptServiceTitle + ", ptServiceContent=" + ptServiceContent + ", ptServiceReply="
				+ ptServiceReply + ", ptServiceStars=" + ptServiceStars + ", ptServiceGood=" + ptServiceGood
				+ ", ptServiceDate=" + ptServiceDate + ", ptServiceStatus=" + ptServiceStatus + ", ptServiceSortation="
				+ ptServiceSortation + ", memberName=" + memberName + "]";
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public int getPtServiceNo() {
		return ptServiceNo;
	}

	public void setPtServiceNo(int ptServiceNo) {
		this.ptServiceNo = ptServiceNo;
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

	public String getPtServiceTitle() {
		return ptServiceTitle;
	}

	public void setPtServiceTitle(String ptServiceTitle) {
		this.ptServiceTitle = ptServiceTitle;
	}

	public String getPtServiceContent() {
		return ptServiceContent;
	}

	public void setPtServiceContent(String ptServiceContent) {
		this.ptServiceContent = ptServiceContent;
	}

	public String getPtServiceReply() {
		return ptServiceReply;
	}

	public void setPtServiceReply(String ptServiceReply) {
		this.ptServiceReply = ptServiceReply;
	}

	public double getPtServiceStars() {
		return ptServiceStars;
	}

	public void setPtServiceStars(double ptServiceStars) {
		this.ptServiceStars = ptServiceStars;
	}

	public int getPtServiceGood() {
		return ptServiceGood;
	}

	public void setPtServiceGood(int ptServiceGood) {
		this.ptServiceGood = ptServiceGood;
	}

	public String getPtServiceDate() {
		return ptServiceDate;
	}

	public void setPtServiceDate(String ptServiceDate) {
		this.ptServiceDate = ptServiceDate;
	}

	public int getPtServiceStatus() {
		return ptServiceStatus;
	}

	public void setPtServiceStatus(int ptServiceStatus) {
		this.ptServiceStatus = ptServiceStatus;
	}

	public int getPtServiceSortation() {
		return ptServiceSortation;
	}

	public void setPtServiceSortation(int ptServiceSortation) {
		this.ptServiceSortation = ptServiceSortation;
	}
	
	
	

}
