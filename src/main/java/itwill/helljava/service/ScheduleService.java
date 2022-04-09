package itwill.helljava.service;

import java.util.List;

import itwill.helljava.dto.Schedule;

public interface ScheduleService {
	
	void addSchedule(Schedule schedule);

	void modifySchedule(Schedule schedule);
	
	void removeSchedule(int schedule_no);

	void removeTrainerSchdule(int trainer_no);
	
	List<Schedule> getScheduleList(int trainer_no);
}
