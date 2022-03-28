package itwill.helljava.Enum;

public enum PtOnceExperienceEnum {

	한달미만(1), 삼개월(2), 육개월(3), 일년이상(4);
	
	private final int ptOnceExperience;
	
	private PtOnceExperienceEnum(final int ptOnceExperience) {
		this.ptOnceExperience = ptOnceExperience;
	}
	
	public static PtOnceExperienceEnum of(final int number) {

		switch (number) {

		case 2:
			return 삼개월;
		case 3:
			return 육개월;
		case 4:
			return 일년이상;
		default:
			return 한달미만;
		}

	}

	public int getValue() {
		return ptOnceExperience;
	}
	
}
