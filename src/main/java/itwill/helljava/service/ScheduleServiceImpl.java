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
	public List<Schedule> getScheduleList(int trainer_no) {
		return scheduleDAO.selectScheduleList(trainer_no);
	}
	
	
	
}
