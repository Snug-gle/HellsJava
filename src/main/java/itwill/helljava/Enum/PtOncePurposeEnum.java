package itwill.helljava.Enum;

public enum PtOncePurposeEnum {

	다이어트(1), 체력증진(2), 취미활동(3), 기타(4);

	private final int ptOncePerpose;

	private PtOncePurposeEnum(final int ptOncePerpose) {
		this.ptOncePerpose = ptOncePerpose;
	}

	public static PtOncePurposeEnum of(final int number) {

		switch (number) {

		case 1:
			return 다이어트;
		case 2:
			return 체력증진;
		case 3:
			return 취미활동;
		default:
			return 기타;
		}

	}

	public int getValue() {
		return ptOncePerpose;
	}
}
