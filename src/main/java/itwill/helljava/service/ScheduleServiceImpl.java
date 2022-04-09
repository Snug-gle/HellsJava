package itwill.helljava.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import itwill.helljava.dao.ScheduleDAO;
import itwill.helljava.dto.Schedule;

@Service
public class ScheduleServiceImpl implements ScheduleService{
	@Autowired
	private ScheduleDAO scheduleDAO;
	
	@Transactional
	@Override
	public void addSchedule(Schedule schedule) {
		scheduleDAO.insertSchedule(schedule);
	}
	
	@Transactional
	@Override
	public void modifySchedule(Schedule schedule) {
		scheduleDAO.updateSchedule(schedule);
	}
	
	@Transactional
	@Override
	public void removeSchedule(int schedule_no) {
		scheduleDAO.deleteSchedule(schedule_no);
	}
	
	@Transactional
	@Override
	public void removeTrainerSchdule(int trainer_no) {
		scheduleDAO.deleteTrainerSchedule(trainer_no);
	}
	
	@Override
	public List<Schedule> getScheduleList(int trainer_no) {
		return scheduleDAO.selectScheduleList(trainer_no);
	}

	
	
	
}
