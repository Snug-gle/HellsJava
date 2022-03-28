package itwill.helljava.Enum;

public enum MemberEnum {

	RESIGN(0), NORMAL(1), PRE_TRAINER(2), TRAINER(3), MANAGER(9);

	private final int memberGrade;

	private MemberEnum(int memberGrade) {
		this.memberGrade = memberGrade;
	}

	public static MemberEnum of(final int number) {

		switch (number) {
			case 0:
				return RESIGN;
			case 2:
				return PRE_TRAINER;
			case 3:
				return TRAINER;
			case 9:
				return MANAGER;
	
			default:
				return NORMAL;
			}
	}
	
	public int getValue() {
		return memberGrade;
	}
}
