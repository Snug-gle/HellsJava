package itwill.helljava.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import itwill.helljava.dto.Trainer;
import itwill.helljava.mapper.TrainerMapper;

@Repository
public class TrainerDAOImpl implements TrainerDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int insertTrainer(Trainer trainer) {
		return sqlSession.getMapper(TrainerMapper.class).insertTrainer(trainer);
	}

	@Override
	public int updateTrainer(Trainer trainer) {
		return sqlSession.getMapper(TrainerMapper.class).updateTrainer(trainer);
	}


	@Override
	public Trainer selectTrainer(int trainer_no) {
		return sqlSession.getMapper(TrainerMapper.class).selectTrainer(trainer_no);
	}

	@Override
	public List<Trainer> selectTrainerList(Map<String, Object> map, String member_id, String member_name) {
		return sqlSession.getMapper(TrainerMapper.class).selectTrainerList(map, member_id, member_name);
	}
}
