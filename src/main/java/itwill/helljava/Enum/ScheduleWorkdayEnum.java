package itwill.helljava.Enum;

public enum ScheduleWorkdayEnum {
	
	평일(1), 토요일(2), 일요일(3), 휴무일(4);
	
	private final int workDay;
	
	private ScheduleWorkdayEnum(final int workDay) {
		this.workDay = workDay;
	}
	
	public static ScheduleWorkdayEnum of(final int number) {
		
		switch(number) {
		case 2 :
			return 토요일;
		case 3 :
			return 일요일;
		case 4 :
			return 휴무일;
		default :
			return 평일;
		}
	}
	
	public int getValue() {
		return workDay;
	}
}
