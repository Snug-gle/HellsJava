package itwill.helljava.dto;

public class Schedule {
	private int scheduleNo;
	private int scheduleWorkday;
	private String scheduleHours;
	private String scheduleDayoff;
	private int trainerNo;
	
	public Schedule() {
		// TODO Auto-generated constructor stub
	}

	public int getScheduleNo() {
		return scheduleNo;
	}

	public void setScheduleNo(int scheduleNo) {
		this.scheduleNo = scheduleNo;
	}

	public int getScheduleWorkday() {
		return scheduleWorkday;
	}

	public void setScheduleWorkday(int scheduleWorkday) {
		this.scheduleWorkday = scheduleWorkday;
	}

	public String getScheduleHours() {
		return scheduleHours;
	}

	public void setScheduleHours(String scheduleHours) {
		this.scheduleHours = scheduleHours;
	}

	public String getScheduleDayoff() {
		return scheduleDayoff;
	}

	public void setScheduleDayoff(String scheduleDayoff) {
		this.scheduleDayoff = scheduleDayoff;
	}

	public int getTrainerNo() {
		return trainerNo;
	}

	public void setTrainerNo(int trainerNo) {
		this.trainerNo = trainerNo;
	}
	
	
	
	
}