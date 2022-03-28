package itwill.helljava.Enum;

public enum PtOnceStatusEnum {

	미확인(0), 확인(1), 확인완료(2);

	private final int ptOnceStatus;

	private PtOnceStatusEnum(final int ptOnceStatus) {
		this.ptOnceStatus = ptOnceStatus;
	}

	public static PtOnceStatusEnum of(final int number) {

		switch (number) {

		case 1:
			return 확인;
		case 2:
			return 확인완료;
		default:
			return 미확인;
		}

	}

	public int getValue() {
		return ptOnceStatus;
	}
}
