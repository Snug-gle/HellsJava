package itwill.helljava.mapper;

import java.util.List;

import itwill.helljava.dto.Schedule;

public interface ScheduleMapper {

	int insertSchedule(Schedule schedule);

	int updateSchedule(Schedule schedule);
	
	int deleteSchedule(int schedule_no);

	List<Schedule> selectScheduleList(int trainer_no);
}
