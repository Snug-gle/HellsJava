package itwill.helljava.Enum;

public enum PayTypeEnum {

	일회피티(1), 트레이너신청(2), 캐시충전(3);

	private final int payType;

	private PayTypeEnum(int payType) {
		this.payType = payType;
	}

	public static PayTypeEnum of(final int number) {

		switch (number) {
		case 1:
			return 일회피티;
		case 2:
			return 트레이너신청;
		default:
			return 캐시충전;
		}
	}

	public int getValue() {
		return payType;
	}
}
