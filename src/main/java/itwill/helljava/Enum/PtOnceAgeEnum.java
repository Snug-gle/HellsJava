package itwill.helljava.Enum;

public enum PtOnceAgeEnum {

	십대(1), 이십대(2), 삼십대(3), 사십대(4), 오십대(5), 육십대(6);
	
	private final int ptOnceAge;
	
	private PtOnceAgeEnum(final int ptOnceAge) {
		this.ptOnceAge = ptOnceAge;
	}
	
	public static PtOnceAgeEnum of(final int number) {
		
		switch (number) {
		
		case 1:
			return 십대;
		case 2:
			return 이십대;
		case 3: 
			return 삼십대;
		case 4:
			return 사십대;
		case 5:
			return 오십대;
		default:
			return 육십대;
		}
	}
	
	public int getValue() {
		return ptOnceAge;
	}
}
