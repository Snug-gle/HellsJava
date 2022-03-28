package itwill.helljava.dto;

public class NoticeService {

	int noticeServiceNo;
	int memberNo;
	int noticeServiceCategory;
	String noticeServiceTitle;
	String noticeServiceContent;
	String noticeServiceReply;
	int noticeServiceHits;
	String noticeServiceDate;
	int noticeServiceStatus;
	int noticeServiceSortation;

	String memberName;

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public int getNoticeServiceNo() {
		return noticeServiceNo;
	}

	public void setNoticeServiceNo(int noticeServiceNo) {
		this.noticeServiceNo = noticeServiceNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getNoticeServiceCategory() {
		return noticeServiceCategory;
	}

	public void setNoticeServiceCategory(int noticeServiceCategory) {
		this.noticeServiceCategory = noticeServiceCategory;
	}

	public String getNoticeServiceTitle() {
		return noticeServiceTitle;
	}

	public void setNoticeServiceTitle(String noticeServiceTitle) {
		this.noticeServiceTitle = noticeServiceTitle;
	}

	public String getNoticeServiceContent() {
		return noticeServiceContent;
	}

	public void setNoticeServiceContent(String noticeServiceContent) {
		this.noticeServiceContent = noticeServiceContent;
	}

	public String getNoticeServiceReply() {
		return noticeServiceReply;
	}

	public void setNoticeServiceReply(String noticeServiceReply) {
		this.noticeServiceReply = noticeServiceReply;
	}

	public int getNoticeServiceHits() {
		return noticeServiceHits;
	}

	public void setNoticeServiceHits(int noticeServiceHits) {
		this.noticeServiceHits = noticeServiceHits;
	}

	public String getNoticeServiceDate() {
		return noticeServiceDate;
	}

	public void setNoticeServiceDate(String noticeServiceDate) {
		this.noticeServiceDate = noticeServiceDate;
	}

	public int getNoticeServiceStatus() {
		return noticeServiceStatus;
	}

	public void setNoticeServiceStatus(int noticeServiceStatus) {
		this.noticeServiceStatus = noticeServiceStatus;
	}

	public int getNoticeServiceSortation() {
		return noticeServiceSortation;
	}

	public void setNoticeServiceSortation(int noticeServiceSortation) {
		this.noticeServiceSortation = noticeServiceSortation;
	}

	@Override
	public String toString() {
		return "NoticeService [noticeServiceNo=" + noticeServiceNo + ", memberNo=" + memberNo
				+ ", noticeServiceCategory=" + noticeServiceCategory + ", noticeServiceTitle=" + noticeServiceTitle
				+ ", noticeServiceContent=" + noticeServiceContent + ", noticeServiceReply=" + noticeServiceReply
				+ ", noticeServiceHits=" + noticeServiceHits + ", noticeServiceDate=" + noticeServiceDate
				+ ", noticeServiceStatus=" + noticeServiceStatus + ", noticeServiceSortation=" + noticeServiceSortation
				+ ", memberName=" + memberName + "]";
	}

}
