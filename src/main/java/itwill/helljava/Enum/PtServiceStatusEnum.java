package itwill.helljava.Enum;

public enum PtServiceStatusEnum {
	삭제리뷰(0), 일반리뷰(1), 미확인문의(2), 확인문의(3);
	
	private int ptStatus;
	
	private PtServiceStatusEnum(int ptStatus) {
		this.ptStatus = ptStatus;
	}
	
	public static PtServiceStatusEnum of(final int number) {
		
		switch (number) {
		case 1:
			return 삭제리뷰;
		case 2:
			return 일반리뷰;
		case 3:
			return 미확인문의;
		default:
			return 확인문의;
		}
	}
	public int getValue() {
		return ptStatus;
	}
}
