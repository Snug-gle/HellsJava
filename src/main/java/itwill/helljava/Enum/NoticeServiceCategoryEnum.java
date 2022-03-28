package itwill.helljava.Enum;

public enum NoticeServiceCategoryEnum {
	
	결제관련문의(1), 트레이너관련문의(2), 기타문의(3);
	
	private final int noticeCategory;
	
	private NoticeServiceCategoryEnum(int noticeCategory) {
		this.noticeCategory = noticeCategory;
	}
	public static NoticeServiceCategoryEnum of(final int number) {
		switch (number) {
			case 1:
				return 결제관련문의;
			case 2:
				return 트레이너관련문의;
			default:
				return 기타문의;
		}
	}
	
	public int getValue() {
		return noticeCategory;
	}
}
