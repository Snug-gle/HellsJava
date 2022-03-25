package itwill.helljava.service;

import java.util.List;

import itwill.helljava.dto.Schedule;

public interface ScheduleService {
	
	void addSchedule(Schedule schedule);

	void modifySchedule(Schedule schedule);

	List<Schedule> getScheduleList(int trainer_no);
}
