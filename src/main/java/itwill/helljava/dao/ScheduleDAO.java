package itwill.helljava.dao;

import java.util.List;

import itwill.helljava.dto.Schedule;

public interface ScheduleDAO {
	int insertSchedule(Schedule schedule);
	int updateSchedule(Schedule schedule);
	List<Schedule> selectScheduleList(int trainer_no);
}
