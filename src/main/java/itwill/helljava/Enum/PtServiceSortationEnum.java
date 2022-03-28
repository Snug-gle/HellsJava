package itwill.helljava.Enum;

public enum PtServiceSortationEnum {
	리뷰(1), 피티문의(2);
	
	private int ptSortation;
	
	private PtServiceSortationEnum(int ptSortation) {
		this.ptSortation = ptSortation;
	}
	
	public static PtServiceSortationEnum of(final int number) {
		
		switch (number) {
			case 1: 
				return 리뷰;
			default:
				return 피티문의;
	
		}
	}
	public int getValue() {
		return ptSortation;
	}

}