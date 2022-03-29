package itwill.helljava.Enum;

public enum NoticeServiceStatusEnum {
	삭제글(0), 일반글(1), 문의미답변(2), 문의답변(3);
	
	private int noticeStatus;
	
	private NoticeServiceStatusEnum(int noticeStatus) {
		this.noticeStatus = noticeStatus;	
	}
	
	public static NoticeServiceStatusEnum of(final int number) {
		
		switch (number) {
			case 0:
				return 삭제글;
			case 2:
				return 문의미답변;
			case 3:
				return 문의답변;
			default:
				return 일반글;
		}
	}
	
	public int getValue() {
		return noticeStatus;
	}
	
	
}
