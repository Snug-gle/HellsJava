package itwill.helljava.Enum;

public enum MemberEnum {

	탈퇴회원(0), 일반회원(1), 트레이너예정(2), 트레이너(3), 관리자(9);

	private final int memberGrade;

	private MemberEnum(int memberGrade) {
		this.memberGrade = memberGrade;
	}

	public static MemberEnum of(final int number) {

		switch (number) {
			case 0:
				return 탈퇴회원;
			case 2:
				return 트레이너예정;
			case 3:
				return 트레이너;
			case 9:
				return 관리자;
	
			default:
				return 일반회원;
			}
	}
	
	public int getValue() {
		return memberGrade;
	}
}
