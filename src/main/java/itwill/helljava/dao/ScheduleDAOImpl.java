package itwill.helljava.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import itwill.helljava.dto.Schedule;
import itwill.helljava.mapper.ScheduleMapper;

@Repository
public class ScheduleDAOImpl implements ScheduleDAO{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int insertSchedule(Schedule schedule) {
		return sqlSession.getMapper(ScheduleMapper.class).insertSchedule(schedule);
	}

	@Override
	public int updateSchedule(Schedule schedule) {
		return sqlSession.getMapper(ScheduleMapper.class).updateSchedule(schedule);
	}

	@Override
	public List<Schedule> selectScheduleList(int trainer_no) {
		return sqlSession.getMapper(ScheduleMapper.class).selectScheduleList(trainer_no);
	}

	@Override
	public int deleteSchedule(int schedule_no) {
		return sqlSession.getMapper(ScheduleMapper.class).deleteSchedule(schedule_no);
	}
	
	
}
