package itwill.helljava.dto;

public class Schedule {
	private int schedule_no;
	private int schedule_workday;
	private String schedule_hours;
	private String schedule_dayoff;
	private String trainer_no;
	
	public Schedule() {
		// TODO Auto-generated constructor stub
	}

	public int getSchedule_no() {
		return schedule_no;
	}

	public void setSchedule_no(int schedule_no) {
		this.schedule_no = schedule_no;
	}

	public int getSchedule_workday() {
		return schedule_workday;
	}

	public void setSchedule_workday(int schedule_workday) {
		this.schedule_workday = schedule_workday;
	}

	public String getSchedule_hours() {
		return schedule_hours;
	}

	public void setSchedule_hours(String schedule_hours) {
		this.schedule_hours = schedule_hours;
	}

	public String getSchedule_dayoff() {
		return schedule_dayoff;
	}

	public void setSchedule_dayoff(String schedule_dayoff) {
		this.schedule_dayoff = schedule_dayoff;
	}

	public String getTrainer_no() {
		return trainer_no;
	}

	public void setTrainer_no(String trainer_no) {
		this.trainer_no = trainer_no;
	}
	
}