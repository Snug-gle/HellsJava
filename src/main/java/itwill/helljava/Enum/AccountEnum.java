package itwill.helljava.Enum;

public enum AccountEnum {
	
	국민(0), 신한(1), 하나(2), 농협(3), 우체국(4), 우리(5);
	
	private final int bank;
	
	private AccountEnum(final int bank) {
		this.bank = bank;
	}
	
	public static AccountEnum of(final int number) {
		
		switch (number) {
			
			case 0 : 
				return 국민;
			case 1 :
				return 신한;
			case 2 :
				return 하나;
			case 3 :
				return 농협;
			case 4 :
				return 우체국;
			default :
				return 우리;		
		}
	}
	
	public int getValue() {
		return bank;
	}
}
