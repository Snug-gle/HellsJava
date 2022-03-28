package itwill.helljava.Enum;

public enum NoticeServiceStatusEnum {
	삭제글(1), 일반글(2), 문의미답변(3), 문의답변(4);
	
	private int noticeStatus;
	
	private NoticeServiceStatusEnum(int noticeStatus) {
		this.noticeStatus = noticeStatus;	
	}
	
	public static NoticeServiceStatusEnum of(final int number) {
		
		switch (number) {
			case 1:
				return 삭제글;
			case 3:
				return 문의미답변;
			case 4:
				return 문의답변;
			default:
				return 일반글;
		}
	}
	
	public int getValue() {
		return noticeStatus;
	}
	
	
}
