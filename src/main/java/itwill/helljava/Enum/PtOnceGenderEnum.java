package itwill.helljava.Enum;

public enum PtOnceGenderEnum {

	남자(1), 여자(2);
	
	private final int ptOnceGender;
	
	private PtOnceGenderEnum(final int ptOnceGender) {
		this.ptOnceGender=ptOnceGender;
	}
	
	public static PtOnceGenderEnum of(int number) {

		if(number == 1) {
			return 남자;
		}
		else {
			return 여자;
		}
	}
	
	public int getValue() {
		return ptOnceGender;
	}
}
