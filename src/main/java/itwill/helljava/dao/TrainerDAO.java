package itwill.helljava.dao;

import java.util.List;

import itwill.helljava.dto.Trainer;

public interface TrainerDAO {
	int insertTrainer(Trainer trainer);
	int updateTrainer(Trainer trainer);
	int deleteTrainer(Trainer trainer);
	int selectTrainerCount();
	Trainer selectTrainer(int trainer_no);
	List<Trainer> selectTrainerList();
}
