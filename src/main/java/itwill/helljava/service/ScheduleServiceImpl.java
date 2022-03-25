package itwill.helljava.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import itwill.helljava.dao.ScheduleDAO;
import itwill.helljava.dto.Schedule;

@Service
public class ScheduleServiceImpl implements ScheduleService{
	@Autowired
	private ScheduleDAO scheduleDAO;

	@Override
	public void addSchedule(Schedule schedule) {
		scheduleDAO.insertSchedule(schedule);
	}

	@Override
	public void modifySchedule(Schedule schedule) {
		scheduleDAO.updateSchedule(schedule);
	}

	@Override
	public Schedule getSchedule(int schedule_no) {
		return scheduleDAO.selectSchedule(schedule_no);
	}

	@Override
	public List<Schedule> getScheduleList() {
		return scheduleDAO.selectScheduleList();
	}
	
	
	
}
