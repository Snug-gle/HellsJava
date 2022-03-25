package itwill.helljava.dao;

import java.util.List;

import itwill.helljava.dto.Schedule;

public interface ScheduleDAO {
	int insertSchedule(Schedule schedule);
	int updateSchedule(Schedule schedule);
	Schedule selectSchedule(int trainer_no);
	List<Schedule> selectScheduleList();
}
