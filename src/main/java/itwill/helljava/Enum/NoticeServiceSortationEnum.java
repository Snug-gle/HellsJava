package itwill.helljava.Enum;

public enum NoticeServiceSortationEnum {

	공지사항(1), FAQ(2), 일대일문의(3);

	private final int noticeSort;

	private NoticeServiceSortationEnum(int noticeSort) {
		this.noticeSort = noticeSort;
	}

	public static NoticeServiceSortationEnum of(final int number) {

		switch (number) {
		case 1:
			return 공지사항;
		case 2:
			return FAQ;
		default:
			return 일대일문의;
		}
	}
	public int getValue() {
		return noticeSort;
	}

}
